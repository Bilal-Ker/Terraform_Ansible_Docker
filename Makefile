# Makefile para terraform-ansible

help: _header
	${info }
	@echo Opciones:
	@echo ---------
	@echo build
	@echo workspace
	@echo ssh-key
	@echo clean
	@echo ---------

_header:
	@echo ----------------------
	@echo Terraform y Ansible
	@echo ----------------------

build:
	@docker compose build --pull

workspace:
	@docker compose run --rm terraform-ansible

ssh-key:
	@docker compose run --rm terraform-ansible generar_clave.sh

clean:
	@docker compose down -v --remove-orphans
