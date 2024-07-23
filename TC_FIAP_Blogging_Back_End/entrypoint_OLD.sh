#!/bin/bash
# Script de inicialização para garantir que o PostgreSQL está rodando

# Inicia o serviço do PostgreSQL
service postgresql start

# Espera alguns segundos para garantir que o PostgreSQL está rodando
sleep 10

# Executa o comando original para iniciar a aplicação Node.js
exec "$@"
