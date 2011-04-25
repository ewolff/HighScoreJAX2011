package com.ewolff.highscore.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ewolff.highscore.domain.Email;
import com.ewolff.highscore.domain.Player;

//@Component("eMailServiceImpl")
public class EMailServiceImpl implements EMailService {

	@Override
	@Transactional
	public void sendEMail(String subject, String body) {
		List<Player> players = Player.findPlayersWithHighscore().getResultList();
		for (Player player:players) {
			Email eMail = new Email();
			eMail.setRecipient(player.getEmail());
			eMail.setSubject(subject);
			eMail.setBody(body);
			eMail.persist();
		}
	}

}
