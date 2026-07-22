<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Buscador Pokémon</title>

    @vite(['resources/js/app.js'])
</head>
<body class="bg-gray-100 text-gray-900 antialiased min-h-screen">
    <!-- Ojo: Revisar responsivo en pantallas ultra-wide más adelante -->
    <header class="bg-white border-b border-gray-200 py-4 shadow-sm">
        <div class="max-w-4xl mx-auto px-4 flex justify-between items-center">
            <h1 class="text-xl font-bold text-slate-800">PokéBuscador</h1>
            
            <span class="text-xs font-semibold px-2.5 py-1 bg-slate-100 text-slate-600 rounded-full">v1.0</span>
        </div>
    </header>

    <main class="max-w-4xl mx-auto px-4 py-8">
        @yield('content')
    </main>

    @stack('scripts')
</body>
</html>
