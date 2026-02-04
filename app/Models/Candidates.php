<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Candidates extends Model
{
    protected $fillable = [
        'candidateName',
        'departmentId',
        'photo'
    ];

    public function department()
    {
        return $this->belongsTo('App\Models\Departments', 'departmentId', 'id');
    }

    public function votes()
    {
        return $this->hasMany(Votes::class, 'candidateId', 'id');
    }
}
