package com.ajar.coingate.member.asset;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AssetService {
	@Autowired
	AssetDao assetdao;
	
	public List<AssetVo> getAllAssets(){
		return assetdao.selectAllAssets();
	}
	
}
