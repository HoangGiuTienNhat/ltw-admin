# Tabler Admin - Product Management (added)

This folder contains additional admin pages integrated with the Tabler template for product and order management.

- `index.html` — Product list and search (uses `../../../project-web/public/api/products.php`).
- `product.html` — Create / Edit product page.
- `orders.html` — Orders list and status update (uses `../../../project-web/public/api/orders.php`).
- `js/admin.js` — Simple JavaScript to call the APIs and render UI.

Notes:
- I did not modify any existing Tabler files. New files are under `dashboard/admin/`.
- APIs are added under `project-web/public/api/`.
- Products API is file-based and operates on `project-web/data/products.json`.
- Orders API reads/writes to the MySQL database via `config/database.php`.

How to use:
1. Start XAMPP and ensure `LTW-xampp` is served (e.g. http://localhost/LTW-xampp/...).
2. Open the admin page: `tabler-1.4.0-hienthuc/dashboard/admin/index.html` (via server URL).
3. Add/Edit/Delete products and manage order status.
