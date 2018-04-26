.PHONY: all install

all:
	docker build -t doh-frontend frontend
	docker build -t doh-backend backend

install:
	install -Dm0644 *.service /etc/systemd/system/
	systemctl daemon-reload || true
	systemctl restart doh-frontend doh-backend || true

uninstall:
	systemctl stop doh-frontend doh-backend || true
	docker rm -f doh-frontend doh-backend || true
	docker rmi -f doh-frontend doh-backend || true
