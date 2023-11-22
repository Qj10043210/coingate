package com.ajar.coingate.client;

import java.math.BigDecimal;
import java.util.Date;


public class ClientLogDataVO {

	
	
	    private Integer tradeType;
	    private String currency;
	    private BigDecimal purchasePrice;
	    private BigDecimal noOfTrade;
	    private BigDecimal tradeAmount;
	    private Date tradeTime;
	    private BigDecimal totalTradeAmount;

	    // Getters and setters for the new fields
	    public Integer getTradeType() {
	        return tradeType;
	    }

	    public void setTradeType(Integer tradeType) {
	        this.tradeType = tradeType;
	    }

	    public String getCurrency() {
	        return currency;
	    }

	    public void setCurrency(String currency) {
	        this.currency = currency;
	    }

	    public BigDecimal getPurchasePrice() {
	        return purchasePrice;
	    }

	    public void setPurchasePrice(BigDecimal purchasePrice) {
	        this.purchasePrice = purchasePrice;
	    }

	    public BigDecimal getNoOfTrade() {
	        return noOfTrade;
	    }

	    public void setNoOfTrade(BigDecimal noOfTrade) {
	        this.noOfTrade = noOfTrade;
	    }

	    public BigDecimal getTradeAmount() {
	        return tradeAmount;
	    }

	    public void setTradeAmount(BigDecimal tradeAmount) {
	        this.tradeAmount = tradeAmount;
	    }

	    public Date getTradeTime() {
	        return tradeTime;
	    }

	    public void setTradeTime(Date tradeTime) {
	        this.tradeTime = tradeTime;
	    }

	    public BigDecimal getTotalTradeAmount() {
	        return totalTradeAmount;
	    }

	    public void setTotalTradeAmount(BigDecimal totalTradeAmount) {
	        this.totalTradeAmount = totalTradeAmount;
	    }
	}
	
	

