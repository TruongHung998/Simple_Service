# Sử dụng image Node.js
FROM node:18.17.0

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép file package.json và package-lock.json
COPY package*.json ./

# Cài đặt các phụ thuộc
RUN yarn install

# Sao chép toàn bộ mã nguồn
COPY . .

# Build ứng dụng
RUN yarn run build

# Lệnh chạy ứng dụng
CMD ["yarn", "run", "start:prod"]