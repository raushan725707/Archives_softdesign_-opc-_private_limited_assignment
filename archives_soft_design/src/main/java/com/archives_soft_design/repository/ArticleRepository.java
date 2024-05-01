package com.archives_soft_design.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.archives_soft_design.entity.Article;

public interface ArticleRepository extends JpaRepository<Article, Integer> {

}
