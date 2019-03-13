build:
	docker build --target jodconverter-base . -t keyintegrity/jodconverter:base
	docker build --target gui . -t keyintegrity/jodconverter:gui
	docker build --target rest . -t keyintegrity/jodconverter:rest

push:
	docker push keyintegrity/jodconverter:base
	docker push keyintegrity/jodconverter:gui
	docker push keyintegrity/jodconverter:rest

start-gui: stop
	docker run --name jodconverter-spring -m 512m --rm -p 8080:8080 keyintegrity/jodconverter:gui

start-rest: stop
	docker run --name jodconverter-rest -m 512m --rm -p 8080:8080 keyintegrity/jodconverter:rest

stop:
	docker stop --name jodconverter-rest > /dev/null 2>&1 || true
	docker stop --name jodconverter-spring > /dev/null 2>&1 || true
