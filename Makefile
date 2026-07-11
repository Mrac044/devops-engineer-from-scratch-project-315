test:
	./gradlew test

start: run

run:
	./gradlew bootRun

update-gradle:
	./gradlew wrapper --gradle-version 9.2.1

update-deps:
	./gradlew refreshVersions

install:
	./gradlew dependencies

build:
	./gradlew build

lint:
	./gradlew spotlessCheck

lint-fix:
	./gradlew spotlessApply

.PHONY: build

docker-build:
	docker build -t billboard:latest .

docker-run:
	docker run -d -p 8080:8080 --name billboard

# Остановка контейнера
docker-stop:
	docker stop billboard