const API_URL = '../api/comments';

document.addEventListener('DOMContentLoaded', () => {
    loadComments(1);
});

async function loadComments(page = 1) {
    const search = document.getElementById('searchInput').value;
    const statusFilter = document.getElementById('filterStatus').value;
    let apiUrl = `${API_URL}/read.php?page=${page}&status=${statusFilter}`;
    if (search && search.trim() !== '') {
        apiUrl += `&search=${search.trim()}`;
    }
    const response = await fetch(apiUrl);
    const result = await response.json();
    
    const tbody = document.querySelector('#commentsTable tbody');
    tbody.innerHTML = '';
    if(result.data.length === 0) {
        tbody.innerHTML = '<tr><td colspan="7" class="text-center">Chưa có bình luận nào</td></tr>';
        document.getElementById('pagination').innerHTML = '';
        return;
    }
    result.data.forEach(item => {
        let statusBadge = item.status == 1 
            ? `<span class="badge bg-success text-white">Đã duyệt</span>` 
            : `<span class="badge bg-warning text-white">Chờ duyệt</span>`;

        // Nút bấm chuyển trạng thái
        let actionBtn = item.status == 1
            ? `<button class="btn btn-sm btn-secondary m-1" onclick="toggleStatus(${item.id}, 0)">Ẩn đi</button>`
            : `<button class="btn btn-sm btn-success m-1" onclick="toggleStatus(${item.id}, 1)">Duyệt</button>`;
        news_title = item.news_title.length > 45 ? item.news_title.substring(0, 45) + '...' : item.news_title;
        const row = `
            <tr>
                <td class="text-wrap">
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
                <td class="text-wrap fw-semibold">
                    ${item.author}
                </td>
                <td class="text-wrap text-muted">
                    ${item.content}
                </td>
                <td class="text-wrap">
                    <a href="view.html?id=${item.news_id}" class="text-decoration-none">
                        <p class="fw-semibold lh-sm m-0" style="word-wrap: break-word;">
                            ${news_title}
                        </p>
                    </a>
                </td>
                <td>
                    ${statusBadge}
                </td>
                <td style="white-space: nowrap;">
                    ${actionBtn}
                    <button class="btn btn-sm btn-danger m-1" onclick="deleteComment(${item.id})">Xóa</button>
                </td>
            </tr>
        `;
        tbody.innerHTML += row;
    });

    renderPagination(result.pagination);
}

// Hàm duyệt/ẩn bình luận
async function toggleStatus(id, newStatus) {
    const formData = new FormData();
    formData.append('id', id);
    formData.append('status', newStatus);
    console.log(formData.get('id'), formData.get('status'));
    await fetch(`${API_URL}/toggle_status.php`, {
        method: 'POST',
        body: formData
    });

    const currentPageBtn = document.querySelector('.pagination .active .page-link');
    const currentPage = currentPageBtn ? currentPageBtn.innerText : 1;
    loadComments(currentPage);
}

// Hàm xóa bình luận
async function deleteComment(id) {
    console.log("Deleting comment with ID:", id);
    if(!confirm("Bạn có chắc muốn xóa bình luận này?")) return;

    const formData = new FormData();
    formData.append('id', id);
    await fetch(`${API_URL}/delete.php`, {
        method: 'POST',
        body: formData
    });
    const currentPageBtn = document.querySelector('.pagination .active .page-link');
    const currentPage = currentPageBtn ? currentPageBtn.innerText : 1;
    loadComments(currentPage);
}

function renderPagination(pagination) {
    const container = document.getElementById('pagination');
    if (pagination.total_pages >= 1) {
        let html = `<ul class="pagination">`;
        for (let i = 1; i <= pagination.total_pages; i++) {
            const active = i === pagination.current_page ? 'active' : '';
            html += `<li class="page-item ${active}"><a class="page-link" href="#" onclick="loadComments(${i})">${i}</a></li>`;
        }
        html += `</ul>`;
        container.innerHTML = html;
    } else {
        container.innerHTML = '';
    }
}