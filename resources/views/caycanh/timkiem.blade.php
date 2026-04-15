<x-cay-canh-layout>
    <x-slot name="title">
        Kết quả tìm kiếm: {{ $keyword }}
    </x-slot>

    <div class="mt-4 mb-5">
        <h5 style="color: #2f5d3a; font-weight: bold; border-bottom: 2px solid #2f5d3a; padding-bottom: 10px; display: inline-block;">
            Kết quả tìm kiếm cho: "{{ $keyword }}"
        </h5>

        <div class="list-cay-canh mt-3">
            
            @forelse($sanPhams as $item)
                <div class="cay-canh pb-2">
                    <a href="#">
                        <img src="{{ asset('storage/image/' . $item->hinh_anh) }}" alt="{{ $item->ten_san_pham }}" style="width: 100%; height: 220px; object-fit: cover;">
                        
                        <div class="cay-canh-info p-2" style="display: block !important; text-align: center;">
    
                            <div style="font-weight: bold; font-size: 14px; color: black; margin-bottom: 8px;">
                                {{ $item->ten_san_pham }}
                            </div>
                            
                            <div style="color: #dc3545; font-weight: bold; font-style: italic; font-size: 15px; margin-top: 5px;">
                                {{ number_format($item->gia_ban, 0, ',', '.') }} VNĐ
                            </div>

                        </div>
                    </a>
                </div>
            @empty
                <div style="grid-column: span 5; text-align: center; padding: 50px 0;">
                    <h6 class="text-muted">Không tìm thấy cây cảnh nào phù hợp với từ khóa này.</h6>
                </div>
            @endforelse

        </div>
    </div>
    
    <script>
        document.getElementsByName("keyword")[0].value = "{{ $keyword }}";
    </script>
</x-cay-canh-layout>