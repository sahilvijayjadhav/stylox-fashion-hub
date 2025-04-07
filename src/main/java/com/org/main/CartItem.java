package com.org.main;

public class CartItem {
	private int pId;
	private int quantity;
	private String selectedColor;
	private String selectedSize;
	public CartItem(int pId, int quantity, String selectedColor, String selectedSize) {
		this.pId = pId;
		this.quantity = quantity;
		this.selectedColor = selectedColor;
		this.selectedSize = selectedSize;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSelectedColor() {
		return selectedColor;
	}
	public void setSelectedColor(String selectedColor) {
		this.selectedColor = selectedColor;
	}
	public String getSelectedSize() {
		return selectedSize;
	}
	public void setSelectedSize(String selectedSize) {
		this.selectedSize = selectedSize;
	}
	
	
}
