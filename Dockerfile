# Use a imagem oficial do Node.js como base
FROM node:18-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

# Copie o arquivo package.json e package-lock.json (se existir)
COPY package*.json yarn.lock ./

# Instale as dependências
RUN yarn install

# Copie o código-fonte para o diretório de trabalho
COPY . .

# Exponha a porta em que o aplicativo será executado
EXPOSE 3000

# Comando padrão para executar o aplicativo quando o contêiner for iniciado
CMD ["npm", "start"]
