.PHONY: build

docker-build:
	docker build -t bulletin-board:latest .

docker-run:
	docker run -d -p 8080:8080 --name bulletin-board

docker-stop:
	docker stop bulletin-board

setup-roles:
	ansible-galaxy install -r requirements.yml --force

deploy:
	ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass
