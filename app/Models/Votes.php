<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Votes extends Model
{
    protected $fillable = [
        'userId',
        'candidateId',
        'departmentId',
        'date',
        'time'
    ];

    /**
     * The user who cast this vote
     */
    public function user()
    {
        // One vote belongs to one user
        return $this->belongsTo(User::class, 'userId', 'id');
    }

    /**
     * The candidate this vote is for
     */
    public function candidate()
    {
        // One vote belongs to one candidate
        return $this->belongsTo(Candidates::class, 'candidateId', 'id');
    }

    /**
     * The department this vote belongs to
     */
    public function department()
    {
        // One vote belongs to one department
        return $this->belongsTo(Departments::class, 'departmentId', 'id');
    }
}
