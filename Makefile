enter:
	docker run -it dfavato/nvim:latest

build:
	docker build -t dfavato/nvim .
	docker push dfavato/nvim
