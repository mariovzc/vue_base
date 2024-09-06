IMAGE_NAME = vue_base
PORT = 8080

build:
	docker build -t $(IMAGE_NAME) -f Dockerfile.dev .

run:
	docker run -it -p $(PORT):8080 -v $(shell pwd):/app  $(IMAGE_NAME)

shell:
	docker run -it --rm -p $(PORT):8080 -v $(shell pwd):/app  $(IMAGE_NAME)

clean:
	docker system prune -f
