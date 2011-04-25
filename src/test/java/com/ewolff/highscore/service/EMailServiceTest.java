package com.ewolff.highscore.service;

import java.util.Date;

import junit.framework.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ewolff.highscore.domain.Email;
import com.ewolff.highscore.domain.HighScore;
import com.ewolff.highscore.domain.Player;
import com.ewolff.highscore.service.EMailService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/META-INF/spring/applicationContext.xml")
@Transactional
public class EMailServiceTest {

	@Autowired
	private EMailService emailService;
	
	@Test
	public void testEMailSendingAgain() {
		testEMailSending();
	}
	
	@Test
	public void testEMailSending() {
		Player playerWithHighscore = new Player();
		playerWithHighscore.setEmail("eberhard.wolff@gmail.com");
		playerWithHighscore.setFirstname("Eberhard");
		playerWithHighscore.setName("Wolff");
		playerWithHighscore.persist();
		playerWithHighscore.flush();
		
		HighScore highScore = new HighScore();
		highScore.setDateAt(new Date());
		highScore.setPlayer(playerWithHighscore);
		highScore.setScore(42);
		highScore.persist();
		highScore.flush();
		
		Player playerWithoutHighscore = new Player();
		playerWithoutHighscore.setEmail("rjohnson@vmware.com");
		playerWithoutHighscore.setFirstname("Rod");
		playerWithoutHighscore.setName("Johnson");
		playerWithoutHighscore.persist();
		playerWithoutHighscore.flush();
		
		Assert.assertEquals(1, HighScore.countHighScores());
		Assert.assertEquals(1, Player.findPlayersWithHighscore().getResultList().size());
		
		Assert.assertEquals(0L, Email.countEmails());
		
		emailService.sendEMail("Congrats on your score!","We thought we would congragulate you to...");
		
		Assert.assertEquals(1L, Email.countEmails());
	}
	
}
