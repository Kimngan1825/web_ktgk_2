<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderSuccess;

class Controller4 extends Controller
{
    // 1. Hiển thị trang giỏ hàng
    public function index()
    {
        // Lấy giỏ hàng từ Session, mặc định là mảng rỗng
        $cart = Session::get('cart', []);
        $total = 0;

        // Tính tổng tiền
        foreach ($cart as $item) {
            $total += $item['gia_ban'] * $item['so_luong'];
        }

        return view('caycanh.cart', compact('cart', 'total'));
    }

    // 2. Xóa sản phẩm khỏi giỏ hàng
    public function remove($id)
    {
        $cart = Session::get('cart', []);
        
        if (isset($cart[$id])) {
            unset($cart[$id]);
            Session::put('cart', $cart); // Cập nhật lại session
        }

        return redirect()->route('cart.index')->with('success', 'Đã xóa sản phẩm khỏi giỏ hàng.');
    }

    // 3. Xử lý đặt hàng
    public function checkout(Request $request)
    {
        $cart = Session::get('cart', []);
        
        if (empty($cart)) {
            return redirect()->route('cart.index')->with('error', 'Giỏ hàng của bạn đang trống!');
        }

        $userId = Auth::id() ?? 1; 
        $hinh_thuc_thanh_toan = $request->input('hinh_thuc_thanh_toan', 1);

        DB::beginTransaction();
        try {
            // Lưu đơn hàng
            $maDonHang = DB::table('don_hang')->insertGetId([
                'ngay_dat_hang' => now(),
                'tinh_trang' => 0, 
                'hinh_thuc_thanh_toan' => $hinh_thuc_thanh_toan,
                'user_id' => $userId
            ]);

            // Lưu chi tiết đơn hàng
            foreach ($cart as $id_san_pham => $item) {
                DB::table('chi_tiet_don_hang')->insert([
                    'ma_don_hang' => $maDonHang,
                    'id_san_pham' => $id_san_pham,
                    'so_luong' => $item['so_luong'],
                    'don_gia' => $item['gia_ban']
                ]);
            }

            // --- XỬ LÝ GỬI MAIL ---
            if (Auth::check()) {
                // Lấy email người đang đăng nhập
                $userEmail = Auth::user()->email;
                Mail::to($userEmail)->send(new OrderSuccess($maDonHang, $cart));
            } else {
                // NẾU BẠN CHƯA LÀM CHỨC NĂNG ĐĂNG NHẬP NHƯNG VẪN MUỐN TEST MAIL
                // Hãy xóa dấu // ở dòng dưới và điền thẳng email của bạn vào:
                // Mail::to('email_cua_ban@gmail.com')->send(new OrderSuccess($maDonHang, $cart));
            }

            DB::commit(); // Chỉ xác nhận thành công khi mail đã gửi được
            Session::forget('cart');

            return redirect()->route('cart.index')->with('success', 'Đặt hàng thành công! Đã gửi hóa đơn qua Email.');

        } catch (\Exception $e) {
            DB::rollBack(); 
            // Nếu gửi mail thất bại do file .env, nó sẽ báo lỗi chi tiết ra màn hình
            return redirect()->route('cart.index')->with('error', 'Lỗi: ' . $e->getMessage());
        }
    }

    
}