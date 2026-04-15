<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\Controller4;
use App\Http\Controllers\Controller8;
use Illuminate\Support\Facades\Route;

// Thêm name('home') vào route này_câu 2
Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/dashboard', function () {
    //return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

require __DIR__.'/auth.php';


//Câu 4:bam vao gio hang
Route::get('/gio-hang', [Controller4::class, 'index'])->name('cart.index');
Route::get('/gio-hang/xoa/{id}', [Controller4::class, 'remove'])->name('cart.remove');
Route::post('/gio-hang/dat-hang', [Controller4::class, 'checkout'])->name('cart.checkout');

// Câu 8: Các route cho thêm sản phẩm 
Route::get('/quan-ly/them-san-pham', [Controller8::class, 'create'])->name('product.create');
Route::post('/quan-ly/luu-san-pham', [Controller8::class, 'store'])->name('product.store');