<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Controller8 extends Controller
{
    // 1. Hiển thị form thêm sản phẩm
    public function create()
    {
        return view('caycanh.create');
    }

    // 2. Xử lý lưu dữ liệu vào database
    public function store(Request $request)
    {
        // Xử lý upload hình ảnh
        $fileName = null;
        if ($request->hasFile('hinh_anh')) {
            $file = $request->file('hinh_anh');
            // Lấy tên gốc của file ảnh
            $fileName = $file->getClientOriginalName();
            
            // Lưu ảnh vào đúng thư mục storage/app/public/image mà bạn đang dùng
            $file->storeAs('image', $fileName, 'public');
        }

        // Tạo mã sản phẩm tự động (Vì form không có ô nhập Mã SP nhưng DB bắt buộc)
        $maSanPham = 'SP' . time(); 

        // Lưu vào database sử dụng Query Builder
        DB::table('san_pham')->insert([
            'code'              => $maSanPham,
            'ten_san_pham'      => $request->input('ten_san_pham'),
            'ten_khoa_hoc'      => $request->input('ten_khoa_hoc'),
            'ten_thong_thuong'  => $request->input('ten_thong_thuong'),
            'mo_ta'             => $request->input('mo_ta'),
            'do_kho'            => $request->input('do_kho'),
            'yeu_cau_anh_sang'  => $request->input('yeu_cau_anh_sang'),
            'nhu_cau_nuoc'      => $request->input('nhu_cau_nuoc'),
            'gia_ban'           => $request->input('gia_ban', 0),
            'hinh_anh'          => $fileName
        ]);

        // Chuyển hướng về trang chủ (hoặc trang quản lý) kèm thông báo thành công
        return redirect()->route('home')->with('success', 'Đã thêm sản phẩm thành công!');
    }
}