# Sử dụng image cơ bản từ Ubuntu
FROM ubuntu:latest

# Cập nhật các gói và cài đặt OpenSSH Server và iptables
RUN apt-get update && apt-get install -y openssh-server iptables php

# Tạo thư mục cho SSH daemon
RUN mkdir /var/run/sshd

# Thiết lập mật khẩu cho root (chỉ sử dụng cho mục đích demo, nên sử dụng phương pháp bảo mật tốt hơn trong thực tế)
RUN echo 'root:quangtx2002' | chpasswd

# Cho phép đăng nhập bằng mật khẩu
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Thay đổi cổng SSH sang 8080
RUN sed -i 's/#Port 22/Port 8080/' /etc/ssh/sshd_config

# Mở cổng 8080 cho SSH
EXPOSE 8080

# Khởi động dịch vụ SSH
CMD ["/usr/sbin/sshd", "-D"]

CMD ["bash", "-c", "php -S 0.0.0.0:8080"]
