#### 2026-07-13
* Added [Active ETF Daily Holding TaiwanStockActiveETFHolding](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockactiveetfholding-sponsor): data range 2025-05-05 ~ now
* Added [Active ETF Daily Holding Change TaiwanStockActiveETFHoldingChange](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockactiveetfholdingchange-sponsor): data range 2025-05-05 ~ now
* Added [Taiwan Active ETF List TaiwanStockActiveETFInfo](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockactiveetfinfo): a list / basic-info table of Taiwan-listed active ETFs (TWSE-listed + TPEx OTC), with columns `date`, `stock_id` (ETF code), `stock_name` (ETF name), `category` (ETF category: domestic / foreign), and `type` (market type: twse / tpex)

#### 2026-07-12
* Added [Disclaimer & Data Licensing](https://finmind.github.io/en/Disclaimer/): explains FinMind's data sources and licensing basis (data obtained via government open data platforms is used under the Open Government Data License of Taiwan), the scope of the license granted to users (the right to use this service, excluding redistribution / resale / mirroring), and disclaimers such as all data being for reference only

#### 2026-07-01
* Added [Taiwan Option VIX TaiwanOptionVix](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptionvix-backersponsor): data range 2026-03-01 ~ now
* Added [Convertible Bond Monthly Analysis TaiwanStockConvertibleBondMonthlyAnalysis](https://finmind.github.io/en/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondmonthlyanalysis-backersponsor): data range 2026-05-01 ~ now

#### 2026-06-15
* [Taiwan Warrant Underlying Reference Table TaiwanStockInfoWithWarrantSummary](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockinfowithwarrantsummary-sponsor) now covers **OTC (TPEX)** warrants' underlying (mother stock) reference in addition to listed (TWSE); OTC warrant underlying history goes back to 2011-01-03, so you can look up the warrants of a given underlying (including expired and code-reused historical warrants)
* [Taiwan Stock Warrant Trading Daily Report TaiwanStockWarrantTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#query-by-taiwanstockwarranttradingdailyreport-sponsor) now supports storage_objects whole-day bulk download (sponsorpro members only); data is provided per trading day from feature launch, no historical backfill for now

#### 2026-06-13
* Added [Institutional Investors Buy/Sell (Wide) TaiwanStockInstitutionalInvestorsBuySellWide](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysellwide): same data as `TaiwanStockInstitutionalInvestorsBuySell` but in wide format — one row per trading day with each institutional investor's buy/sell as its own column, no manual pivot needed. Columns cover all historical investor categories; a category is 0 in eras where it did not exist (dealer split into proprietary/hedging from 2014-12-01; foreign dealer self from 2018-01-15). Data range 2005-01-01 ~ now
* The FinMind Python package now supports **Python 3.12** (Python 3.8–3.11 remain supported). Starting from this release, dependencies are upgraded to `pandas>=2.0` and `ta>=0.11` (`numpy` and `pydantic` unchanged).
    * **No code changes are required** to call FinMind: the public `DataLoader`, strategy, and plotting interfaces are unchanged.
    * :warning: **Upgrade note**: installing/upgrading also bumps `pandas` to 2.x and `ta` to 0.11 in your environment. If your **own surrounding code** still uses pandas 1.x APIs removed in 2.0, you will need to adjust it — common examples: `df.append()` → `pd.concat([...])`, `df.to_dict("r")` → `df.to_dict("records")`, `df.iteritems()` → `df.items()`. If you cannot adjust yet, pin an older FinMind version for now.

#### 2026-06-09
* Added [Futures Spread Tick Table TaiwanFuturesSpreadTick](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesspreadtick-sponsor) (sponsor members only): per-trade futures spread (near/far month) data, including contract months, deal time, spread deal price, volume, near month price, far month price, and spread-to-spread deal flag. Only one day of data is provided per request; data accumulates daily since 2026-04-27 (earlier historical backfill not yet included).

#### 2026-06-05
* [Taiwan Stock Minute K Table TaiwanStockKBar](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#k-taiwanstockkbar-sponsor), [Futures Trading Detail TaiwanFuturesTick](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor), and [Options Trading Detail TaiwanOptionTick](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptiontick-backersponsor) now support storage_objects bulk download to fetch a whole day's data at once (sponsorpro members only). Data is available from the feature launch date; no historical backfill.

#### 2026-06-03
* Added [Service Status & Uptime](https://finmind.github.io/en/ServiceStatus/): a public, real-time status page at [status.finmindtrade.com](https://status.finmindtrade.com), explaining how API uptime is calculated and the status tiers (Operational / Degraded Performance / Partial Outage / Major Outage), which serve as the basis for the enterprise-plan SLA.

#### 2026-05-23
* Added [Taiwan Stock Index Codes](https://finmind.github.io/en/tutor/TaiwanMarket/IndexCodes/): [taiwan_stock_tick_snapshot](https://finmind.github.io/en/tutor/TaiwanMarket/RealTime/#taiwan_stock_tick_snapshot-sponsor) `data_id` also accepts 91 three-digit index codes in addition to 4-digit stock IDs (e.g. `001` = TAIEX, `101` = OTC weighted), grouped into broad market / sector / themed (Smart Beta) / leverage & inverse categories.

#### 2026-05-22
* [Monthly Revenue Table TaiwanStockMonthRevenue](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue) added a **creation time** `create_time` column (YYYY-MM-DD); empty string for older historical rows.

#### 2026-05-19
* The following datasets now cover **emerging market companies** in addition to TWSE-listed and TPEx OTC companies (distinguished by `stock_id`; use `TaiwanStockInfo` to look up market type):
    * [Monthly Revenue Table TaiwanStockMonthRevenue](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue)
    * [Income Statement TaiwanStockFinancialStatements](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockfinancialstatements)
    * [Balance Sheet TaiwanStockBalanceSheet](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockbalancesheet)
    * [Cash Flows Statement TaiwanStockCashFlowsStatement](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockcashflowsstatement)
    * [Institutional Investors Buy/Sell TaiwanStockInstitutionalInvestorsBuySell](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysell)

#### 2026-05-06
* [Taiwan Stock Trading Daily Report by Branch TaiwanStockTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/) storage_objects docs: added a FinMind package example (`taiwan_stock_trading_daily_report(use_object=True)`).

#### 2026-05-05
* [Taiwan Stock Trading Daily Report by Branch TaiwanStockTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/) added a storage_objects download path to fetch a whole day's data at once (sponsorpro members only).

#### 2026-05-02
* Added the "[Update Token](https://finmind.github.io/en/update_token/)" feature: users can reset their token themselves on the user info page. The old token becomes invalid immediately, with no need to contact support.

#### 2026-04-30
* Added [Loan Collateral Balance TaiwanStockLoanCollateralBalance](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockloancollateralbalance-sponsor)

#### 2026-04-28
* Added [Block Trade Daily Transaction Information TaiwanStockBlockTrade](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockblocktrade-sponsor)

#### 2026-04-19
* Added [Day Trading Securities Borrowing Fee Rate TaiwanStockDayTradingBorrowingFeeRate](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockdaytradingborrowingfeerate-backersponsor)

#### 2026-04-17
* Added [Block Trade Daily Report TaiwanStockBlockTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockblocktradingdailyreport-sponsor)

#### 2026-04-12
* [TaiwanStockPriceLimit](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockpricelimit-backersponsor) documentation update: 0 means no price limit.

#### 2026-04-03
* Added async batch query example.

#### 2026-03-28
* Updated [TaiwanStockDispositionSecuritiesPeriod](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockdispositionsecuritiesperiod-backersponsor) documentation with ESB and TWSE data.

#### 2026-03-26
* Fixed mistakenly entered data range for the shareholding distribution table.

#### 2026-03-21
* [Agent Skill](https://finmind.github.io/en/tutor/ai/AgentSkill/) added installation instructions and example screenshots for Claude Code, Cursor, Windsurf, and Gemini.
* Updated [Contact](https://finmind.github.io/en/Contact/): replaced Gitter with the Facebook group and fan page.

#### 2026-03-20
* Added [Agent Skill](https://finmind.github.io/en/tutor/ai/AgentSkill/) documentation, allowing tools such as Claude Code to query FinMind data quickly via skill.

#### 2026-03-10
* Added [llms.txt](https://finmind.github.io/llms.txt) and [llms-full.txt](https://finmind.github.io/llms-full.txt), helping AI tools understand FinMind documentation more quickly.
* Added TaiwanStockPriceTick object method documentation.
* Added an LLM / AI integration section to the homepage.

#### 2026-03-06
* Added [Daily Price Limit TaiwanStockPriceLimit](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockpricelimit-backersponsor)

#### 2026-02-22
* Updated futures and options real-time information documentation, adding supported codes and an explanation that an empty value retrieves all data.

#### 2026-02-07
* Added [Futures Spread Trading TaiwanFuturesSpreadTrading](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesspreadtrading-backersponsor)

#### 2026-02-01
* Added [Futures Final Settlement Price TaiwanFuturesFinalSettlementPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesfinalsettlementprice-backersponsor)
* Added [Option Final Settlement Price TaiwanOptionFinalSettlementPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptionfinalsettlementprice-backersponsor)

#### 2026-01-31
* [TaiwanStockSuspended](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstocksuspended-backersponsor) and [TaiwanStockDayTradingSuspension](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockdaytradingsuspension-backersponsor) added FinMind package examples.

#### 2026-01-24
* Added [Taiwan Stock Suspended Trading Announcement TaiwanStockSuspended](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstocksuspended-backersponsor)
* Added [Day Trading Sell-Then-Buy Suspension Notice TaiwanStockDayTradingSuspension](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockdaytradingsuspension-backersponsor)

#### 2026-01-23
* Added English translations to the documentation.

#### 2026-01-22
* Updated taiwan_options_snapshot documentation.

#### 2026-01-18
* Removed the token parameter from the API URL query; tokens are now passed via the header.

#### 2026-01-04
* Removed the `login` function; login is only supported via `login_by_token`.

#### 2025-12-15
* Enhanced the tick data async usage documentation.

#### 2025-10-06
* Added [Dividend Policy Table TaiwanStockDividend](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockdividend)

#### 2025-09-21
* Added the kind parameter to [Index Statistics Every 5 Seconds TaiwanStockEvery5SecondsIndex](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockevery5secondsindex-backersponsor).

#### 2025-09-11
* FinMind package added async batch query functionality.

#### 2025-08-31
* Added [Taiwan Stock Par Value Change Reference Price TaiwanStockParValueChange](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockparvaluechange)

#### 2025-08-13
* Added the suspension marker for sell-then-buy trades, and corrected the documentation for futures and options institutional investors.

#### 2025-07-20
* Added [Taiwan Stock Warrant Underlying Mapping Table TaiwanStockInfoWithWarrantSummary](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockinfowithwarrantsummary-sponsor)
* Added [Taiwan Stock Trading Date TaiwanStockTradingDate](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstocktradingdate)
* Added [Taiwan Stock Post-Split Reference Price TaiwanStockSplitPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstocksplitprice)

#### 2025-05-25
* [Taiwan Stock Tick by Securities Trader TaiwanStockTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstocktradingdailyreport-sponsor) added FinMind package example.
* [Taiwan Stock Warrant Tick by Securities Trader TaiwanStockWarrantTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockwarranttradingdailyreport-sponsor) added FinMind package example.

#### 2025-05-11
* Added [US Stock Minute Price USStockPriceMinute](https://finmind.github.io/en/tutor/UnitedStatesMarket/Technical/#usstockpriceminute-backersponsor)
* [Company Industry Chain TaiwanStockIndustryChain](https://finmind.github.io/en/tutor/TaiwanMarket/Others/#taiwanstockindustrychain-backersponsor) added FinMind package example.

#### 2025-05-10
* Added [Index Statistics Every 5 Seconds TaiwanStockEvery5SecondsIndex](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockevery5secondsindex-backersponsor)
* API authentication updated; tokens are now passed via the header `Authorization: Bearer <token>`.

#### 2025-04-06
* Added [Company Industry Chain TaiwanStockIndustryChain](https://finmind.github.io/en/tutor/TaiwanMarket/Others/#taiwanstockindustrychain-backersponsor)

#### 2025-02-09
* Added [Disposition Securities Period TaiwanStockDispositionSecuritiesPeriod](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockdispositionsecuritiesperiod-backersponsor)

#### 2025-01-05
* TaiwanStockConvertibleBond, CnnFearGreedIndex, Futures/OptionOpenInterestLargeTraders, Futures/OptionInstitutionalInvestorsAfterHours, and TaiwanStockHoldingSharesPer are now available to backer-tier members.

#### 2024-12-23
* FinMind package added async batch query functionality.

#### 2024-12-07
* Added data range descriptions for [TaiwanBusinessIndicator](https://finmind.github.io/en/tutor/TaiwanMarket/Others/#taiwanbusinessindicator-backersponsor) and [CnnFearGreedIndex](https://finmind.github.io/en/tutor/Others/#cnnfeargreedindex).

#### 2024-12-01
* Added [Taiwan Monthly Business Indicator TaiwanBusinessIndicator](https://finmind.github.io/en/tutor/TaiwanMarket/Others/#taiwanbusinessindicator-backersponsor)

#### 2024-11-17
* Added [Taiwan Stock Market Value Weight TaiwanStockMarketValueWeight](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockmarketvalueweight-backersponsor)

#### 2024-10-12
* Added [Futures Open Interest Large Traders TaiwanFuturesOpenInterestLargeTraders](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesopeninterestlargetraders-backersponsor)
* Added [Option Open Interest Large Traders TaiwanOptionOpenInterestLargeTraders](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptionopeninterestlargetraders-backersponsor)
* Added [Futures After-Hours Institutional Investors TaiwanFuturesInstitutionalInvestorsAfterHours](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesinstitutionalinvestorsafterhours-backersponsor)
* Added [Option After-Hours Institutional Investors TaiwanOptionInstitutionalInvestorsAfterHours](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptioninstitutionalinvestorsafterhours-backersponsor)

#### 2024-09-28
* Added [API usage query](https://finmind.github.io/en/api_usage_count/), allowing users to check api_usage and api_usage_limit through the package.

#### 2024-09-26
* [TaiwanStockTradingDailyReportSecIdAgg](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstocktradingdailyreportsecidagg-sponsor) added securities_trader_id and end_date parameters.

#### 2024-08-25
* Added [Daily Securities Trader Aggregate Statistics TaiwanStockTradingDailyReportSecIdAgg](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstocktradingdailyreportsecidagg-sponsor)

#### 2024-07-14
* Added [Taiwan Stock Weekly K-line TaiwanStockWeekPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockweekprice-backersponsor)
* Added [Taiwan Stock Monthly K-line TaiwanStockMonthPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockmonthprice-backersponsor)

#### 2024-05-28
* Added [Taiwan Total Exchange Margin Maintenance TaiwanTotalExchangeMarginMaintenance](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwantotalexchangemarginmaintenance-backersponsor)

#### 2024-05-19
* Added FinMind package example for [Securities Trader Info TaiwanSecuritiesTraderInfo](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwansecuritiestraderinfo).
* Added data range description for [Capital Reduction Reference Price TaiwanStockCapitalReductionReferencePrice](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockcapitalreductionreferenceprice).

#### 2024-05-08
* Removed the exchange rate data source.

#### 2024-04-18
* Added [Margin Short Sale Suspension (Short Covering Date) TaiwanStockMarginShortSaleSuspension](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockmarginshortsalesuspension)

#### 2024-04-01
* Added FinMind package examples to the [Convertible Bond](https://finmind.github.io/en/tutor/TaiwanMarket/ConvertibleBond/) series of datasets.

#### 2024-03-24
* Added the convertible bond series of datasets:
    * [Convertible Bond Overview TaiwanStockConvertibleBondInfo](https://finmind.github.io/en/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondinfo-backersponsor)
    * [Convertible Bond Daily Transaction Info TaiwanStockConvertibleBondDaily](https://finmind.github.io/en/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebonddaily-backersponsor)
    * [Convertible Bond Institutional Investors Daily Trading Info TaiwanStockConvertibleBondInstitutionalInvestors](https://finmind.github.io/en/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondinstitutionalinvestors-backersponsor)
    * [Convertible Bond Daily Overview TaiwanStockConvertibleBondDailyOverview](https://finmind.github.io/en/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebonddailyoverview-backersponsor)

#### 2024-03-19
* Added [Taiwan Stock Delisting Table TaiwanStockDelisting](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwanstockdelisting)

#### 2024-01-27
* Added column schema documentation for all market datasets.

#### 2021-10-06
* Released FinMind package 1.5.3, addressing the connect error issue.
* Added FinMind package documentation.

#### 2021-08-01
* Removed real-time quotes due to data source issues.

#### 2021-05-23
* Added [Total Short Sale Balance Limit Table TaiwanDailyShortSaleBalances](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwandailyshortsalebalances)

#### 2021-03-18
* Added [Day Trading Securities and Trading Volume TaiwanStockDayTrading](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockdaytrading).


#### 2021-02-22
* Added the `streaming_all_data` parameter to retrieve real-time data (tick), covering all data from market open to the current moment.

#### 2021-01-26
* Added [CnnFearGreedIndex Fear and Greed Index](https://finmind.github.io/en/tutor/Others/#cnnfeargreedindex)
* Registered users surpassed 500.

#### 2021-01-25
* [web](https://finmindtrade.com/) officially launched, including strategy analysis and backtesting features that analyze the win rate of stocks across the entire market to reduce survivorship bias.
* Began the next phase of web development.


#### 2021-01-18
* Added [Futures and Options Institutional Investors Trading](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/)
* Added [Futures and Options Daily Trading Information by Securities Trader](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/)
* The web backtesting and strategy analysis features are scheduled to launch soon. They can analyze the win rate of all market stocks for a specific strategy to reduce survivorship bias.
* api v4 is live, allowing users to retrieve all stock prices, institutional investor data, and margin trading information for a specific date in a single call. This makes daily updates more convenient by sending only a small number of requests.

#### 2020-12-25
* All data has been migrated to a time series database. For tick data, response speeds have improved by more than 10 times.
* [web data download](https://finmindtrade.com/analysis/#/data/document)
* [FinMind backtesting package documentation](https://finmind.github.io/en/tutor/analysis/Backtesting/) is being optimized.

#### 2020-10-06
* Plan to switch to a time series database to improve API efficiency.
* Working on backtesting feature development.
* Web development of the data download feature: since most users use Excel for financial analysis, we are developing the web Excel data download function.

#### 2020-05-06
* Added [Securities Lending Transaction Detail SecuritiesLending](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstocksecuritieslending)
* Added [Order Book and Trade Statistics Every 5 Seconds StockStatisticsOfOrderBookAndTrade](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#5-taiwanstockstatisticsoforderbookandtrade)


#### 2020-05-01
* Added [Taiwan Futures daily data](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesdaily)
* Added [Taiwan Options daily data](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptiondaily)

#### 2020-04-24
* Added Taiwan Stock real-time best five bid/ask.
* Added [Taiwan Futures real-time quotes](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#info-taiwanfutopttickinfo)

#### 2020-04-15
* Added documentation.
* Added [Taiwan Stock real-time price](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockpriceminute)
* Added [US Treasury Bond Yield](https://finmind.github.io/en/tutor/Macroeconomy/#governmentbondsyield)
* Added [Taiwan Stock PER and PBR Table TaiwanStockPER](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockper)


#### 2019-10-23
* Added TotalMarginPurchaseShortSale: total daily margin purchase and short sale.
* Added TaiwanStockNews: Taiwan stock-related news.

#### 2019-10-10
* Added TaiwanFutures: Taiwan futures trading detail.
* Added TaiwanOption: Taiwan options trading detail.


#### FinMind 1.0.80 (2019-07-15)
* Major update. Previously the package connected directly to the database; now it uses the API. Older versions of the package will stop working in the future and will not be able to connect directly to the database. Please upgrade to the latest version, or use the API directly.


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
* `BalanceSheet` ( Taiwan Balance Sheet )
* `TaiwanStockHoldingSharesPer ` ( Taiwan Shareholding Distribution Table )
* `Shareholding` ( Taiwan Foreign Shareholding by Stock )
* `RawMaterialFuturesPrices ` ( US Raw Material Futures )
#### New Function
* `transpose(data)`
* [demp2.py](https://github.com/linsamtw/FinMind/blob/master/demo2.py)

#### 2018/8/5
1. Central bank interest rates 100% ( 13 Countrys, Contains G8 )

          FED Federal Reserve System (USA)
          ECB European Central Bank (Europe)
          BOE Bank of England (UK)
          SNB Swiss National Bank (Switzerland)
          RBA Reserve Bank of Australia (Australia)
          BOC Bank of Canada (Canada)
          RBNZ Reserve Bank of New Zealand (New Zealand)
          BOJ Bank of Japan (Japan)
          CBR The Central Bank of the Russian Federation (Russia)
          RBI Reserve Bank of India (India)
          PBOC People's Bank of China  (China)
          BCB Banco Central do Brasil (Brazil)
2. Gold Price 100%
3. Government bond ->>>  https://data.oecd.org/interest/long-term-interest-rates.htm
4. Futures ->>> https://www.investing.com/commodities/energies
5. S&P 500 index, plus crawled prices of all 500 constituent stocks ->>>

#### 2018/7/5
1. International oil prices: Load data example. (100%)
3. Foreign exchange rates  ( 53 Countrys, Contains G8 )  (100%)

#### 2018/7/2 Future crawler order
2. Central bank interest rates from https://tradingeconomics.com/search.aspx?q=Interest%20Rate
4. Inflation monthly from https://tradingeconomics.com/russia/inflation-cpi
5. Consumer Price Index (CPI) monthly from https://tradingeconomics.com/russia/consumer-price-index-cpi
6. Output Gap monthly from https://tradingeconomics.com/russia/gdp-deflator
8. S&P 500 from yahoo finance
9. Gold price from https://www.gold.org/data/gold-price




