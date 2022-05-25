package net.aird.FAQboard.model;

import java.util.Date;

public class Question {
	private int id;
	private Type type;
	private String title;
	private String content;
	private String author;
	private Date date;
	private int count;
	
	public Question() {
		
	}
	
	public Question(Type type, String title, String content, String author, Date date, int count) {
		this.type = type;
		this.title = title;
		this.content = content;
		this.author = author;
		this.date = date;
		this.count = count;
	}
	
	public void incrementCount() {
		this.count++;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	
}