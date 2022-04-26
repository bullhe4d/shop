NS = local
REPO = dabian
VERSION ?=latest
NETWORK =localenv_localenv_default
.PHONY: build dev

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .
dev:
	docker network connect  $(NETWORK) $(REPO)
	docker rm -f $(REPO)
	docker run -itd --name $(REPO)  -p 8888:80  -e DB_HOST=mysql -e DB_PASSWORD=123qweQWE -e DB_PASSWORD=123qweQWE   $(NS)/$(REPO):$(VERSION)
	docker exec -it  $(REPO) bash


