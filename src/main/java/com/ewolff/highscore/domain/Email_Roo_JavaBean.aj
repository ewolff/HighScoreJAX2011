// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ewolff.highscore.domain;

import java.lang.String;

privileged aspect Email_Roo_JavaBean {
    
    public String Email.getRecipient() {
        return this.recipient;
    }
    
    public void Email.setRecipient(String recipient) {
        this.recipient = recipient;
    }
    
    public String Email.getSubject() {
        return this.subject;
    }
    
    public void Email.setSubject(String subject) {
        this.subject = subject;
    }
    
    public String Email.getBody() {
        return this.body;
    }
    
    public void Email.setBody(String body) {
        this.body = body;
    }
    
}
