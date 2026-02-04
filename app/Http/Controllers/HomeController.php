<?php

namespace App\Http\Controllers;

use App\Services\VoteServices;
use App\Services\VotingService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public $votingService;

    public function __construct(VotingService $votingService)
    {
        $this->votingService = $votingService;
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        if (auth()->user()->access == "admin") {
            return redirect('admin-members');
        } else {
            $curtime = DB::select('SELECT CURTIME()');
            $curdate = DB::select('SELECT CURDATE()');

            $dateString = $curdate[0]->{'CURDATE()'};
            $timeString = $curtime[0]->{'CURTIME()'};


            if ($dateString == env('VOTING_DATE')) {
                if ($timeString >= env('TIME_START')  &&  $timeString <= env('TIME_END')) {
                    $voteServicesParameter = $this->votingService->voteChecker();
                    if ($voteServicesParameter['checker'] == "granted") {
                        return redirect('voting-booth');
                    } else {
                        Auth::logout();
                        $request->session()->invalidate();
                        $request->session()->regenerateToken();
                        return redirect('/')->with('error', 'You have already casted your vote. Voting again is not allowed!');
                    }
                } else {
                    Auth::logout();
                    $request->session()->invalidate();
                    $request->session()->regenerateToken();
                    return redirect('/')->with('error', 'Voting has ended. You are no longer able to cast a vote!');
                }
            } else {
                Auth::logout();
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                return redirect('/')->with('error', 'Login not allowed!');
            }
        }
    }
}
