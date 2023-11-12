package com.liivtogether.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import com.liivtogether.dto.Msg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@RestController
public class NotificationController {
	 @Autowired
	    SimpMessagingTemplate template;


	    @MessageMapping("/receiveto") // 특정 Id에게 전송
	    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
	        log.info(msg.toString()+"-------------------------테스트");

	        String target = msg.getReceiveid();
	        template.convertAndSend("/send/to/" + target, msg);
	    }

	    @MessageMapping("/alarmto") // 특정 Id에게 전송
	    public void alarmto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
	        log.info(msg.toString() + "---------------마커여기");
	        String target = msg.getReceiveid();
	        log.info(target+"target");
	        template.convertAndSend("/alarm/to/" + target, msg);
	    }

	    @MessageMapping("/deliveryalarm") // 특정 Id에게 전송
	    public void deliveryalarm(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
	        log.info(msg.toString() + "---------------블라알람여기");
	        String target = msg.getReceiveid();
	        template.convertAndSend("/deliveryalarm/to/" + target, msg);
	    }

	    @MessageMapping("/receiveall") // 모두에게 전송
	    public void receiveall(Msg msg, SimpMessageHeaderAccessor headerAccessor) {

	        template.convertAndSend("/send", msg);
	    }
}