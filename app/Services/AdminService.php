<?php

namespace App\Services;

use App\Models\Candidates;
use App\Models\Departments;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class AdminService
{
    public function adminRegisterMemberProcess($request)
    {
        $newUser = new User([
            'firstName'    => $request->input('firstName'),
            'lastName'     => $request->input('lastName'),
            'userNumber'   => $request->input('userNumber'),
            'password'     => Hash::make($request->input('passCode')),
            'departmentId' => $request->input('departmentId'),
            'access'       => "member",
        ]);

        $newUser->save();

        return back()->with('success', 'New member registeredsuccessfully.');
    }

    public function getMembers()
    {
        $members = User::select('id', 'firstName', 'lastName', 'userNumber', 'departmentId', 'access')->get();
        return [
            'members' => $members
        ];
    }

    public function getCandidates()
    {
        $candidates = Candidates::select('id', 'departmentId', 'candidateName', 'photo')->get();

        return [
            'candidates' => $candidates
        ];
    }


    public function adminCandidatesProcess($request)
    {
        if ($request->candidateId) {
            $candidate = Candidates::find($request->candidateId);

            if (!$candidate) {
                return back()->with('error', 'Candidate not found.');
            }

            // Always use photo_path if filled, else keep existing
            $photo = $request->photo_path ?: $candidate->photo;

            $candidate->update([
                'candidateName' => $request->candidateName,
                'departmentId'  => $request->departmentId,
                'photo'         => $photo,
            ]);

            return back()->with('success', 'Candidate updated successfully.');
        }

        // Create new candidate
        Candidates::create([
            'candidateName' => $request->candidateName,
            'departmentId'  => $request->departmentId,
            'photo'         => $request->photo_path,
        ]);

        return back()->with('success', 'Candidate added successfully.');
    }


    public function handleChunkUpload($request)
    {
        $fileId = $request->fileId;
        $chunkIndex = $request->chunkIndex;
        $totalChunks = $request->totalChunks;
        $fileName = $request->fileName;

        $chunk = $request->file('chunk');

        $tempPath = storage_path("app/chunks/$fileId");
        if (!file_exists($tempPath)) {
            mkdir($tempPath, 0777, true);
        }

        // Move chunk to temp folder
        $chunk->move($tempPath, "chunk_$chunkIndex");

        // If last chunk, merge all
        if ($chunkIndex == $totalChunks - 1) {

            $finalPath = storage_path("app/public/candidates/");
            if (!file_exists($finalPath)) {
                mkdir($finalPath, 0777, true);
            }

            $finalFileName = uniqid() . "_" . $fileName;
            $finalFile = fopen($finalPath . $finalFileName, 'wb');

            for ($i = 0; $i < $totalChunks; $i++) {
                $chunkFile = fopen("$tempPath/chunk_$i", 'rb');
                stream_copy_to_stream($chunkFile, $finalFile);
                fclose($chunkFile);
                unlink("$tempPath/chunk_$i"); // Delete chunk after merging
            }

            fclose($finalFile);
            rmdir($tempPath); // Remove temp folder

            return response()->json([
                'status' => 'chunk_received',
                'file_path' => "storage/candidates/$finalFileName"
            ]);
        }

        // Not last chunk yet
        return response()->json(['status' => 'chunk_received']);
    }



    // public function adminCandidatesProcess($request)
    // {
    //     $photoPath = $request->photo_path;

    //     Candidates::create([
    //         'candidateName' => $request->candidateName,
    //         'departmentId' => $request->departmentId,
    //         'photo' => $photoPath,
    //     ]);

    //     return redirect()->back()->with('success', 'Candidate added successfully!');
    // }


    // public function handleChunkUpload($request)
    // {
    //     $fileId = $request->fileId;
    //     $chunkIndex = $request->chunkIndex;
    //     $totalChunks = $request->totalChunks;
    //     $fileName = $request->fileName;

    //     $chunk = $request->file('chunk');

    //     $tempPath = storage_path("app/chunks/$fileId");
    //     if (!file_exists($tempPath)) {
    //         mkdir($tempPath, 0777, true);
    //     }

    //     $chunk->move($tempPath, "chunk_$chunkIndex");

    //     // If last chunk → merge
    //     if ($chunkIndex == $totalChunks - 1) {
    //         $finalPath = storage_path("app/public/candidates/");
    //         if (!file_exists($finalPath)) {
    //             mkdir($finalPath, 0777, true);
    //         }

    //         $finalFileName = uniqid() . "_" . $fileName;
    //         $finalFile = fopen($finalPath . $finalFileName, 'wb');

    //         for ($i = 0; $i < $totalChunks; $i++) {
    //             $chunkFile = fopen("$tempPath/chunk_$i", 'rb');
    //             stream_copy_to_stream($chunkFile, $finalFile);
    //             fclose($chunkFile);
    //             unlink("$tempPath/chunk_$i");
    //         }

    //         fclose($finalFile);
    //         rmdir($tempPath);

    //         return response()->json([
    //             'status' => 'chunk_received',
    //             'file_path' => "storage/candidates/$finalFileName"
    //         ]);
    //     }

    //     return response()->json(['status' => 'chunk_received']);
    // }


    public function getDepartments()
    {
        $departments = Departments::select('id', 'departmentName')->get();

        return [
            'departments' => $departments
        ];
    }

    public function adminDepartmentProcess($request)
    {
        $request->validate([
            'departmentName' => 'required|string|max:255',
        ]);

        if ($request->filled('departmentId')) {
            $department = Departments::find($request->departmentId);
            $department->departmentName = $request->input('departmentName');
            $department->save();

            return redirect()->back()->with('success', 'Department updated successfully!');
        } else {
            $newDepartment = new Departments([
                'departmentName' => $request->input('departmentName')
            ]);

            $newDepartment->save();

            return redirect()->back()->with('success', 'Department added successfully!');
        }
    }

    public function adminMigrationProcess($request)
    {
        ini_set('max_execution_time', 300);

        // 1️⃣ Validate uploaded CSV
        $request->validate([
            'csvFile' => 'required|mimes:csv,txt|max:2048',
        ]);

        $file = $request->file('csvFile');
        $fileHandle = fopen($file->getRealPath(), 'r');

        if (!$fileHandle) {
            return redirect()->back()->with('error', 'Cannot open uploaded CSV file.');
        }

        // 2️⃣ Read header row
        $header = fgetcsv($fileHandle);
        if (!$header) {
            return redirect()->back()->with('error', 'CSV file is empty or invalid.');
        }

        $insertData = [];
        $rowNumber = 1;

        // 3️⃣ Loop CSV rows and prepare data
        while (($row = fgetcsv($fileHandle)) !== false) {
            $rowNumber++;

            // Skip if userNumber is empty
            if (empty($row[3])) {
                continue;
            }

            $insertData[] = [
                'firstName'     => $row[1] ?? null,
                'lastName'      => $row[2] ?? null,
                'userNumber'    => $row[3] ?? null,
                'password'      => Hash::make($row[4] ?? null), // Laravel 12 auto-hashes
                'departmentId'  => $row[5] ?? null,
                'access'        => strtolower($row[6] ?? 'member'),
                'created_at'    => now(),
                'updated_at'    => now(),
            ];
        }

        fclose($fileHandle);

        if (!empty($insertData)) {
            try {
                // 4️⃣ Bulk upsert (insert or update)
                \App\Models\User::upsert(
                    $insertData,
                    ['userNumber'], // unique key for update
                    ['firstName', 'lastName', 'password', 'departmentId', 'access', 'updated_at'] // columns to update
                );

                return redirect()->back()->with('success', 'CSV data has been processed successfully!');
            } catch (\Exception $e) {
                return redirect()->back()->with('error', 'Error processing CSV: ' . $e->getMessage());
            }
        } else {
            return redirect()->back()->with('error', 'No valid data found in CSV.');
        }
    }
}
