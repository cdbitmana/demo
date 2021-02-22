package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.Article;
import com.example.demo.dto.ResultData;
import com.example.demo.service.ArticleService;

@Controller
public class UsrArticleController {

	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("usr/article/list")
	public String showList(@RequestParam Map<String,Object> param, Model model) {
		
		List<Article> articles = articleService.getArticlesForPrint(param);
		model.addAttribute("articles",articles);
		model.addAttribute("rs", new ResultData("S-1","성공","articles",articles));
		return "usr/article/list";
	}
	
	@RequestMapping("usr/article/write")
	public String write() {
		return "usr/article/writeForm";
	}
	
	@RequestMapping("usr/article/doWrite")
	public String doWrite(@RequestParam Map<String,Object> param, Model model) {
		articleService.doWrite(param);
		List<Article> articles = articleService.getArticlesForPrint(param);
		model.addAttribute("articles",articles);
		model.addAttribute("rs", new ResultData("S-1","성공","articles",articles));
		return "usr/article/list";
	}
	
	@RequestMapping("usr/article/modify")
	public String modify(@RequestParam Map<String,Object> param, Model model, HttpServletRequest request) {
		if (param.get("id") == null) {
			return "";
		}
		model.addAttribute("id",param.get("id"));
		return "usr/article/modifyForm";
	}
	
	@RequestMapping("usr/article/doModify")
	public String doModify(@RequestParam Map<String,Object> param, Model model, HttpServletRequest request) {
		
		articleService.doModify(param);
		
		return "usr/article/modifyForm";
	}
	
	@RequestMapping("usr/article/delete")
	public String doDelete(@RequestParam Map<String,Object> param) {
		articleService.doDelete(param);
		return "";
	}
}
