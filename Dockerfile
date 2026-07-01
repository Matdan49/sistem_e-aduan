FROM richarvey/nginx-php-fpm:latest

# Kita gunakan portal_user sebagai aplikasi utama yang akan di-run oleh Render
# Salin semua kod portal_user ke dalam server Render
COPY portal_user /var/www/html

# Tetapan environment utama Laravel
ENV WEBROOT /var/www/html/public
ENV APP_ENV production
ENV APP_DEBUG false

# Jalankan Composer untuk install dependencies di dalam folder tersebut
RUN composer install --no-dev --optimize-autoloader

# Beri kebenaran akses folder storage & cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache