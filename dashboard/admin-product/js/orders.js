
(function(){
    // 1. Config Paths
    // Lưu ý: Kiểm tra lại đường dẫn này nếu file php nằm khác thư mục với file js cũ
    const apiBase = '../../../project-web/public/api/';
    const apiOrders = apiBase + 'orders.php';

    // 2. Helper Functions
    function escapeHtml(str){ 
    if(!str) return ''; 
    return String(str).replace(/[&<>\"']/g, function(s){
        return{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#39;"}[s];
    }); 
    }

    // 3. Main Logic: Fetch & Render
    const container = document.getElementById('ordersContainer');
    
    if (container){
    fetch(apiOrders)
        .then(r => r.json())
        .then(data => {
            renderOrders(data);
        })
        .catch(e => { 
            console.error(e); 
            container.innerHTML = '<div class="alert alert-danger">Error loading orders. Please check API path.</div>'; 
        });
    }

    function renderOrders(orders){
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

        html += `<tr>
        <td>${o.id}</td>
        <td>${escapeHtml(o.order_number)}</td>
        <td>${o.total_amount}</td>
        <td id="status-${o.id}">
            <span class="badge bg-secondary text-secondary-fg">${escapeHtml(o.status)}</span>
        </td>
        <td class="text-wrap">${items}</td>
        <td>
            <div class="d-flex gap-2">
                ${statusSelect}
                <button class="btn btn-sm btn-primary" onclick="adminUpdateStatus(${o.id})">Update</button>
            </div>
        </td>
        </tr>`;
    });

    html += '</tbody></table></div>';
    container.innerHTML = html;

    // Sau khi render HTML, set giá trị hiện tại cho các ô select
    orders.forEach(o => { 
        const sel = document.getElementById('select-' + o.id); 
        if(sel) sel.value = o.status; 
    });
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

})();
