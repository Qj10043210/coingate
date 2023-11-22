package com.ajar.coingate.client;

import java.math.BigDecimal;

public class ClientTradeVO {
	private Integer id;
    private String userId;
    private String currency;
    private BigDecimal currency_num;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public BigDecimal getCurrency_num() {
		return currency_num;
	}
	public void setCurrency_num(BigDecimal currency_num) {
		this.currency_num = currency_num;
	}
}
