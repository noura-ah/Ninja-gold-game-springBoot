package com.example.ninjagoldgame.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("gold")
public class NinjaGoldController {
	
	@RequestMapping("")
	public String index(HttpSession session) {
		if (session.getAttribute("gold")==null) {
			session.setAttribute("gold", 0);
		}
		if((int)session.getAttribute("gold")< -100) {
			return "prison.jsp";
		}
		return "index.jsp";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String index(
			@RequestParam(value="process") String process,
			HttpSession session,
			Model model) {
		
		Integer gold = (Integer) session.getAttribute("gold");
		ArrayList<String> activities =(ArrayList<String>) session.getAttribute("activities");
		ArrayList<String> colors= (ArrayList<String>) session.getAttribute("colors");
		if (activities==null) {
			activities = new ArrayList<String>();
			colors = new ArrayList<String>();
		}
		
		
		
		Random rand = new Random();
		SimpleDateFormat sdf = new SimpleDateFormat("E', the' dd 'of ' MMM',' yyyy  h:mm a");
		String date = sdf.format(new Date());
		String activitie="";
		String color="";
		
		int num;
		if (process.equals("farm")) {
			num = rand.nextInt((20 - 10) + 1) + 10;
			gold+=num;
			activitie=String.format("You entered a farm and earned %d gold. %s",num,date);
			color="green";
		}
		else if (process.equals("cave")) {
			num=rand.nextInt((10 - 5) + 1) + 5;
			gold+=num;
			activitie=String.format("You entered a cave and earned %d gold. %s",num,date);
			color="green";
		}
		else if (process.equals("house")) {
			num = rand.nextInt((5 - 2) + 1) + 2;
			gold+=num;
			activitie=String.format("You entered a house and earned %d gold. %s",num,date);
			color="green";
		}
		else if (process.equals("spa")) {
			num = rand.nextInt((20 - 5) + 1) + 5;
			gold-=num;
			activitie=String.format("You entered a spa and loses %d gold. %s",num,date);
			color="red";
		}
		else if (process.equals("casino")) {
			num = rand.nextInt((10 - 5) + 1) + 5;
			if (rand.nextBoolean()) {
				gold+=num;
				activitie=String.format("You entered a casino and earned %d gold. %s",num,date);
				color="green";
			}
				
			else {
				gold-=num;
				activitie=String.format("You entered a casino and lost %d gold. %s",num,date);
				color="red";
			}
			
		}
		activities.add(activitie);
		colors.add(color);
		
		session.setAttribute("activities", activities);
		session.setAttribute("colors", colors);
		session.setAttribute("gold", gold);
		
		return "redirect:/gold";
	}
	
	@RequestMapping("reset")
	public String reset(HttpSession session) {
		session.removeAttribute("activities");
		session.removeAttribute("gold");
		session.removeAttribute("colors");
		return "redirect:/gold";
	}
	
	
}
