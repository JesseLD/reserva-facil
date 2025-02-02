import { IncomingMessage } from "node:http";
import internal from "node:stream";
import WebSocket from "ws";

export const wss = new WebSocket.Server({ noServer: true });

wss.on("connection", (ws) => {
  // Escutando as mensagens do WebSocket
  ws.on("message", (message) => {
    console.log(`Received message => ${message}`);
  });

  // Enviando uma mensagem para o cliente quando ele se conectar
  ws.send("Hello! Message From Server!!");

  // Tratar erros no WebSocket
  ws.on("error", (error) => {
    console.log(`Error has occurred: ${error}`);
  });

  // Quando a conexão do WebSocket é fechada
  ws.on("close", () => {
    console.log("Client disconnected");
  });
});

// Função para tratar o upgrade de protocolo para WebSocket
export function handleUpgrade(request: IncomingMessage, socket: internal.Duplex, head: Buffer) {
  // Estabelecendo a conexão WebSocket
  wss.handleUpgrade(request, socket, head, (ws) => {
    // Emitindo a conexão para o WebSocket
    wss.emit("connection", ws, request);
  });
}
