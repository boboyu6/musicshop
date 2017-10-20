package ch14.bookshop.master;

import java.sql.Timestamp;

//bookdatabean
//aaaaasdff
//학원 컴퓨터 작업
public class ShopBookDataBean {
	private int book_id; //梨낆쓽 �벑濡앸쾲�샇
	private String book_kind; //梨낆쓽 遺꾨쪟
	private String book_title; //梨낆씠由�
	private int book_price; //梨낃�寃�
	private short book_count; //梨낆쓽 �옱怨좎닔�웾
	private String author; //���옄
	private String publishing_com; //異쒗뙋�궗
	private String publishing_date; //異쒗뙋�씪
	private String book_image; //梨� �씠誘몄�紐�
	private String book_content; //梨낆쓽 �궡�슜
	private byte discount_rate; //梨낆쓽 �븷�씤�쑉
	private Timestamp reg_date; //梨낆쓽 �벑濡앸궇吏�
	
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_kind() {
		return book_kind;
	}
	public void setBook_kind(String book_kind) {
		this.book_kind = book_kind;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public short getBook_count() {
		return book_count;
	}
	public void setBook_count(short book_count) {
		this.book_count = book_count;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublishing_com() {
		return publishing_com;
	}
	public void setPublishing_com(String publishing_com) {
		this.publishing_com = publishing_com;
	}
	public String getPublishing_date() {
		return publishing_date;
	}
	public void setPublishing_date(String publishing_date) {
		this.publishing_date = publishing_date;
	}
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	public String getBook_content() {
		return book_content;
	}
	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}
	public byte getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(byte discount_rate) {
		this.discount_rate = discount_rate;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
