package dao;

import java.util.ArrayList;				
import dto.Article;

public class ArticleRepository {
	
	private ArrayList<Article> listOfArticles=new ArrayList<Article>();
	private static ArticleRepository instance=new ArticleRepository();
	
	public static ArticleRepository getInstance() {
		return instance;
	}
	
	public ArticleRepository() {
			Article article1 = new Article("1", "4박 5일간의 영국 여행");
			article1.setWriter("허종우");
			article1.setDescription("이 글은 허종우가 2024년 1월 8일~1월 12일 약 4일 간 잉글랜드의 런던, 맨체스터를 여행한 후기입니다. 많은 사람들은 일생에 단 한번이라도 유럽 여행을 가보고 싶어합니다. 저도 그 중 한 명이었고, 저번 겨울방학에 1달 동안 유럽 국가 5개국(영국, 프랑스, 스페인, 포르투갈, 독일)에 다녀왔습니다. 5개 국 중 영국은 별로 추천하지 않습니다.");
			article1.setReleaseDate("2024/03/04");
			article1.setFilename("eye.jpg");
			
			
			
			listOfArticles.add(article1);
			
	}
	public ArrayList<Article> getAllArticles() {
		return listOfArticles;
	}
	
	public Article getArticleById(String articleId) {
		Article articleById = null;
		
		for (int i = 0; i < listOfArticles.size(); i++) {
			Article article = listOfArticles.get(i);
			if (article != null && article.getArticleId() != null && article.getArticleId().equals(articleId)) 
			{
				articleById=article;
				break;
			}
		}
		return articleById;
	}
	
	public void addArticle(Article article) {
		listOfArticles.add(article);
	}
	
}