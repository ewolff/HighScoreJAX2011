package com.ewolff.highscore.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ewolff.highscore.service.EMailService;

@RequestMapping("/sendemail/**")
@Controller
public class SendEMail {

	@Autowired
	private EMailService eMailService;

	public void seteMailService(EMailService eMailService) {
		this.eMailService = eMailService;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String post(@RequestParam("body") String body,
			@RequestParam("subject") String subject) {
		eMailService.sendEMail(subject, body);
		return "sendemail/index";
	}

	@RequestMapping
	public String index() {
		return "sendemail/form";
	}
}
