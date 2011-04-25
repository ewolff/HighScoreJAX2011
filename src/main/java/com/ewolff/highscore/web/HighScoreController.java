package com.ewolff.highscore.web;

import com.ewolff.highscore.domain.HighScore;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "highscores", formBackingObject = HighScore.class)
@RequestMapping("/highscores")
@Controller
public class HighScoreController {
}
