// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ewolff.highscore.domain;

import com.ewolff.highscore.domain.Email;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Email_Roo_Entity {
    
    declare @type: Email: @Entity;
    
    @PersistenceContext
    transient EntityManager Email.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Email.id;
    
    @Version
    @Column(name = "version")
    private Integer Email.version;
    
    public Long Email.getId() {
        return this.id;
    }
    
    public void Email.setId(Long id) {
        this.id = id;
    }
    
    public Integer Email.getVersion() {
        return this.version;
    }
    
    public void Email.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Email.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Email.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Email attached = Email.findEmail(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Email.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Email Email.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Email merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Email.entityManager() {
        EntityManager em = new Email().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Email.countEmails() {
        return entityManager().createQuery("select count(o) from Email o", Long.class).getSingleResult();
    }
    
    public static List<Email> Email.findAllEmails() {
        return entityManager().createQuery("select o from Email o", Email.class).getResultList();
    }
    
    public static Email Email.findEmail(Long id) {
        if (id == null) return null;
        return entityManager().find(Email.class, id);
    }
    
    public static List<Email> Email.findEmailEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Email o", Email.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}