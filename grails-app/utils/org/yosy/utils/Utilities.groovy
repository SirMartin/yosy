package org.yosy.utils

import javax.mail.internet.MimeMessage
import org.springframework.mail.*
import org.springframework.mail.javamail.MimeMessageHelper

public class Utilities {

	//El string que recibe lo pasa a MD5. Cómodo, ¿que no?
	def static String codMD5(String st) {
		def md5 = java.security.MessageDigest.getInstance("MD5")
		st  = md5.digest(st.getBytes()).toString()
		md5.update(st.getBytes(), 0, st.length());
		return new BigInteger(1, md5.digest()).toString(16)
	}

	//Envío de correos
	def MailSender mailSender
	def SimpleMailMessage templateMessage
	def sendEmail(to,body,subject,html) {
		if(!html)
		{
			def msg = new SimpleMailMessage(templateMessage)
			msg.subject = subject
			msg.text = body
			msg.to = [to]
			mailSender.send(msg)
		}
		else
		{
			MimeMessage message = mailSender.createMimeMessage();
			
			// true = multipart
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setTo([to]);
			// true = html
			helper.setText(body, true);
			helper.setSubject(subject);
			mailSender.send(message);			
		}
	}

}
