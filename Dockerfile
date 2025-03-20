# Sử dụng image Node.js
FROM node:18.17.0

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép file package.json và package-lock.json
COPY package*.json ./

# Cài đặt các phụ thuộc
RUN yarn install

# Cài đặt PM2 toàn cục
RUN yarn global add pm2

# Sao chép toàn bộ mã nguồn
COPY . .

# Build ứng dụng
RUN yarn run build

# Lệnh chạy ứng dụng bằng PM2
CMD ["pm2-runtime", "start", "pm2.config.js"]