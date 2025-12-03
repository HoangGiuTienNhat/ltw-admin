// Basic admin JS for products and orders (copied for top-level dashboard/js)
(function(){
  // Relative path from this file (dashboard/js/) to project-web/public/api/
  const apiBase = '../../../project-web/public/api/';
  const apiProducts = apiBase + 'products.php';
  const apiOrders = apiBase + 'orders.php';
  const apiUpload = apiBase + 'upload.php';
  // Base URL to prepend to image paths stored as 'pic/product/...' so admin pages can display images from client site
  const imageBase = '../../../project-web/public/';

  // reusable upload helper: uploads a single file and returns path like 'pic/product/....'
  async function uploadFileForProduct(file, productId, imageIndex, category){
    const fd = new FormData();
    fd.append('image', file);
    if (productId) fd.append('product_id', productId);
    if (typeof imageIndex !== 'undefined') fd.append('image_index', imageIndex);
    if (category) fd.append('category', category);
    const res = await fetch(apiUpload, { method: 'POST', body: fd });
    const jr = await res.json();
    return jr.path || (jr.paths?jr.paths[0]:null);
  }

  function el(id){return document.getElementById(id);} 

  // Product list page: support search input and load products automatically
  (function(){
    const qInput = el('search');
    if (qInput){
      // press Enter to search
      qInput.addEventListener('keyup', (e)=>{ if (e.key === 'Enter') loadProducts(qInput.value); });
    }
    // If there's a dedicated search button (older markup), wire it too
    const btn = el('btnSearch');
    if (btn && qInput) btn.addEventListener('click', ()=>{ loadProducts(qInput.value); });
    // initial load when table container exists
    if (el('tableContainer')) loadProducts('');
  })();

  function loadProducts(q){
    const url = apiProducts + (q?('?q='+encodeURIComponent(q)):'');
    fetch(url).then(r=>r.json()).then(data=>{
      renderProductsTable(data);
    }).catch(e=>{ console.error(e); document.getElementById('tableContainer').innerText='Error loading products'; });
  }

  function renderProductsTable(products){
    const container = document.getElementById('tableContainer');
    if(!container) return;
    // store products globally for modal editing
    window.adminProducts = products || [];
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
      const imgSrc = p.image ? (p.image.indexOf('http')===0 ? p.image : imageBase + p.image) : null;
      const img = imgSrc?'<img src="'+imgSrc+'" style="height:48px">':'-';
      html += `<tr><td>${p.id}</td><td>${img}</td><td>${escapeHtml(p.name)}</td><td>${escapeHtml(p.category||'')}</td><td>${p.price}</td><td>`+
        `<button class="btn btn-sm btn-secondary" onclick="adminOpenEdit(${p.id})">Edit</button> `+
        `<a class="btn btn-sm btn-outline-secondary" href="./index-product.html?id=${p.id}">Open</a> `+
        `<button class="btn btn-sm btn-danger" data-id="${p.id}" onclick="adminDelete(${p.id})">Delete</button>`+
        `</td></tr>`;
    });
    html += '</tbody></table>';
    container.innerHTML = html;
    window.adminDelete = function(id){ if(confirm('Delete product '+id+'?')){ fetch(apiProducts+'?id='+id, { method: 'DELETE' }).then(r=>r.json()).then(()=>loadProducts(el('search')?el('search').value:'')); } };
  }

  // Open inline edit modal
  window.adminOpenEdit = function(id){
    const p = (window.adminProducts||[]).find(x=>x.id==id);
    if(!p){ alert('Product not found'); return; }
    // populate fields
    el('edit_id').value = p.id||'';
    el('edit_name').value = p.name||'';
    el('edit_category').value = p.category||'';
    el('edit_price').value = p.price||'';
    el('edit_amount').value = p.amount||'';
    el('edit_chip').value = p.chip||'';
    el('edit_ram').value = p.ram||'';
    el('edit_outstanding').value = p.outstanding||'';
    el('edit_rating').value = p.rating||'';
    el('edit_is_featured').value = p.is_featured?1:0;
    const prev = el('edit_imagePreview');
    const hid = el('edit_image');
    if(hid) hid.value = p.image || '';
    if(prev){
      if(p.image){ prev.src = (p.image.indexOf('http')===0 ? p.image : imageBase + p.image); prev.style.display='block'; }
      else prev.style.display='none';
    }
    // clear file input
    const fileInp = el('edit_imageFile'); if(fileInp) fileInp.value = '';
    // show modal (bootstrap)
    const modalEl = document.getElementById('editProductModal');
    if (modalEl){ var m = bootstrap.Modal.getOrCreateInstance(modalEl); m.show(); }
  };

  // Save edit from modal
  const editSaveBtn = el('editSaveBtn');
  if (editSaveBtn){
    editSaveBtn.addEventListener('click', async function(){
      const obj = {};
      const form = document.getElementById('editProductForm');
      const fd = new FormData(form);
      for (let pair of fd.entries()){ obj[pair[0]] = pair[1]; }
      // If a new file was selected, upload it first
      const fileEl = el('edit_imageFile');
      if (fileEl && fileEl.files && fileEl.files.length>0){
        try{
          const path = await uploadFileForProduct(fileEl.files[0], obj.id, 0, obj.category);
          if (path){ obj.image = path; const hid = el('edit_image'); if(hid) hid.value = path; }
        } catch(err){ console.error('Upload failed', err); alert('Image upload failed'); return; }
      }
      // convert numeric flags
      if (obj.id) obj.id = parseInt(obj.id);
      if (obj.price) obj.price = parseFloat(obj.price);
      if (obj.amount) obj.amount = parseInt(obj.amount);
      if (obj.rating) obj.rating = parseFloat(obj.rating);
      obj.is_featured = parseInt(obj.is_featured||0);
      fetch(apiProducts, { method:'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify(obj) }).then(r=>r.json()).then(res=>{
        // hide modal and reload list
        const modalEl = document.getElementById('editProductModal'); if (modalEl){ var m = bootstrap.Modal.getInstance(modalEl); if(m) m.hide(); }
        loadProducts(el('search')?el('search').value:'');
      }).catch(err=>{ console.error(err); alert('Save failed'); });
    });
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
        el('old_price').value = p.old_price||'';
        el('amount').value = p.amount||100;
        el('chip').value = p.chip||'';
        el('ram').value = p.ram||'';
        el('screen').value = p.screen||'';
        el('battery').value = p.battery||'';
        el('guarantee').value = p.guarantee||'12 Tháng';
        el('outstanding').value = p.outstanding||'';
        el('rating').value = p.rating||5;
        el('is_featured').value = p.is_featured?1:0;
        if (p.image){ el('image').value = p.image; el('imagePreview').src = p.image; el('imagePreview').style.display='block'; }
        if (p.image1){ el('image1').value = p.image1; el('image1Preview').src = p.image1; el('image1Preview').style.display='block'; }
        if (p.image2){ el('image2').value = p.image2; el('image2Preview').src = p.image2; el('image2Preview').style.display='block'; }
        if (p.image3){ el('image3').value = p.image3; el('image3Preview').src = p.image3; el('image3Preview').style.display='block'; }
      });
    }
    document.getElementById('productForm').addEventListener('submit', function(e){
      e.preventDefault();
      const formEl = this;
      // build object from non-file inputs
      const obj = {};
      const f = new FormData(formEl);
      for (let pair of f.entries()){
        const k = pair[0]; const v = pair[1];
        // skip File objects (they will be handled separately)
        if (v instanceof File) continue;
        obj[k] = v;
      }

      // helper to upload a single file with optional meta (productId, imageIndex, category)
      function uploadSingle(file, meta){
        const fd = new FormData();
        fd.append('image', file);
        if (meta){
          if (meta.productId) fd.append('product_id', meta.productId);
          if (typeof meta.imageIndex !== 'undefined') fd.append('image_index', meta.imageIndex);
          if (meta.productNum) fd.append('product_num', meta.productNum);
          if (meta.category) fd.append('category', meta.category);
          if (meta.category_id) fd.append('category_id', meta.category_id);
        }
        return fetch(apiUpload, { method: 'POST', body: fd }).then(r=>r.json()).then(res=>{ return res.path || (res.paths?res.paths[0]:null); });
      }

      // list of file inputs to process: [inputId, targetKey, previewId, hiddenId]
      const filesMap = [
        ['imageFile','image','imagePreview','image'],
        ['image1File','image1','image1Preview','image1'],
        ['image2File','image2','image2Preview','image2'],
        ['image3File','image3','image3Preview','image3']
      ];

      // sequentially upload present files
      (async function(){
        try{
          // If it's a new product (no id), create it first (without images) so we can name images using product id
          let isNew = !obj.id;
          if (isNew){
            const createObj = Object.assign({}, obj);
            // remove image fields if present
            delete createObj.image; delete createObj.image1; delete createObj.image2; delete createObj.image3; delete createObj.id;
            const res = await fetch(apiProducts, { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify(createObj) });
            const jr = await res.json();
            if (jr && jr.id) {
              obj.id = jr.id;
            } else {
              throw new Error('Failed to create product first');
            }
          }

          // now upload files sequentially with product_id so upload.php can name them properly
          for (let i=0;i<filesMap.length;i++){
            const item = filesMap[i];
            const inputId = item[0], key = item[1], previewId = item[2], hiddenId = item[3];
            const inp = document.getElementById(inputId);
            if (inp && inp.files && inp.files.length>0){
              const meta = { productId: obj.id, imageIndex: i, category: obj.category };
              const path = await uploadSingle(inp.files[0], meta);
              if (path){ obj[key] = path; const hid = document.getElementById(hiddenId); if(hid) hid.value = path; const prev = document.getElementById(previewId); if(prev){ prev.src = path; prev.style.display='block'; } }
            }
          }

          // save final product (PUT update)
          if (obj.id){
            await fetch(apiProducts, { method:'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify(obj) });
            alert(isNew? 'Created' : 'Saved');
            location.href='./index-manage.html';
          }
        } catch(err){ console.error(err); alert('Upload or save failed: '+(err.message||err)); }
      })();
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

  function escapeHtml(str){ if(!str) return ''; return String(str).replace(/[&<>\"']/g,function(s){return{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#39;"}[s];}); }

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
