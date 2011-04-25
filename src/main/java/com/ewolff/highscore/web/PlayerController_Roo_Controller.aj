// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ewolff.highscore.web;

import com.ewolff.highscore.domain.Player;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.Object;
import java.lang.String;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PlayerController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PlayerController.create(@Valid Player player, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("player", player);
            return "players/create";
        }
        player.persist();
        return "redirect:/players/" + encodeUrlPathSegment(player.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PlayerController.createForm(Model model) {
        model.addAttribute("player", new Player());
        return "players/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PlayerController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("player", Player.findPlayer(id));
        model.addAttribute("itemId", id);
        return "players/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PlayerController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("players", Player.findPlayerEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Player.countPlayers() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("players", Player.findAllPlayers());
        }
        return "players/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PlayerController.update(@Valid Player player, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("player", player);
            return "players/update";
        }
        player.merge();
        return "redirect:/players/" + encodeUrlPathSegment(player.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PlayerController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("player", Player.findPlayer(id));
        return "players/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PlayerController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Player.findPlayer(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/players?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @RequestMapping(params = { "find=ByName", "form" }, method = RequestMethod.GET)
    public String PlayerController.findPlayersByNameForm(Model model) {
        return "players/findPlayersByName";
    }
    
    @RequestMapping(params = "find=ByName", method = RequestMethod.GET)
    public String PlayerController.findPlayersByName(@RequestParam("name") String name, Model model) {
        model.addAttribute("players", Player.findPlayersByName(name).getResultList());
        return "players/list";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public Object PlayerController.showJson(@PathVariable("id") Long id) {
        Player player = Player.findPlayer(id);
        if (player == null) {
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        return player.toJson();
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public String PlayerController.listJson() {
        return Player.toJsonArray(Player.findAllPlayers());
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PlayerController.createFromJson(@RequestBody String json) {
        Player.fromJsonToPlayer(json).persist();
        return new ResponseEntity<String>(HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> PlayerController.createFromJsonArray(@RequestBody String json) {
        for (Player player: Player.fromJsonArrayToPlayers(json)) {
            player.persist();
        }
        return new ResponseEntity<String>(HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PlayerController.updateFromJson(@RequestBody String json) {
        if (Player.fromJsonToPlayer(json).merge() == null) {
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> PlayerController.updateFromJsonArray(@RequestBody String json) {
        for (Player player: Player.fromJsonArrayToPlayers(json)) {
            if (player.merge() == null) {
                return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> PlayerController.deleteFromJson(@PathVariable("id") Long id) {
        Player player = Player.findPlayer(id);
        if (player == null) {
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        player.remove();
        return new ResponseEntity<String>(HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByName", method = RequestMethod.GET, headers = "Accept=application/json")
    public String PlayerController.jsonFindPlayersByName(@RequestParam("name") String name, Model model) {
        return Player.toJsonArray(Player.findPlayersByName(name).getResultList());
    }
    
    String PlayerController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
