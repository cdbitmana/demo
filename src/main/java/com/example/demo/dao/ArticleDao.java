package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {

	List<Article> getArticlesForPrint(@Param(value="param") Map<String, Object> param);

	void doWrite(@Param(value="param") Map<String, Object> param);

	void doModify(@Param(value="param") Map<String, Object> param);

	void doDelete(@Param(value="param") Map<String, Object> param);

}
