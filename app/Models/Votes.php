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
}
