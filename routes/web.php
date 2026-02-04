<?php

use App\Http\Controllers\AdminCandidateController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::middleware(['auth', 'prevent-back-history'])->group(function () {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('/admin-import-member', [App\Http\Controllers\AdminController::class, 'index'])->name('admin-import-member');
    Route::post('/admin-migration-process', [App\Http\Controllers\AdminController::class, 'adminMigrationProcess'])->name('admin-migration-process');

    Route::get('/admin-departments', [App\Http\Controllers\AdminDepartmentController::class, 'index'])->name('admin-departments');
    Route::post('/admin-department-process', [App\Http\Controllers\AdminDepartmentController::class, 'adminDepartmentProcess'])->name('admin-department-process');

    Route::get('/admin-candidates', [App\Http\Controllers\AdminCandidateController::class, 'index'])->name('admin-candidates');
    Route::post('/admin-candidates-process', [App\Http\Controllers\AdminCandidateController::class, 'adminCandidatesProcess'])->name('admin-candidates-process');
    Route::post('/chunk-upload', [AdminCandidateController::class, 'chunkUpload'])->name('chunk.upload');

    Route::get('/admin-members', [App\Http\Controllers\AdminUserController::class, 'index'])->name('admin-members');

    Route::get('/admin-register-member', [App\Http\Controllers\AdminRegisterMemberController::class, 'index'])->name('admin-register-member');
    Route::post('/admin-register-member-process', [App\Http\Controllers\AdminRegisterMemberController::class, 'adminRegisterMemberProcess'])->name('admin-register-member-process');

    Route::get('/voting-booth', [App\Http\Controllers\VotingBoothController::class, 'index'])->name('voting-booth');
    Route::post('/vote-submit', [App\Http\Controllers\VotingBoothController::class, 'voteSubmit'])->name('vote-submit');
});


Route::get('/results', [App\Http\Controllers\ResultsController::class, 'index'])->name('results');
Route::post('/admin-logout', [App\Http\Controllers\AdminController::class, 'logout'])->name('admin-logout');
