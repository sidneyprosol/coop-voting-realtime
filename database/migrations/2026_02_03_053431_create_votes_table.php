<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('votes', function (Blueprint $table) {
            $table->id();
            $table->integer('userId')->index();
            $table->foreign('userId')->references('id')->on('users');
            $table->integer('departmentId')->index();
            $table->foreign('departmentId')->references('id')->on('departments');
            $table->integer('candidateId')->index();
            $table->foreign('candidateId')->references('id')->on('candidates');
            $table->date('date');
            $table->time('time');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('votes');
    }
};
