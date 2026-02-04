@extends('layouts.master')

@section('title', 'Dashboard - 2026 COOP ELECTIONS')

@section('content')
    <h2 class="mb-4">Edit User Info</h2>

    <div class="form-section">
        <form method="POST" action="#">
            @csrf
            <div class="mb-3">
                <label for="firstname" class="form-label">Firstname</label>
                <input type="text" class="form-control" id="firstname" name="firstname" value="">
            </div>

            <div class="mb-3">
                <label for="middle_initial" class="form-label">Middle Initial</label>
                <input type="text" class="form-control" id="middle_initial" name="middle_initial" maxlength="1">
            </div>

            <div class="mb-3">
                <label for="lastname" class="form-label">Lastname</label>
                <input type="text" class="form-control" id="lastname" name="lastname">
            </div>

            <div class="mb-3">
                <label for="suffix" class="form-label">Suffix</label>
                <input type="text" class="form-control" id="suffix" name="suffix">
            </div>

            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>
@endsection
