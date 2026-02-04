<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Live Election Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    @vite('resources/js/app.js')
    <style>
        body {
            background: linear-gradient(135deg, #e9f2ff);
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }

        .header-bar {
            background: linear-gradient(90deg, #0d6efd, #dc3545);
            color: white;
            padding: 18px;
            text-align: center;
            font-weight: bold;
            letter-spacing: 1px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .department-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: transform .3s ease;
            background: #fff;
        }

        .department-card:hover {
            transform: translateY(-5px);
        }

        .candidate-row {
            animation: fadeInUp .6s ease forwards;
            opacity: 0;
            transition: .2s;
        }

        .candidate-row:hover {
            transform: scale(1.02);
            background: #eef4ff;
        }

        @keyframes fadeInUp {
            from {
                transform: translateY(10px);
                opacity: 0;
            }

            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .progress {
            height: 18px;
            border-radius: 50px;
        }

        .progress-bar {
            font-size: 11px;
        }
    </style>
</head>

<body>
    <div class="header-bar">
        🗳️ 2026 COOP ELECTION LIVE RESULTS
        <div class="timer" id="timeStatus"></div>
    </div>

    <div class="container my-4">
        <div class="row g-4" id="resultsContainer"></div>
    </div>

    <script>
        let data = {
            departments: @json($departments)
        };

        function renderResults() {
            let container = document.getElementById("resultsContainer");
            container.innerHTML = "";

            data.departments.forEach(dept => {
                let totalVotes = dept.candidates.reduce((sum, c) => sum + c.votes_count, 0);

                let candidatesHTML = dept.candidates.map((c, index) => {
                    let percent = totalVotes ? ((c.votes_count / totalVotes) * 100).toFixed(1) : 0;
                    return `
            <div class="candidate-row mb-3 p-2 rounded" style="animation-delay:${index*0.1}s">
                <div class="d-flex align-items-center">
                    <img src="/${c.photo}" class="rounded-circle me-3 shadow"
                         style="width:55px;height:55px;object-fit:cover;border:3px solid #0d6efd;">
                    <div class="flex-grow-1">
                        <div class="d-flex justify-content-between">
                           ${c.candidateName}
                           <span class="fw-bold text-danger">${c.votes_count} votes (${percent}%)</span>
                        </div>
                        <div class="progress mt-1">
                            <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated"
                                 style="width:${percent}%"></div>
                        </div>
                    </div>
                </div>
            </div>`;
                }).join('');

                container.innerHTML += `
        <div class="col-lg-4 col-md-6">
            <div class="card department-card h-100">
                <div class="card-header bg-primary text-white fw-bold">
                    ${dept.departmentName} <span class="float-end">Total: ${totalVotes}</span>
                </div>
                <div class="card-body">${candidatesHTML}</div>
            </div>
        </div>`;
            });
        }

        // ⏰ Check if voting still active
        function checkVotingStatus() {
            const now = new Date();
            const endTime = new Date();
            endTime.setHours(16, 0, 0); // 4:00 PM
            const timeStatus = document.getElementById("timeStatus");

            if (now > endTime) {
                timeStatus.textContent = "Voting ended. Live updates disabled.";
                return false;
            } else {
                timeStatus.textContent = "Voting ongoing. Live updates enabled.";
                return true;
            }
        }

        renderResults();

        // 🔥 Listen for live votes
        document.addEventListener("DOMContentLoaded", function() {
            if (checkVotingStatus()) {
                console.log('Connecting to Echo...');
                window.Echo.channel('election-channel')
                    .listen('.vote.submitted', (e) => {
                        console.log('Vote received', e);
                        let candidateId = e.candidateId;
                        data.departments.forEach(dept => {
                            dept.candidates.forEach(c => {
                                if (c.id == candidateId) c.votes_count++;
                            });
                        });
                        renderResults();
                    });
            }
        });
    </script>

</body>

</html>
