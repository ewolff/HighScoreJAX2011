package com.ewolff.highscore.web;

import com.ewolff.highscore.domain.Email;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "emails", formBackingObject = Email.class)
@RequestMapping("/emails")
@Controller
public class EMailController {
}
