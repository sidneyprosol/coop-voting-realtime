<?php

namespace App\Services;

use App\Events\VoteSubmitted;
use App\Models\Departments;
use App\Models\Votes;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class VotingService
{
    public function getMemberVotes()
    {
        $departments = Departments::with([
            'candidates' => function ($q) {
                $q->withCount('votes') // adds votes_count column
                    ->orderByDesc('votes_count'); // ranking
            }
        ])->get();

        return [
            'departments' => $departments
        ];
    }

    public function voteChecker()
    {

        $hasVoted = Votes::where('userId', auth()->user()->id)->exists();

        return [
            'checker' => $hasVoted ? 'denied' : 'granted'
        ];
    }

    public function voteSubmit($request)
    {
        $request->validate([
            '*.departmentId' => 'required|exists:departments,id',
            '*.candidateId' => 'required|exists:candidates,id',
        ]);

        $userId = auth()->user()->id; // authenticated user
        $curdate = DB::select('SELECT CURDATE()');
        $curtime = DB::select('SELECT CURTIME()');


        // Save votes
        foreach ($request->all() as $voteData) {
            Votes::create([
                'userId' => $userId,
                'departmentId' => $voteData['departmentId'],
                'candidateId' => $voteData['candidateId'],
                'date' => $curdate[0]->{'CURDATE()'},
                'time' => $curtime[0]->{'CURTIME()'},
            ]);
            // Safe broadcast
            try {
                broadcast(new VoteSubmitted($voteData['candidateId']))->toOthers();
            } catch (\Exception $e) {
                Log::error('Broadcast failed: ' . $e->getMessage());
            }
        }

        // Logout and clear session
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return response()->json([
            'message' => 'Votes saved successfully. You have been logged out.'
        ]);
    }

    public function getCandidates()
    {
        $departments = Departments::select('id', 'departmentName')
            ->get();

        return [
            'departments' => $departments
        ];
    }

    public function getAllVotes()
    {
        $votes = Votes::get();

        return [
            'votes' => $votes
        ];
    }
}
