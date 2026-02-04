<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Departments extends Model
{
    protected $fillable = [
        'departmentName'
    ];

    public function candidates()
    {
        return $this->hasMany('App\Models\Candidates', 'departmentId', 'id');
    }

    public function votes()
    {
        return $this->hasManyThrough(
            Votes::class,
            Candidates::class,
            'departmentId', // Foreign key on candidates table
            'candidateId',  // Foreign key on votes table
            'id',           // Local key on departments
            'id'            // Local key on candidates
        );
    }
}
