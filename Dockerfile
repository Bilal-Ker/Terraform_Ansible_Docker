ARG TERRAFORM_VERSION=latest

FROM hashicorp/terraform:${TERRAFORM_VERSION}

# Instalar los paquetes necesarios
RUN apk add --no-cache jq bash shadow nano ansible && \
    chsh root --shell /bin/bash && \
    apk del shadow && \
    touch ~/.bashrc && \
    terraform -install-autocomplete

# Copiar el script para crear la clave SSH
COPY generar_clave.sh /usr/local/bin/generar_clave.sh
RUN chmod +x /usr/local/bin/generar_clave.sh

# Mostrar el usuario y el host en el prompt
ENV PS1='\u@\h:\w\$\040'

# Variables de entorno de Ansible
ENV ANSIBLE_HOST_KEY_CHECKING=false
ENV ANSIBLE_PYTHON_INTERPRETER=auto_silent

# Eliminar el entrypoint original
ENTRYPOINT []

CMD ["/bin/bash"]