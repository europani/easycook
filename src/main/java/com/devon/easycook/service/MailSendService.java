package com.devon.easycook.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.devon.easycook.util.MailUtils;

@Service("mss")
public class MailSendService {
	
	int size;
    @Resource(name = "mailSender")
    private JavaMailSenderImpl mailSender;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String id, String email) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
            .append("<a href='http://localhost:8089/easycook/member/signupCheck?email=")
            .append(email)
            .append("&id=")
            .append(id)
            .append("&authKey=")
            .append(authKey)
            .append("' target='_blenk'>이메일 인증 확인</a>")
            .toString());
            sendMail.setFrom("hp304885@gmail.com", "easycook");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
          return authKey;
    }
    
    public String sendPwdMail(String id, String email) {
        String authKey = getKey(6);

        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("비밀번호 인증번호 메일");
            sendMail.setText(new StringBuffer().append("<h1>[비밀번호 인증번호]</h1>")
            .append("<p>비밀번호 인증번호는 다음과 같습니다.</p>")
            .append("<strong>")
            .append(authKey)
            .append("</strong>")
            .toString());
            sendMail.setFrom("hp304885@gmail.com", "easycook");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
          return authKey;
    }
}
