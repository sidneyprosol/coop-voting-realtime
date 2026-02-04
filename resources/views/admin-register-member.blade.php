@extends('layouts.master')

@section('title', 'Dashboard - 2026 COOP ELECTIONS')

@section('content')
    <h2 class="mb-4">Register Member</h2>



    <div class="form-section mt-3">
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
        <form action="{{ route('admin-register-member-process') }}" method="post" id="submitForm">
            @csrf
            <div class="row">
                <div class="col-md-4">
                    <label for="userNumber">First Name</label>
                    <input type="text" class="form-control" required name="firstName" placeholder="Enter First Name">
                </div>
                <div class="col-md-4">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" required name="lastName" placeholder="Enter Last Name">
                </div>
                <div class="col-md-4">
                    <label for="departmentId">Department</label>
                    <select name="departmentId" class="form-select" required>
                        <option value="" default>Select</option>
                        @foreach ($departments as $data)
                            <option value="{{ $data->id }}">{{ $data->departmentName }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="userNumber">User Number</label>
                    <input type="text" class="form-control" required name="userNumber" placeholder="Enter User Number">
                </div>
                <div class="col-md-6">
                    <label for="passCode">Passcode</label>
                    <input type="text" class="form-control" required name="passCode" placeholder="Enter Passcode">
                </div>
                <div class="col-md-12">
                    <button class="btn btn-sm float-end btn-success" type="submit">Register New Member</button>
                </div>
            </div>
        </form>
    </div>

@endsection

@push('scripts')
    <script>
        // Get input and table
        const searchInput = document.getElementById('searchInput');
        const table = document.getElementById('membersTable');
        const rows = table.getElementsByTagName('tr');

        searchInput.addEventListener('keyup', function() {
            const filter = this.value.toLowerCase();

            // Loop through table rows (skip header row)
            for (let i = 1; i < rows.length; i++) {
                let row = rows[i];
                let cells = row.getElementsByTagName('td');
                let match = false;

                // Check each cell
                for (let j = 0; j < cells.length; j++) {
                    if (cells[j].innerText.toLowerCase().includes(filter)) {
                        match = true;
                        break;
                    }
                }

                // Show/hide row
                row.style.display = match ? '' : 'none';
            }
        });
    </script>
@endpush
