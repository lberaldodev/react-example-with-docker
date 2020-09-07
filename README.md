## Info.

Projeto iniciado utilizando Create React App.

Há 2 arquivos docker:

- Dockerfile: Inclui o script docker para buildar a imagem do nodejs e executar o ReactJS.
Estamos trabalhando com 2 volumes, onde 1 volume fica responsavel pelo códigofonte e outro responsavel apenas pelas libs. Assim, nao copiamos a node_modules pra dentro.

- docker-compose.yml: Executa o dockerfile como script de build.
Estamos trabalhando com 2 volumes, onde 1 volume fica responsavel pelo códigofonte e outro responsavel apenas pelas libs. Assim, nao copiamos a node_modules pra dentro.

## Docker Scripts 
Criar e executar o container utilizando a imagem node alpine e executar em background.
```sh 
docker-compose up -d --build
```

Listar todos os containers em execução.
```sh 
docker ps -a
```

Após criar o container, iniciar ele.
```sh 
docker start <id>
```

Remover todos containers em execução.
```sh
docker-compose down
```

## Dockerfile Scripts

Criar um volume chamado nodemodules, que será utilizado apenas para libs.
```sh 
docker volume create --name nodemodules
```

Criar uma imagem docker chamada app.
```sh
docker build -t app
```

Executar a imagem criada anteriormente (app).
```sh 
docker run --name app -it -p 3000:3000 -v `pwd`:/src -v nodemodules:/src/node_modules app
```
- --name: seta a tag da imagem para app.

- -p 3000:3000: exporta a porta 3000 de dentro do container para acesso externo também na 3000.

- -v `pwd`:/src: cria um volume para que tudo que tiver dentro do diretorio do projeto vai ser refletido dentro do container na pasta src.

- -v nodemodules:/src/node_modules: define um volume exclusivo para libs.

### `yarn start`

- Inicia o projeto React.

### `yarn test`

- Executa os testes.

### `yarn build`

- Gera o build de producao.