<?php

namespace App\Http\Controllers;

use App\Services\AdminService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminCandidateController extends Controller
{
    protected $adminService;

    public function __construct(AdminService $adminService)
    {
        $this->adminService = $adminService;
    }

    public function index()
    {
        if (Auth::check()) {
            $adminServiceParameterForDepartments = $this->adminService->getDepartments();
            $adminServiceParamaterForCandidates = $this->adminService->getCandidates();
            return view('admin-candidates', [
                'departments' => $adminServiceParameterForDepartments['departments'],
                'candidates' => $adminServiceParamaterForCandidates['candidates'],
            ]);
        } else {
            return redirect('/')->with('error', 'Session Expired. Please Login Again!');
        }
    }

    public function adminCandidatesProcess(Request $request)
    {
        return $this->adminService->adminCandidatesProcess($request);
    }

    public function chunkUpload(Request $request)
    {
        return $this->adminService->handleChunkUpload($request);
    }
}
