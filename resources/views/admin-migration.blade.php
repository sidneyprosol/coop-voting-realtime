@extends('layouts.master')

@section('title', 'Dashboard - 2026 COOP ELECTIONS')

@section('content')
    <h2 class="mb-4">Bulk import users from CSV</h2>

    <div class="form-section">
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <form method="POST" id="submitForm" action="{{ route('admin-migration-process') }}" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-md-12">
                    <input type="file" class="form-control" required name="csvFile" placeholder="Attached File Here!">
                </div>
                <div class="col-md-12">
                    <br />
                    <button type="submit" class="btn btn-success btn-sm float-end">Upload File</button>
                </div>
            </div>
        </form>
    </div>

@endsection


