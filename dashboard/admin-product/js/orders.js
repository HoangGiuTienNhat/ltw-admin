(function(){
    // 1. Config Paths
    const apiBase = '../../../project-web/public/api/';
    const apiOrders = apiBase + 'orders.php';

    // State quản lý trang hiện tại
    let state = {
        page: 1
    };

    // 2. Helper Functions
    function escapeHtml(str){ 
        if(!str) return ''; 
        return String(str).replace(/[&<>"']/g, function(s){
            return{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#39;"}[s];
        }); 
    }

    function el(id) { return document.getElementById(id); }

    // 3. Main Logic: Fetch & Render
    // Hàm tải dữ liệu theo trang
    function loadOrders() {
        const container = el('ordersContainer');
        if (!container) return;

        // Gọi API kèm tham số page
        fetch(`${apiOrders}?page=${state.page}`)
            .then(r => r.json())
            .then(res => {
                // API mới trả về { status, data, pagination }
                if (res.status === 'success') {
                    renderOrders(res.data, res.pagination);
                } else if (Array.isArray(res)) {
                    // Fallback hỗ trợ nếu API cũ trả về mảng trực tiếp
                    renderOrders(res, null);
                } else {
                    container.innerHTML = '<div class="alert alert-danger">Error: ' + (res.error || 'Unknown error') + '</div>';
                }
            })
            .catch(e => { 
                console.error(e); 
                container.innerHTML = '<div class="alert alert-danger">Error loading orders. Please check API path.</div>'; 
            });
    }

    // Khởi chạy lần đầu
    loadOrders();

    // Hàm hiển thị
    function renderOrders(orders, pagination){
        const container = el('ordersContainer');
        
        if (!orders || orders.length === 0) {
            container.innerHTML = '<div class="text-center p-4">No orders found.</div>';
            return;
        }

        let html = `
        <div class="table-responsive mb-3">
            <table class="table card-table table-vcenter text-nowrap">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Order#</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Items</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>`;
        
        orders.forEach(o => {
            // Format danh sách items ngắn gọn
            const items = (o.items || []).map(i => escapeHtml(i.product_name) + ' x' + i.quantity).join('<br>');
            
            // Format tiền tệ
            const totalFormatted = new Intl.NumberFormat('vi-VN').format(o.total_amount);

            // Select box cho status
            const statusSelect = `
            <select class="form-select form-select-sm d-inline-block w-auto" id="select-${o.id}">
                <option value="pending">pending</option>
                <option value="shipping">shipping</option>
                <option value="completed">completed</option>
                <option value="cancelled">cancelled</option>
            </select>`;

            html += `<tr data-order-id="${o.id}">
            <td>${o.id}</td>
            <td>${escapeHtml(o.order_number)}</td>
            <td>${totalFormatted}</td>
            <td id="status-${o.id}">
                <span class="badge bg-secondary text-secondary-fg">${escapeHtml(o.status)}</span>
            </td>
            <td class="text-wrap small text-muted">${items}</td>
            <td>
                    <div class="d-flex gap-2">
                        <button class="btn btn-sm btn-outline-secondary" onclick="viewOrder(${o.id})">View</button>
                        ${statusSelect}
                        <button class="btn btn-sm btn-primary" onclick="adminUpdateStatus(${o.id})">Update</button>
                    </div>
            </td>
            </tr>`;
        });

        html += '</tbody></table></div>';

        // --- RENDER PHÂN TRANG (Pagination) ---
        if (pagination && pagination.total_pages > 1) {
            html += `<nav><ul class="pagination justify-content-center">`;
            
            // Nút Prev
            const prevDisabled = pagination.current_page == 1 ? 'disabled' : '';
            html += `<li class="page-item ${prevDisabled}">
                        <a class="page-link" href="#" onclick="changeOrderPage(${pagination.current_page - 1}); return false;">Prev</a>
                     </li>`;

            // Các nút số trang
            for (let i = 1; i <= pagination.total_pages; i++) {
                const active = i == pagination.current_page ? 'active' : '';
                html += `<li class="page-item ${active}">
                            <a class="page-link" href="#" onclick="changeOrderPage(${i}); return false;">${i}</a>
                         </li>`;
            }

            // Nút Next
            const nextDisabled = pagination.current_page == pagination.total_pages ? 'disabled' : '';
            html += `<li class="page-item ${nextDisabled}">
                        <a class="page-link" href="#" onclick="changeOrderPage(${pagination.current_page + 1}); return false;">Next</a>
                     </li>`;
            
            html += `</ul></nav>`;
        }

        container.innerHTML = html;

        // Sau khi render HTML, set giá trị cho các ô select status
        orders.forEach(o => { 
            const sel = document.getElementById('select-' + o.id); 
            if(sel) sel.value = o.status; 
        });
    }

    // --- 4. GLOBAL FUNCTIONS (Gọi từ HTML onclick) ---

    // Hàm chuyển trang
    window.changeOrderPage = function(newPage) {
        if (newPage < 1) return; // Không cần check max ở đây vì API sẽ trả về rỗng, hoặc logic render sẽ handle
        state.page = newPage;
        loadOrders();
    };

    // Hàm Update Status (Giữ nguyên logic cũ)
    window.adminUpdateStatus = function(id){ 
        const sel = document.getElementById('select-' + id);
        const newStatus = sel.value;
        
        fetch(apiOrders, { 
            method: 'POST', 
            headers: {'Content-Type':'application/json'}, 
            body: JSON.stringify({ id: id, status: newStatus }) 
        })
        .then(r => r.json())
        .then(res => { 
            if(res.success) {
                const statusCell = document.getElementById('status-' + id);
                if(statusCell) {
                    statusCell.innerHTML = `<span class="badge bg-secondary text-secondary-fg">${escapeHtml(newStatus)}</span>`;
                }
                alert('Order #' + id + ' updated to ' + newStatus);
            } else {
                alert('Failed: ' + (res.error || 'Unknown'));
            }
        })
        .catch(err => {
            console.error(err);
            alert('Failed to update status');
        }); 
    };

    // Helper đóng chi tiết inline
    window.closeOrderDetail = function(){ const c = document.getElementById('cartDetailContainer'); if(c) c.style.display = 'none'; };

    // Hàm View Order (Giữ nguyên logic cũ, gọi API lấy chi tiết)
    window.viewOrder = function(id){
        fetch(apiOrders + '?id=' + encodeURIComponent(id))
        .then(r => r.json())
        .then(order => {
            if(order.error) { alert(order.error); return; }

            // Build chi tiết giống logic cũ
            let html = `<div class="mb-2"><strong>Order #${order.id}</strong> — Status: <span class="badge bg-info">${escapeHtml(order.status)}</span></div>`;
            html += `<div class="mb-2">User: ${escapeHtml(order.user_name || order.user_id || 'Guest')}</div>`;
            if (order.session_id) html += `<div class="mb-2">Session: ${escapeHtml(order.session_id)}</div>`;
            
            html += '<div class="table-responsive"><table class="table table-sm"><thead><tr><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th></tr></thead><tbody>';
            let total = 0;
            (order.items||[]).forEach(it=>{ 
                const sub = (parseFloat(it.price)||0) * (parseInt(it.quantity)||0); 
                total += sub; 
                html += `<tr>
                    <td>${escapeHtml(it.product_name||'')}</td>
                    <td>${new Intl.NumberFormat('vi-VN').format(parseFloat(it.price)||0)}</td>
                    <td>${it.quantity}</td>
                    <td>${new Intl.NumberFormat('vi-VN').format(sub)}</td>
                </tr>`; 
            });
            html += `<tr><td colspan="3" class="text-end"><strong>Total</strong></td><td><strong>${new Intl.NumberFormat('vi-VN').format(total)}</strong></td></tr>`;
            html += '</tbody></table></div>';
            
            // Xóa dòng chi tiết cũ nếu có
            document.querySelectorAll('tr.detail-row').forEach(r=>r.remove());
            
            // Chèn dòng chi tiết mới ngay dưới dòng đơn hàng
            const row = document.querySelector(`tr[data-order-id="${id}"]`);
            if (row) {
                const detailTr = document.createElement('tr');
                detailTr.className = 'detail-row';
                const td = document.createElement('td');
                td.colSpan = 6;
                td.style.backgroundColor = '#f8f9fa'; // Màu nền nhẹ để phân biệt
                td.innerHTML = html + '<div class="text-end mt-2"><button class="btn btn-sm btn-outline-secondary" onclick="document.querySelectorAll(\'tr.detail-row\').forEach(r=>r.remove())">Close</button></div>';
                detailTr.appendChild(td);
                row.parentNode.insertBefore(detailTr, row.nextSibling);
            } else {
                // Fallback nếu không tìm thấy dòng (hiếm gặp)
                alert('Chi tiết: ' + JSON.stringify(order));
            }
        })
        .catch(err => { console.error(err); alert('Failed to load order details'); });
    };

})();