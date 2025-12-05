(function(){
    // Config paths
    const apiBase = '../../../project-web/public/api/';
    const apiProducts = apiBase + 'products.php';
    const apiUpload = apiBase + 'upload.php';
    const imageBase = '../../../project-web/public/';

    function el(id){ return document.getElementById(id); }

    // Map definition for file inputs: [FileInputID, HiddenInputID, PreviewImgID]
    // Note: Logic allows uploading logic to iterate over this
    const filesMap = [
    ['imageFile', 'image', 'imagePreview'],
    ['image1File', 'image1', 'image1Preview'],
    ['image2File', 'image2', 'image2Preview'],
    ['image3File', 'image3', 'image3Preview']
    ];

    // --- 1. SETUP PREVIEWS FOR ALL IMAGE INPUTS ---
    filesMap.forEach(item => {
    const inputId = item[0];
    const previewId = item[2];
    const inp = el(inputId);
    if(inp){
        inp.addEventListener('change', function(){
        const f = this.files[0];
        const prev = el(previewId);
        if (f && prev){
            const reader = new FileReader();
            reader.onload = function(e){ 
            prev.src = e.target.result; 
            prev.style.display = 'block'; 
            };
            reader.readAsDataURL(f);
        } else if (prev) {
            // keep old preview if exists? or hide? usually keep old unless cleared
        }
        });
    }
    });

    // --- 2. LOAD DATA IF EDIT MODE ---
    const params = new URLSearchParams(location.search);
    const id = params.get('id');
    const action = params.get('action');

    if (action === 'new'){
    el('formTitle').innerText = 'Add New Product';
    } else if (id){
    el('formTitle').innerText = 'Edit Product #' + id;
    
    // Fetch current data
    fetch(apiProducts + '?id=' + id)
        .then(r => r.json())
        .then(p => {
        el('pid').value = p.id || '';
        el('name').value = p.name || '';
        
        // Xử lý select category: Gán value, select sẽ tự chọn option tương ứng
        el('category').value = p.category || ''; 
        
        el('price').value = p.price || '';
        el('old_price').value = p.old_price || '';
        el('amount').value = p.amount || 0;
        el('chip').value = p.chip || '';
        el('ram').value = p.ram || '';
        el('screen').value = p.screen || '';
        el('battery').value = p.battery || '';
        el('guarantee').value = p.guarantee || '12 Tháng';
        el('outstanding').value = p.outstanding || '';
        el('rating').value = p.rating || 5;
        el('is_featured').value = p.is_featured ? 1 : 0;

        // Load existing images into hidden fields and previews
        // Helper to set image
        const setImg = (key, previewId) => {
            if(p[key]) {
                el(key).value = p[key];
                const prev = el(previewId);
                // Check if absolute or relative path
                const src = p[key].indexOf('http') === 0 ? p[key] : imageBase + p[key];
                prev.src = src;
                prev.style.display = 'block';
            }
        };

        setImg('image', 'imagePreview');
        setImg('image1', 'image1Preview');
        setImg('image2', 'image2Preview');
        setImg('image3', 'image3Preview');
        })
        .catch(err => console.error('Error loading product:', err));
    }

    // --- 3. FORM SUBMISSION LOGIC ---
    document.getElementById('productForm').addEventListener('submit', function(e){
    e.preventDefault();
    const formEl = this;
    const obj = {};
    const f = new FormData(formEl);

    // Convert FormData to Object (Select box value is automatically captured here)
    for (let pair of f.entries()){
        const k = pair[0]; const v = pair[1];
        if (v instanceof File) continue; // skip files here
        obj[k] = v;
    }

    // --- Helper: Upload Single File ---
    function uploadSingle(file, meta){
        const fd = new FormData();
        fd.append('image', file);
        if (meta){
        if (meta.productId) fd.append('product_id', meta.productId);
        if (typeof meta.imageIndex !== 'undefined') fd.append('image_index', meta.imageIndex);
        if (meta.category) fd.append('category', meta.category);
        }
        return fetch(apiUpload, { method: 'POST', body: fd })
        .then(r => r.json())
        .then(res => { return res.path || (res.paths ? res.paths[0] : null); });
    }

    // --- Execute Save Process ---
    (async function(){
        try {
        let isNew = !obj.id;
        
        // Step A: If NEW, create record first (POST) to get ID for image naming
        if (isNew){
            const createObj = Object.assign({}, obj);
            // remove image keys to avoid sending empty strings initially
            delete createObj.image; delete createObj.image1; delete createObj.image2; delete createObj.image3; delete createObj.id;
            
            const res = await fetch(apiProducts, { 
                method:'POST', 
                headers:{'Content-Type':'application/json'}, 
                body: JSON.stringify(createObj) 
            });
            const jr = await res.json();
            
            if (jr && jr.id) {
            obj.id = jr.id; // Update obj with real ID
            } else {
            throw new Error('Failed to create product record.');
            }
        }

        // Step B: Upload Files (Sequentially) using the ID
        for (let i = 0; i < filesMap.length; i++){
            const item = filesMap[i];
            const inputId = item[0]; // e.g. 'imageFile'
            const key = item[1];     // e.g. 'image'
            // Hidden input is also 'image', 'image1' etc used in obj[key]
            
            const inp = el(inputId);
            if (inp && inp.files && inp.files.length > 0){
            // Determine metadata for upload
            // Note: Image index 0 is primary, 1 is image1, etc.
            const meta = { 
                productId: obj.id, 
                imageIndex: i, 
                category: obj.category 
            };
            
            const path = await uploadSingle(inp.files[0], meta);
            if (path){
                obj[key] = path; // Update object with new path
            }
            }
        }

        // Step C: Update Product (PUT) with final data (including new image paths)
        // Even if it was new, we do a PUT now to save image paths
        await fetch(apiProducts, { 
            method:'PUT', 
            headers:{'Content-Type':'application/json'}, 
            body: JSON.stringify(obj) 
        });

        alert(isNew ? 'Product Created Successfully!' : 'Product Updated Successfully!');
        window.location.href = './index-manage.php';

        } catch(err){
        console.error(err);
        alert('Error saving product: ' + (err.message || err));
        }
    })();
    });

})();
