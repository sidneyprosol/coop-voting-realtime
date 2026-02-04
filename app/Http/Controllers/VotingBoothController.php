<?php

namespace App\Http\Controllers;

use App\Services\VotingService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VotingBoothController extends Controller
{
    protected $votingService;

    public function __construct(VotingService $votingService)
    {
        $this->votingService = $votingService;
    }

    public function index()
    {
        if (Auth::check()) {
            $votingServiceParameter = $this->votingService->getCandidates();
            return view('voting-booth',[
                'departments' => $votingServiceParameter['departments']
            ]);
        } else {
            return redirect('/')->with('error', 'Session Expired. Please Login Again!');
        }
    }

    public function voteSubmit(Request $request)
    {
        return $this->votingService->voteSubmit($request);
    }
}
