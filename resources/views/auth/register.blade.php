<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>404 - Page Not Found</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      color: #212529;
    }
    .error-page {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      flex-direction: column;
    }
    .error-code {
      font-size: 8rem;
      font-weight: bold;
      color: #dc3545; /* red */
    }
    .error-text {
      font-size: 1.5rem;
      color: #0d6efd; /* blue */
    }
    .home-btn {
      background-color: #fff;
      border: 2px solid #dc3545;
      color: #dc3545;
      transition: all 0.3s;
    }
    .home-btn:hover {
      background-color: #dc3545;
      color: #fff;
      border-color: #dc3545;
    }
  </style>
</head>
<body>

  <div class="error-page">
    <div class="error-code">404</div>
    <div class="error-text mb-4">Page Not Found</div>
    <p class="mb-4 text-secondary">Sorry, the page you are looking for does not exist.</p>
    <a href="/" class="btn home-btn btn-lg">Go to Homepage</a>
  </div>

  <!-- Bootstrap 5 JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
