const API_URL = '../api/news'; 
const UPLOAD_URL = '../../../../project-web/public/news_uploads/';

document.addEventListener('DOMContentLoaded', () => {
    loadNews(1);
});

// phân trang
function renderPagination(pagination) {
    const container = document.getElementById('pagination');
    if (pagination.total_pages >= 1) {
        let html = `<ul class="pagination">`;
        
        for (let i = 1; i <= pagination.total_pages; i++) {
            const active = i === pagination.current_page ? 'active' : '';
            html += `<li class="page-item ${active}"><a class="page-link" href="#" onclick="loadNews(${i})">${i}</a></li>`;
        }
        
        html += `</ul>`;
        container.innerHTML = html;
    } else {
        container.innerHTML = '';
    }
}

async function loadNews(page = 1) {
    const search = document.getElementById('searchInput').value;
    const response = await fetch(`${API_URL}/read.php?page=${page}&search=${search}`);
    const result = await response.json();
    const tbody = document.querySelector('#news-table tbody');
    tbody.innerHTML = '';
    
    if(result.data.length === 0) {
        tbody.innerHTML = '<tr><td colspan="6" class="text-center">Chưa có bài viết nào</td></tr>';
        document.getElementById('pagination').innerHTML = '';
        return;
    }

    result.data.forEach(item => {
        const imgTag = item.image 
            ? `<img src="${UPLOAD_URL}${item.image}" class="img-fluid object-fit-contain" alt="ảnh bìa bài viết">` 
            : `<span class="avatar">NA</span>`;
            
        const row = `
            <tr>
                <td class="text-wrap" style="max-width: 150px;">
                    ${new Date(item.created_at).toLocaleString('vi-VN', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                        hour12: false
                    })}
                </td>
                <td class="text-wrap">
                    <a href="view.html?id=${item.id}" class="text-inherit news-link">
                        ${item.title}
                    </a>
                </td>
                <td style="max-width: 150px;">
                    ${imgTag}
                </td>
                <td style="white-space: nowrap; max-width: 120px;">
                    <button class="btn btn-primary btn-sm m-1" onclick="editNews(${item.id})">Sửa</button>
                    <button class="btn btn-danger btn-sm m-1" onclick="deleteNews(${item.id})">Xóa</button>
                </td>
            </tr>
        `;
        tbody.insertAdjacentHTML('beforeend', row);
    });

    renderPagination(result.pagination);
}

function openModal() {
    document.getElementById('modal-title').innerText = "Thêm bài viết mới";
    document.getElementById('news-image-file').value = '';
    document.getElementById('news-id').value = "";
    document.getElementById('title').value = "";
    document.getElementById('content').value = "";
    showPreview('');

    var myModal = new bootstrap.Modal(document.getElementById('modal-news'));
    myModal.show();

    setTimeout(() => { initEditor(); }, 200);
}

async function editNews(id) {
    try {
        const response = await fetch(`${API_URL}/detail.php?id=${id}`);
        const result = await response.json();

        if (result.status === 'success') {
            const data = result.data;
            document.getElementById('modal-title').innerText = "Cập nhật bài viết";
            document.getElementById('news-image-file').value = '';
            document.getElementById('news-id').value = data.id;
            document.getElementById('title').value = data.title;
            document.getElementById('content').value = data.content;
            showPreview(data.image ? `${UPLOAD_URL}${data.image}` : '');

            var myModal = new bootstrap.Modal(document.getElementById('modal-news'));
            myModal.show();

            setTimeout(() => { 
                initEditor();
                tinymce.get('content').setContent(data.content);
            }, 200);
        } else {
            alert(result.message);
        }
    } catch (error) {
        console.error("Lỗi khi tải chi tiết bài viết:", error);
        alert("Không thể tải thông tin bài viết.");
    }
}

async function saveNews() {
    if (tinymce.get('content')) {
        tinymce.triggerSave();
    }
    
    // kiểm tra không để trống tiêu đề và nội dung
    let hasError = false;
    const titleInput = document.getElementById('title');
    const content = tinymce.get('content') ? tinymce.get('content').getContent() : '';
    
    if (!titleInput.value.trim()) {
        alert("Tiêu đề không được để trống");
        hasError = true;
    }

    if (!content.trim()) {
        alert("Nội dung không được để trống");
        hasError = true;
    }

    if (hasError) return;

    const formData = new FormData();
    formData.append('title', titleInput.value.trim());
    formData.append('content', content.trim());
    const fileInput = document.getElementById('news-image-file');
    if (fileInput.files.length > 0) {
        formData.append('image', fileInput.files[0]);
    }
    
    const id = document.getElementById('news-id').value;
    if (id) {
        formData.append('id', id);
    }
    let url = id ? `${API_URL}/update.php` : `${API_URL}/create.php`;
    
    // Hiển thị loading
    const btnSave = document.querySelector('#modal-news .btn-primary');
    const originalText = btnSave.innerHTML;
    btnSave.innerHTML = 'Đang lưu...';
    btnSave.disabled = true;

    try {
        const response = await fetch(url, {
            method: 'POST',
            body: formData
        });

        const result = await response.json();
        
        if(result.status === 'success') {
            alert(result.message);
            const currentPageBtn = document.querySelector('.pagination .active .page-link');
            const currentPage = currentPageBtn ? currentPageBtn.innerText : 1;
            loadNews(currentPage);
            const modalInstance = bootstrap.Modal.getInstance(document.getElementById('modal-news'));
            modalInstance.hide();
        } else {
            alert('Lỗi khi lưu bài viết: ' + result.message);
        }
    } catch (error) {
        console.error('Lỗi khi lưu bài viết:', error);
    } finally {
        btnSave.innerHTML = originalText;
        btnSave.disabled = false;
    }
}

async function deleteNews(id) {
    if(!confirm("Bạn có chắc muốn xóa bài này?")) return;

    const formData = new FormData();
    formData.append('id', id);

    await fetch(`${API_URL}/delete.php`, {
        method: 'POST',
        body: formData
    });
    const currentPageBtn = document.querySelector('.pagination .active .page-link');
    const currentPage = currentPageBtn ? currentPageBtn.innerText : 1;
    loadNews(currentPage);
}

// Hàm xem trước ảnh
function previewImage() {
    const fileInput = document.getElementById('news-image-file');
    const file = fileInput.files[0];
    
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            showPreview(e.target.result);
        }
        reader.readAsDataURL(file);
    }
}

function showPreview(src) {
    const img = document.getElementById('img-preview');
    const text = document.getElementById('no-img-text');
    
    if (src && src !== 'null') {
        img.src = src;
        img.style.display = 'block';
        text.style.display = 'none';
    } else {
        img.style.display = 'none';
        text.style.display = 'block';
    }
}

function initEditor() {
    if (tinymce.get('content')) {
        tinymce.get('content').remove();
    }

    tinymce.init({
        selector: 'textarea#content',
        plugins: [
            "advlist", "autolink", "charmap", "table",
            "insertdatetime", "lists", "searchreplace",
        ],
        toolbar: 'undo redo | ' +
        'bold italic underline forecolor | ' +
        'alignleft aligncenter alignright alignjustify | ' +
        'bullist numlist',
        content_style: 'body { font-family: Helvetica, Arial, sans-serif; font-size: 14px }'
    });
}


var modalElement = document.getElementById('modal-news');
modalElement.addEventListener('hidden.bs.modal', function () {
    if (tinymce.get('content')) {
        tinymce.get('content').remove();
    }
});