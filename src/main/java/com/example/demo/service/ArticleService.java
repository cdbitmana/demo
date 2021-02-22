package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;

@Service
public class ArticleService {

	@Autowired
	private ArticleDao articleDao;

	public List<Article> getArticlesForPrint(Map<String,Object> param) {
		return articleDao.getArticlesForPrint(param);
	}

	public void doWrite(Map<String, Object> param) {
		articleDao.doWrite(param);
		
	}

	public void doModify(Map<String, Object> param) {
		articleDao.doModify(param);
	}

	public void doDelete(Map<String, Object> param) {
		articleDao.doDelete(param);
	}
}
