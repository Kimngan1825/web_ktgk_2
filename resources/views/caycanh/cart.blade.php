<x-cay-canh-layout>
    <x-slot name="title">
        Giỏ hàng
    </x-slot>

    <style>
        .cart-container { max-width: 800px; margin: 30px auto; font-family: Arial, sans-serif; }
        .cart-title { text-align: center; color: #1a5ca4; text-transform: uppercase; font-weight: bold; font-size: 18px; margin-bottom: 15px; }
        
        .cart-table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        .cart-table th, .cart-table td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        .cart-table th { background-color: #fcfcfc; font-weight: bold; color: #333;}
        .text-left { text-align: left !important; }
        
        .btn-delete { background-color: #dc3545; color: white; padding: 6px 15px; text-decoration: none; border-radius: 4px; display: inline-block; font-size: 14px;}
        .btn-delete:hover { background-color: #c82333; }
        
        .checkout-section { text-align: center; margin-top: 20px; }
        .checkout-label { font-weight: bold; margin-bottom: 8px; display: block; font-size: 14px;}
        .checkout-select { padding: 6px 30px 6px 10px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 15px; background-color: #fdfdfd;}
        
        .btn-order { background-color: #007bff; color: white; padding: 10px 25px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; font-size: 14px;}
        .btn-order:hover { background-color: #0069d9; }
        
        .alert-success { background-color: #d4edda; color: #155724; padding: 12px; border-radius: 4px; margin-bottom: 20px; border: 1px solid #c3e6cb; text-align: center; font-weight: bold;}
        .alert-error { background-color: #f8d7da; color: #721c24; padding: 12px; border-radius: 4px; margin-bottom: 20px; border: 1px solid #f5c6cb; text-align: center;}
    </style>

    <div class="cart-container">
        
        @if(session('success'))
            <div class="alert-success">{{ session('success') }}</div>
        @endif
        @if(session('error'))
            <div class="alert-error">{{ session('error') }}</div>
        @endif

        <h2 class="cart-title">DANH SÁCH SẢN PHẨM</h2>

        <table class="cart-table">
            <thead>
                <tr>
                    <th width="50">STT</th>
                    <th>Tên sản phẩm</th>
                    <th width="100">Số lượng</th>
                    <th width="120">Đơn giá</th>
                    <th width="80">Xóa</th>
                </tr>
            </thead>
            <tbody>
                @php $stt = 1; @endphp
                @forelse($cart as $id => $item)
                    <tr>
                        <td>{{ $stt++ }}</td>
                        <td class="text-left">{{ $item['ten_san_pham'] }}</td>
                        <td>{{ $item['so_luong'] }}</td>
                        <td>{{ number_format($item['gia_ban'], 0, ',', '.') }}đ</td>
                        <td>
                            <a href="{{ route('cart.remove', $id) }}" class="btn-delete" onclick="return confirm('Xác nhận xóa sản phẩm này?');">Xóa</a>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="5" style="padding: 30px; color: #888;">Giỏ hàng của bạn đang trống.</td>
                    </tr>
                @endforelse

                @if(count($cart) > 0)
                    <tr>
                        <td colspan="3" style="text-align: center; font-weight: bold;">Tổng cộng</td>
                        <td colspan="2" class="text-left" style="font-weight: bold; color: #333;">
                            {{ number_format($total, 0, ',', '.') }}đ
                        </td>
                    </tr>
                @endif
            </tbody>
        </table>

        @if(count($cart) > 0)
            <form action="{{ route('cart.checkout') }}" method="POST" class="checkout-section">
                @csrf
                <label class="checkout-label">Hình thức thanh toán</label>
                <select name="hinh_thuc_thanh_toan" class="checkout-select">
                    <option value="1">Tiền mặt</option>
                </select>
                <br>
                <button type="submit" class="btn-order">ĐẶT HÀNG</button>
            </form>
        @endif
    </div>

</x-cay-canh-layout>