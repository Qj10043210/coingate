package com.ajar.coingate.coindata;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.ResponseEntity;

@Controller
@RequestMapping("/data")
public class CoindataController {
	
	//service
	@Autowired
	private CoindataService cdsv;
	
	//DAO
	@Autowired
	private mainAPIDAO madao;
	
	
	@RequestMapping(value = "/passToEach", method = {RequestMethod.POST})
	public ModelAndView passToEach(@RequestParam("hiddenInput") String currency) {
		System.out.println("wh??");
		String nextPage = "coins/Each_Deatil";
		BigDecimal currentPrice = cdsv.currentPrices(currency);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(nextPage);
		mav.addObject("Tcurrency", currency);
		mav.addObject("Tprice", currentPrice);

		return mav;
	}
	
	
	
	
	
			@RequestMapping(value = "/postMainAPI", method = RequestMethod.POST, consumes = "application/json")
			public ResponseEntity<String> postMainAPI(@RequestBody List<Object> data) {
				List<mainAPIVO> coinDataList = new ArrayList<>();
				for (Object item : data) {
					if (item instanceof List) {
						List<?> itemAsList = (List<?>) item;
						if (itemAsList.size() == 2) {
							Object currency = itemAsList.get(0);
							Object value = itemAsList.get(1);
		
							if (currency instanceof String && value instanceof List) {
								List<?> valueList = (List<?>) value;
								mainAPIVO coinData = new mainAPIVO();
								coinData.setCurrency((String) currency);
		
								for (Object subItem : valueList) {
									if (subItem instanceof List && ((List<?>) subItem).size() == 2) {
										List<?> subItemList = (List<?>) subItem;
										String key = (String) subItemList.get(0);
										String stringValue = (String) subItemList.get(1);
		
										switch (key) {
											case "opening_price":
												coinData.setOpeningPrice(new BigDecimal(stringValue));
												break;
											case "closing_price":
												coinData.setClosingPrice(new BigDecimal(stringValue));
												break;
											case "min_price":
												coinData.setMinPrice(new BigDecimal(stringValue));
												break;
											case "max_price":
												coinData.setMaxPrice(new BigDecimal(stringValue));
												break;
											case "units_traded":
												coinData.setUnitsTraded(new BigDecimal(stringValue));
												break;
											case "acc_trade_value":
												coinData.setAccTradeValue(new BigDecimal(stringValue));
												break;
											case "prev_closing_price":
												coinData.setPrevClosingPrice(new BigDecimal(stringValue));
												break;
											case "units_traded_24H":
												coinData.setUnitsTraded24H(new BigDecimal(stringValue));
												break;
											case "acc_trade_value_24H":
												coinData.setAccTradeValue24H(new BigDecimal(stringValue));
												break;
											case "fluctate_24H":
												coinData.setFluctuate24H(new BigDecimal(stringValue));
												break;
											case "fluctate_rate_24H":
												coinData.setFluctuateRate24H(new BigDecimal(stringValue));
												break;
											case "date":
												coinData.setDate(Long.parseLong(stringValue));
												break;
											default:
												
												break;
										}
									}
								}
								coinData.setCreatedAt(new Date(System.currentTimeMillis()));
								coinDataList.add(coinData);
							}
						}
					}
				}
		
				// Now, you have a List of coinDataVO objects, which you can save to the
				// database
				cdsv.saveCoinDataList(coinDataList);
		
				return ResponseEntity.ok("Data saved successfully"); // can change to void!
				// logger.info("Data saved successfully"); // Log the success message
				
			}// postMainAPI
			
			@RequestMapping(value = "/postBIDSAPI", method = RequestMethod.POST, consumes = "application/json")
			public ResponseEntity<String> handleAjaxRequestBids(@RequestBody List<Object> data) {
				List<askbidAPIVO> callingDataList = new ArrayList<>();
				Date thisTime = new Date(System.currentTimeMillis());
				for (Object item : data) {
					if (item instanceof List) {
						List<?> itemAsList = (List<?>) item;
						if (itemAsList.size() == 2) {
							Object currency = itemAsList.get(0);
							Object value = itemAsList.get(1);
							if (currency instanceof String && value instanceof List) {
								List<?> valueList = (List<?>) value; // [ [bids, [] ] ]
								List<?> valueList2 = (List<?>) valueList.get(0); // [bids, [] ]
								List<?> valueList3 = (List<?>) valueList2.get(1); // [bids, "[]" ]
								for (Object subItem : valueList3) {
									if (subItem instanceof List && ((List<?>) subItem).size() == 2) {
										List<?> subItemList = (List<?>) subItem;
										if (subItemList.get(0) instanceof String && subItemList.get(1) instanceof String) {
											String price = (String) subItemList.get(0);
											String quant = (String) subItemList.get(1);
											askbidAPIVO callingData = new askbidAPIVO();
											callingData.setCurrency((String) currency);
											callingData.setBids_Price(new BigDecimal(price));
											callingData.setBids_Quant(new BigDecimal(quant));
											callingData.setCreated_At((Date) thisTime);
											callingDataList.add(callingData);

										}
									}
								}

							}
						}
					}
				}
				cdsv.saveAsksBidsData(callingDataList, "B");
				return ResponseEntity.ok("Data saved successfully");
			}//handleAjaxRequestBids

			@RequestMapping(value = "/postASKSAPI", method = RequestMethod.POST, consumes = "application/json")
			public ResponseEntity<String> handleAjaxRequestAsks(@RequestBody List<Object> data) {
				
				List<askbidAPIVO> callingDataList = new ArrayList<>();
				Date thisTime = new Date(System.currentTimeMillis() );
				for (Object item : data) {
					if (item instanceof List) {
						List<?> itemAsList = (List<?>) item;
						if (itemAsList.size() == 2) {
							Object currency = itemAsList.get(0);
							Object value = itemAsList.get(1);
							if (currency instanceof String && value instanceof List) {
								List<?> valueList = (List<?>) value; // [ [asks, [] ] ]
								List<?> valueList2 = (List<?>) valueList.get(0); // [asks, [] ]
								List<?> valueList3 = (List<?>) valueList2.get(1); // [asks, "[]" ]
								for (Object subItem : valueList3) {				
									if (subItem instanceof List && ((List<?>) subItem).size() == 2) {
										List<?> subItemList = (List<?>) subItem;
										if (subItemList.get(0) instanceof String && subItemList.get(1) instanceof String) {
											String price = (String) subItemList.get(0);
											String quant = (String) subItemList.get(1);
											askbidAPIVO callingData = new askbidAPIVO();
											callingData.setCurrency((String) currency);
											callingData.setAsks_Price(new BigDecimal(price));
											callingData.setAsks_Quant(new BigDecimal(quant));
											callingData.setCreated_At((Date) thisTime);
											callingDataList.add(callingData);

										}
								
									}
								}

							}
						}
					}
				}
				cdsv.saveAsksBidsData(callingDataList, "A");
				return ResponseEntity.ok("Data saved successfully");
			}//handleAjaxRequestAsks
			
			@RequestMapping(value = "/GetMainApi", method = RequestMethod.GET)
			@ResponseBody
			public List<mainAPIVO> GetMainApi() {
				List<mainAPIVO> cvo = cdsv.GetMainApitoTable();
				return cvo;
			}
			
			@RequestMapping(value = "/GetMainApiEachSituation", method = {RequestMethod.GET, RequestMethod.POST})
			@ResponseBody
			public List<mainAPIVO> GetMainApiEachSituation(@RequestParam("situation") String situation, @RequestParam("situ") String situ) {
				List<mainAPIVO> cvo = cdsv.GetMainApitoTableEACH(situation, situ);
				return cvo;
			}
			
			@RequestMapping(value = "/GetExactPrice", method = {RequestMethod.GET, RequestMethod.POST})
			@ResponseBody
			public BigDecimal GetExactPrice(@RequestParam("preCur") String preCur) {
				BigDecimal cvo = cdsv.GetExactPrice(preCur);
				return cvo;
			}
			
			@RequestMapping(value = "/GetTablesForGraph", method = RequestMethod.GET)
			@ResponseBody
			public List<mainAPIVO> GetTablesForGraph() {
				List<mainAPIVO> cvo = cdsv.GetTablesForGraph();
				return cvo;
			}
			
			@RequestMapping(value = "/GetAsksBids", method = RequestMethod.GET)
			@ResponseBody
			public Map<String, Object> GetAsksBids() {
				Map<String, Object> mav = new HashMap<>();
				String bids = "bids";
				String asks = "asks";
				List<askbidAPIVO> cvo1 = cdsv.listDataCalling(bids);
				List<askbidAPIVO> cvo2 = cdsv.listDataCalling(asks);
				mav.put("bids", cvo1);
				mav.put("asks", cvo2);
				return mav;
			}
			
			
			
	
}
