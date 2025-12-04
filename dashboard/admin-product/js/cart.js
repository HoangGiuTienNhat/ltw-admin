(function(){
  const apiBase = '../../../project-web/public/api/';
  const apiCarts = apiBase + 'carts.php';

  function el(id){ return document.getElementById(id); }

  window.closeCartDetail = function(){ const c = el('cartDetailContainer'); if(c) c.style.display='none'; };

  async function loadCarts(q){
    try{
      let url = apiCarts;
      if (q) url += '?q=' + encodeURIComponent(q);
      const res = await fetch(url);
      const data = await res.json();
      const cartsList = data && data.data ? data.data : data;
      renderCartsTable(cartsList);
    } catch(err){ console.error(err); const c = el('cartsContainer'); if(c) c.innerText='Error loading carts'; }
  }

  function renderCartsTable(carts){
    const container = el('cartsContainer'); if(!container) return;
    if(!carts || carts.length===0){ container.innerHTML = '<div class="p-4">No carts found.</div>'; return; }
    let html = '<div class="table-responsive"><table class="table card-table table-vcenter text-nowrap"><thead><tr><th>ID</th><th>User</th><th>Session</th><th>Items</th><th>Total</th><th>Status</th><th>Created</th><th>Action</th></tr></thead><tbody>';
    carts.forEach(c=>{
      const itemsCount = (c.items||[]).length;
      const user = c.user_name || (c.user_id?c.user_id:'-');
      html += `<tr><td>${c.id}</td><td>${escapeHtml(user)}</td><td>${escapeHtml(c.session_id||'')}</td><td>${itemsCount}</td><td>${c.total_amount}</td><td>${escapeHtml(c.status)}</td><td>${c.created_at}</td><td class="text-end">`+
        `<button class="btn btn-sm btn-outline-secondary" onclick="viewCart(${c.id})">View</button> `+
        `<select id="status-select-${c.id}" class="form-select form-select-sm d-inline-block mx-1" style="width:120px"><option value="pending">pending</option><option value="processing">processing</option><option value="shipping">shipping</option><option value="completed">completed</option><option value="cancelled">cancelled</option></select>`+
        `<button class="btn btn-sm btn-primary" onclick="updateCartStatus(${c.id})">Set</button> `+
        `<button class="btn btn-sm btn-danger ms-1" onclick="deleteCart(${c.id})">Delete</button>`+
        `</td></tr>`;
    });
    html += '</tbody></table></div>';
    container.innerHTML = html;
    // set current status on selects
    carts.forEach(c=>{ const s = document.getElementById('status-select-'+c.id); if(s) s.value = c.status; });
  }

  window.viewCart = async function(id){
    try{
      const res = await fetch(apiCarts + '?id=' + encodeURIComponent(id));
      const cart = await res.json();
      const container = el('cartDetailContent');
      if (!container) return;
      let html = `<div class="mb-2"><strong>Cart #${cart.id}</strong> — Status: <span class="badge bg-info">${escapeHtml(cart.status)}</span></div>`;
      html += `<div class="mb-2">User: ${escapeHtml($replace(cart.user_name || cart.user_id || 'Guest'))}</div>`;
      html += `<div class="mb-2">Session: ${escapeHtml(cart.session_id||'')}</div>`;
      html += '<div class="table-responsive"><table class="table table-sm"><thead><tr><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th></tr></thead><tbody>';
      let total = 0;
      (cart.items||[]).forEach(it=>{ const sub = (parseFloat(it.price)||0) * (parseInt(it.quantity)||0); total += sub; html += `<tr><td>${escapeHtml(it.product_name||'')}</td><td>${it.price}</td><td>${it.quantity}</td><td>${sub.toFixed(2)}</td></tr>`; });
      html += `<tr><td colspan="3" class="text-end"><strong>Total</strong></td><td><strong>${total.toFixed(2)}</strong></td></tr>`;
      html += '</tbody></table></div>';
      container.innerHTML = html;
      const detailBox = el('cartDetailContainer'); if(detailBox) detailBox.style.display='block';
    } catch(err){ console.error(err); alert('Failed to load cart'); }
  };

  // small helper - replace undefined-safe
  function $replace(v){ return v?v:''; }

  window.updateCartStatus = async function(id){
    const sel = document.getElementById('status-select-'+id);
    if (!sel) return; const status = sel.value;
    try{
      const res = await fetch(apiCarts, { method: 'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify({id:id, status:status}) });
      const jr = await res.json();
      if (jr && jr.success) { alert('Status updated'); loadCarts(el('cartSearch')?el('cartSearch').value:''); }
      else alert('Update failed');
    } catch(err){ console.error(err); alert('Update failed'); }
  };

  window.deleteCart = async function(id){ if(!confirm('Delete cart '+id+'?')) return; try{ const res = await fetch(apiCarts + '?id='+id, { method: 'DELETE' }); const jr = await res.json(); if (jr && jr.success){ alert('Deleted'); loadCarts(el('cartSearch')?el('cartSearch').value:''); } } catch(err){ console.error(err); alert('Delete failed'); } };

  function escapeHtml(str){ if(!str) return ''; return String(str).replace(/[&<>\"']/g,function(s){return{'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#39;"}[s];}); }

  // wire search and refresh
  document.addEventListener('DOMContentLoaded', function(){
    const s = el('cartSearch'); if (s) s.addEventListener('keyup', (e)=>{ if (e.key === 'Enter') loadCarts(s.value); });
    const btn = el('btnRefreshCarts'); if (btn) btn.addEventListener('click', ()=>{ loadCarts(el('cartSearch')?el('cartSearch').value:''); });
    // initial load
    if (el('cartsContainer')) loadCarts('');
  });

})();
