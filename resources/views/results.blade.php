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
            background: #fff;
        }

        /* 🔥 SMOOTH ENTERPRISE ANIMATIONS */
        .candidate-row {
            transition: all .45s cubic-bezier(.25, .8, .25, 1);
            position: relative;
        }

        .candidate-row:hover {
            transform: scale(1.02);
            background: #eef4ff;
        }

        .progress {
            height: 18px;
            border-radius: 50px;
        }

        .progress-bar {
            font-size: 11px;
            transition: width .7s ease-in-out;
        }

        .vote-bump {
            animation: votePulse .5s ease;
        }

        @keyframes votePulse {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.07);
            }

            100% {
                transform: scale(1);
            }
        }

        .timer {
            font-size: 14px;
            margin-top: 5px;
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
        const VOTE_TIME_START = "{{ env('TIME_START') }}";
        const VOTE_TIME_END = "{{ env('TIME_END') }}";
    </script>

    <script>
        let data = {
            departments: @json($departments)
        };

        function renderResults() {
            let container = document.getElementById("resultsContainer");
            container.innerHTML = "";

            data.departments.forEach(dept => {

                // SORT initially
                dept.candidates.sort((a, b) => b.votes_count - a.votes_count);

                let totalVotes = dept.candidates.reduce((sum, c) => sum + c.votes_count, 0);

                let candidatesHTML = dept.candidates.map(c => {
                    let percent = totalVotes ? ((c.votes_count / totalVotes) * 100).toFixed(1) : 0;
                    return `
<div class="candidate-row mb-3 p-2 rounded"
     id="candidate-${c.id}"
     data-id="${c.id}"
     data-votes="${c.votes_count}">
    <div class="d-flex align-items-center">
        <img src="/${c.photo}" class="rounded-circle me-3 shadow"
             style="width:55px;height:55px;object-fit:cover;border:3px solid #0d6efd;">
        <div class="flex-grow-1">
            <div class="d-flex justify-content-between">
               ${c.candidateName}
               <span class="fw-bold text-danger vote-count">${c.votes_count} votes (${percent}%)</span>
            </div>
            <div class="progress mt-1">
                <div class="progress-bar bg-primary progress-bar-striped progress-bar-animated vote-bar"
                     style="width:${percent}%"></div>
            </div>
        </div>
    </div>
</div>`;
                }).join('');

                container.innerHTML += `
<div class="col-lg-4 col-md-6">
    <div class="card department-card h-100">
        <div class="card-header bg-primary text-white fw-bold" style="font-size:13px;">
            ${dept.departmentName}
            <span class="float-end">Total: <span id="total-${dept.id}">${totalVotes}</span></span>
        </div>
        <div class="card-body" id="dept-body-${dept.id}">
            ${candidatesHTML}
        </div>
    </div>
</div>`;
            });
        }

        function smoothVoteUpdate(candidateId) {
            data.departments.forEach(dept => {
                let totalVotes = dept.candidates.reduce((s, c) => s + c.votes_count, 0);
                document.getElementById(`total-${dept.id}`).innerText = totalVotes;

                dept.candidates.forEach(c => {
                    const row = document.getElementById(`candidate-${c.id}`);
                    if (!row) return;

                    const percent = totalVotes ? ((c.votes_count / totalVotes) * 100).toFixed(1) : 0;

                    row.querySelector(".vote-count").innerHTML =
                        `${c.votes_count} votes (${percent}%)`;

                    row.querySelector(".vote-bar").style.width = percent + "%";
                });

                // SORT DESC
                dept.candidates.sort((a, b) => b.votes_count - a.votes_count);
                const cardBody = document.getElementById(`dept-body-${dept.id}`);

                dept.candidates.forEach(c => {
                    const el = document.getElementById(`candidate-${c.id}`);
                    cardBody.appendChild(el); // smooth DOM move
                });
            });

            const votedRow = document.getElementById(`candidate-${candidateId}`);
            if (votedRow) {
                votedRow.classList.add("vote-bump");
                setTimeout(() => votedRow.classList.remove("vote-bump"), 500);
            }
        }

        /* TIMER + STATUS */
        function parseTimeToDate(timeStr) {
            const [h, m, s] = timeStr.split(':').map(Number);
            const d = new Date();
            d.setHours(h, m, s, 0);
            return d;
        }

        function startCountdown(targetTime) {
            const el = document.getElementById("countdown");

            function update() {
                const now = new Date();
                const diff = targetTime - now;
                if (diff <= 0) {
                    location.reload();
                    return;
                }
                const hrs = Math.floor(diff / (1000 * 60 * 60));
                const mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
                const secs = Math.floor((diff % (1000 * 60)) / 1000);
                el.innerHTML =
                    `${String(hrs).padStart(2,'0')}:${String(mins).padStart(2,'0')}:${String(secs).padStart(2,'0')}`;
            }
            update();
            setInterval(update, 1000);
        }

        function checkVotingStatus() {
            const now = new Date();
            const start = parseTimeToDate(VOTE_TIME_START);
            const end = parseTimeToDate(VOTE_TIME_END);
            const timeStatus = document.getElementById("timeStatus");

            if (now < start) {
                timeStatus.innerHTML =
                    `Voting not started.<br>Starts in: <span id="countdown" class="fw-bold text-warning"></span>`;
                startCountdown(start);
                return false;
            } else if (now <= end) {
                timeStatus.innerHTML =
                    `Voting ongoing. Live updates enabled.<br>Ends in: <span id="countdown" class="fw-bold text-light"></span>`;
                startCountdown(end);
                return true;
            } else {
                timeStatus.innerHTML = "Voting ended.";
                return false;
            }
        }

        /* INIT */
        renderResults();

        document.addEventListener("DOMContentLoaded", function() {
            if (checkVotingStatus()) {
                window.Echo.channel('election-channel')
                    .listen('.vote.submitted', (e) => {
                        let candidateId = e.candidateId;

                        data.departments.forEach(dept => {
                            dept.candidates.forEach(c => {
                                if (c.id == candidateId) c.votes_count++;
                            });
                        });

                        smoothVoteUpdate(candidateId);
                    });
            }
        });
    </script>
</body>

</html>
