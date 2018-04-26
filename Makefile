.PHONY: all install uninstall

all:
	docker rmi -f doh-frontend doh-backend || true
	docker build -t doh-frontend frontend
	docker build -t doh-backend backend

install:
	install -Dm0644 *.service /etc/systemd/system/
	systemctl daemon-reload || true
	systemctl restart doh-frontend doh-backend || true
