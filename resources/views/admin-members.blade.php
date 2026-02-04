@extends('layouts.master')

@section('title', 'Dashboard - 2026 COOP ELECTIONS')

@section('content')
    <h2 class="mb-4">List of Members</h2>


    {{-- Department Table --}}
    <div class="form-section mt-3">
        <!-- Search Input -->
        <input type="text" id="searchInput" placeholder="Search..." class="form-control mb-2">

        <table id="membersTable" class="table table-bordered table-striped table-sm">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>User Number</th>
                    <th>Department</th>
                    <th>Access</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($members as $item)
                    <tr>
                        <td>{{ $item->firstName }}</td>
                        <td>{{ $item->lastName }}</td>
                        <td>{{ $item->userNumber }}</td>
                        <td>
                            @if ($item->department)
                                {{ $item->department->departmentName }}
                            @else
                                N/A
                            @endif
                        </td>
                        <td>{{ Str::ucfirst($item->access) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
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
