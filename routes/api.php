<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::prefix('/v1')->group(function () {

    Route::prefix('/products')->group(function () {
        Route::get('/', [ProductController::class, 'products']);

    });

    Route::prefix('/admins')->group(function () {
        Route::post('/', [AdminController::class, 'store']);
        Route::patch('/editStatusOrder', [AdminController::class, 'updateStatusOrder']);

    });


    Route::middleware(['auth:api'])->prefix('/customer')->group(function () {
        Route::post('/', [OrderController::class, 'store']);
        Route::patch('/editStatus', [OrderController::class, 'updateStatusOrder']);
        Route::get('/orders', [OrderController::class, 'orders']);
        Route::patch('/cancel', [OrderController::class, 'cancelOrder']);


    });

    Route::prefix('/auth')->group(function () {
        Route::post('/login', [UserController::class, 'login'])->middleware('auth:api');
        Route::post('/register', [UserController::class, 'register']);
        Route::get('/logout', [UserController::class, 'logout'])->middleware('auth:api');
    });

});
