<x-cay-canh-layout>
    <x-slot name="title">
        Thêm Sản Phẩm
    </x-slot>

    <style>
        .form-container { max-width: 600px; margin: 20px auto; font-family: Arial, sans-serif; }
        .form-title { text-align: center; color: #0056b3; font-weight: bold; text-transform: uppercase; margin-bottom: 20px; font-size: 16px;}
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; color: #333; font-size: 14px;}
        .form-control { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; font-family: inherit; font-size: 14px;}
        textarea.form-control { resize: vertical; height: 80px; }
        .file-input-wrapper { border: 1px solid #ccc; padding: 5px; border-radius: 4px; background-color: #fff; display: flex; align-items: center;}
        .file-input-wrapper input[type="file"] { font-size: 14px; }
        .btn-submit { display: block; margin: 20px auto; background-color: #007bff; color: white; border: none; padding: 8px 25px; border-radius: 4px; cursor: pointer; font-weight: bold; font-size: 14px;}
        .btn-submit:hover { background-color: #0056b3; }
    </style>

    <div class="form-container">
        <h2 class="form-title">THÊM</h2>

        <form action="{{ route('product.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group">
                <label>Tên sản phẩm</label>
                <input type="text" name="ten_san_pham" class="form-control" required>
            </div>

            <div class="form-group">
                <label>Tên khoa học</label>
                <input type="text" name="ten_khoa_hoc" class="form-control">
            </div>

            <div class="form-group">
                <label>Tên thông thường</label>
                <input type="text" name="ten_thong_thuong" class="form-control">
            </div>

            <div class="form-group">
                <label>Mô tả</label>
                <textarea name="mo_ta" class="form-control"></textarea>
            </div>

            <div class="form-group">
                <label>Độ khó</label>
                <input type="text" name="do_kho" class="form-control">
            </div>

            <div class="form-group">
                <label>Yêu cầu ánh sáng</label>
                <input type="text" name="yeu_cau_anh_sang" class="form-control">
            </div>

            <div class="form-group">
                <label>Nhu cầu nước</label>
                <input type="text" name="nhu_cau_nuoc" class="form-control">
            </div>

            <div class="form-group">
                <label>Giá bán</label>
                <input type="number" name="gia_ban" class="form-control">
            </div>

            <div class="form-group">
                <label>Ảnh</label>
                <div class="file-input-wrapper">
                    <input type="file" name="hinh_anh" accept="image/*">
                </div>
            </div>

            <button type="submit" class="btn-submit">Lưu</button>
        </form>
    </div>

</x-cay-canh-layout>