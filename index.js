// Importando o módulo HTTP
const http = require('http');

// Criando um servidor HTTP simples
const server = http.createServer((req, res) => {
  // Definindo o cabeçalho de resposta com o tipo de conteúdo
  res.writeHead(200, {'Content-Type': 'text/plain; charset=utf-8'});

  // Enviando a resposta de volta para o cliente
  res.end('Olá, mundo! Este é um servidor HTTP simples criado com Node.js.');
});

// Definindo a porta em que o servidor vai escutar as solicitações
const porta = 8080;

// Iniciando o servidor e fazendo-o escutar na porta especificada
server.listen(porta, () => {
  console.log(`Servidor rodando em http://localhost:${porta}/`);
});
