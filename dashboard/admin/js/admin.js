// Basic admin JS for products and orders
(function(){
  const apiProducts = '../../../project-web/public/api/products.php';
  const apiOrders = '../../../project-web/public/api/orders.php';
  const apiUpload = '../../../project-web/public/api/upload.php';

  function el(id){return document.getElementById(id);} 

  // Product list page
  if (el('btnSearch')) {
    const qInput = el('search');
    const btn = el('btnSearch');
    btn.addEventListener('click', ()=>{ loadProducts(qInput.value); });
    // load initial
    loadProducts('');
  }

  function loadProducts(q){
    const url = apiProducts + (q?('?q='+encodeURIComponent(q)):'');
    fetch(url).then(r=>r.json()).then(data=>{
      renderProductsTable(data);
    }).catch(e=>{ console.error(e); document.getElementById('tableContainer').innerText='Error loading products'; });
  }

  function renderProductsTable(products){
    const container = document.getElementById('tableContainer');
    if(!container) return;
    let html = `<table class="table card-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Image</th>
          <th>Name</th>
          <th>Category</th>
          <th>Price</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>`;
    products.forEach(p=>{
      const img = p.image?'<img src="'+p.image+'" style="height:48px">':'-';
      html += `<tr><td>${p.id}</td><td>${img}</td><td>${escapeHtml(p.name)}</td><td>${escapeHtml(p.category||'')}</td><td>${p.price}</td><td>`+
        `<a class="btn btn-sm btn-secondary" href="./product.html?id=${p.id}">Edit</a> `+
        `<button class="btn btn-sm btn-danger" data-id="${p.id}" onclick="adminDelete(${p.id})">Delete</button>`+
        `</td></tr>`;
    });
    html += '</tbody></table>';
    container.innerHTML = html;
    window.adminDelete = function(id){ if(confirm('Delete product '+id+'?')){ fetch(apiProducts+'?id='+id, { method: 'DELETE' }).then(r=>r.json()).then(()=>loadProducts(el('search')?el('search').value:'')); } };
  }

  // product form page
  if (el('productForm')){
    const params = new URLSearchParams(location.search);
    const id = params.get('id');
    if (params.get('action') === 'new'){
      el('formTitle').innerText = 'Add Product';
    } else if (id){
      el('formTitle').innerText = 'Edit Product';
      fetch(apiProducts+'?id='+id).then(r=>r.json()).then(p=>{
        el('pid').value = p.id||'';
        el('name').value = p.name||'';
        el('category').value = p.category||'';
        el('price').value = p.price||'';
        el('image').value = p.image||'';
      });
    }
    document.getElementById('productForm').addEventListener('submit', function(e){
      e.preventDefault();
      const form = new FormData(this);
      const obj = {};
      form.forEach((v,k)=>obj[k]=v);
      // if imageFile present and a file is selected, ensure it's uploaded first
      const fileInput = document.getElementById('imageFile');
      const doSave = (objData)=>{
        if (objData.id){
          fetch(apiProducts, { method:'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify(objData) }).then(r=>r.json()).then(()=>{ alert('Saved'); location.href='./'; });
        } else {
          fetch(apiProducts, { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify(objData) }).then(r=>r.json()).then(()=>{ alert('Created'); location.href='./'; });
        }
      };
      if (fileInput && fileInput.files && fileInput.files.length>0){
        const fdata = new FormData();
        fdata.append('image', fileInput.files[0]);
        fetch(apiUpload, { method: 'POST', body: fdata }).then(r=>r.json()).then(res=>{
          if (res && res.path) {
            obj.image = res.path;
            document.getElementById('image').value = res.path;
          }
          doSave(obj);
        }).catch(err=>{ console.error(err); alert('Upload failed'); });
      } else {
        doSave(obj);
      }
    });
  }

  // orders page
  if (document.getElementById('ordersContainer')){
    fetch(apiOrders).then(r=>r.json()).then(data=>{
      renderOrders(data);
    }).catch(e=>{ console.error(e); document.getElementById('ordersContainer').innerText='Error loading orders'; });
  }

  function renderOrders(orders){
    const c = document.getElementById('ordersContainer');
    let html = '<table class="table card-table"><thead><tr><th>ID</th><th>Order#</th><th>Total</th><th>Status</th><th>Items</th><th>Action</th></tr></thead><tbody>';
    orders.forEach(o=>{
      const items = (o.items||[]).map(i=>escapeHtml(i.product_name)+' x'+i.quantity).join('<br>');
      html += `<tr><td>${o.id}</td><td>${escapeHtml(o.order_number)}</td><td>${o.total_amount}</td><td id="status-${o.id}">${escapeHtml(o.status)}</td><td>${items}</td><td>`+
        `<select id="select-${o.id}"><option value="pending">pending</option><option value="shipping">shipping</option><option value="completed">completed</option><option value="cancelled">cancelled</option></select>`+
        `<button class="btn btn-sm btn-primary" onclick="adminUpdateStatus(${o.id})">Update</button>`+
        `</td></tr>`;
    });
    html += '</tbody></table>';
    c.innerHTML = html;
    orders.forEach(o=>{ const sel=document.getElementById('select-'+o.id); if(sel) sel.value=o.status; });
    window.adminUpdateStatus = function(id){ const sel=document.getElementById('select-'+id); fetch(apiOrders, { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify({id:id, status:sel.value}) }).then(r=>r.json()).then(()=>{ document.getElementById('status-'+id).innerText = sel.value; }); };
  }

  function escapeHtml(str){ if(!str) return ''; return String(str).replace(/[&<>"']/g,function(s){return{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#39;"}[s];}); }

})();

  // Image preview handling for form page
  document.addEventListener('DOMContentLoaded', function(){
    const imageFile = document.getElementById('imageFile');
    const preview = document.getElementById('imagePreview');
    if (imageFile){
      imageFile.addEventListener('change', function(){
        const f = this.files[0];
        if (f){
          const reader = new FileReader();
          reader.onload = function(e){ preview.src = e.target.result; preview.style.display='block'; };
          reader.readAsDataURL(f);
        } else { preview.style.display='none'; }
      });
    }
  });
