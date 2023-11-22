package com.ajar.coingate.member;

import java.math.BigDecimal;
import java.util.Date;


public class PageVO {

	private int startPage; 
	private int endPage; 
	private boolean prev, next; 

	private int pageNum;
	private int amount = 10;
	private int total; 

	
	public PageVO(int pageNum, int amount, int total) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.total = total;

		// 1. endPage寃곗젙
		this.endPage = (int) Math.ceil(this.pageNum * 0.1) * 10;

		// 2. startPage寃곗젙
		this.startPage = this.endPage - 10 + 1;

		// 3. realEnd(吏꾩쭨 �걹踰덊샇) 援ы빐�꽌 endPage�쓽 媛믪쓣 �떎�떆 寃곗젙
		int realEnd = (int) Math.ceil(this.total / (double) this.amount);


		if (this.endPage > realEnd) {
			this.endPage = realEnd;
		}

		// 4. prev寃곗젙 ( startPage�쓽 踰덊샇�뒗 1, 11, 21... )
		this.prev = this.startPage > 1;

		// 5. next寃곗젙
		this.next = this.endPage < realEnd;

		// �솗�씤
		System.out.println("�떆�옉�럹�씠吏�:" + this.startPage + ", �걹�럹�씠吏�:" + this.endPage);
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
}
