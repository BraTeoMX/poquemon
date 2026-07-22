<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';

const props = defineProps({
    pokemon: {
        type: Object,
        default: null,
    },
    recentSearches: {
        type: Array,
        default: () => [],
    },
    errors: {
        type: Object,
        default: () => ({}),
    },
});

const searchForm = useForm({
    pokemon: '',
});

const submitSearch = () => {
    if (!searchForm.pokemon.trim()) return;

    searchForm.post(route('pokemon.search'), {
        preserveScroll: true,
    });
};

const searchSpecificPokemon = (pokemonName) => {
    searchForm.pokemon = pokemonName;
    submitSearch();
};
</script>

<template>
    <Head title="Buscador Pokémon" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="text-xl font-semibold leading-tight text-gray-800 dark:text-gray-200">
                Buscador Pokémon
            </h2>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl space-y-6 sm:px-6 lg:px-8">
                <!-- Tarjeta de Búsqueda -->
                <div class="bg-white p-6 shadow sm:rounded-lg dark:bg-gray-800">
                    <form @submit.prevent="submitSearch" class="flex flex-col gap-4 sm:flex-row">
                        <div class="flex-1">
                            <input
                                v-model="searchForm.pokemon"
                                type="text"
                                placeholder="Ingresa el nombre o ID de un Pokémon (ej. pikachu, 25)"
                                class="w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-100"
                            />
                            <p v-if="searchForm.errors.pokemon" class="mt-1 text-sm text-red-600 dark:text-red-400">
                                {{ searchForm.errors.pokemon }}
                            </p>
                        </div>
                        <button
                            type="submit"
                            :disabled="searchForm.processing"
                            class="inline-flex items-center justify-center rounded-md bg-indigo-600 px-6 py-2 font-semibold text-white transition hover:bg-indigo-500 disabled:opacity-50"
                        >
                            {{ searchForm.processing ? 'Buscando...' : 'Buscar' }}
                        </button>
                    </form>

                    <!-- Alerta de Error Flash -->
                    <div v-if="$page.props.flash?.error" class="mt-4 rounded-md bg-red-50 p-4 dark:bg-red-900/40">
                        <p class="text-sm font-medium text-red-800 dark:text-red-200">
                            {{ $page.props.flash.error }}
                        </p>
                    </div>
                </div>

                <!-- Resultado del Pokémon -->
                <div v-if="props.pokemon" class="bg-white p-6 shadow sm:rounded-lg dark:bg-gray-800">
                    <div class="grid grid-cols-1 gap-6 md:grid-cols-2">
                        <div class="flex flex-col items-center justify-center border-b border-gray-200 pb-6 md:border-b-0 md:border-r md:pb-0 dark:border-gray-700">
                            <img
                                v-if="props.pokemon.official_artwork"
                                :src="props.pokemon.official_artwork"
                                :alt="props.pokemon.name"
                                class="h-48 w-48 object-contain"
                            />
                            <h3 class="mt-4 text-2xl font-bold capitalize text-gray-900 dark:text-gray-100">
                                #{{ props.pokemon.id }} {{ props.pokemon.name }}
                            </h3>
                            <div class="mt-2 flex gap-2">
                                <span
                                    v-for="typeItem in props.pokemon.types"
                                    :key="typeItem.name"
                                    class="rounded-full bg-indigo-100 px-3 py-1 text-xs font-semibold capitalize text-indigo-800 dark:bg-indigo-900 dark:text-indigo-200"
                                >
                                    {{ typeItem.name }}
                                </span>
                            </div>
                        </div>

                        <div class="space-y-4">
                            <h4 class="text-lg font-bold text-gray-900 dark:text-gray-100">Características</h4>
                            <div class="grid grid-cols-2 gap-4 text-sm text-gray-600 dark:text-gray-300">
                                <div><span class="font-semibold">Altura:</span> {{ props.pokemon.height / 10 }} m</div>
                                <div><span class="font-semibold">Peso:</span> {{ props.pokemon.weight / 10 }} kg</div>
                            </div>

                            <h4 class="text-lg font-bold text-gray-900 dark:text-gray-100">Habilidades</h4>
                            <ul class="flex flex-wrap gap-2">
                                <li
                                    v-for="abilityItem in props.pokemon.abilities"
                                    :key="abilityItem.name"
                                    class="rounded bg-gray-100 px-2.5 py-1 text-xs capitalize text-gray-700 dark:bg-gray-700 dark:text-gray-300"
                                >
                                    {{ abilityItem.name }}
                                </li>
                            </ul>

                            <h4 class="text-lg font-bold text-gray-900 dark:text-gray-100">Estadísticas Principales</h4>
                            <div class="space-y-2">
                                <div v-for="(statValue, statName) in props.pokemon.stats" :key="statName" class="text-sm">
                                    <div class="flex justify-between font-medium capitalize text-gray-700 dark:text-gray-300">
                                        <span>{{ statName }}</span>
                                        <span>{{ statValue }}</span>
                                    </div>
                                    <div class="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-700">
                                        <div
                                            class="h-2 rounded-full bg-indigo-600"
                                            :style="{ width: Math.min((statValue / 150) * 100, 100) + '%' }"
                                        ></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Historial de Búsquedas Recientes -->
                <div v-if="props.recentSearches.length > 0" class="bg-white p-6 shadow sm:rounded-lg dark:bg-gray-800">
                    <h3 class="mb-4 text-lg font-bold text-gray-900 dark:text-gray-100">Búsquedas Recientes</h3>
                    <div class="flex flex-wrap gap-2">
                        <button
                            v-for="(searchLog, index) in props.recentSearches"
                            :key="index"
                            @click="searchSpecificPokemon(searchLog.name)"
                            class="inline-flex items-center gap-1 rounded-lg border border-gray-300 bg-gray-50 px-3 py-1.5 text-xs font-medium text-gray-700 transition hover:bg-gray-100 dark:border-gray-600 dark:bg-gray-700 dark:text-gray-200 dark:hover:bg-gray-600"
                        >
                            <span>{{ searchLog.name }}</span>
                            <span class="text-gray-400">({{ searchLog.searched_at }})</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
