IMAGE_NAME = vue_base
CONTAINER_NAME = Dockerfile.dev
PORT = 8080

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -it -p $(PORT):8080 -v $(shell pwd):/app --name $(CONTAINER_NAME) $(IMAGE_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) sh

serve:
	docker exec -it $(CONTAINER_NAME) npm run serve

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

clean:
	docker system prune -f
