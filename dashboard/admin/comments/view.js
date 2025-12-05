const API_URL_NEWS = '../api/news';
const API_URL_COMMENTS = '../api/comments';
const UPLOAD_URL = '../../../../project-web/public/news_uploads/';

const urlParams = new URLSearchParams(window.location.search);
const newsId = urlParams.get('id');

document.addEventListener('DOMContentLoaded', () => {
    if (!newsId) {
        alert("Không tìm thấy ID bài viết");
        window.location.href = 'index.html';
        return;
    }

    loadNewsDetail(newsId);
    loadComments(newsId, 1);
});

function renderPagination(pagination) {
    const container = document.getElementById('pagination');
    if (pagination.total_pages >= 1) {
        let html = `<ul class="pagination">`;
        for (let i = 1; i <= pagination.total_pages; i++) {
            const active = i === pagination.current_page ? 'active' : '';
            html += `<li class="page-item ${active}"><a class="page-link" href="#" onclick="loadComments(${newsId}, ${i})">${i}</a></li>`;
        }
        
        html += `</ul>`;
        container.innerHTML = html;
    } else {
        container.innerHTML = '';
    }
}

// 1. Hiển thị chi tiết bài viết
async function loadNewsDetail(id) {
    try {
        const response = await fetch(`${API_URL_NEWS}/detail.php?id=${id}`);
        const result = await response.json();
        
        if (result.status === 'success') {
            const data = result.data;
            
            document.title = data.title;
            document.getElementById('viewTitle').innerText = data.title;
            document.getElementById('viewDate').innerText = 'Đăng vào: ' + new Date(data.created_at).toLocaleString('vi-VN', {
                day: '2-digit',
                month: '2-digit',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: false
            });
            
            // Render nội dung HTML
            document.getElementById('viewContent').innerHTML = data.content;

            // Xử lý ảnh
            const imgEl = document.getElementById('viewImage');
            const imgLabelEl = document.getElementById('viewImageLabel');
            if (data.image) {
                imgEl.src = UPLOAD_URL + data.image;
                imgEl.style.display = 'block';
            } else {
                imgEl.style.display = 'none';
                imgLabelEl.style.display = 'none';
            }
        }
    } catch (error) {
        console.error(error);
    }
}

async function loadComments(newsId, page = 1) {
    const response = await fetch(`${API_URL_COMMENTS}/get_by_news.php?news_id=${newsId}&page=${page}`);
    const result = await response.json();
    const container = document.getElementById('commentsList');
    
    container.innerHTML = '';

    if (result.data.length === 0) {
        document.getElementById('noComments').style.display = 'block';
        document.getElementById('pagination').innerHTML = '';
        return;
    }

    result.data.forEach(cmt => {
        const isApproved = cmt.status == 1;
        const statusBadge = isApproved 
            ? '<span class="badge bg-green-lt">Đã hiện</span>' 
            : '<span class="badge bg-warning-lt">Chờ duyệt</span>';
        
        const actionButton = isApproved
            ? `<button class="btn btn-sm btn-outline-secondary" onclick="toggleStatus(${cmt.id}, 0)">Ẩn</button>`
            : `<button class="btn btn-sm btn-success" onclick="toggleStatus(${cmt.id}, 1)">Duyệt</button>`;

        const html = `
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-2">
                        <div>
                            <span class="fw-bold">${cmt.author}</span>
                            <div class="text-muted small">${cmt.created_at}</div>
                        </div>
                        <div>${statusBadge}</div>
                    </div>
                    
                    <div class="mb-3 bg-light p-2 rounded text-secondary">
                        ${cmt.content}
                    </div>

                    <div class="d-flex justify-content-end gap-2">
                        ${actionButton}
                        <button class="btn btn-sm btn-outline-danger" onclick="deleteComment(${cmt.id})">Xóa</button>
                    </div>
                </div>
            </div>
        `;
        container.innerHTML += html;
    });

    renderPagination(result.pagination);
}

async function toggleStatus(id, status) {
    const formData = new FormData();
    formData.append('id', id);
    formData.append('status', status);

    await fetch(`${API_URL_COMMENTS}/toggle_status.php`, {
        method: 'POST', 
        body: formData
    });
    const currentPageBtn = document.querySelector('.pagination .active .page-link');
    const currentPage = currentPageBtn ? currentPageBtn.innerText : 1;
    loadComments(newsId, currentPage);
}

async function deleteComment(id) {
    if(!confirm("Xóa bình luận này?")) return;

    const formData = new FormData();
    formData.append('id', id);

    await fetch(`${API_URL_COMMENTS}/delete.php`, {
        method: 'POST',
        body: formData
    });
    const currentPageBtn = document.querySelector('.pagination .active .page-link');
    const currentPage = currentPageBtn ? currentPageBtn.innerText : 1;
    loadComments(newsId, currentPage);
}