package com.archives_soft_design.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;

@Entity
public class Article {

	@Id
	@GeneratedValue
	private int id;
	private String title;
	private String author;
	private String publicurl;
	private LocalDate articledate;
	private String accesscategory;
	private String freeviewexpiry;
	private String description;
	@Lob
    private byte[] featuredimage;
	@Lob
    private byte[] pdf_image;
	
	private LocalDateTime createdon;
	private String createdby;
	private LocalDateTime updatedon;
	private String updatedby;
	private String preference;
	private String status;
	private String published_on_connect;
	

	public String getPreference() {
		return preference;
	}
	public void setPreference(String preference) {
		this.preference = preference;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPublished_on_connect() {
		return published_on_connect;
	}
	public void setPublished_on_connect(String published_on_connect) {
		this.published_on_connect = published_on_connect;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublicurl() {
		return publicurl;
	}
	public void setPublicurl(String publicurl) {
		this.publicurl = publicurl;
	}
	public LocalDate getArticledate() {
		return articledate;
	}
	public void setArticledate(LocalDate articledate) {
		this.articledate = articledate;
	}
	public String getAccesscategory() {
		return accesscategory;
	}
	public void setAccesscategory(String accesscategory) {
		this.accesscategory = accesscategory;
	}
	public String getFreeviewexpiry() {
		return freeviewexpiry;
	}
	public void setFreeviewexpiry(String freeviewexpiry) {
		this.freeviewexpiry = freeviewexpiry;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public byte[] getFeaturedimage() {
		return featuredimage;
	}
	public void setFeaturedimage(byte[] featuredimage) {
		this.featuredimage = featuredimage;
	}
	public byte[] getPdf_image() {
		return pdf_image;
	}
	public void setPdf_image(byte[] pdf_image) {
		this.pdf_image = pdf_image;
	}
	public LocalDateTime getCreatedon() {
		return createdon;
	}
	public void setCreatedon(LocalDateTime createdon) {
		this.createdon = createdon;
	}
	public String getCreatedby() {
		return createdby;
	}
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	public LocalDateTime getUpdatedon() {
		return updatedon;
	}
	public void setUpdatedon(LocalDateTime updatedon) {
		this.updatedon = updatedon;
	}
	public String getUpdatedby() {
		return updatedby;
	}
	public void setUpdatedby(String updatedby) {
		this.updatedby = updatedby;
	}
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}


}
