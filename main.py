import subprocess

def run_docker_compose():
    try:
        # Chạy lệnh Docker Compose
        result = subprocess.run(['docker-compose', 'up', '-d'], check=True, capture_output=True, text=True)
        print("Docker Compose đã chạy thành công!")
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print("Có lỗi xảy ra khi chạy Docker Compose:")
        print(e.output)
        print(e.stderr)

if __name__ == "__main__":
    run_docker_compose()
