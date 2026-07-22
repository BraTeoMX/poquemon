<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->web(append: [
            \App\Http\Middleware\HandleInertiaRequests::class,
            \Illuminate\Http\Middleware\AddLinkHeadersForPreloadedAssets::class,
        ]);

        //
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        $exceptions->render(function (\Illuminate\Http\Client\ConnectionException $e, $request) {
            return back()->with('error', 'No fue posible conectar con el servidor de la PokéAPI. Intenta nuevamente más tarde.');
        });

        $exceptions->render(function (\Illuminate\Http\Client\RequestException $e, $request) {
            return back()->with('error', 'Ocurrió un error al comunicarse con PokéAPI (Código ' . $e->getCode() . ').');
        });
    })->create();
