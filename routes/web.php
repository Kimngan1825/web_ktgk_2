<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\Controller3;
use App\Http\Controllers\Controller4;
use App\Http\Controllers\Controller8;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Controller5;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller7;

// Thêm name('home') vào route này_câu 2
Route::get('/', [HomeController::class, 'index'])->name('home');

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


//Câu 4:bam vao gio hang
Route::get('/gio-hang', [Controller4::class, 'index'])->name('cart.index');
Route::get('/gio-hang/xoa/{id}', [Controller4::class, 'remove'])->name('cart.remove');
Route::post('/gio-hang/dat-hang', [Controller4::class, 'checkout'])->name('cart.checkout');

require __DIR__.'/auth.php';

// Trang chi tiết 
Route::get('/chitiet/{id}', [Controller3::class, 'chitiet'])->name('caycanh.chitiet');
Route::post('/add-to-cart', [Controller3::class, 'addToCart'])->name('cart.add');
// Câu 8: Các route cho thêm sản phẩm 
Route::get('/quan-ly/them-san-pham', [Controller8::class, 'create'])->name('caycanh.create');
Route::post('/quan-ly/luu-san-pham', [Controller8::class, 'store'])->name('caycanh.store');
