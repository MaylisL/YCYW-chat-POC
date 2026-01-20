import { Injectable } from '@angular/core';
import { Client, Message } from '@stomp/stompjs';
import { ChatMessage } from '../models/chat-message';
import SockJS from 'sockjs-client';

@Injectable({
  providedIn: 'root'
})
export class WebSocketService {

  private client: Client;
  messages: ChatMessage[] = [];

  constructor() {
    this.client = new Client({
      webSocketFactory: () => new SockJS('http://localhost:8080/chat')
    });
  }

  connect(): void {
    this.client.onConnect = () => {
      this.client.subscribe('/topic/chat', (message: Message) => {
        const chatMessage: ChatMessage = JSON.parse(message.body);
        this.messages.push(chatMessage);
      });
    };
    this.client.activate();
  }

  sendMessage(message: ChatMessage): void {
    this.client.publish({
      destination: '/app/chat.send',
      body: JSON.stringify(message)
    });
  }

  disconnect(): void {
    if (this.client.active) {
      this.client.deactivate();
      this.messages = [];
    }
  }
}
