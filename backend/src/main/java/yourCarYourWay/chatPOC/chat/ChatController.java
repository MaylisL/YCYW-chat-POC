package yourCarYourWay.chatPOC.chat;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class ChatController {

    @MessageMapping("/chat.send")
    @SendTo("/topic/chat")
    public ChatMessage sendMessage(ChatMessage message) {
        message.setSender(HtmlUtils.htmlEscape(message.getSender()));
        message.setContent(HtmlUtils.htmlEscape(message.getContent()));
        return message;
    }
}
