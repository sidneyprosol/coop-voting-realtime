<?php

namespace App\Events;

use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\Channel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Events\Dispatchable;

class VoteSubmitted implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $candidateId;

    /**
     * Create a new event instance.
     *
     * @param int $candidateId
     */
    public function __construct($candidateId)
    {
        $this->candidateId = $candidateId;
    }

    /**
     * The channel the event should broadcast on.
     *
     * @return Channel
     */
    public function broadcastOn()
    {
        return new Channel('election-channel'); // public channel
    }

    /**
     * Custom event name when broadcasting.
     *
     * @return string
     */
    public function broadcastAs()
    {
        return 'vote.submitted';
    }
}
