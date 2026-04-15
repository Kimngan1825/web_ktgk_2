<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Cây Cảnh Xanh') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="font-sans text-gray-900 antialiased">
        <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-gray-100">
            <div>
                <a href="/" class="flex flex-col items-center gap-2">
                    <span class="inline-flex h-20 w-20 items-center justify-center rounded-full bg-emerald-100 ring-2 ring-emerald-300">
                        <svg class="h-11 w-11 text-emerald-700" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                            <path d="M12.03 3.25a8.87 8.87 0 0 0-5.48 3.2c-2.02 2.37-2.72 5.82-1.66 8.63.16.44.74.55 1.06.24 1.76-1.74 3.53-3.4 5.28-4.96a.75.75 0 1 1 1 1.12c-1.68 1.5-3.37 3.08-5.06 4.73a8.73 8.73 0 0 0 8.38-1.28 9 9 0 0 0 3.48-6.85c.08-2.3-.66-4.16-1.48-5.35a.74.74 0 0 0-1.13-.14c-1.24 1.13-2.95 2.16-4.39 2.66z" />
                            <path d="M12 9.4a.75.75 0 0 1 .75.75v10.1a.75.75 0 0 1-1.5 0v-10.1A.75.75 0 0 1 12 9.4z" />
                        </svg>
                    </span>
                    <div class="text-center">
                        <p class="text-lg font-semibold text-emerald-800">Cây Cảnh Xanh</p>
                        <p class="text-xs text-gray-600">Đăng nhập và mua sắm dễ dàng</p>
                    </div>
                </a>
            </div>

            <div class="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg">
                {{ $slot }}
            </div>
        </div>
    </body>
</html>
