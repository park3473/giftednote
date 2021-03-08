package egovframework.kaist.user.portfolio.service;

import java.util.HashMap;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.portfolio.model.UserPortfolioVo;

public interface UserPortfolioService {

	public int setInsert(UserPortfolioVo userPortfolioDomain);

	public boolean setUpdate(UserPortfolioVo userPortfolioDomain);
	
	public boolean setDelete(UserPortfolioVo userPortfolioDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getPortfolioIdCheck(String portfolioId);

	public ModelMap getList(UserPortfolioVo userPortfolioVo);
	
	public HashMap<String,String> getSummary(UserPortfolioVo userPortfolioVo);

	public Object getView2(String portfolioid);

}
