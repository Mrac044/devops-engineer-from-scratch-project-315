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
	docker build -t bulletin-board:latest .

docker-run:
	docker run -d -p 8080:8080 --name bulletin-board

docker-stop:
	docker stop bulletin-board