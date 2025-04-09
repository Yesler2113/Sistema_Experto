FROM swipl:9.1.8  # Versión específica para evitar sorpresas

WORKDIR /app

# Instala dependencias primero (caché eficiente)
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copia el archivo fuente
COPY server.pl .

# Verifica que los módulos necesarios estén disponibles
RUN swipl -g "use_module(library(http/thread_httpd)), \
              use_module(library(http/http_dispatch)), \
              use_module(library(http/http_json)), \
              use_module(library(http/http_header))), \
              halt" \
    || { echo "Error: Falta algún módulo HTTP"; exit 1; }

EXPOSE 4000

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:4000/ || exit 1

CMD ["swipl", "-g", "start_server(4000), wait_forever", "server.pl"]
