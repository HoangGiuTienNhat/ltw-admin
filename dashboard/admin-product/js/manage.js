(function(){
    // --- CẤU HÌNH ĐƯỜNG DẪN ---
    // Dashboard: .../dashboard/admin-product/
    // API: .../project-web/public/api/products.php
    // => Cần lùi 3 cấp (../../..)
    const apiProducts = '../../../project-web/public/api/products.php'; 
    const imageBase = '../../../project-web/public/';

    // --- QUẢN LÝ TRẠNG THÁI (STATE) ---
    // Lưu trang hiện tại và từ khóa tìm kiếm
    let state = {
        page: 1,
        q: ''
    };

    function el(id){ return document.getElementById(id); } 
    function escapeHtml(str){ 
        if(!str) return ''; 
        return String(str).replace(/[&<>"']/g, s => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#39;"}[s])); 
    }

    // --- KHỞI TẠO ---
    const qInput = el('search');
    if (qInput){
        // Sự kiện tìm kiếm: Enter thì tìm và reset về trang 1
        qInput.addEventListener('keyup', (e)=>{ 
            if (e.key === 'Enter') {
                state.q = qInput.value.trim();
                state.page = 1; 
                loadProducts(); 
            }
        });
        // Tải lần đầu
        loadProducts();
    }

    // --- HÀM TẢI DỮ LIỆU ---
    function loadProducts(){
        // Gửi cả page và q lên server
        const url = `${apiProducts}?page=${state.page}&q=${encodeURIComponent(state.q)}`;
        
        fetch(url)
            .then(r => r.json())
            .then(res => {
                if(res.status === 'success') {
                    // API trả về: { status: 'success', data: [...], pagination: {...} }
                    renderProductsTable(res.data, res.pagination);
                } else if(res.success) {
                    // Fallback cho trường hợp API cũ (chỉ trả về mảng)
                    console.warn("API format cũ, không có phân trang");
                    renderProductsTable(res.data || [], null);
                } else {
                    console.error("Lỗi API:", res);
                    el('tableContainer').innerHTML = '<p class="text-danger p-3">Lỗi tải dữ liệu.</p>';
                }
            })
            .catch(e => { 
                console.error(e); 
                el('tableContainer').innerHTML = `<p class="text-danger p-3">Không kết nối được API.<br>Path: ${apiProducts}</p>`; 
            });
    }

    // --- HÀM VẼ GIAO DIỆN ---
    function renderProductsTable(products, pagination){
        const container = el('tableContainer');
        if(!container) return;
        
        // Render Bảng
        let html = `<div class="table-responsive mb-3">
            <table class="table card-table table-vcenter text-nowrap datatable">
            <thead>
                <tr>
                    <th class="w-1">ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>`;
            
        if(products && products.length > 0) {
            products.forEach(p => {
                let imgSrc = p.image ? (p.image.startsWith('http') ? p.image : imageBase + p.image) : null;
                const img = imgSrc 
                    ? `<span class="avatar avatar-sm" style="background-image: url('${imgSrc}')"></span>` 
                    : '<span class="avatar avatar-sm">-</span>';
                
                const priceFormatted = new Intl.NumberFormat('vi-VN').format(p.price);
                const catName = p.category_name || p.category || '';

                html += `<tr>
                    <td><span class="text-secondary">${p.id}</span></td>
                    <td>${img}</td>
                    <td>${escapeHtml(p.name)}</td>
                    <td>${escapeHtml(catName)}</td>
                    <td>${priceFormatted}</td>
                    <td class="text-end">
                        <a class="btn btn-sm btn-outline-secondary" href="./index-product.php?id=${p.id}">Open</a>
                        <button class="btn btn-sm btn-danger ms-1" onclick="adminDelete(${p.id})">Delete</button>
                    </td>
                </tr>`;
            });
        } else {
            html += '<tr><td colspan="6" class="text-center p-4">Không tìm thấy sản phẩm nào</td></tr>';
        }
        html += '</tbody></table></div>';

        // Render Phân trang (Pagination)
        if (pagination && pagination.total_pages > 1) {
            html += `<nav><ul class="pagination justify-content-center">`;
            
            // Nút Prev
            const prevDisabled = pagination.current_page == 1 ? 'disabled' : '';
            html += `<li class="page-item ${prevDisabled}">
                        <a class="page-link" href="#" onclick="changePage(${pagination.current_page - 1}); return false;">Prev</a>
                     </li>`;

            // Các nút số
            for (let i = 1; i <= pagination.total_pages; i++) {
                const active = i == pagination.current_page ? 'active' : '';
                // Chỉ hiện một số trang xung quanh trang hiện tại để đỡ dài (Optional logic)
                html += `<li class="page-item ${active}">
                            <a class="page-link" href="#" onclick="changePage(${i}); return false;">${i}</a>
                         </li>`;
            }

            // Nút Next
            const nextDisabled = pagination.current_page == pagination.total_pages ? 'disabled' : '';
            html += `<li class="page-item ${nextDisabled}">
                        <a class="page-link" href="#" onclick="changePage(${pagination.current_page + 1}); return false;">Next</a>
                     </li>`;
            
            html += `</ul></nav>`;
        }

        container.innerHTML = html;
        
        // --- GLOBAL FUNCTIONS (để gọi từ onclick) ---
        
        // Hàm Xóa
        window.adminDelete = function(id){ 
            if(confirm('Bạn có chắc muốn xóa sản phẩm ID '+id+'?')){ 
                fetch(apiProducts + '?id=' + id, { method: 'DELETE' })
                .then(r => r.json())
                .then(res => {
                    if(res.success) {
                        loadProducts(); // Tải lại trang hiện tại sau khi xóa
                    } else {
                        alert('Lỗi: ' + (res.error || 'Không thể xóa'));
                    }
                }); 
            } 
        };

        // Hàm Chuyển trang
        window.changePage = function(newPage) {
            if (newPage < 1 || newPage > pagination.total_pages) return;
            state.page = newPage;
            loadProducts();
        };
    }
})();