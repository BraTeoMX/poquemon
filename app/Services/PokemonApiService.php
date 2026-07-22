<?php

namespace App\Services;

use App\Exceptions\PokemonNotFoundException;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;

class PokemonApiService
{
    private string $apiBaseUrl = 'https://pokeapi.co/api/v2';

    public function getPokemon(string $identifier): array
    {
        $normalizedIdentifier = strtolower(trim($identifier));
        $cacheKey = "pokeapi:pokemon:{$normalizedIdentifier}";

        return Cache::remember($cacheKey, now()->addMinutes(10), function () use ($normalizedIdentifier) {
            $apiResponse = Http::get("{$this->apiBaseUrl}/pokemon/{$normalizedIdentifier}");

            if ($apiResponse->status() === 404) {
                throw new PokemonNotFoundException("El Pokémon '{$normalizedIdentifier}' no fue encontrado en PokeAPI.");
            }

            // TODO: Se captura cualquier otro error HTTP no exitoso para lanzar excepción generica si el servicio externo falla.
            if ($apiResponse->failed()) {
                $apiResponse->throw();
            }

            $pokemonPayload = $apiResponse->json();

            return [
                'id' => $pokemonPayload['id'],
                'name' => $pokemonPayload['name'],
                'height' => $pokemonPayload['height'],
                'weight' => $pokemonPayload['weight'],
                'types' => array_column($pokemonPayload['types'], 'type'),
                'abilities' => array_column($pokemonPayload['abilities'], 'ability'),
                'official_artwork' => $pokemonPayload['sprites']['other']['official-artwork']['front_default'] ?? null,
                'stats' => $this->extractPrimaryStats($pokemonPayload['stats']),
            ];
        });
    }

    private function extractPrimaryStats(array $rawStats): array
    {
        $targetStatKeys = ['hp', 'attack', 'defense', 'speed'];
        $formattedStats = [];

        foreach ($rawStats as $statEntry) {
            $statName = $statEntry['stat']['name'];

            if (in_array($statName, $targetStatKeys, true)) {
                $formattedStats[$statName] = $statEntry['base_stat'];
            }
        }

        return $formattedStats;
    }
}
