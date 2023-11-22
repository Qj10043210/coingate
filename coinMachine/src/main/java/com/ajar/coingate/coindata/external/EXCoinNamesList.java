package com.ajar.coingate.coindata.external;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.lang.Math;
import java.text.DecimalFormat;

import org.springframework.stereotype.Component;

@Component
public class EXCoinNamesList {
	private List<String> coinNameDefaultList;
    private List<Double> coinRandomZeroTwoentyList;
   
    public EXCoinNamesList() {
        coinNameDefaultList = new ArrayList<>();
        coinNameDefaultList.add("BTC");
        coinNameDefaultList.add("ETH");
        coinNameDefaultList.add("LINK");
        coinNameDefaultList.add("TRX");
        coinNameDefaultList.add("XRP");
        coinNameDefaultList.add("SOL");
        coinNameDefaultList.add("DOGE");
        coinNameDefaultList.add("MATIC");
        coinNameDefaultList.add("DOT");
        coinNameDefaultList.add("ATOM");
        coinNameDefaultList.add("BNB");
        coinNameDefaultList.add("AVAX");
        coinNameDefaultList.add("SHIB");
        coinNameDefaultList.add("ADA");
        coinNameDefaultList.add("BAL");
        coinNameDefaultList.add("BCH");
        coinNameDefaultList.add("BSV");
        coinNameDefaultList.add("AAVE");
        coinNameDefaultList.add("QTUM");
        coinNameDefaultList.add("ADP");
        coinNameDefaultList.add("AERGO");
        coinNameDefaultList.add("AMO");
        coinNameDefaultList.add("ANKR");
        coinNameDefaultList.add("ANV");
        coinNameDefaultList.add("APM");
        coinNameDefaultList.add("ARPA");
        coinNameDefaultList.add("BAT");
        coinNameDefaultList.add("BEL");
        coinNameDefaultList.add("BIOT");
        coinNameDefaultList.add("BLY");
        coinNameDefaultList.add("BOA");
        coinNameDefaultList.add("BORA");
        coinNameDefaultList.add("BTG");
        coinNameDefaultList.add("CHR");
        coinNameDefaultList.add("CKB");
        coinNameDefaultList.add("COMP");
        coinNameDefaultList.add("CON");
        coinNameDefaultList.add("COS");
        coinNameDefaultList.add("CRO");
        coinNameDefaultList.add("CTC");
        coinNameDefaultList.add("CTXC");
        coinNameDefaultList.add("DVI");
        coinNameDefaultList.add("EGG");
        coinNameDefaultList.add("EL");
        coinNameDefaultList.add("ELF");
        coinNameDefaultList.add("ENJ");
        coinNameDefaultList.add("EOS");
        coinNameDefaultList.add("EVZ");
        coinNameDefaultList.add("FIT");
        coinNameDefaultList.add("FX");
        coinNameDefaultList.add("GHX");
        coinNameDefaultList.add("GLM");
        coinNameDefaultList.add("GRT");
        coinNameDefaultList.add("HIVE");
        coinNameDefaultList.add("ICX");
        coinNameDefaultList.add("IOST");
        coinNameDefaultList.add("KNC");
        coinNameDefaultList.add("LOOM");
        coinNameDefaultList.add("LRC");
        coinNameDefaultList.add("MBL");
        coinNameDefaultList.add("MEV");
        coinNameDefaultList.add("MIX");
        coinNameDefaultList.add("MTL");
        coinNameDefaultList.add("MVC");
        coinNameDefaultList.add("MXC");
        coinNameDefaultList.add("NMR");
        coinNameDefaultList.add("OBSR");
        coinNameDefaultList.add("ORBS");
        coinNameDefaultList.add("ORC");
        coinNameDefaultList.add("POLA");
        coinNameDefaultList.add("POWR");
        coinNameDefaultList.add("QTCON");
        coinNameDefaultList.add("REN");
        coinNameDefaultList.add("RLC");
        coinNameDefaultList.add("RSR");
        coinNameDefaultList.add("SAND");
        coinNameDefaultList.add("SNT");
        coinNameDefaultList.add("SNX");
        coinNameDefaultList.add("SOFI");
        coinNameDefaultList.add("STEEM");
        coinNameDefaultList.add("STPT");
        coinNameDefaultList.add("STRAX");
        coinNameDefaultList.add("SXP");
        coinNameDefaultList.add("TFUEL");
        coinNameDefaultList.add("THETA");
        coinNameDefaultList.add("UMA");
        coinNameDefaultList.add("UNI");
        coinNameDefaultList.add("UOS");
        coinNameDefaultList.add("VALOR");
        coinNameDefaultList.add("VET");
        coinNameDefaultList.add("VRA");
        coinNameDefaultList.add("WAVES");
        coinNameDefaultList.add("WAXP");
        coinNameDefaultList.add("WOM");
        coinNameDefaultList.add("WOZX");
        coinNameDefaultList.add("XPR");
        coinNameDefaultList.add("YFI");
        coinNameDefaultList.add("ZIL");
        coinNameDefaultList.add("ZRX");
    }

    public List<String> getCoinNameDefaultList() {
        return coinNameDefaultList;
    }
    public List<Double> getRandomZeroTwoentyList(){
    	coinRandomZeroTwoentyList = new ArrayList<>();
    	DecimalFormat df = new DecimalFormat("#.####");
    	for (int i =0; i<40; i++) {
    		boolean checking = true;
    		double a = 0;
	    		while(checking) {
	    		a =  Math.random();
	    		double b = a*100;
	    			if(b>=0 && b<=20) {
	    				checking=false;
	    				}
	    		}
	    if(i<20) {coinRandomZeroTwoentyList.add(a*100);}
	    else {coinRandomZeroTwoentyList.add((a*100)*-1);}
    	}
    	coinRandomZeroTwoentyList.sort(Comparator.reverseOrder());
    	return coinRandomZeroTwoentyList; 
    }
}
