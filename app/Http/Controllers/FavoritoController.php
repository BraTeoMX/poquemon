<?php

namespace App\Http\Controllers;

use App\Exceptions\PokemonNotFoundException;
use App\Models\PokemonSearchLog;
use App\Services\PokemonApiService;
use App\Services\Favorito;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class FavoritoController extends Controller
{
    public function index(Request $request): \Illuminate\Contracts\View\View
    {
        return view('favorito.index');
    }

    
}
