// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ewolff.highscore.web;

import com.ewolff.highscore.domain.Email;
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

privileged aspect EMailController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String EMailController.create(@Valid Email email, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("email", email);
            return "emails/create";
        }
        email.persist();
        return "redirect:/emails/" + encodeUrlPathSegment(email.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String EMailController.createForm(Model model) {
        model.addAttribute("email", new Email());
        return "emails/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String EMailController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("email", Email.findEmail(id));
        model.addAttribute("itemId", id);
        return "emails/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String EMailController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("emails", Email.findEmailEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Email.countEmails() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("emails", Email.findAllEmails());
        }
        return "emails/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String EMailController.update(@Valid Email email, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("email", email);
            return "emails/update";
        }
        email.merge();
        return "redirect:/emails/" + encodeUrlPathSegment(email.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String EMailController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("email", Email.findEmail(id));
        return "emails/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String EMailController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Email.findEmail(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/emails?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public Object EMailController.showJson(@PathVariable("id") Long id) {
        Email email = Email.findEmail(id);
        if (email == null) {
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        return email.toJson();
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public String EMailController.listJson() {
        return Email.toJsonArray(Email.findAllEmails());
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EMailController.createFromJson(@RequestBody String json) {
        Email.fromJsonToEmail(json).persist();
        return new ResponseEntity<String>(HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EMailController.createFromJsonArray(@RequestBody String json) {
        for (Email email: Email.fromJsonArrayToEmails(json)) {
            email.persist();
        }
        return new ResponseEntity<String>(HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> EMailController.updateFromJson(@RequestBody String json) {
        if (Email.fromJsonToEmail(json).merge() == null) {
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> EMailController.updateFromJsonArray(@RequestBody String json) {
        for (Email email: Email.fromJsonArrayToEmails(json)) {
            if (email.merge() == null) {
                return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> EMailController.deleteFromJson(@PathVariable("id") Long id) {
        Email email = Email.findEmail(id);
        if (email == null) {
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        email.remove();
        return new ResponseEntity<String>(HttpStatus.OK);
    }
    
    String EMailController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
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