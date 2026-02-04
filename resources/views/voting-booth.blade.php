<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>2026 Coop Election - Voting Booth</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f5fb;
            position: relative;
            z-index: 1;
        }

        /* WATERMARK LOGO */
        body::before {
            content: "";
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 500px;
            background: url("{{ asset('images/coopLogo.png') }}") no-repeat center center;
            background-size: contain;
            opacity: 0.1;
            z-index: 0;
            pointer-events: none;
        }

        /* Sticky Header */
        .header-container {
            position: sticky;
            top: 0;
            background: rgba(241, 245, 251, 0.95);
            backdrop-filter: blur(5px);
            z-index: 10;
            padding: 15px 0;
        }

        /* Titles */
        .election-title {
            color: #d90429;
            font-weight: 800;
            letter-spacing: 2px;
        }

        .page-title {
            color: #0033a0;
            font-weight: 700;
        }

        /* Department box */
        .department-box {
            background: rgba(255, 255, 255, 0.55);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
            padding: 20px;
            margin-bottom: 40px;
        }

        .dept-title {
            background: linear-gradient(90deg, #0033a0, #d90429);
            color: white;
            padding: 10px 15px;
            border-radius: 8px;
            font-weight: bold;
            letter-spacing: 1px;
            font-size: 18px;
            display: inline-block;
            margin-bottom: 20px;
        }

        /* Candidate card */
        .candidate-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 15px;
            text-align: center;
            cursor: pointer;
            transition: 0.3s ease;
            border: 3px solid transparent;
            height: 100%;
            position: relative;
        }

        .candidate-card:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            border-color: #0033a0;
        }

        .candidate-card.selected {
            border: 3px solid #d90429;
            box-shadow: 0 0 15px #d90429aa;
        }

        .candidate-card.selected::after {
            content: "✓";
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            color: #d90429;
            font-weight: bold;
        }

        .candidate-img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            border: 3px solid #0033a0;
            margin-bottom: 10px;
        }

        .candidate-name {
            font-weight: 600;
            color: #0033a0;
        }

        /* Vote button */
        .vote-btn {
            background: linear-gradient(90deg, #0033a0, #d90429);
            border: none;
            padding: 12px 40px;
            border-radius: 30px;
            font-weight: bold;
            letter-spacing: 1px;
            color: white;
            width: 100%;
            max-width: 300px;
        }

        .vote-btn:hover {
            opacity: 0.9;
        }

        /* Step indicator */
        .step-indicator {
            position: fixed;
            bottom: 15px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 20;
            font-size: 14px;
            color: #555;
            background: rgba(255, 255, 255, 0.7);
            padding: 5px 15px;
            border-radius: 20px;
            backdrop-filter: blur(5px);
        }

        /* Modal candidate summary card */
        .modal-vote-card {
            padding: 12px;
            border-radius: 10px;
            background: #f8f9fa;
            border-left: 5px solid #d90429;
            margin-bottom: 10px;
        }

        .modal-vote-card .dept-name {
            font-weight: bold;
            color: #0033a0;
            font-size: 16px;
        }

        .modal-vote-card .candidate-name {
            font-weight: 600;
            color: #d90429;
            margin-top: 3px;
        }
    </style>
</head>

<body>

    <div class="container header-container text-center">
        <h1 class="election-title">2026 COOP ELECTION</h1>
        <h3 class="page-title mb-0">🗳 VOTING BOOTH</h3>
    </div>

    <div class="container my-4">

        @foreach ($departments as $departmentData)
            <div class="department-box" data-deptid="{{ $departmentData->id }}">
                <div class="dept-title mt-3">{{ $departmentData->departmentName }}</div>
                <div class="row g-4">
                    @foreach ($departmentData->candidates as $candidates)
                        <div class="col-6 col-md-4 col-lg-3">
                            <div class="candidate-card" data-id="{{ $candidates->id }}"
                                onclick="selectCandidate(this, '{{ $departmentData->id }}')">
                                <img src="{{ asset($candidates->photo) }}" class="candidate-img">
                                <div class="candidate-name">{{ $candidates->candidateName }}</div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @endforeach

        <div class="text-center mt-4 mb-5">
            <button class="btn vote-btn" onclick="submitVote()">SUBMIT VOTE</button>
        </div>

    </div>

    <div class="step-indicator" id="stepIndicator">Voted 1 of {{ count($departments) }}</div>

    <!-- Modal -->
    <div class="modal fade" id="voteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content border-0">
                <div class="modal-header" style="background: linear-gradient(90deg,#0033a0,#d90429); color:white;">
                    <h5 class="modal-title">Confirm Your Votes</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body" id="modalBody">
                    <!-- Votes summary will be injected here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="confirmVoteBtn"
                        style="background: linear-gradient(90deg,#0033a0,#d90429); border:none;">Submit Vote</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        let votes = {};

        function selectCandidate(card, deptId) {
            let group = card.closest('.department-box').querySelectorAll('.candidate-card');
            group.forEach(c => c.classList.remove('selected'));
            card.classList.add('selected');

            const departmentName = card.closest('.department-box').querySelector('.dept-title').innerText;

            votes[deptId] = {
                departmentId: deptId,
                departmentName: departmentName,
                candidateId: card.dataset.id,
                candidateName: card.querySelector('.candidate-name').innerText
            };

            // Scroll with offset so department title is visible
            let nextDept = card.closest('.department-box').nextElementSibling;
            if (nextDept) {
                const headerOffset = document.querySelector('.header-container').offsetHeight + 10;
                const y = nextDept.getBoundingClientRect().top + window.pageYOffset - headerOffset;
                window.scrollTo({
                    top: y,
                    behavior: 'smooth'
                });
            }

            // Update step indicator
            let allDepartments = document.querySelectorAll('.department-box');
            let currentIndex = Array.from(allDepartments).indexOf(card.closest('.department-box'));
            document.getElementById('stepIndicator').innerText = `Voted ${currentIndex + 1} of ${allDepartments.length}`;
        }

        function submitVote() {
            const selectedCount = Object.keys(votes).length;
            if (selectedCount < 3) {
                alert(`Please select at least 3 candidates before submitting.\nCurrently selected: ${selectedCount}`);
                return;
            }

            // Prepare modal summary with modern card layout
            let summaryHTML = '';
            for (let key in votes) {
                const vote = votes[key];
                summaryHTML += `
                    <div class="modal-vote-card">
                        <div class="dept-name">${vote.departmentName}</div>
                        <div class="candidate-name">${vote.candidateName}</div>
                    </div>
                `;
            }
            document.getElementById('modalBody').innerHTML = summaryHTML;

            // Show modal
            let voteModal = new bootstrap.Modal(document.getElementById('voteModal'));
            voteModal.show();

            document.getElementById('confirmVoteBtn').onclick = () => {
                voteModal.hide();
                sendVote();
            };
        }

        function sendVote() {
            let payload = Object.values(votes).map(v => ({
                departmentId: v.departmentId,
                candidateId: v.candidateId
            }));

            fetch("{{ route('vote-submit') }}", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "X-CSRF-TOKEN": "{{ csrf_token() }}"
                    },
                    body: JSON.stringify(payload)
                })
                .then(res => res.json())
                .then(data => {
                    Swal.fire({
                        title: '<span style="color:#002868; font-weight:bold;">Vote Submitted!</span>',
                        html: '<span style="color:#BF0A30;">Thank you for casting your vote.</span>',
                        icon: 'success',
                        iconColor: '#002868', // dark blue icon
                        background: '#ffffff', // white background
                        confirmButtonText: 'OK',
                        confirmButtonColor: '#BF0A30', // red button
                        timer: 4000,
                        timerProgressBar: true,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    }).then(() => {
                        window.location.href = '/login';
                    });
                })
                .catch(err => {
                    console.error(err);
                    alert("An error occurred. Please try again.");
                });
        }
    </script>

</body>

</html>
