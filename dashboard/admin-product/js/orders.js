
(function(){
    // 1. Config Paths
    // Lưu ý: Kiểm tra lại đường dẫn này nếu file php nằm khác thư mục với file js cũ
    const apiBase = '../../../project-web/public/api/';
    const apiOrders = apiBase + 'orders.php';
    
    // Pagination state
    let currentPage = 1;
    const itemsPerPage = 15;

    // 2. Helper Functions
    function escapeHtml(str){ 
    if(!str) return ''; 
    return String(str).replace(/[&<>\"']/g, function(s){
        return{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#39;"}[s];
    }); 
    }

    // 3. Main Logic: Fetch & Render
    const container = document.getElementById('ordersContainer');
    
    function loadOrders(page = 1) {
        if (!container) return;
        
        const url = `${apiOrders}?page=${page}&limit=${itemsPerPage}`;
        fetch(url)
            .then(r => r.json())
            .then(response => {
                currentPage = page;
                renderOrders(response.data, response.pagination);
            })
            .catch(e => { 
                console.error(e); 
                container.innerHTML = '<div class="alert alert-danger">Error loading orders. Please check API path.</div>'; 
            });
    }

    // Load initial page
    loadOrders(1);

    function renderOrders(orders, pagination){
        if (!orders || orders.length === 0) {
            container.innerHTML = '<div class="text-center p-4">No orders found.</div>';
            return;
        }

        let html = `
        <div class="table-responsive">
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
            const items = (o.items || []).map(i => escapeHtml(i.product_name) + ' x' + i.quantity).join('<br>');
            
            // Tạo Select box cho status
            // Note: id="select-${o.id}" dùng để lấy value khi bấm Update
            const statusSelect = `
            <select class="form-select form-select-sm d-inline-block w-auto" id="select-${o.id}">
                <option value="pending">pending</option>
                <option value="shipping">shipping</option>
                <option value="completed">completed</option>
                <option value="cancelled">cancelled</option>
            </select>
            `;

            html += `<tr data-order-id="${o.id}">
            <td>${o.id}</td>
            <td>${escapeHtml(o.order_number)}</td>
            <td>${o.total_amount}</td>
            <td id="status-${o.id}">
                <span class="badge bg-secondary text-secondary-fg">${escapeHtml(o.status)}</span>
            </td>
            <td class="text-wrap">${items}</td>
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
        
        // Add pagination controls
        if (pagination && pagination.totalPages > 1) {
            html += renderPaginationControls(pagination);
        }
        
        container.innerHTML = html;

        // Sau khi render HTML, set giá trị hiện tại cho các ô select
        orders.forEach(o => { 
            const sel = document.getElementById('select-' + o.id); 
            if(sel) sel.value = o.status; 
        });
    }

    function renderPaginationControls(pagination) {
        const { page, totalPages } = pagination;
        let html = '<nav aria-label="Orders pagination" class="mt-4"><ul class="pagination justify-content-center">';
        
        // Previous button
        if (page > 1) {
            html += `<li class="page-item"><a class="page-link" href="#" onclick="loadOrdersPage(${page - 1}); return false;">Previous</a></li>`;
        } else {
            html += '<li class="page-item disabled"><span class="page-link">Previous</span></li>';
        }
        
        // Page numbers
        const maxVisiblePages = 5;
        let startPage = Math.max(1, page - Math.floor(maxVisiblePages / 2));
        let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);
        if (endPage - startPage + 1 < maxVisiblePages) {
            startPage = Math.max(1, endPage - maxVisiblePages + 1);
        }
        
        if (startPage > 1) {
            html += `<li class="page-item"><a class="page-link" href="#" onclick="loadOrdersPage(1); return false;">1</a></li>`;
            if (startPage > 2) {
                html += '<li class="page-item disabled"><span class="page-link">...</span></li>';
            }
        }
        
        for (let i = startPage; i <= endPage; i++) {
            if (i === page) {
                html += `<li class="page-item active"><span class="page-link">${i}</span></li>`;
            } else {
                html += `<li class="page-item"><a class="page-link" href="#" onclick="loadOrdersPage(${i}); return false;">${i}</a></li>`;
            }
        }
        
        if (endPage < totalPages) {
            if (endPage < totalPages - 1) {
                html += '<li class="page-item disabled"><span class="page-link">...</span></li>';
            }
            html += `<li class="page-item"><a class="page-link" href="#" onclick="loadOrdersPage(${totalPages}); return false;">${totalPages}</a></li>`;
        }
        
        // Next button
        if (page < totalPages) {
            html += `<li class="page-item"><a class="page-link" href="#" onclick="loadOrdersPage(${page + 1}); return false;">Next</a></li>`;
        } else {
            html += '<li class="page-item disabled"><span class="page-link">Next</span></li>';
        }
        
        html += '</ul></nav>';
        return html;
    }

    // 4. Global Function for "Update" button
    // Gán vào window để onclick trong HTML gọi được
    window.adminUpdateStatus = function(id){ 
        const sel = document.getElementById('select-' + id);
        const newStatus = sel.value;
        
        // UI Feedback: Disable button or show spinner logic could go here
        
        fetch(apiOrders, { 
            method: 'POST', 
            headers: {'Content-Type':'application/json'}, 
            body: JSON.stringify({ id: id, status: newStatus }) 
        })
        .then(r => r.json())
        .then(() => { 
            // Cập nhật text trạng thái ngay lập tức mà không cần reload
            const statusCell = document.getElementById('status-' + id);
            if(statusCell) {
                statusCell.innerHTML = `<span class="badge bg-secondary text-secondary-fg">${escapeHtml(newStatus)}</span>`;
            }
            alert('Order #' + id + ' updated to ' + newStatus);
        })
        .catch(err => {
            console.error(err);
            alert('Failed to update status');
        }); 
    };
    
    // Global function to load a specific page
    window.loadOrdersPage = function(page) {
        loadOrders(page);
        // Scroll to top of orders table
        if (container) container.scrollIntoView({ behavior: 'smooth' });
    };

    // helper to close the inline detail panel
    window.closeOrderDetail = function(){ const c = document.getElementById('cartDetailContainer'); if(c) c.style.display = 'none'; };

    // 5. Global view function to show order details in a modal (similar to cart view)
    window.viewOrder = function(id){
        fetch(apiOrders + '?id=' + encodeURIComponent(id))
        .then(r => r.json())
        .then(order => {
            // build HTML similar to cart detail
            let html = `<div class="mb-2"><strong>Order #${order.id}</strong> — Status: <span class="badge bg-info">${escapeHtml(order.status)}</span></div>`;
            html += `<div class="mb-2">User: ${escapeHtml(order.user_name || order.user_id || 'Guest')}</div>`;
            // session may or may not exist on orders
            if (order.session_id) html += `<div class="mb-2">Session: ${escapeHtml(order.session_id)}</div>`;
            html += '<div class="table-responsive"><table class="table table-sm"><thead><tr><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th></tr></thead><tbody>';
            let total = 0;
            (order.items||[]).forEach(it=>{ const sub = (parseFloat(it.price)||0) * (parseInt(it.quantity)||0); total += sub; html += `<tr><td>${escapeHtml(it.product_name||'')}</td><td>${(parseFloat(it.price)||0).toFixed(2)}</td><td>${it.quantity}</td><td>${sub.toFixed(2)}</td></tr>`; });
            html += `<tr><td colspan="3" class="text-end"><strong>Total</strong></td><td><strong>${total.toFixed(2)}</strong></td></tr>`;
            html += '</tbody></table></div>';
            // remove existing detail rows
            document.querySelectorAll('tr.detail-row').forEach(r=>r.remove());
            // create detail row after the order row
            const row = document.querySelector('tr[data-order-id="'+id+'"]');
            if (!row) {
                // fallback to modal/inline
                const modalBody = document.getElementById('cartDetailModalBody');
                if (modalBody) modalBody.innerHTML = html;
                const inlineBody = document.getElementById('cartDetailContent'); if (inlineBody) inlineBody.innerHTML = html;
                const modalEl = document.getElementById('cartDetailModal'); if (modalEl && window.bootstrap) new bootstrap.Modal(modalEl).show();
                return;
            }
            const detailTr = document.createElement('tr');
            detailTr.className = 'detail-row';
            const td = document.createElement('td');
            td.colSpan = 6;
            td.innerHTML = html + '<div class="text-end mt-2"><button class="btn btn-sm btn-outline-secondary" onclick="document.querySelectorAll(\'tr.detail-row\').forEach(r=>r.remove())">Close</button></div>';
            detailTr.appendChild(td);
            row.parentNode.insertBefore(detailTr, row.nextSibling);
        })
        .catch(err => { console.error(err); alert('Failed to load order details'); });
    };

})();
