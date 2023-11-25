IMAGE_NAME=arjunksozone/todo-be

build-image:
	docker build -t $(IMAGE_NAME) .

run-app: build-image
	docker run -p 8080:8080 $(IMAGE_NAME)

test:
	go test -v ./... -coverprofile cover.out && go tool cover -html=cover.out