.PHONY: all force install

all:
	docker rmi -f m13253/doh-infrastructure:{frontend,backend} || true
	docker build -t m13253/doh-infrastructure:common common
	docker build -t m13253/doh-infrastructure:frontend --no-cache frontend
	docker build -t m13253/doh-infrastructure:backend backend

force:
	docker rmi -f m13253/doh-infrastructure:{common,frontend,backend} || true
	docker build -t m13253/doh-infrastructure:common --no-cache common
	docker build -t m13253/doh-infrastructure:frontend frontend
	docker build -t m13253/doh-infrastructure:backend backend

install:
	install -Dm0644 *.service /etc/systemd/system/
	systemctl daemon-reload || true
	systemctl restart doh-frontend doh-backend || true
