<?php

namespace App\Http\Controllers;

use App\Exceptions\PokemonNotFoundException;
use App\Models\PokemonSearchLog;
use App\Services\PokemonApiService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class PokemonController extends Controller
{
    public function index(Request $request): \Illuminate\Contracts\View\View
    {
        $recentQueries = PokemonSearchLog::query()
            ->latest('searched_at')
            ->take(5)
            ->get();

        $formattedSearchHistory = $recentQueries->map(
            fn (PokemonSearchLog $searchItem) => [
                'name' => ucfirst($searchItem->pokemon),
                'pokemon_id' => $searchItem->pokemon_id,
                'searched_at' => $searchItem->searched_at->diffForHumans(),
            ]
        );

        return view('pokemon.index', [
            'recentSearches' => $formattedSearchHistory,
        ]);
    }

    public function indexVue(): Response
    {
        $recentQueries = PokemonSearchLog::query()
            ->latest('searched_at')
            ->take(5)
            ->get();

        $formattedSearchHistory = $recentQueries->map(
            fn (PokemonSearchLog $searchItem) => [
                'name' => ucfirst($searchItem->pokemon),
                'pokemon_id' => $searchItem->pokemon_id,
                'searched_at' => $searchItem->searched_at->diffForHumans(),
            ]
        );

        return Inertia::render('Pokemon/Index', [
            'recentSearches' => $formattedSearchHistory,
        ]);
    }

    public function search(Request $request, PokemonApiService $pokemonApiService): RedirectResponse
    {
        $searchQuery = $request->validate([
            'pokemon' => ['required', 'string'],
        ]);

        $pokemonTerm = trim($searchQuery['pokemon']);

        try {
            $pokemonDetailsPayload = $pokemonApiService->getPokemon($pokemonTerm);
        } catch (PokemonNotFoundException $exception) {
            return back()->with('error', "No encontramos al Pokémon. Verifica el nombre o ID ingresado.");
        }

        PokemonSearchLog::create([
            'pokemon' => $pokemonTerm,
            'pokemon_id' => $pokemonDetailsPayload['id'],
            'searched_at' => now(),
        ]);

        return back()->with('pokemon', $pokemonDetailsPayload);
    }
}
