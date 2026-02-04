@extends('layouts.master')

@section('title', 'Dashboard - 2026 COOP ELECTIONS')

@section('content')
    <h2 class="mb-4">Candidates</h2>

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

        {{-- Add / Update Candidate Form --}}
        <form method="POST" id="submitForm" action="{{ route('admin-candidates-process') }}">
            @csrf

            <!-- Hidden Inputs -->
            <input type="hidden" name="candidateId" id="candidateId">
            <input type="hidden" name="photo_path" id="photo_path">

            <div class="row">
                <div class="col-md-6">
                    <div class="row g-3">
                        <!-- Candidate Name -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="candidateName" class="form-label fw-semibold">Candidate Name</label>
                                <input type="text" id="candidateName" name="candidateName" class="form-control"
                                    placeholder="Enter candidate full name" required>
                            </div>
                        </div>

                        <!-- Department -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="departmentId" class="form-label fw-semibold">Department</label>
                                <select id="departmentId" style="width:100%;" name="departmentId" class="form-select"
                                    required>
                                    <option value="" disabled selected>Choose department</option>
                                    @foreach ($departments as $data)
                                        <option value="{{ $data->id }}">{{ $data->departmentName }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Photo Upload -->
                <div class="col-md-6">
                    <div class="row g-3">
                        <div class="col-md-12">
                            <div class="card shadow-sm border-0">
                                <div class="card-body text-center">
                                    <label class="form-label fw-semibold d-block">Candidate Photo</label>

                                    <!-- Image Preview -->
                                    <img id="imagePreview" src="https://via.placeholder.com/200x200?text=No+Image"
                                        class="img-fluid rounded mb-3 border" style="max-height:200px; object-fit:cover;">

                                    <!-- File Input -->
                                    <input type="file" name="photo" id="photoInput" class="form-control"
                                        accept="image/*" required>

                                    <small class="text-muted">Allowed: JPG, PNG. Max 2MB</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Buttons -->
                <div class="col-md-12 mt-3">
                    <button type="submit" class="btn btn-success btn-sm float-end" id="submitBtn">Save Candidate</button>
                    <button type="button" class="btn btn-secondary btn-sm float-end me-2 d-none"
                        id="cancelEdit">Cancel</button>
                </div>
            </div>
        </form>
    </div>

    {{-- Candidate List --}}
    <div class="form-section mt-3">
        <table class="table table-bordered table-striped table-sm">
            <thead>
                <tr>
                    <th>Candidate Name</th>
                    <th>Department</th>
                    <th>Photo</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($candidates as $data)
                    <tr>
                        <td>{{ $data->candidateName }}</td>
                        <td>{{ $data->department->departmentName }}</td>
                        <td>
                            <img src="{{ asset($data->photo) }}" alt="Candidate Photo" class="img-fluid"
                                style="max-height:50px;">
                        </td>
                        <td>
                            <div class="d-grid gap-2">
                                <a href="javascript:void(0)" class="btn btn-sm btn-primary editBtn"
                                    data-id="{{ $data->id }}" data-name="{{ $data->candidateName }}"
                                    data-department="{{ $data->departmentId }}" data-photo="{{ asset($data->photo) }}">
                                    Edit
                                </a>
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
        const fileInput = document.getElementById('photoInput');
        const preview = document.getElementById('imagePreview');
        const form = document.getElementById('submitForm');
        const submitBtn = document.getElementById('submitBtn');
        const cancelBtn = document.getElementById('cancelEdit');
        const candidateIdInput = document.getElementById('candidateId');
        const photoPathInput = document.getElementById('photo_path');

        const CHUNK_SIZE = 1024 * 1024; // 1MB
        let uploadInProgress = false;

        // Chunked Upload
        fileInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (!file) return;

            preview.src = URL.createObjectURL(file);
            uploadFileInChunks(file);
        });

        function uploadFileInChunks(file) {
            const totalChunks = Math.ceil(file.size / CHUNK_SIZE);
            const fileId = Date.now() + '-' + file.name.replace(/\s/g, '');
            let chunkIndex = 0;
            uploadInProgress = true;

            function sendNextChunk() {
                const start = chunkIndex * CHUNK_SIZE;
                const end = Math.min(start + CHUNK_SIZE, file.size);
                const chunk = file.slice(start, end);

                let formData = new FormData();
                formData.append('chunk', chunk);
                formData.append('chunkIndex', chunkIndex);
                formData.append('totalChunks', totalChunks);
                formData.append('fileName', file.name);
                formData.append('fileId', fileId);
                formData.append('_token', '{{ csrf_token() }}');

                fetch("{{ route('chunk.upload') }}", {
                        method: 'POST',
                        body: formData
                    })
                    .then(res => res.json())
                    .then(data => {
                        console.log("Chunk Upload Response:", data);
                        if (data.status === 'chunk_received') {
                            chunkIndex++;
                            if (chunkIndex < totalChunks) {
                                sendNextChunk();
                            } else {
                                photoPathInput.value = data.file_path;
                                uploadInProgress = false;
                                console.log("Upload Complete, photo_path set to:", data.file_path);
                            }
                        }
                    });
            }

            sendNextChunk();
        }

        // Debug before submit
        form.addEventListener('submit', function(e) {
            console.log("Submitting form with candidateId:", candidateIdInput.value);
            console.log("Submitting form with photo_path:", photoPathInput.value);

            if (!photoPathInput.value && !candidateIdInput.value) {
                e.preventDefault();
                alert('Please wait until photo upload is complete.');
            }
        });

        // Edit Candidate
        document.querySelectorAll('.editBtn').forEach(btn => {
            btn.addEventListener('click', function() {
                const id = this.dataset.id;
                const name = this.dataset.name;
                const dept = this.dataset.department;
                const photo = this.dataset.photo;

                console.log("Edit clicked. candidateId:", id);

                candidateIdInput.value = id;
                document.getElementById('candidateName').value = name;
                document.getElementById('departmentId').value = dept;
                preview.src = photo;

                submitBtn.innerText = "Update Candidate";
                submitBtn.classList.remove('btn-success');
                submitBtn.classList.add('btn-warning');

                cancelBtn.classList.remove('d-none');
            });
        });

        // Cancel Edit
        cancelBtn.addEventListener('click', () => {
            form.reset();
            preview.src = "https://via.placeholder.com/200x200?text=No+Image";
            candidateIdInput.value = "";
            photoPathInput.value = "";
            submitBtn.innerText = "Save Candidate";
            submitBtn.classList.remove('btn-warning');
            submitBtn.classList.add('btn-success');
            cancelBtn.classList.add('d-none');
            console.log("Edit cancelled. Form reset.");
        });
    </script>
@endpush
