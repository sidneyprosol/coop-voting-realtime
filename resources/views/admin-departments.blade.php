@extends('layouts.master')

@section('title', 'Dashboard - 2026 COOP ELECTIONS')

@section('content')
    <h2 class="mb-4">Departments</h2>

    <div class="form-section">
        {{-- Alert Messages --}}
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

        {{-- Add / Update Department Form --}}
        <form method="POST" id="submitForm" action="{{ route('admin-department-process') }}">
            @csrf
            <div class="row">
                <div class="col-md-12">
                    <input type="text" id="departmentInput" name="departmentName" class="form-control" required
                        placeholder="Enter Department Name">
                    <input type="hidden" id="departmentId" name="departmentId">
                </div>
                <div class="col-md-12 mt-3">
                    <button type="submit" class="btn btn-success btn-sm float-end" id="submitBtn">Save Department</button>
                </div>
            </div>
        </form>
    </div>

    {{-- Department Table --}}
    <div class="form-section mt-3">
        <table class="table table-bordered table-striped table-sm">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Department Name</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($departments as $data)
                    <tr>
                        <td>{{ $data->id }}</td>
                        <td>{{ $data->departmentName }}</td>
                        <td>
                            <div class="d-grid gap-2">
                                <button type="button" class="btn btn-sm btn-info edit-btn" data-id="{{ $data->id }}"
                                    data-name="{{ $data->departmentName }}">
                                    Edit
                                </button>
                            </div>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

@endsection

@push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const editButtons = document.querySelectorAll('.edit-btn');
            const departmentInput = document.getElementById('departmentInput');
            const departmentId = document.getElementById('departmentId');
            const submitBtn = document.getElementById('submitBtn');

            editButtons.forEach(btn => {
                btn.addEventListener('click', function() {
                    const id = this.getAttribute('data-id');
                    const name = this.getAttribute('data-name');

                    // Populate form
                    departmentInput.value = name;
                    departmentId.value = id;

                    // Change button text
                    submitBtn.textContent = 'Update Department';
                });
            });

            // Optional: Reset form after submit
            const form = departmentInput.closest('form');
            form.addEventListener('submit', function() {
                setTimeout(() => {
                    departmentInput.value = '';
                    departmentId.value = '';
                    submitBtn.textContent = 'Save Department';
                }, 500); // small delay to ensure session flash works
            });
        });
    </script>
@endpush
