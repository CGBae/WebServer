package dto;

import java.io.Serializable;

public class Article implements Serializable {

	private static final long serialVersionUID =-4274700572038677000L;
	
	private String articleId;
	private String name;
	private String writer;
	private String description;
	private String releaseDate;
	private String filename;
	
	public Article() {	// 기본 생성자
		super();	
	}
	public Article(String articleId, String name) {	// 생성자
		this.articleId = articleId;
		this.name = name;
	}
	
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}