import { Component } from '@angular/core';
import { WebSocketService } from '../services/web-socket.service';

@Component({
  selector: 'app-chat',
  templateUrl: './chat.component.html',
  styleUrls: ['./chat.component.css']
})
export class ChatComponent {

  chatStarted = false;
  usernameValidated = false;
  sender = '';
  content = '';

  constructor(public webSocketService: WebSocketService) {}


  startChat(): void {
    this.chatStarted = true;
  }

   validateUsername(): void {
    if (this.sender.trim()) {
      this.usernameValidated = true;
      this.webSocketService.connect();
    }
  }

   send(): void {
    if (this.content.trim()) {
      this.webSocketService.sendMessage({
        sender: this.sender,
        content: this.content
      });
      this.content = '';
    }
  }

  disconnect(): void {
    this.webSocketService.disconnect();
    this.chatStarted = false;
    this.usernameValidated = false;
    this.sender = '';
    this.content = '';
  }

}
