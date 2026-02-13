@extends('layouts.master')

@section('title', 'Dashboard - 2026 COOP ELECTIONS')

@section('content')
    <h2 class="mb-4">List of Members</h2>

    <div class="form-section mt-3">

        <!-- Search + Export Row -->
        <div class="d-flex justify-content-between mb-2">
            <input type="text" id="searchInput" class="form-control w-50"
                placeholder="Search member, department, candidate...">

            <button onclick="exportTableToExcel()" class="btn btn-success">
                Export to Excel
            </button>
        </div>

        <table id="membersTable" class="table table-bordered table-striped table-sm">
            <thead>
                <tr>
                    <th>Member</th>
                    <th>Department</th>
                    <th>Candidate</th>
                    <th>Date</th>
                    <th>Time</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($votes as $data)
                    <tr>
                        <td>{{ $data->user->firstName . ' ' . $data->user->lastName }}</td>
                        <td>{{ $data->department->departmentName }}</td>
                        <td>{{ $data->candidate->candidateName }}</td>
                        <td>{{ $data->date }}</td>
                        <td>{{ \Carbon\Carbon::parse($data->time)->format('h:i A') }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/xlsx/dist/xlsx.full.min.js"></script>

    <script>
        // 🔎 SEARCH FUNCTION
        document.getElementById("searchInput").addEventListener("keyup", function() {
            let input = this.value.toLowerCase();
            let rows = document.querySelectorAll("#membersTable tbody tr");

            rows.forEach(function(row) {
                let text = row.textContent.toLowerCase();
                row.style.display = text.includes(input) ? "" : "none";
            });
        });


        // 📤 EXPORT TO EXCEL FUNCTION
        function exportTableToExcel() {
            let table = document.getElementById("membersTable");

            // Convert table to workbook
            let wb = XLSX.utils.table_to_book(table, {
                sheet: "Members"
            });

            // Export to real Excel file
            XLSX.writeFile(wb, "balot-data.xlsx");
        }
    </script>
@endpush
