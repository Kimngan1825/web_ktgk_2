<?php

use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Controller5;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller7;

Route::get('/', [HomeController::class, 'index']);


Route::get('/dashboard', function () {
    //return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// Trang tìm kiếm
Route::post('/timkiem', [App\Http\Controllers\Controller5::class, 'search']);

// Trang danh sách quản lý
Route::get('/admin/sanpham', [App\Http\Controllers\Controller7::class, 'index'])->name('admin.index');

// Xử lý xóa mềm
Route::post('/admin/sanpham/xoa/{id}', [App\Http\Controllers\Controller7::class, 'destroy'])->name('admin.destroy');

require __DIR__.'/auth.php';
