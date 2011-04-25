package com.ewolff.highscore.domain;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.hibernate.validator.constraints.Email;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findPlayersByName" })
@RooJson
public class Player {

    private String name;

    private String firstname;
    


    @Email
    private String email;

    public static TypedQuery<Player> findPlayersWithHighscore() {
        EntityManager em = Player.entityManager();
        return em.createQuery("SELECT DISTINCT highscore.player FROM HighScore highscore", Player.class);
    }
}
