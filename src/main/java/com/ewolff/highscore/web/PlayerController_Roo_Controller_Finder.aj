// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ewolff.highscore.web;

import java.lang.String;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

privileged aspect PlayerController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByName", "form" }, method = RequestMethod.GET)
    public String PlayerController.findPlayersByNameForm(Model uiModel) {
        return "players/findPlayersByName";
    }
    
}