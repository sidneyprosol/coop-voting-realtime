<?php

namespace App\Http\Controllers;

use App\Services\VotingService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ResultsController extends Controller
{
    protected $votingService;

    public function __construct(VotingService $votingService)
    {
        $this->votingService = $votingService;
    }

    public function index()
    {
        $votingServiceParameter = $this->votingService->getMemberVotes();
        return view('results', [
            'departments' => $votingServiceParameter['departments']
        ]);
    }
}
