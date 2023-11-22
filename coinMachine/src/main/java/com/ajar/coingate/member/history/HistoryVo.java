package com.ajar.coingate.member.history;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;


public class HistoryVo {
	int id;
	String user_id;
	int trade_type;
	String currency;
	BigDecimal purchase_price;
	BigDecimal no_of_trade;
	BigDecimal trade_amount;
	Date trade_time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTrade_type() {
		return trade_type;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setTrade_type(int trade_type) {
		this.trade_type = trade_type;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public BigDecimal getPurchase_price() {
		return purchase_price;
	}
	public void setPurchase_price(BigDecimal purchase_price) {
		this.purchase_price = purchase_price;
	}
	public BigDecimal getNo_of_trade() {
		return no_of_trade;
	}
	public void setNo_of_trade(BigDecimal no_of_trade) {
		this.no_of_trade = no_of_trade;
	}
	public BigDecimal getTrade_amount() {
		return trade_amount;
	}
	public void setTrade_amount(BigDecimal trade_amount) {
		this.trade_amount = trade_amount;
	}
	public Date getTrade_time() {
		return trade_time;
	}
	public void setTrade_time(Date trade_time) {
		this.trade_time = trade_time;
	}
	
}
