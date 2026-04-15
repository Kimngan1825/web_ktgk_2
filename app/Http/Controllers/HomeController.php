<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        // Lấy tất cả danh mục hiển thị lên menu
        $categories = DB::table('danh_muc')->get();
        
        // Nhận các tham số từ URL
        $categoryId = $request->input('category_id');
        $sort = $request->input('sort');
        $filter = $request->input('filter');

        // Khởi tạo truy vấn sản phẩm
        $query = DB::table('san_pham')
            ->select('san_pham.id', 'san_pham.ten_san_pham', 'san_pham.gia_ban', 'san_pham.hinh_anh')
            ->distinct();

        // Lọc theo danh mục
        if ($categoryId) {
            $query->join('sanpham_danhmuc', 'san_pham.id', '=', 'sanpham_danhmuc.id_san_pham')
                  ->where('sanpham_danhmuc.id_danh_muc', $categoryId);
        }

        // Lọc theo độ khó và mức độ chịu bóng râm
        if ($filter == 'easy_care') {
            $query->where('san_pham.do_kho', 'like', '%Dễ%'); 
        } elseif ($filter == 'shade_tolerant') {
            $query->where(function($q) {
                $q->where('san_pham.yeu_cau_anh_sang', 'like', '%bóng râm%')
                  ->orWhere('san_pham.yeu_cau_anh_sang', 'like', '%râm mát%');
            });
        }

        // Sắp xếp theo giá
        if ($sort == 'asc') {
            $query->orderBy('san_pham.gia_ban', 'asc');
        } elseif ($sort == 'desc') {
            $query->orderBy('san_pham.gia_ban', 'desc');
        }

        // Kiểm tra điều kiện để quyết định số lượng lấy ra
        if (!$categoryId && !$sort && !$filter) {
            // Trang chủ mặc định: Lấy 20 sản phẩm
            $products = $query->limit(20)->get();
        } else {
            // Có bộ lọc: Lấy tất cả sản phẩm thỏa mãn
            $products = $query->get(); 
        }

        // Trả về view caycanh.index cùng với dữ liệu
        return view("caycanh.index", compact('categories', 'products', 'categoryId'));
    }
}