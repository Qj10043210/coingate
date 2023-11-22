package com.ajar.coingate.coindata;
import java.math.BigDecimal;
import java.util.Date;


public class askbidAPIVO {
	private String currency;
    private BigDecimal asks_Price;
    private BigDecimal asks_Quant;
    private BigDecimal bids_Price;
    private BigDecimal bids_Quant;
    private Date created_At;
    
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public BigDecimal getAsks_Price() {
		return asks_Price;
	}
	public void setAsks_Price(BigDecimal asks_Price) {
		this.asks_Price = asks_Price;
	}
	public BigDecimal getAsks_Quant() {
		return asks_Quant;
	}
	public void setAsks_Quant(BigDecimal asks_Quant) {
		this.asks_Quant = asks_Quant;
	}
	public BigDecimal getBids_Price() {
		return bids_Price;
	}
	public void setBids_Price(BigDecimal bids_Price) {
		this.bids_Price = bids_Price;
	}
	public BigDecimal getBids_Quant() {
		return bids_Quant;
	}
	public void setBids_Quant(BigDecimal bids_Quant) {
		this.bids_Quant = bids_Quant;
	}
	public Date getCreated_At() {
		return created_At;
	}
	public void setCreated_At(Date created_At) {
		this.created_At = created_At;
	}

	
}
