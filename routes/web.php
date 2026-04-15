<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\Controller3;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index']);


Route::get('/dashboard', function () {
    //return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');



require __DIR__.'/auth.php';

// Trang chi tiết phim
Route::get('/chitiet/{id}', [Controller3::class, 'chitiet'])->name('caycanh.chitiet');
Route::post('/add-to-cart', [Controller3::class, 'addToCart'])->name('cart.add');