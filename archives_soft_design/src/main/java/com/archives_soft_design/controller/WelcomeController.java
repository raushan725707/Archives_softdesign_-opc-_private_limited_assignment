package com.archives_soft_design.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;


import com.archives_soft_design.entity.Article;
import com.archives_soft_design.repository.ArticleRepository;

@Controller
public class WelcomeController {
	
	  Logger logger = LoggerFactory.getLogger(WelcomeController.class); 
	@Autowired
	ArticleRepository articleRepository;
 @Value("${spring.mail.username}") private String sender; 
	 @Autowired
	 JavaMailSender javaMailSender;
	
	@GetMapping("/")
	public ModelAndView getAllStudents() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	@GetMapping("/addarticle")
	public ModelAndView addArticle() {
		logger.info("addArticle jsp page loading");
		ModelAndView mav = new ModelAndView("addarticle");
		return mav;
	}
	
	
	@PostMapping("/save-article")
	public String saveArticle(@ModelAttribute Article article,Model modal) {
		
		logger.info("save article controller implementation start");

		SimpleMailMessage mailMessage = new SimpleMailMessage();
		logger.info("email service start");

		mailMessage.setFrom(sender);

		mailMessage.setTo("raushanmth98@gmail.com");

		mailMessage.setSubject("New Article Created");

		String messageText = "Dear User,\n\n";
		messageText += "We are delighted to inform you that a new article has been created on our platform. ";
		messageText += "Please log in to view the latest content.\n\n";
		messageText += "Thank you for your contribution!\n\n";
		messageText += "Best regards,\nArchives softdesign (opc) private limited";

		mailMessage.setText(messageText);

		javaMailSender.send(mailMessage);
logger.info("Email sent successfullt");
		
		
		
		
		
		article.setPreference("");
		article.setStatus("Active");
		article.setPublished_on_connect("Published");
		article.setUpdatedby("testUser@gmail.com");
		article.setUpdatedon(LocalDateTime.now());
		article.setCreatedon(LocalDateTime.now());
		article.setCreatedby("testuser@gmail.com");
		articleRepository.save(article);
		logger.info("Article created succussfully");
		modal.addAttribute("alertType", "success");
		return "redirect:/listarticle";
	}
	@PostMapping("/update-article")

	public String updateArticle(@ModelAttribute Article article,Model modal) {
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
logger.info("update article controller started,Email service started");
		mailMessage.setFrom(sender);

		mailMessage.setTo("raushanmth98@gmail.com");

		mailMessage.setSubject("Article is Updated");

		String messageText = "Dear User,\n\n";
		messageText += "We are delighted to inform you that a  article"+article.getId()+" has been Updated on our platform. ";
		messageText += "Please log in to view the latest content.\n\n";
		messageText += "Thank you for your contribution!\n\n";
		messageText += "Best regards,\nArchives softdesign (opc) private limited";

		mailMessage.setText(messageText);
logger.info("email sent successfully");
		javaMailSender.send(mailMessage);
		

		article.setUpdatedby("testUser@gmail.com");
		article.setUpdatedon(LocalDateTime.now());
		article.setCreatedon(LocalDateTime.now());
		article.setCreatedby("testuser@gmail.com");
		articleRepository.save(article);
		logger.info("Article updated ");
		modal.addAttribute("alertType", "success");
		return "redirect:/listarticle";
	}
	
	@ResponseBody
	@DeleteMapping("/delete-article/{articleId}")
	public ResponseEntity<?> deleteArticle1(@PathVariable("articleId") int articleId) {
		System.out.println("article id"+articleId);
	    // Perform deletion of the article with the given ID
	    articleRepository.deleteById(articleId);
		System.out.print("deleted");

	    return ResponseEntity.ok().build();
	}
	
	
	
	
	
	
	
	
	// Controller code
	@PostMapping("/delete-article")
	public String deleteArticle(@RequestParam("articleId") int articleId) {
	    // Perform deletion of the article with the given ID
	    articleRepository.deleteById(articleId);
	    return "redirect:/listarticle"; // Redirect to the article list page
	}


	
	@GetMapping("/edit")
	public String editArticle(@RequestParam("articleId") int articleId, Model model) {
	    Article article = articleRepository.findById(articleId).orElse(null);
	    model.addAttribute("article", article);
	    return "edit";

	}
	
	@GetMapping("/listarticle")
	public String getAllArticle(Model model,@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) {
	  
	    
	    
	    Pageable pageable = PageRequest.of(page, size);
	    
	    // Retrieve a page of articles using pagination
	    Page<Article> articlePage = articleRepository.findAll(pageable);

	    // Extract list of articles from the page
	    List<Article> articles = articlePage.getContent();
	    
	    // Add articles and pagination information to the model
	    model.addAttribute("articles", articles);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", articlePage.getTotalPages());
	    
	    
	    return "listarticle"; 
	}

	@GetMapping("/viewui")
	public String viewArticle(@RequestParam("articleId") int articleId, Model model) {
	    Article article = articleRepository.findById(articleId).orElse(null);
	    
	    if (article == null) {
	        return "No Article Found";
	    }
	    
	    model.addAttribute("article", article);
	    
	    return "viewui";
	}
}
