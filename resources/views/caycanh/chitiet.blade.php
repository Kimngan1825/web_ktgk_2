    <x-cay-canh-layout>
        <x-slot name="title">
            Chi tiết cây cảnh: {{ $sanPham->ten_san_pham ?? 'Không tìm thấy sản phẩm' }}
        </x-slot>

        @if ($sanPham)
            @if (session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            @if (session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
            @endif

            <div class="row" style="margin-top: 20px;">
                <div class="col-md-4 mb-3">
                    <img
                        src="{{ asset('storage/image/'.$sanPham->hinh_anh) }}"
                        alt="{{ $sanPham->ten_san_pham }}"
                        class="img-fluid rounded"
                        style="width: 100%; display: block;"
                    >                    
                </div>

                <div class="col-md-8">
                    <h2 class="font-weight-bold">{{ $sanPham->ten_san_pham }}</h2>
                    <ul class="list-unstyled mt-3">
                        <li><b>Tên khoa học:</b> {{ $sanPham->ten_khoa_hoc ?? 'Đang cập nhật' }}</li>
                        <li><b>Tên thông thường:</b> {{ $sanPham->ten_thong_thuong ?? 'Đang cập nhật' }}</li>
                        <li><b>Mô tả:</b> {{ $sanPham->mo_ta ?? 'Đang cập nhật' }}</li>
                        <li><b>Quy cách:</b> {{ $sanPham->quy_cach_san_pham ?? 'Đang cập nhật' }}</li>
                        <li><b>Độ khó chăm sóc:</b> {{ $sanPham->do_kho ?? 'Đang cập nhật' }}</li>
                        <li><b>Yêu cầu ánh sáng:</b> {{ $sanPham->yeu_cau_anh_sang ?? 'Đang cập nhật' }}</li>
                        <li><b>Nhu cầu nước:</b> {{ $sanPham->nhu_cau_nuoc ?? 'Đang cập nhật' }}</li>
                    </ul>

                        <p style="font-size: 24px; margin-bottom: 10px; line-height: 1.2;">
                            Giá:
                            <span style="color: #dc4a3d; font-style: italic; font-weight: 700;">
                                {{ number_format($sanPham->gia_ban ?? 0, 0, ',', '.') }} VNĐ
                            </span>
                        </p>

                        <form method="POST" action="{{ route('cart.add') }}" class="d-flex align-items-center" style="gap: 8px; flex-wrap: wrap;">
                            @csrf
                            <input type="hidden" name="id" value="{{ $sanPham->id }}">
                            <label for="so_luong" style="font-size: 22px; margin: 0; line-height: 1.2;">Số lượng mua:</label>
                            <input
                                id="so_luong"
                                name="so_luong"
                                type="number"
                                min="1"
                                value="1"
                                class="form-control"
                                style="width: 100px; height: 40px; font-size: 20px;"
                            >
                            <button type="submit" class="btn btn-primary" style="height: 40px; font-size: 20px; line-height: 1.1; padding: 4px 18px;">
                                Thêm vào giỏ hàng
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        @else
            <div class="alert alert-warning mt-3">Không tìm thấy sản phẩm cây cảnh.</div>
        @endif
    </x-cay-canh-layout>

