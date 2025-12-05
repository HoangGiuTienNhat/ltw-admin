(function(){
  const apiBase = '../../../project-web/public/api/';
  const apiCarts = apiBase + 'carts.php';

  function el(id){ return document.getElementById(id); }

  window.closeCartDetail = function(){ const c = el('cartDetailContainer'); if(c) c.style.display='none'; };

  async function loadCarts(q){
    try{
      // Load pending and processing carts separately so admin can see both
      const qs = q ? '&q=' + encodeURIComponent(q) : '';
      const [resPending, resProcessing] = await Promise.all([
        fetch(apiCarts + '?status=pending' + (q? '&q='+encodeURIComponent(q): '')),
        fetch(apiCarts + '?status=processing' + (q? '&q='+encodeURIComponent(q): ''))
      ]);
      const jPending = await resPending.json();
      const jProcessing = await resProcessing.json();
      const pending = jPending && jPending.data ? jPending.data : (Array.isArray(jPending)? jPending : []);
      const processing = jProcessing && jProcessing.data ? jProcessing.data : (Array.isArray(jProcessing)? jProcessing : []);
      renderCartsSections(pending, processing);
    } catch(err){ console.error(err); const c = el('cartsContainer'); if(c) c.innerText='Error loading carts'; }
  }

  function renderCartsSections(pending, processing){
    const container = el('cartsContainer'); if(!container) return;
    let html = '';
    // Pending section
    html += '<h5>Pending Carts</h5>';
    if(!pending || pending.length===0){ html += '<div class="p-2 mb-3">No pending carts.</div>'; }
    else {
      html += '<div class="table-responsive mb-4"><table class="table card-table table-vcenter text-nowrap"><thead><tr><th>ID</th><th>User</th><th>Session</th><th>Items</th><th>Total</th><th>Created</th><th>Action</th></tr></thead><tbody>';
      pending.forEach(c=>{ const itemsCount = (c.items||[]).length; const user = c.user_name || (c.user_id?c.user_id:'-');
        html += `<tr data-cart-id="${c.id}"><td>${c.id}</td><td>${escapeHtml(user)}</td><td>${escapeHtml(c.session_id||'')}</td><td>${itemsCount}</td><td>${c.total_amount}</td><td>${c.created_at}</td><td class="text-end">`+
          `<button class="btn btn-sm btn-outline-secondary" onclick="viewCart(${c.id})">View</button> `+
          `<button class="btn btn-sm btn-primary ms-1" onclick="updateCartStatus(${c.id})">Set Status</button> `+
          `<button class="btn btn-sm btn-danger ms-1" onclick="deleteCart(${c.id})">Delete</button>`+
          `</td></tr>`; });
      html += '</tbody></table></div>';
    }

    // Processing section
    html += '<h5>Processing (Awaiting Payment)</h5>';
    if(!processing || processing.length===0){ html += '<div class="p-2 mb-3">No processing carts.</div>'; }
    else {
      html += '<div class="table-responsive"><table class="table card-table table-vcenter text-nowrap"><thead><tr><th>ID</th><th>User</th><th>Session</th><th>Items</th><th>Total</th><th>Updated</th><th>Action</th></tr></thead><tbody>';
      processing.forEach(c=>{ const itemsCount = (c.items||[]).length; const user = c.user_name || (c.user_id?c.user_id:'-');
        html += `<tr data-cart-id="${c.id}"><td>${c.id}</td><td>${escapeHtml(user)}</td><td>${escapeHtml(c.session_id||'')}</td><td>${itemsCount}</td><td>${c.total_amount}</td><td>${c.updated_at||c.created_at}</td><td class="text-end">`+
          `<button class="btn btn-sm btn-outline-secondary" onclick="viewCart(${c.id})">View</button> `+
          `<button class="btn btn-sm btn-success ms-1" onclick="completeProcessingCart(${c.id})">Complete Payment</button> `+
          `<button class="btn btn-sm btn-warning ms-1" onclick="cancelProcessingCart(${c.id})">Cancel</button>`+
          `</td></tr>`; });
      html += '</tbody></table></div>';
    }

    container.innerHTML = html;
  }

  // admin action: complete processing cart -> create order and mark cart completed
  window.completeProcessingCart = async function(id){
    if(!confirm('Complete payment for cart '+id+'? This will create an order.')) return;
    try{
      const res = await fetch(apiCarts, { method: 'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify({id:id, status:'completed'}) });
      const jr = await res.json();
      if (jr && jr.success) { alert('Cart completed. Order: '+(jr.order_number||'')); loadCarts(el('cartSearch')?el('cartSearch').value:''); }
      else if (jr && jr.order_number) { alert('Cart completed. Order: '+jr.order_number); loadCarts(el('cartSearch')?el('cartSearch').value:''); }
      else alert('Complete failed');
    } catch(err){ console.error(err); alert('Complete failed'); }
  };

  window.cancelProcessingCart = async function(id){ if(!confirm('Cancel cart '+id+'?')) return; try{ const res = await fetch(apiCarts, { method: 'PUT', headers:{'Content-Type':'application/json'}, body: JSON.stringify({id:id, status:'cancelled'}) }); const jr = await res.json(); if (jr && jr.success){ alert('Cancelled'); loadCarts(el('cartSearch')?el('cartSearch').value:''); } else alert('Cancel failed'); } catch(err){ console.error(err); alert('Cancel failed'); } };

  window.viewCart = async function(id){
    try{
      const res = await fetch(apiCarts + '?id=' + encodeURIComponent(id));
      const cart = await res.json();
      // remove any existing detail rows
      document.querySelectorAll('tr.detail-row').forEach(r=>r.remove());
      // find the row for this cart
      const row = document.querySelector('tr[data-cart-id="'+id+'"]');
      if (!row) return alert('Row not found');
      // build detail HTML
      let html = `<div class="mb-2"><strong>Cart #${cart.id}</strong> — Status: <span class="badge bg-info">${escapeHtml(cart.status)}</span></div>`;
      html += `<div class="mb-2">User: ${escapeHtml($replace(cart.user_name || cart.user_id || 'Guest'))}</div>`;
      html += `<div class="mb-2">Session: ${escapeHtml(cart.session_id||'')}</div>`;
      html += '<div class="table-responsive"><table class="table table-sm"><thead><tr><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th></tr></thead><tbody>';
      let total = 0;
      (cart.items||[]).forEach(it=>{ const sub = (parseFloat(it.price)||0) * (parseInt(it.quantity)||0); total += sub; html += `<tr><td>${escapeHtml(it.product_name||'')}</td><td>${(parseFloat(it.price)||0).toFixed(2)}</td><td>${it.quantity}</td><td>${sub.toFixed(2)}</td></tr>`; });
      html += `<tr><td colspan="3" class="text-end"><strong>Total</strong></td><td><strong>${total.toFixed(2)}</strong></td></tr>`;
      html += '</tbody></table></div>';
      // create detail row
      const detailTr = document.createElement('tr');
      detailTr.className = 'detail-row';
      const td = document.createElement('td');
      td.colSpan = 8;
      td.innerHTML = html + '<div class="text-end mt-2"><button class="btn btn-sm btn-outline-secondary" onclick="document.querySelectorAll(\'tr.detail-row\').forEach(r=>r.remove())">Close</button></div>';
      detailTr.appendChild(td);
      row.parentNode.insertBefore(detailTr, row.nextSibling);
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
