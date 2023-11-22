package com.ajar.coingate.coindata;
import java.math.BigDecimal;
import java.util.Date;
public class mainAPIVO {
	private String currency;
    private BigDecimal openingPrice;
    private BigDecimal closingPrice;
    private BigDecimal minPrice;
    private BigDecimal maxPrice;
    private BigDecimal unitsTraded;
    private BigDecimal accTradeValue;
    private BigDecimal prevClosingPrice;
    private BigDecimal unitsTraded24H;
    private BigDecimal accTradeValue24H;
    private BigDecimal fluctuate24H;
    private BigDecimal fluctuateRate24H;
    private Long date;
    private Date createdAt;
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public BigDecimal getOpeningPrice() {
		return openingPrice;
	}
	public void setOpeningPrice(BigDecimal openingPrice) {
		this.openingPrice = openingPrice;
	}
	public BigDecimal getClosingPrice() {
		return closingPrice;
	}
	public void setClosingPrice(BigDecimal closingPrice) {
		this.closingPrice = closingPrice;
	}
	public BigDecimal getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(BigDecimal minPrice) {
		this.minPrice = minPrice;
	}
	public BigDecimal getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(BigDecimal maxPrice) {
		this.maxPrice = maxPrice;
	}
	public BigDecimal getUnitsTraded() {
		return unitsTraded;
	}
	public void setUnitsTraded(BigDecimal unitsTraded) {
		this.unitsTraded = unitsTraded;
	}
	public BigDecimal getAccTradeValue() {
		return accTradeValue;
	}
	public void setAccTradeValue(BigDecimal accTradeValue) {
		this.accTradeValue = accTradeValue;
	}
	public BigDecimal getPrevClosingPrice() {
		return prevClosingPrice;
	}
	public void setPrevClosingPrice(BigDecimal prevClosingPrice) {
		this.prevClosingPrice = prevClosingPrice;
	}
	public BigDecimal getUnitsTraded24H() {
		return unitsTraded24H;
	}
	public void setUnitsTraded24H(BigDecimal unitsTraded24H) {
		this.unitsTraded24H = unitsTraded24H;
	}
	public BigDecimal getAccTradeValue24H() {
		return accTradeValue24H;
	}
	public void setAccTradeValue24H(BigDecimal accTradeValue24H) {
		this.accTradeValue24H = accTradeValue24H;
	}
	public BigDecimal getFluctuate24H() {
		return fluctuate24H;
	}
	public void setFluctuate24H(BigDecimal fluctuate24h) {
		fluctuate24H = fluctuate24h;
	}
	public BigDecimal getFluctuateRate24H() {
		return fluctuateRate24H;
	}
	public void setFluctuateRate24H(BigDecimal fluctuateRate24H) {
		this.fluctuateRate24H = fluctuateRate24H;
	}
	public Long getDate() {
		return date;
	}
	public void setDate(Long date) {
		this.date = date;
	}
    
    
}
