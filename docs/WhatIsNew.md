#### 2021-08-01
* 由於資料源問題，移除即時報價

#### 2021-05-23
* 新增 [融券借券賣出 TaiwanDailyShortSaleBalances](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwandailyshortsalebalances)

#### 2021-03-18
* 新增[當日沖銷交易標的及成交量值 TaiwanStockDayTrading](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockdaytrading)。


#### 2021-02-22
* 新增 `streaming_all_data` 參數，可拿取即時資料(tick)，開盤到當下所有 data。

#### 2021-01-26
* 新增[CnnFearGreedIndex 恐懼與貪婪指數](https://finmind.github.io/tutor/Others/#cnnfeargreedindex)
* 註冊會員突破500人。

#### 2021-01-25
* [web](https://finmindtrade.com/) 正式上線，包含策略分析、回測功能，分析全市場股票勝率，降低生存者偏差。
* 開始下一階段 web 開發。


#### 2021-01-18
* 新增[期貨、選擇權三大法人買賣](https://finmind.github.io/tutor/TaiwanMarket/Derivative/)
* 新增[期貨、選擇權各卷商日交易資訊](https://finmind.github.io/tutor/TaiwanMarket/Derivative/)
* web 回測、策略分析功能，預計近期上線。可針對特定策略，分析全市場股票勝率，降低生存者偏差。
* api v4 上線，可一次拿取特定日期，所有股價、三大法人、融資券等資訊，方便使用者進行每日更新時，只需要發少量 request。

#### 2020-12-25
* 資料已全部轉移到時間序列資料庫，針對 tick data，回應速度提升 10 倍以上。
* [web data 下載](https://finmindtrade.com/analysis/#/data/document)
* [FinMind 回測 package 說明文件](https://finmind.github.io/tutor/analysis/Backtesting/)，正在優化中。

#### 2020-10-06
* 預計改用時間序列資料庫，增加 api 效率。
* 進行回測功能開發。
* web 開發 data 下載功能，由於大多數人，使用 excel 進行金融分析，因此開發 web 下載 excel data 功能。

#### 2020-05-06
* 新增 [借券成交明細 SecuritiesLending](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocksecuritieslending)
* 新增 [每5秒委託成交統計 StockStatisticsOfOrderBookAndTrade](https://finmind.github.io/tutor/TaiwanMarket/Technical/#5-taiwanstockstatisticsoforderbookandtrade)


#### 2020-05-01
* 新增 [台股期貨 daily data](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdaily)
* 新增 [台股選擇權 daily data](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondaily)

#### 2020-04-24
* 新增 台股即時最佳五檔
* 新增 [台股期貨即時報價](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#info-taiwanfutopttickinfo)

#### 2020-04-15
* 新增 document
* 新增 [台股即時股價](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpriceminute)
* 新增 [美國債券殖利率](https://finmind.github.io/tutor/Macroeconomy/#governmentbondsyield)
* 新增 [台灣個股PER、PBR資料表 TaiwanStockPER](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockper)


#### 2019-10-23
* 新增 TotalMarginPurchaseShortSale 當天總體融資融券買賣
* 新增 TaiwanStockNews 台股相關新聞

#### 2019-10-10
* 新增 TaiwanFutures 台股期貨交易明細
* 新增 TaiwanOption 台股選擇權交易明細


#### FinMind 1.0.80 (2019-07-15) 
* 重大更新，過去是直接連 DataBase，目前改走 api 方式，未來舊版 package 將會失效，無法直接連 DataBase。請更新到最新版本，或是直接走 api。
 

#### FinMind 1.0.70 (2019-06-23) 
* add [api](https://github.com/linsamtw/FinMind/blob/master/api_demo.py)
* add function `Mind.MoveAverage`, <br>
e.g : 
		
		Mind.MoveAverage(_2330.StockPrice,days = 5,variable = 'close')
		
* add function `Mind.RSV`, <br>
e.g : 
	
		Mind.RSV(_2330.StockPrice,days = 5)
	
* add function `Mind.BIAS`, <br>
e.g : 
	
		Mind.BIAS(_2330.StockPrice,days = 5)

  ----------------------
#### FinMind 1.0.60 (2019-05-24) 
* New data `TaiwanStockMonthRevenue`
	
		from FinMind.Data import Load
		TaiwanStockMonthRevenue = Load.FinData(
			dataset = 'TaiwanStockMonthRevenue',
			select = '2330',
			date = '2018-01-01')
* Market index:
	* TSEC weighted index ( Taiwan weighted index ) : stock_id - `^TWII`
	* SP500 : stock_id - `^GSPC`
	* Dow Jones Industrial Average : stock_id - `^DJI`

  ----------------------
#### FinMind 1.0.57 (2019-04-28) 
* Change taiwan stock id, delete TWO and TW. ( eg. 2330.TW -> 2330 )

#### FinMind 1.0.54 (2019-04-13) 
* Optimize speeds of loading TaiwanStockPrice, USStockPrice
* Add [DataSource](https://github.com/linsamtw/FinMind/blob/master/Data/DataSource.md)

#### FinMind 1.0.53 (2019-04-07) 
##### Fix FinMind.Data.Load
* optimize speeds of loading data , ex :
 
		from FinMind.Data import Load
		import datetime

		TaiwanStockInfo = Load.FinData(dataset = 'TaiwanStockInfo')
		s = datetime.datetime.now()
		TaiwanStockFinancialStatements = Load.FinData(dataset = 'FinancialStatements',select = list(TaiwanStockInfo['stock_id']),date = '2018-12-01')
		t = datetime.datetime.now() - s
		print(t)
		0:00:01.861724
  
#### FinMind 1.0.52 (2019-04-06) 
##### New Data
* `BalanceSheet` ( Taiwan 資產負債表 )
* `TaiwanStockHoldingSharesPer ` ( Taiwan 股權分散表 )
* `Shareholding` ( Taiwan 個股外資持股 )
* `RawMaterialFuturesPrices ` ( 美國原物料期貨 )
#### New Function
* `transpose(data)`
* [demp2.py](https://github.com/linsamtw/FinMind/blob/master/demo2.py)

#### 2018/8/5
1. 央行利率 100% ( 13 Countrys, Contains G8 )

          FED Federal Reserve System 美國
          ECB European Central Bank 歐洲
          BOE Bank of England 英國
          SNB Swiss National Bank 瑞士
          RBA Reserve Bank of Australia 澳洲
          BOC Bank of Canada 加拿大
          RBNZ Reserve Bank of New Zealand 紐西蘭
          BOJ Bank of Japan 日本
          CBR The Central Bank of the Russian Federation 俄羅斯
          RBI Reserve Bank of India 印度
          PBOC People's Bank of China  中國
          BCB Banco Central do Brasil 巴西
2. Gold Price 100%
3. Government bond ->>>  https://data.oecd.org/interest/long-term-interest-rates.htm
4. 期貨 ->>> https://www.investing.com/commodities/energies
5. S&P 500指數，並爬取該 500 家股票股價 ->>>
 
#### 2018/7/5 
1. 國際油價 讀取範例 Load data example. (100%)
3. 各國匯率  ( 53 Countrys, Contains G8 )  (100%)

#### 2018/7/2 未來爬蟲順序
2. 央行利率 from https://tradingeconomics.com/search.aspx?q=Interest%20Rate
4. Inflation (通貨膨脹) monthly from https://tradingeconomics.com/russia/inflation-cpi
5. Consumer Price Index (CPI) monthly from https://tradingeconomics.com/russia/consumer-price-index-cpi
6. Output Gap monthly from https://tradingeconomics.com/russia/gdp-deflator
8. S&P 500 from yahoo finance
9. 黃金價格 from https://www.gold.org/data/gold-price




