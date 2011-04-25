package com.ewolff.highscore.web;

import com.ewolff.highscore.domain.Player;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "players", formBackingObject = Player.class)
@RequestMapping("/players")
@Controller
public class PlayerController {
}
