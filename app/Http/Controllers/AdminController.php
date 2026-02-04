<?php

namespace App\Http\Controllers;

use App\Services\AdminService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    protected $adminService;

    public function __construct(AdminService $adminService)
    {
        $this->adminService = $adminService;
    }

    public function index()
    {
        if (Auth::check()) {
            return view('admin-migration');
        } else {
            return redirect('/')->with('error', 'Session Expired. Please Login Again!');
        }
    }

    public function adminMigrationProcess(Request $request)
    {
        return $this->adminService->adminMigrationProcess($request);
    }

    public function logout()
    {
        // 1. Log out the user
        Auth::logout();

        // 2. Invalidate current session
        request()->session()->invalidate();

        // 3. Regenerate CSRF token
        request()->session()->regenerateToken();

        // 4. Redirect to login page with optional message
        return redirect()->route('login')->with('success', 'Logged out successfully!');
    }
}
