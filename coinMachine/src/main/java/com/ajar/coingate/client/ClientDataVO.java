package com.ajar.coingate.client;
import java.math.BigDecimal;
import java.util.Date;
public class ClientDataVO {
	private Integer id;
    private String userId;
    private String userPwd;
    private String userEmail;
    private Integer userLevel;
    private BigDecimal userBalance;
    private Integer userPlayableTime;
    private Date userLastJoinedTime;
    private Integer userGameON;
    public Integer getUserGameON() {
		return userGameON;
	}
	public void setUserGameON(Integer userGameON) {
		this.userGameON = userGameON;
	}
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
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Integer getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}
	public BigDecimal getUserBalance() {
		return userBalance;
	}
	public void setUserBalance(BigDecimal userBalance) {
		this.userBalance = userBalance;
	}
	public Integer getUserPlayableTime() {
		return userPlayableTime;
	}
	public void setUserPlayableTime(Integer userPlayableTime) {
		this.userPlayableTime = userPlayableTime;
	}
	public Date getUserLastJoinedTime() {
		return userLastJoinedTime;
	}
	public void setUserLastJoinedTime(Date userLastJoinedTime) {
		this.userLastJoinedTime = userLastJoinedTime;
	}
	

}
