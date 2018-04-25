.PHONY: all

all:
	docker build -t doh-frontend frontend
	docker build -t doh-backend backend
	sudo install *.service /etc/systemd/system/
	sudo systemctl daemon-reload || true
