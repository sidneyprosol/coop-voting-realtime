<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title', '2026 COOP ELECTIONS')</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body,
        html {
            height: 100%;
            background: #f8f9fa;
        }

        /* Sidebar */
        .sidebar {
            min-width: 220px;
            max-width: 220px;
            background: linear-gradient(180deg, #0d6efd, #dc3545);
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 60px;
            /* spacing for navbar */
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 12px 20px;
            border-radius: 6px;
            margin: 4px 10px;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* Top Navbar */
        .top-navbar {
            height: 60px;
            background: #fff;
            border-bottom: 1px solid #dee2e6;
            position: fixed;
            top: 0;
            left: 220px;
            right: 0;
            display: flex;
            align-items: center;
            padding: 0 20px;
            z-index: 1000;
        }

        /* Main content */
        .main-content {
            margin-left: 220px;
            padding: 20px;
            padding-top: 80px;
        }

        /* Form section */
        .form-section {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
        }
    </style>

    @stack('styles')
</head>

<body class="d-flex flex-column min-vh-100">
    <div id="loadingOverlay"
        style="
    display:none;
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.6);
    z-index:9999;
    justify-content:center;
    align-items:center;
    flex-direction:column;
    color:#fff;
    font-size:18px;
">
        <div class="spinner-border text-light" style="width:3rem;height:3rem;" role="status"></div>
        <div class="mt-3">Processing, please wait...</div>
    </div>

    <form id="logoutForm" action="{{ route('admin-logout') }}" method="POST" style="display: none;">
        @csrf
    </form>
    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center mb-4">DASHBOARD</h4>
        <a href="{{ route('admin-import-member') }}">Import</a>
        <a href="{{ route('admin-register-member') }}">Register</a>
        <a href="{{ route('admin-members') }}">Members</a>
        <a href="{{ route('admin-candidates') }}">Candidates</a>
        <a href="{{ route('admin-departments') }}">Departments</a>
        <a href="#" onclick="event.preventDefault(); document.getElementById('logoutForm').submit();">
            Logout
        </a>
    </div>

    <!-- Top Navbar -->
    <div class="top-navbar">
        <div class="ms-auto">
            Logged in as:
            <strong>{{ auth()->check() ? auth()->user()->firstName . ' ' . auth()->user()->middleInitial . ' ' . auth()->user()->lastName : 'Guest' }}</strong>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content flex-grow-1">
        @yield('content')
    </div>

    <!-- Footer -->
    <footer class="text-center mt-auto py-3 text-muted" style="background: #f8f9fa;">
        &copy; 2026 COOP ELECTIONS
    </footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById("submitForm").addEventListener("submit", function() {
            document.getElementById("loadingOverlay").style.display = "flex";
        });
    </script>
    @stack('scripts')
</body>


</html>
