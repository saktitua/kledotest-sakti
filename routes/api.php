<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PegawaiController;
use App\Http\Controllers\KasbonController;

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



Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('pegawai/get',[PegawaiController::class,'list']);
Route::post('pegawai/post',[PegawaiController::class,'post']);
Route::get('kasbon/get',[KasbonController::class,'list']);
Route::POST('kasbon/post',[KasbonController::class,'post']);
Route::PATCH('kasbon/setujui/{id}',[KasbonController::class,'setuju']);



