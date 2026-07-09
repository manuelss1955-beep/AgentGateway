FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        git \
        jq \
        bash && \
    rm -rf /var/lib/apt/lists/*

# Instalar Agent Gateway
RUN curl -sL https://agentgateway.dev/install | bash

# Añadir el directorio de binarios al PATH (ajusta si el instalador usa otra ruta)
ENV PATH="/root/.local/bin:${PATH}"

# Comando por defecto
CMD ["/bin/bash"]
