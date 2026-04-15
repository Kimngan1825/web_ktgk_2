<x-cay-canh-layout>
    <x-slot name="title">
        Cây cảnh
    </x-slot>

    <style>
        /* Bộ lọc tìm kiếm theo */
        .filter-section { margin-bottom: 30px; display: flex; align-items: center; gap: 10px; flex-wrap: wrap; justify-content: center; margin-top: 15px;}
        .filter-label { font-size: 14px; color: #333; font-weight: bold;}
        .filter-btn { padding: 6px 15px; border: 1px solid #ddd; background: #fff; cursor: pointer; text-decoration: none; color: #444; border-radius: 4px; font-size: 13px; transition: 0.2s;}
        .filter-btn:hover { background: #f8f9fa; border-color: #bbb;}
        .filter-btn.active { background: #e9ecef; border-color: #28a745; font-weight: 600; color: #28a745;}

        /* Lưới sản phẩm */
        .product-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; padding: 10px;}
        .product-item { border: 1px solid #f0f0f0; border-radius: 8px; padding: 15px; text-align: center; background: #fff; transition: box-shadow 0.3s;}
        .product-item:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.08);}
        .product-item img { width: 100%; height: 200px; object-fit: contain; margin-bottom: 12px;}
        .product-info-name { font-size: 14px; font-weight: 600; color: #222; margin-bottom: 8px; height: 40px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;}
        .product-info-price { color: #d32f2f; font-weight: bold; font-size: 15px;}
    </style>

    <div class="filter-section">
        <span class="filter-label">Tìm kiếm theo</span>
        
        <a href="{{ request()->fullUrlWithQuery(['sort' => 'asc']) }}" 
           class="filter-btn {{ request('sort') == 'asc' ? 'active' : '' }}">Giá tăng dần</a>
        
        <a href="{{ request()->fullUrlWithQuery(['sort' => 'desc']) }}" 
           class="filter-btn {{ request('sort') == 'desc' ? 'active' : '' }}">Giá giảm dần</a>
        
        <a href="{{ request()->fullUrlWithQuery(['filter' => 'easy_care']) }}" 
           class="filter-btn {{ request('filter') == 'easy_care' ? 'active' : '' }}">Dễ chăm sóc</a>
        
        <a href="{{ request()->fullUrlWithQuery(['filter' => 'shade_tolerant']) }}" 
           class="filter-btn {{ request('filter') == 'shade_tolerant' ? 'active' : '' }}">Chịu được bóng râm</a>

        @if(request('sort') || request('filter'))
            <a href="{{ request()->fullUrlWithoutQuery(['sort', 'filter']) }}" 
               class="filter-btn" style="color: #999;">✕ Xóa lọc</a>
        @endif
    </div>

    <div class="product-grid">
        @forelse($products as $product)
            <div class="product-item">
                <a href="{{ route('caycanh.chitiet', $product->id) }}" style="text-decoration: none; color: inherit;">
                    <img src="{{ asset('storage/image/' . $product->hinh_anh) }}" 
                         alt="{{ $product->ten_san_pham }}" 
                         onerror="this.onerror=null; this.src='https://via.placeholder.com/200x200?text=No+Image'">
                    <div class="product-info-name">{{ $product->ten_san_pham }}</div>
                    <div class="product-info-price">{{ number_format($product->gia_ban, 0, ',', '.') }} VNĐ</div>
                </a>
            </div>
        @empty
            <div style="grid-column: 1 / -1; text-align: center; padding: 40px; color: #777; font-size: 16px;">
                Không tìm thấy sản phẩm nào phù hợp với tiêu chí của bạn.
            </div>
        @endforelse
    </div>

</x-cay-canh-layout>