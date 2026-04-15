<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Controller3 extends Controller
{
    // Chi tiết cây cảnh
    public function chitiet($id)
    {
        $sanPham = DB::table('san_pham')->where('id', $id)->first();

        return view('caycanh.chitiet', compact('sanPham'));
    }

    // Tìm kiếm cây cảnh
    public function timkiem(Request $request)
    {
        $keyword = trim($request->keyword ?? '');

        $sanPhams = DB::table('san_pham')
            ->when($keyword !== '', function ($query) use ($keyword) {
                $query->where('ten_san_pham', 'like', "%{$keyword}%")
                    ->orWhere('ten_khoa_hoc', 'like', "%{$keyword}%")
                    ->orWhere('ten_thong_thuong', 'like', "%{$keyword}%");
            })
            ->get();

        return view('caycanh.index', compact('sanPhams', 'keyword'));
    }

    // Thêm sản phẩm vào giỏ hàng theo số lượng
    public function addToCart(Request $request)
    {
        $request->validate([
            'id' => 'required|integer',
            'so_luong' => 'required|integer|min:1',
        ]);

        $sanPham = DB::table('san_pham')->where('id', $request->id)->first();

        if (! $sanPham) {
            return redirect()->back()->with('error', 'Sản phẩm không tồn tại.');
        }

        $cart = session()->get('cart', []);
        $productId = (int) $sanPham->id;
        $soLuongThem = (int) $request->so_luong;

        if (isset($cart[$productId])) {
            $cart[$productId]['so_luong'] += $soLuongThem;
        } else {
            $cart[$productId] = [
                'id' => $productId,
                'ten_san_pham' => $sanPham->ten_san_pham,
                'hinh_anh' => $sanPham->hinh_anh,
                'gia_ban' => (int) ($sanPham->gia_ban ?? 0),
                'so_luong' => $soLuongThem,
            ];
        }

        session()->put('cart', $cart);

        return redirect()->back()->with('success', 'Đã thêm sản phẩm vào giỏ hàng.');
    }

}