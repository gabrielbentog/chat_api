# :speech_balloon: Chat API com Rails e ActionCable

Esta é uma API de chat simples construída com Ruby on Rails, utilizando o ActionCable para comunicação em tempo real via WebSockets. O objetivo é permitir que clientes se inscrevam em canais e recebam mensagens em tempo real.

## :clipboard: Requisitos

As seguintes tecnologias foram usadas no projeto

- [Ruby (3.3.4)](https://www.ruby-lang.org/pt/)

- [Postgresql (16.2)](https://www.postgresql.org/)

## :gear: Configuração

### 1. Clone o repositório

```bash



git clone https://github.com/seu-usuario/chat-api.git



cd chat-api



```

### 2. Instale as dependências

```



bundle install



```

### 3. Configure o banco de dados

Crie e migre o banco de dados:

```bash



rails db:create db:migrate



```

### 4. Configure o Redis

O ActionCable utiliza Redis para gerenciar as conexões. Certifique-se de que o Redis esteja instalado e em execução:

```bash



redis-server



```

### 5. Execute o servidor Rails

Inicie o servidor Rails:

```bash



rails s



```

Agora, a API estará disponível em http://localhost:3000.

## :rocket: Utilização

### 1. Conectar ao WebSocket

Use uma ferramenta como wscat para se conectar ao WebSocket:

```bash



wscat -c ws://localhost:3000/cable



```

Após conectar, você verá uma mensagem de boas-vindas ({"type":"welcome"}).

### 2. Inscreva-se em um Canal

Para começar a receber mensagens, inscreva-se em um canal:

```json
{ "command": "subscribe", "identifier": "{\"channel\":\"ChatChannel\"}" }
```

### 3. Enviar Mensagens via API

Você pode enviar uma mensagem para o canal utilizando um cliente HTTP como o Postman ou curl.

Exemplo com postman:

```json
// POST http://localhost:3000/messages

{
  "message": {
    "body": "Hello World!"
  }
}
```

Essa requisição fará o ActionCable transmitir a mensagem para todos os clientes inscritos no ChatChannel.

### 4. Receber Mensagens

Após se inscrever no canal, você receberá mensagens em tempo real:

```json



< {"message":"Hello, World!"}



```
