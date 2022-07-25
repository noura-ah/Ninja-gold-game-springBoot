package com.example.ninjagoldgame;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@Controller
public class NinjaGoldGame1Application {

	public static void main(String[] args) {
		SpringApplication.run(NinjaGoldGame1Application.class, args);
	}
	
	@RequestMapping("")
	public String index() {
		return "redirect:/gold";
	}
}
