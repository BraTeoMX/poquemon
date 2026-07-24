@extends('layouts.app')

@section('content')
<div class="space-y-6">
    <!-- Formulario de Búsqueda -->
    <section class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
        <form action="{{ route('pokemon.search') }}" method="POST" class="flex flex-col sm:flex-row gap-3">
            @csrf
            <div class="flex-1">
                <label for="pokemon" class="sr-only">Nombre o ID del Pokémon</label>
                <input
                    type="text"
                    name="pokemon"
                    id="pokemon"
                    value="{{ old('pokemon') }}"
                    placeholder="Ingresa el nombre o número ID (ej. pikachu, 25)"
                    class="w-full rounded-lg border-gray-300 px-4 py-2.5 text-sm focus:border-indigo-500 focus:ring-indigo-500"
                    required
                />
            </div>
            <button
                type="submit"
                class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium px-6 py-2.5 rounded-lg text-sm transition-colors duration-150"
            >
                Buscar Pokémon
            </button>
        </form>

        @if (session('error'))
            <div class="mt-4 p-4 rounded-lg bg-red-50 border border-red-200 text-red-700 text-sm flex items-center gap-2">
                <svg class="w-5 h-5 shrink-0" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                </svg>
                <span>{{ session('error') }}</span>
            </div>
        @endif
    </section>

    <!-- Tarjeta de Resultado del Pokémon -->
    @if ($pokemon = session('pokemon'))
        <!-- Ojo: Revisar responsivo en pantallas ultra-wide más adelante -->
        <article class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
            <div class="p-6 grid grid-cols-1 md:grid-cols-2 gap-8">
                <!-- Columna Izquierda: Imagen e Info Básica -->
                <div class="flex flex-col items-center justify-center border-b md:border-b-0 md:border-r border-gray-100 pb-6 md:pb-0">
                    @if (!empty($pokemon['official_artwork']))
                        <img
                            src="{{ $pokemon['official_artwork'] }}"
                            alt="{{ $pokemon['name'] }}"
                            class="h-52 w-52 object-contain"
                        />
                    @endif
                    <h2 class="text-2xl font-bold capitalize text-slate-800 mt-4">
                        #{{ $pokemon['id'] }} {{ $pokemon['name'] }}
                    </h2>
                    
                    <div class="flex items-center gap-2 mt-3">
                        @foreach ($pokemon['types'] as $typeItem)
                            <span class="px-3 py-1 rounded-full text-xs font-semibold uppercase tracking-wider bg-indigo-50 text-indigo-700 border border-indigo-100">
                                {{ $typeItem['name'] }}
                            </span>
                        @endforeach

                        @if (!empty($pokemon['is_cached']))
                            <span class="px-2.5 py-1 rounded-full text-[11px] font-medium bg-emerald-50 text-emerald-700 border border-emerald-200 flex items-center gap-1" title="Obtenido rápidamente desde la caché del servidor">
                                <svg class="w-3 h-3 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                                </svg>
                                En Caché
                            </span>
                        @endif
                    </div>
                </div>

                <!-- Columna Derecha: Detalle, Habilidades y Stats -->
                <div class="space-y-5">
                    <div>
                        <h3 class="text-xs font-bold uppercase tracking-wider text-slate-400 mb-2">Medidas</h3>
                        <div class="grid grid-cols-2 gap-4 bg-slate-50 p-3 rounded-lg text-sm">
                            <div><span class="text-slate-500">Altura:</span> <strong class="text-slate-800">{{ $pokemon['height'] / 10 }} m</strong></div>
                            <div><span class="text-slate-500">Peso:</span> <strong class="text-slate-800">{{ $pokemon['weight'] / 10 }} kg</strong></div>
                        </div>
                    </div>

                    <div>
                        <h3 class="text-xs font-bold uppercase tracking-wider text-slate-400 mb-2">Habilidades</h3>
                        <div class="flex flex-wrap gap-1.5">
                            @foreach ($pokemon['abilities'] as $abilityItem)
                                <span class="px-2.5 py-1 rounded bg-slate-100 text-slate-700 text-xs capitalize font-medium">
                                    {{ $abilityItem['name'] }}
                                </span>
                            @endforeach
                        </div>
                    </div>

                    <div>
                        <h3 class="text-xs font-bold uppercase tracking-wider text-slate-400 mb-3">Estadísticas Base</h3>
                        <div class="space-y-2.5">
                            @foreach ($pokemon['stats'] as $statName => $statValue)
                                <div class="text-xs">
                                    <div class="flex justify-between text-slate-600 mb-1">
                                        <span class="capitalize font-semibold">{{ $statName }}</span>
                                        <span class="font-bold text-slate-800">{{ $statValue }}</span>
                                    </div>
                                    <div class="w-full bg-slate-100 h-2 rounded-full overflow-hidden">
                                        <div class="bg-indigo-600 h-2 rounded-full" style="width: {{ min(($statValue / 150) * 100, 100) }}%"></div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </article>
    @endif
</div>

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        @if (session('error'))
            Swal.fire({
                icon: 'error',
                title: 'Búsqueda No Encontrada',
                text: "{{ session('error') }}",
                confirmButtonColor: '#4f46e5',
            });
        @elseif (session('warning'))
            Swal.fire({
                icon: 'warning',
                title: 'Atención',
                text: "{{ session('warning') }}",
                confirmButtonColor: '#4f46e5',
            });
        @elseif ($pokemon = session('pokemon'))
            @if (!empty($pokemon['is_cached']))
                Swal.fire({
                    icon: 'info',
                    title: '¡Cargado desde Caché!',
                    text: "Información de {{ ucfirst($pokemon['name']) }} recuperada al instante desde la memoria caché.",
                    timer: 3000,
                    showConfirmButton: false,
                    toast: true,
                    position: 'top-end',
                });
            @else
                Swal.fire({
                    icon: 'success',
                    title: '¡Pokémon Encontrado!',
                    text: "Información de {{ ucfirst($pokemon['name']) }} (#{{ $pokemon['id'] }}) obtenida de PokeAPI.",
                    timer: 2500,
                    showConfirmButton: false,
                    toast: true,
                    position: 'top-end',
                });
            @endif
        @endif
    });
</script>
@endpush
@endsection
