<?php

namespace App\Http\Controllers;

use App\Services\VotingService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VoteListController extends Controller
{
    protected $votingService;

    public function __construct(VotingService $votingService)
    {
        $this->votingService = $votingService;
    }

    public function index()
    {
        if (Auth::check()) {
            $votingServiceParameter = $this->votingService->getAllVotes();
            return view('admin-voting-list',[
                'votes' => $votingServiceParameter['votes']
            ]);
        } else {
            return redirect('/')->with('error', 'Session Expired. Please Login Again!');
        }
    }
}
