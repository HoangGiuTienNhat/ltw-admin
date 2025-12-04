(function(){
    // Config - Adjust relative paths if necessary
    const apiBase = '../../../project-web/public/api/';
    const apiProducts = apiBase + 'products.php';
    const imageBase = '../../../project-web/public/';

    function el(id){ return document.getElementById(id); } 

    function escapeHtml(str){ 
    if(!str) return ''; 
    return String(str).replace(/[&<>\"']/g, function(s){
        return{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#39;"}[s];
    }); 
    }

    // --- Product List Logic ---
    
    // Initialize Search Listener
    const qInput = el('search');
    if (qInput){
    qInput.addEventListener('keyup', (e)=>{ 
        if (e.key === 'Enter') loadProducts(qInput.value); 
    });
    
    // Initial load
    loadProducts('');
    }

    function loadProducts(q){
    const url = apiProducts + (q ? ('?q=' + encodeURIComponent(q)) : '');
    fetch(url)
        .then(r => r.json())
        .then(data => {
        renderProductsTable(data);
        })
        .catch(e => { 
        console.error(e); 
        const container = el('tableContainer');
        if(container) container.innerText = 'Error loading products. Please check API path.'; 
        });
    }

    function renderProductsTable(products){
    const container = el('tableContainer');
    if(!container) return;
    
    // Store for global access if needed
    window.adminProducts = products || [];
    
    let html = `<div class="table-responsive"><table class="table card-table table-vcenter text-nowrap datatable">
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
            // Image handling
            const imgSrc = p.image ? (p.image.indexOf('http') === 0 ? p.image : imageBase + p.image) : null;
            const img = imgSrc 
            ? `<span class="avatar avatar-sm" style="background-image: url(${imgSrc})"></span>` 
            : '<span class="avatar avatar-sm">-</span>';

            html += `<tr>
            <td><span class="text-secondary">${p.id}</span></td>
            <td>${img}</td>
            <td>${escapeHtml(p.name)}</td>
            <td>${escapeHtml(p.category||'')}</td>
            <td>${p.price}</td>
            <td class="text-end">
                <a class="btn btn-sm btn-outline-secondary" href="./index-product.php?id=${p.id}">Open</a>
                <button class="btn btn-sm btn-danger ms-1" data-id="${p.id}" onclick="adminDelete(${p.id})">Delete</button>
            </td>
            </tr>`;
        });
    } else {
        html += '<tr><td colspan="6" class="text-center p-4">No products found</td></tr>';
    }
    
    html += '</tbody></table></div>';
    container.innerHTML = html;
    
    // Expose delete function globally so onclick="" works
    window.adminDelete = function(id){ 
        if(confirm('Delete product '+id+'?')){ 
            fetch(apiProducts + '?id=' + id, { method: 'DELETE' })
            .then(r => r.json())
            .then(() => loadProducts(el('search') ? el('search').value : '')); 
        } 
    };
    }

})();
