package com.example.model;

public class Category {
	private int categoryid;
	private String categoryName;
	private String categorypic;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCategoryId() {
		return categoryid;
	}
	public void setCategoryId(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryPic() {
		return categorypic;
	}
	public void setCategoryPic(String categorypic) {
		this.categorypic = categorypic;
	}
	@Override
	public String toString() {
		return "Category [categoryid=" + categoryid + ", categoryName=" + categoryName + ", categorypic=" + categorypic
				+ "]";
	}
	
	
	
	
	

}
