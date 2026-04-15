<x-cay-canh-layout>
    <x-slot name="title">Quản lý sản phẩm</x-slot>

    <div class="mt-4 px-3">
        <h4 class="text-center text-primary font-weight-bold mb-3">QUẢN LÝ SẢN PHẨM</h4>
        
        <a href="{{ route('caycanh.create') }}" class="btn btn-success mb-2">Thêm</a>

        <table id="dsSanPham" class="table table-bordered table-striped">
            <thead>
                <tr class="text-center">
                    <th>Tên sản phẩm</th>
                    <th>Tên khoa học</th>
                    <th>Tên thông thường</th>
                    <th>Độ khó</th>
                    <th>Yêu cầu ánh sáng</th>
                    <th>Nhu cầu nước</th>
                    <th>Giá bán</th>
                    <th>Ảnh</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                @foreach($sanPhams as $item)
                <tr>
                    <td>{{ $item->ten_san_pham }}</td>
                    <td>{{ $item->ten_khoa_hoc }}</td>
                    <td>{{ $item->ten_thong_thuong }}</td>
                    <td>{{ $item->do_kho }}</td>
                    <td>{{ $item->yeu_cau_anh_sang }}</td>
                    <td>{{ $item->nhu_cau_nuoc }}</td>
                    <td class="text-right">{{ $item->gia_ban }}</td>
                    <td class="text-center">
                        <img src="{{ asset('storage/image/' . $item->hinh_anh) }}" width="40">
                    </td>
                    <td class="text-center">
                        <div class="d-flex justify-content-center">
                            <a href="#" class="btn btn-primary btn-sm mr-1">Xem</a>
                            <form action="{{ route('admin.destroy', $item->id) }}" method="POST" onsubmit="return confirm('Xóa sản phẩm này?')">
                                @csrf
                                <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                            </form>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            $('#dsSanPham').DataTable({
                "pageLength": 10
            });
        });
    </script>
</x-cay-canh-layout>