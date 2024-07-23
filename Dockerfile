# Utiliza uma imagem base oficial do Node.js
FROM node:20

# Instala o PostgreSQL
RUN apt-get update && \
    apt-get install -y postgresql postgresql-contrib && \
    rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho no contêiner
WORKDIR /usr/src/app

# Copia os arquivos de package.json e package-lock.json
COPY package*.json ./

# Instala as dependências do Node.js
RUN npm install

# Copia o restante do código da aplicação
COPY . .

# Copia o dump para o container
COPY FIAP.sql /docker-entrypoint-initdb.d/

# Define a variável de ambiente com o nome do banco de dados
ENV POSTGRES_DB=FIAP

# Porta que a aplicação vai expor
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "bin/www"]

# Iniciar PostgreSQL e a aplicação Node.js
#CMD service postgresql start && npm start
#Teste
