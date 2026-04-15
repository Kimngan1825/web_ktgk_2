<!DOCTYPE html>
<html>
<head>
    <title>Đặt hàng thành công</title>
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
    <div style="max-width: 600px; margin: 0 auto; border: 1px solid #ddd; padding: 20px; border-radius: 8px;">
        <h2 style="color: #28a745; text-align: center;">CẢM ƠN BẠN ĐÃ ĐẶT HÀNG!</h2>
        <p>Xin chào,</p>
        <p>Đơn hàng của bạn đã được hệ thống ghi nhận thành công. Dưới đây là thông tin chi tiết:</p>
        
        <p><strong>Mã đơn hàng:</strong> #{{ $maDonHang }}</p>
        
        <table style="width: 100%; border-collapse: collapse; margin-top: 15px;">
            <thead>
                <tr style="background-color: #f8f9fa;">
                    <th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Sản phẩm</th>
                    <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Số lượng</th>
                    <th style="border: 1px solid #ddd; padding: 8px; text-align: right;">Đơn giá</th>
                </tr>
            </thead>
            <tbody>
                @php $total = 0; @endphp
                @foreach($cart as $item)
                    @php $total += $item['don_gia'] * $item['so_luong']; @endphp
                    <tr>
                        <td style="border: 1px solid #ddd; padding: 8px;">{{ $item['ten_san_pham'] }}</td>
                        <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $item['so_luong'] }}</td>
                        <td style="border: 1px solid #ddd; padding: 8px; text-align: right;">{{ number_format($item['don_gia'], 0, ',', '.') }}đ</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <h3 style="text-align: right; color: #d32f2f; margin-top: 15px;">Tổng tiền: {{ number_format($total, 0, ',', '.') }} VNĐ</h3>
        
        <p style="margin-top: 20px;">Chúng tôi sẽ sớm liên hệ để giao hàng cho bạn. Chúc bạn một ngày vui vẻ!</p>
    </div>
</body>
</html>