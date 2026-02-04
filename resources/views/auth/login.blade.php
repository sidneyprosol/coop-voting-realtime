<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>2026 COOP ELECTIONS</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        body,
        html {
            height: 100%;
            background: linear-gradient(135deg, #f0f8ff, #e6e6fa);
        }

        .login-container {
            min-height: 100vh;
        }

        .card {
            border: none;
            border-radius: 1rem;
        }

        /* Card header gradient with image */
        .card-header-gradient {
            background: linear-gradient(90deg, #0d6efd, #dc3545);
            color: #fff;
            border-top-left-radius: 1rem;
            border-top-right-radius: 1rem;
            text-align: left;
            padding: 1.5rem 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-header-gradient h1 {
            margin: 0;
            font-size: 1.75rem;
            font-weight: 700;
            line-height: 1.2;
        }

        .card-header-gradient p {
            margin: 0.5rem 0 0 0;
            font-size: 1rem;
            font-weight: 500;
            color: #fffbe6;
        }

        .card-header-gradient img {
            width: 150px;
            /* adjust as needed */
            height: auto;
            border-radius: 0.5rem;
        }

        .form-floating .form-control {
            border-radius: 0.5rem;
            padding: 1.25rem 0.75rem;
        }

        .btn-login {
            border-radius: 0.5rem;
            padding: 0.75rem;
            font-size: 1.1rem;
        }

        @media (max-width: 576px) {
            .card-header-gradient {
                flex-direction: column;
                align-items: flex-start;
            }

            .card-header-gradient h1 {
                font-size: 1.5rem;
            }

            .card-header-gradient p {
                font-size: 0.9rem;
            }

            .card-header-gradient img {
                width: 120px;
                margin-top: 0.5rem;
            }
        }
    </style>
</head>

<body>
    <div class="container login-container d-flex justify-content-center align-items-center">
        <div class="col-lg-5 col-md-7">

            <div class="card shadow-lg">

                <!-- Card Header with Gradient and Image -->
                <div class="card-header-gradient">
                    <div>
                        <h1>2026 COOP ELECTIONS</h1>
                        <p>Member Login Portal</p>
                    </div>
                    <div>
                        <img src="{{ asset('images/coopLogo.png') }}" alt="Election Logo">
                    </div>
                </div>

                <div class="card-body p-4">

                    <form method="POST" action="{{ route('login') }}">
                        @csrf
                        @if (session('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('success') }}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        @endif

                        @if (session('error'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ session('error') }}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        @endif
                        <!-- User Number -->
                        <div class="mb-3">
                            <div class="form-floating">
                                <input id="userNumber" type="text"
                                    class="form-control @error('userNumber') is-invalid @enderror" name="userNumber"
                                    value="{{ old('userNumber') }}" placeholder="User Number" required>
                                <label for="userNumber">{{ __('User Number') }}</label>
                                @error('userNumber')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <!-- Passcode -->
                        <div class="mb-3">
                            <div class="form-floating">
                                <input id="password" type="password"
                                    class="form-control @error('password') is-invalid @enderror" name="password"
                                    placeholder="Passcode" required>
                                <label for="password">{{ __('Passcode') }}</label>
                                @error('password')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <!-- Submit -->
                        <div class="d-grid mb-3">
                            <button type="submit" class="btn btn-danger btn-lg btn-login">{{ __('Login') }}</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
</body>

</html>
