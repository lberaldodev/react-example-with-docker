# NOME DA IMAGEM.
FROM node:14-alpine

# DIRETÓRIO NO CONTAINER (Será criado)
WORKDIR /src

# ADICIONA O PACKAGE.JSON DO PROJETO ATUAL PARA DENTRO DO CONTAINER.
COPY package.json ./

# NESSA ORDEM, O DOCKER VERIFICA SE MUDOU ALGO E SO EXECUTA SE TIVER MUDADO.
RUN npm i --silent

# ADICIONA A NODEMODULES PARA DENTRO DA PASTA SRC DO CONTAINER, 
# POIS A NODE_MODULE ESTA IGNORADO.
ADD . /src

# COMANDO PARA EXECUTAR A APP (Nāo é necessario utilizando docker-compose).
CMD ["npm", "run", "start_dev"]
