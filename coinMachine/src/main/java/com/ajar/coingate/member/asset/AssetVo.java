package com.ajar.coingate.member.asset;

import java.math.BigDecimal;
import lombok.Getter;


public class AssetVo {
	int id;
	String user_id;
	String currency;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	BigDecimal currency_num;
}
