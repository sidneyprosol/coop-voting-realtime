<?php

namespace App\Http\Controllers;

use App\Services\AdminService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminDepartmentController extends Controller
{
    protected $adminService;

    public function __construct(AdminService $adminService)
    {
        $this->adminService = $adminService;
    }

    public function index()
    {
        if (Auth::check()) {
            $adminServiceParameter = $this->adminService->getDepartments();
            return view('admin-departments', [
                'departments' => $adminServiceParameter['departments']
            ]);
        } else {
            return redirect('/')->with('error', 'Session Expired. Please Login Again!');
        }
    }

    public function adminDepartmentProcess(Request $request)
    {
        return $adminServiceParameter = $this->adminService->adminDepartmentProcess($request);
    }
}
