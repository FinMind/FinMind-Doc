#### 2026-09-26
* **資料校正公告**：[台灣股價歷史逐筆資料表 TaiwanStockPriceTick](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricetick-backersponsor)：以 `storage_objects` 下載的整日資料，部分日期同一檔股票的列沒有依時間排序（該股資料後面又接了一段較早的成交），依檔案順序取值會取錯。**2018-12-07 起全部交易日的整日資料已重新產製，曾下載過的使用者請重新取得**
    * 修正後整日資料依 `stock_id`、`Time` 排序；同一時間有多筆成交時，依實際成交先後排列
    * 受影響較明顯的日期如 2020-03-02、2020-03-12、2021-08-03（該日原始資料整天為時間倒序），其餘多為少數個股；資料內容與筆數不變，只調整排列順序

#### 2026-09-25
* **資料校正公告**：[台灣股價歷史逐筆資料表 TaiwanStockPriceTick](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricetick-backersponsor)、[台股分 K 資料表 TaiwanStockKBar](https://finmind.github.io/tutor/TaiwanMarket/Technical/#k-taiwanstockkbar-sponsor)：部分日期有重複或非實際成交的紀錄，已依證交所、櫃買中心公布的日成交量與盤後定價資料逐檔比對後移除，分 K 同步重新計算。**曾下載或查詢過以下日期的使用者請重新取得資料**
    * **2018-12-07 ~ 2019-09-27**（190 個交易日）：同一筆成交多出一筆毫秒為 `.000` 的重複紀錄，共約 19.8 萬筆，已移除
    * **13:30:00 收盤撮合列重複**：部分日期同一檔股票的收盤撮合出現多筆完全相同的紀錄（例如 2022-07-20 ~ 2022-10-18 的上櫃股票），現在每檔每日只保留一筆
    * **2020-01-02 ~ 2020-04-28**：部分個股有重複收錄的成交，或多出非實際成交的 13:30:00 收盤列、14:30:00 盤後定價列，已移除
    * **2025-06-16**：多數股票多出一筆與 13:30:00 收盤列相同的 14:30:00 紀錄（並非實際的盤後定價成交），已移除
    * 分 K：**2020-03-06**、**2021-07-27** 有少數分 K 成交量為負值；**2020-03-23 ~ 2023-07-13** 部分分 K 的開高低收或最低價為 0。均來自原始資料中的非實際成交紀錄，已排除後重新計算
    * 官方日成交量包含零股與鉅額交易，逐筆量合計略低於官方日成交量屬正常現象
* **資料校正公告**：[每 5 秒指數統計 TaiwanStockEvery5SecondsIndex](https://finmind.github.io/tutor/TaiwanMarket/Technical/#5-taiwanstockevery5secondsindex-backersponsor)：
    * 上櫃各指數 13:30:00 原本記錄的是收盤集合競價前最後一個揭示值，已全期間更正為官方收盤指數，與上市指數一致
    * **2026-06-02** 多出 7 條舊制名稱的序列（其中 `CompositAveragePrice`、`IndustryAveragePrice` 整天為 0），已移除
    * **2007-07-02 ~ 2014-01-03** 上櫃航運類的名稱前多一個 Tab 字元，已統一為 `ShippingTransportation`
    * **2005-01-03 ~ 2008-09-18** 部分上市指數同時存在新舊兩個名稱（例如 `TSEWeighted` 與 `TAIEX`、`Electron` 與 `Electronic`，數值相同），已只保留現行名稱；**2005-09-16** 原本只有舊名稱，已改為現行名稱，當日 TAIEX 分 K 一併補齊
    * **2017-05-08** 上櫃各指數的原始資料由 09:00:05 開始，沒有 09:00:00 這一點，無法補齊
* **資料校正公告**：[每5秒委託成交統計 TaiwanStockStatisticsOfOrderBookAndTrade](https://finmind.github.io/tutor/TaiwanMarket/Technical/#5-taiwanstockstatisticsoforderbookandtrade)：**2023-08-04** 09:00:00 的累積成交誤為前一交易日的收盤累計值，已更正為 0；**2011-01-21** 整日資料誤為其他日期的資料，已更正。另有部分日期同一時間點存有重複資料，已一併清除
* **資料校正公告**：[股價日成交資訊 TaiwanStockPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockprice)、[台灣還原股價 TaiwanStockPriceAdj](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpriceadj-backersponsor)、[台股週 K 資料表 TaiwanStockWeekPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#k-taiwanstockweekprice-backersponsor)、[台股月 K 資料表 TaiwanStockMonthPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#k-taiwanstockmonthprice-backersponsor)：
    * 上櫃股票在 **2015-11-23**、**2020-03-09**、**2020-03-10**、**2020-04-24** 的成交股數、成交金額、成交筆數未計入盤後定價與零股交易，已更正為與其他交易日一致的全日口徑；開高低收與漲跌不受影響
    * 還原股價同步更新；上櫃週 K、月 K（2020-03 ~ 2024-12）已依日成交資料重新計算
* **資料校正公告**：[台灣股價歷史逐筆資料表 TaiwanStockPriceTick](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricetick-backersponsor)：**2018-12-07 ~ 2023-03-10** 共 **1,028 個交易日**的 `TickType`（內外盤）標記已全面修正。**曾下載或查詢過這段期間資料的使用者請重新取得資料**
    * 問題：2023-03-13 以前，來源無法判定內外盤的成交被一律標記為 1（外盤），使外盤占比明顯偏高，部分日期高達 0.82，修正後回到 0.50 左右
    * 修正後改用與 2023-03-13 之後一致的判定規則。`TickType` 定義：1＝外盤成交（買方主動）、2＝內盤成交（賣方主動）、0＝無法判定
    * **2021-06-22 以前的日期，約 8% ~ 10% 的成交其 `TickType` 為 0（無法判定）**，因為來源資料本身對這些成交沒有內外盤資訊。若以 `TickType` 分類統計，請將 0 單獨處理，不要併入外盤或內盤
    * 另有約 152 萬筆（佔全區間 0.15%、分布於 187 個交易日）因來源已無法再次提供，保留原始資料與原標記，以免遺失成交紀錄
* **資料校正公告**：[台灣股價歷史逐筆資料表 TaiwanStockPriceTick](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricetick-backersponsor)：**2018-12-10** 整日資料重複，已重新產製。**曾以該日做過統計的使用者請重新計算**
    * 問題：該日絕大多數個股的每一筆成交都存在完全相同的第二筆，使當日成交量約為實際的兩倍；重新產製後已逐股確認與官方日成交量一致
    * 已就 2018-12-07 ~ 2022-09-30 全區間檢查是否有相同情形，確認僅此一日
* [台灣股價歷史逐筆資料表 TaiwanStockPriceTick](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricetick-backersponsor)：資料區間更正為 **2018-12-07 ~ now**（原記為 2019-01-01）；已知缺漏日期補列為 **2018-12-22、2019-02-20、2019-02-21、2019-02-22**，另 **2019-05-16** 僅有少數 ETF 的資料

#### 2026-09-24
* **資料校正公告**：[主動式ETF每日持股明細 TaiwanStockActiveETFHolding](https://finmind.github.io/tutor/TaiwanMarket/Chip/#etf-taiwanstockactiveetfholding-sponsor)、[主動式ETF每日持股異動（買賣）TaiwanStockActiveETFHoldingChange](https://finmind.github.io/tutor/TaiwanMarket/Chip/#etftaiwanstockactiveetfholdingchange-sponsor)：**2026-02-11**（春節前最後一個交易日）有 11 檔 ETF 缺持股資料，已補齊。**曾下載或查詢過 2026-02-11、2026-02-23 資料的使用者請重新取得資料**
    * 補齊的 ETF：00980A、00981A、00981D、00982A、00983A、00985A、00988A、00990A、00992A、00994A、00995A
    * 問題：春節前最後一個交易日的持股清單在春節後第一個交易日才公告，間隔超過收錄時的檢查上限，當日持股因此漏收；已修正，往後遇到長假也能正常收錄
    * 持股異動同步重算：2026-02-11 補上當日買賣；2026-02-23 原本是與 2026-02-10 相減，改為與 2026-02-11 相減。2026-02-23 部分成份股會出現 `buy`、`sell` 皆為 0 的列，代表該成份股當日無異動，可直接略過
    * 00981D、00983A、00988A、00990A 的 **2026-02-10** 資料來源本身未提供持股，**此日無法補齊**
* [台股分 K 資料表 TaiwanStockKBar](https://finmind.github.io/tutor/TaiwanMarket/Technical/#k-taiwanstockkbar-sponsor)：已知缺漏日期補列為 **2019-02-20、2019-02-21、2019-02-22**（這三天僅有加權指數 TAIEX 分 K，無個股資料），另 **2019-05-16** 個股僅有少數 ETF 的資料；與[台灣股價歷史逐筆資料表 TaiwanStockPriceTick](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricetick-backersponsor) 的缺漏日期一致，來源於這些日期未提供逐筆資料，無法補齊

#### 2026-09-20
* **資料校正公告**：[期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[期貨分K TaiwanFuturesKBar](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#k-taiwanfutureskbar-sponsor)：2018 年部分交易日逐筆資料缺漏，已依交易所原始資料重建。**以下日期已重新產製並驗證，曾下載或查詢過這些日期的使用者請重新取得資料**
    * 影響日期（共 70 個交易日）：2018-03-23、2018-03-26、2018-03-27、2018-04-03、2018-04-09、2018-04-13、2018-04-16、2018-04-23、2018-04-30、2018-05-02、2018-05-07、2018-05-11、2018-05-14、2018-05-21、2018-05-25、2018-05-28、2018-06-01、2018-06-04、2018-06-11、2018-06-19、2018-06-22、2018-06-25、2018-06-29、2018-07-02、2018-07-09、2018-07-16、2018-07-23、2018-07-30、2018-08-03、2018-08-06、2018-08-07、2018-08-10、2018-08-13、2018-08-17、2018-08-20、2018-08-24、2018-08-27、2018-08-28、2018-09-03、2018-09-07、2018-09-10、2018-09-14、2018-09-17、2018-09-25、2018-09-28、2018-10-01、2018-10-05、2018-10-08、2018-10-11、2018-10-15、2018-10-19、2018-10-22、2018-10-26、2018-10-29、2018-11-02、2018-11-05、2018-11-09、2018-11-12、2018-11-16、2018-11-19、2018-11-23、2018-11-26、2018-11-27、2018-11-30、2018-12-03、2018-12-04、2018-12-07、2018-12-10、2018-12-14、2018-12-17
    * 問題：這些日期有部分成交未收錄，主要集中在週一（週末後第一個交易日）日盤開盤後的前幾秒；以臺股期貨 TX 為例，42 個交易日共缺 29,909 筆
    * 已逐日比對筆數與成交量後上線；2018 全年臺股期貨 TX 逐筆資料亦已與交易所原始資料逐列比對，完全一致
* **資料校正公告**：[個股三大法人買賣表 TaiwanStockInstitutionalInvestorsBuySell](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysell)、[個股三大法人買賣表（寬表）TaiwanStockInstitutionalInvestorsBuySellWide](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysellwide)：上櫃 **2017-12-18 ~ 2018-01-12**（19 個交易日）的 `Foreign_Dealer_Self`（外資自營商）有誤，已修正。**曾下載或查詢過這段期間上櫃資料的使用者請重新取得資料**
    * 問題：上櫃當時尚未單獨揭露外資自營商（2018-01-15 起才拆分），但此期間約 380 檔上櫃股票的 `Foreign_Dealer_Self` 被誤植為與 `Foreign_Investor` 相同的數值，加總各法人別時外資會被重複計算
    * 修正後此期間上櫃的 `Foreign_Dealer_Self` 買進／賣出皆為 0；另 2018-01-12 有 7 檔上櫃股票的投信買賣股數一併校正為官方數值
    * 已逐日比對官方公告；上市股票及其他期間不受影響
* **資料校正公告**：**颱風全日停市日**出現與**次一交易日盤後時段**完全相同的重複資料，已全數移除。**曾下載或查詢過這些日期的使用者請重新取得資料**
    * 影響日期：**2023-08-03**、**2024-07-24**、**2024-07-25**、**2024-10-02**、**2024-10-03**、**2024-10-31**、**2026-07-10**
    * 影響資料集：[期貨日成交資訊 TaiwanFuturesDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdaily)、[選擇權日成交資訊 TaiwanOptionDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondaily)、[期貨各卷商每日交易 TaiwanFuturesDealerTradingVolumeDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdealertradingvolumedaily)、[選擇權各卷商每日交易 TaiwanOptionDealerTradingVolumeDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondealertradingvolumedaily)
    * 問題：颱風全日停市時，當日已完成的盤後交易時段依規則改歸屬於**次一交易日**；停市日當下寫入的那份資料在歸屬更正後成為殘留，形成與次一交易日盤後列完全相同的重複。正式歸屬日為次一交易日，停市日本身不應有資料
    * [期貨夜盤三大法人買賣 TaiwanFuturesInstitutionalInvestorsAfterHours](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesinstitutionalinvestorsafterhours-backersponsor)：**2022-07-24**（週日）有與 2022-07-25 完全相同的重複資料，一併移除
    * [台股交易日 TaiwanStockTradingDate](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstocktradingdate)：**2026-07-10** 先前誤列為交易日，已更正
    * 逐筆與分 K 資料**不受影響，也不應一併剔除**：這類資料集的 `date` 為日曆時間，停市日 00:00～04:59 是前一交易日夜盤的真實成交
* **資料校正公告**：[期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[期貨分K TaiwanFuturesKBar](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#k-taiwanfutureskbar-sponsor)：**2024-04-26** 少 3 筆成交，已重新產製並驗證。**曾下載或查詢過該日的使用者請重新取得資料**
    * 問題：臺股期貨 TX 202405 於 **15:07:30** 少 3 筆（價格 20163、數量 2），整日由 127,504 筆補回 **127,507 筆**，與交易所原始資料一致
    * 分K 連帶更正：該日 15:07 這一分鐘的成交量由 490 更正為 **496**，TX 202405 整日成交量 389,496
    * 其餘日期已抽驗逐筆與分K 的成交量對帳，無同類問題

#### 2026-09-19
* [現股當日沖銷券差借券費率 TaiwanStockDayTradingBorrowingFeeRate](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockdaytradingborrowingfeerate-backersponsor)：修復相同股票在同一天只有一筆資料的問題（來源資料同一天同一檔股票會有多筆不同借券股數與費率），現已完整保留所有原始資料列，並回補歷史資料
* [期貨分K TaiwanFuturesKBar](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#k-taiwanfutureskbar-sponsor) 新增 storage_objects 一次取得整日資料的下載方式（只限 sponsorpro 會員）；歷史資料亦可下載
* [期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[選擇權交易明細 TaiwanOptionTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick-backersponsor)、[期貨分K TaiwanFuturesKBar](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#k-taiwanfutureskbar-sponsor) 查詢須帶 `data_id`；一次取得整日資料請使用 storage_objects 下載方式
* **資料校正公告（補充 2026-09-17）**：[期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[期貨分K TaiwanFuturesKBar](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#k-taiwanfutureskbar-sponsor)：**2018-02-13** 有與 2026-09-17 公告相同的夜盤重複問題，先前未列入該次修正範圍，現已修正。**此日期已重新產製並驗證，曾下載或查詢過的使用者請重新取得資料**
    * 2018-02-13 為春節前休市日（只含夜盤尾段 00:00～05:00），夜盤歸屬春節後第一個交易日 2018-02-21
    * 已重新逐日檢查 2017-05 ~ 2018-03 全部日期，除上述 43 個日曆日與 2018-02-13 之外，沒有其他日期有此問題

#### 2026-09-17
* **資料校正公告**：[期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[期貨分K TaiwanFuturesKBar](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#k-taiwanfutureskbar-sponsor)：2017-05 ~ 2018-03 部分夜盤資料重複，已修正。**以下日期已重新產製並驗證，曾下載或查詢過這些日期的使用者請重新取得資料**
    * 影響日期（共 43 個日曆日，皆為只含夜盤尾段 00:00～05:00 的週六及休市日）：2017-05-20、2017-05-27、2017-06-10、2017-06-17、2017-06-24、2017-07-01、2017-07-08、2017-07-15、2017-07-22、2017-07-29、2017-08-05、2017-08-12、2017-08-19、2017-08-26、2017-09-02、2017-09-09、2017-09-16、2017-09-23、2017-10-04、2017-10-07、2017-10-14、2017-10-21、2017-10-28、2017-11-04、2017-11-11、2017-11-18、2017-11-25、2017-12-02、2017-12-09、2017-12-16、2017-12-23、2017-12-30、2018-01-06、2018-01-13、2018-01-20、2018-01-27、2018-02-03、2018-02-10、2018-02-24、2018-02-28、2018-03-03、2018-03-10、2018-03-17
    * 問題：這些日期的每一筆逐筆資料都被重複寫入一份，重複的那份成交時間錯位成 00:HH:MM（例如 01:23:45 變成 00:01:23），全部擠在 00:00～00:04，使該段夜盤成交量變成 2 倍；期貨分K 同日期 00:00～00:04 的成交量也因此偏高
    * 夜盤歸屬下一個交易日，所以實際受影響的是**這些日期之後第一個交易日的夜盤**，例如 2018-02-10 的資料屬於 2018-02-12 的夜盤
    * 已移除重複列，逐日比對筆數與成交量後上線；2018-03-24 之後的日期，以及同期間的一般交易日，都沒有這個問題

#### 2026-09-13
* 新增 [期貨分K TaiwanFuturesKBar](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#k-taiwanfutureskbar-sponsor): 資料區間 2011-01-03 ~ now
* [期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[選擇權交易明細 TaiwanOptionTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick-backersponsor)：歷史資料補齊，**以下日期已重新產製並驗證，曾下載或查詢過這些日期的使用者請重新取得資料**
    * TaiwanFuturesTick **2019-04-19 ~ 2019-05-13**（共 20 個日曆日）：補回 16 個匯率、黃金與海外指數期貨商品（`GDF`、`NZF`、`OAF`、`OBF`、`OCF`、`OJF`、`OKF`、`OOF`、`RHF`、`RTF`、`TGF`、`TJF`、`XAF`、`XBF`、`XEF`、`XJF`）整段缺漏的逐筆資料；同區間其他商品不受影響
    * TaiwanFuturesTick **2014-03-19**：整日逐筆資料（235 個商品）已補齊。此日先前公告為無法補齊，現已取得完整資料並完成驗證，**2026-09-02 該則公告同步更正**
    * TaiwanOptionTick **2019-01-15 ~ 2019-06-28**（共 129 個日曆日、105 個交易日）：此區間先前在資料集說明標示為「缺少部分資料，不完整」，現已補齊完整，該但書同步移除
    * 三段皆逐日、逐商品比對筆數與成交量後才上線

#### 2026-09-06
* **資料校正公告**：以下資料集已完成資料校正並上線；**若您先前曾查詢或下載過相關期別／日期的資料，請重新取得**
    * [資產負債表 TaiwanStockBalanceSheet](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockbalancesheet)：**2024-06-30（113 年半年報）**單一期別資料缺漏，已完成回補，該期別涵蓋家數由 1,917 家增為 **2,233 家**（補回 316 家）；已逐季檢查 2014 ~ 2025 各期別，未再發現同規模的缺漏
        * 另有 **25 家**在 2024 上半年仍掛牌並完成申報，但公司後續已下市或終止公開發行，原始來源已不再提供其歷史財報頁面，**此部分無法補齊**
        * 同期間的 [綜合損益表 TaiwanStockFinancialStatements](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockfinancialstatements) 與 [現金流量表 TaiwanStockCashFlowsStatement](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockcashflowsstatement) 資料完整，不受本次問題影響
    * [除權除息結果表 TaiwanStockDividendResult](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdividendresult)：**2026-09-02** 上市 (TWSE) 資料當日一度僅有部分公司，已補齊為當日全部 20 家
        * 原因：當日有除權個股的權值加息值超過 1,000、數值帶千分位符號，導致該日整批資料寫入失敗；解析方式已修正，往後不會再發生

#### 2026-09-02
* **資料校正公告**：[期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[選擇權交易明細 TaiwanOptionTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick-backersponsor)：夜盤逐筆資料校正，**以下日期已重新產製並驗證，曾下載或查詢過這些日期的使用者請重新取得資料**
    * TaiwanFuturesTick：**2026-08-14**、**2019-04-19、2019-05-17、2019-06-21、2019-07-01、2019-07-03、2019-07-11**（以上皆補回 15:00～24:00 夜盤）、**2020-02-01**（週六檔移除重複列）
    * TaiwanOptionTick：**2026-08-14**（補回 15:00～24:00 夜盤）
    * 2026-08-14 的原因：每個交易日的夜盤（當天 15:00 起至隔天 05:00）依規則歸屬於**下一個交易日**，資料要到下一個交易日才會完整；但當天的整日檔會在當晚先行產出，再由隔天的例行作業補上夜盤。08-14 那個週末因週六檔案提前產出，例行補產被跳過，週五整日檔便停留在沒有夜盤的版本；由於逾 14 天的歷史日改由整日檔提供查詢，此問題於 08-28 起才顯現。這是單一週末的特殊情況——2017-05 夜盤上線以來的其他交易日已逐日全量比對，均無此問題；產檔邏輯已修正，不再依賴隔日例行作業
    * 2019 年 6 天的原因：當年歷史回補漏掉週五夜盤的前半段，本次已補齊並驗證
    * 2011～2018 逐日檢查：僅 **2014-03-19** 整日逐筆資料缺漏（**2026-09-13 更正：該日資料已取得並補齊，詳見上方公告**）

#### 2026-09-01
* **資料校正公告**：以下資料集經稽核後已完成歷史資料校正並上線；若您先前已下載這些資料，建議重新取得
    * [台灣還原股價 TaiwanStockPriceAdj](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpriceadj-backersponsor)：除權息遇休市順延、減資與除權息併存等情況的還原計算已修正，全歷史重算
    * [個股融資融劵表 TaiwanStockMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginpurchaseshortsale)：上櫃 (TPEX) 個股融券買進 / 賣出兩欄先前對調，已修正（融券餘額不受影響）
    * [期貨價差行情表 TaiwanFuturesSpreadTrading](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesspreadtrading-backersponsor)：負價差先前被存成正值，已完成全歷史重建
    * [台股產業鏈資金流向 TaiwanStockIndustryChainMoneyFlow](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockindustrychainmoneyflow-sponsor)：市場口徑固定為上市 + 上櫃 + 興櫃，全歷史重建，數值與先前不同
    * [台股分 K TaiwanStockKBar](https://finmind.github.io/tutor/TaiwanMarket/Technical/#k-taiwanstockkbar-sponsor)：部分交易日成交量因重複計入而偏高，整日檔已重新產製
    * [期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[選擇權交易明細 TaiwanOptionTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick-backersponsor)：2019 ~ 2020 整日檔的 `contract_date` 含空白、部分交易日缺漏，已重產並補齊
    * [台灣股票下市櫃表 TaiwanStockDelisting](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdelisting)：補齊上櫃 (TPEX) 終止上櫃資料
    * [股價日成交資訊 TaiwanStockPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockprice) 等日頻資料集（PER、法人買賣、融資融券、當沖、外資持股）與 [每 5 秒指數統計 TaiwanStockEvery5SecondsIndex](https://finmind.github.io/tutor/TaiwanMarket/Technical/#5-taiwanstockevery5secondsindex-backersponsor)：補齊週六補行交易日資料與缺漏的指數

#### 2026-08-20
* [台股分 K 資料表 TaiwanStockKBar](https://finmind.github.io/tutor/TaiwanMarket/Technical/#k-taiwanstockkbar-sponsor) 新增**加權指數分 K**：`data_id` 帶 `TAIEX` 即可查詢，資料區間 **2005-01-03 ~ now**（比個股分 K 的 2019-01-01 更長），每個交易日 271 筆、涵蓋 09:00 ~ 13:30 每分鐘一筆
    * 指數本身沒有成交量，`volume` 固定為 0；`open` / `high` / `low` / `close` 為該分鐘內的指數值

#### 2026-08-09
* [台股選擇權即時資訊 taiwan_options_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_options_snapshot-sponsor) 增開臺指選擇權**週五到期**契約：`data_id` 新增 `TXU`、`TXV`、`TXX`、`TXY`、`TXZ`（當月第 1 ~ 5 個星期五到期）。原有的 `TXO`（月選）與 `TX1` ~ `TX5`（週三到期）不受影響
    * 部分代碼在特定月份查無資料屬正常現象（契約尚未掛牌，或該月不存在對應週次，例如某月只有 4 個星期五）
* 新增 [個股融資維持率 TaiwanStockMarginMaintenance](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginmaintenance-sponsor)：資料區間 2001-01-05 ~ now（上櫃自 2007-01-04 起）。提供個股每日融資維持率(%)、融資成本線、融資餘額（張）與計算採用的融資成數；本資料集為**估算指標**（公開資訊未揭露個股層級的融資金額），與其他服務的數字不會一致，詳見文件說明

#### 2026-08-08
* 新增 [資產交換固定收益日成交資訊 TaiwanAssetSwapFixedIncomeDaily](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanassetswapfixedincomedaily-backersponsor)：資產交換（Asset Swap）固定收益端的每日成交統計，欄位含名目本金 `notional_amount`、成交筆數 `number_of_transactions`、最低／最高／平均利率 `rate_lowest`／`rate_highest`／`rate_average`、合約年期 `contract_term_years`；資料區間 2011-05-03 ~ now
* 新增 [資產交換選擇權日成交資訊 TaiwanAssetSwapOptionDaily](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanassetswapoptiondaily-backersponsor)：資產交換選擇權端的每日成交統計，欄位含名目本金 `notional_amount`、成交筆數 `number_of_transactions`、最低／最高／平均權利金 `premium_lowest`／`premium_highest`／`premium_average`、合約年期 `contract_term_years`；資料區間 2011-05-03 ~ now
    * :warning: 這兩個資料集的 `data_id`（`stock_id`）為**可轉債代號**（例 `17172`），不是普通股代號；帶普通股代號（例 `2330`）會查不到資料

#### 2026-08-03
* [服務狀態與可用率 ServiceStatus](https://finmind.github.io/ServiceStatus/) 可用率演算法調整：改以**請求數**計算（可用率 % = 成功請求 ÷ 有效請求 × 100），不再以「未中斷的分鐘數佔比」衡量；24 小時、90 天與當月數字皆為該區間內請求數加總後計算，錯誤比例會等比反映在可用率上
    * 狀態分級門檻同步調整為 **Operational ≥ 99.5%**、**Elevated Error Rates 95%～99.5%**、**Partial Outage 80%～95%**、**Major Outage < 80%**（原 Degraded Performance 更名為 Elevated Error Rates）

#### 2026-07-29
* [期貨價差每筆成交資料 TaiwanFuturesSpreadTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesspreadtick-sponsor) 修正資料缺漏問題。2026-06-12 起的資料已完成校正；2026-06-11 以前的資料存在缺漏、無法補齊，建議研究用途以 2026-06-12 起的資料為準

#### 2026-07-23
* 新增 [可轉債賣回權時程 TaiwanStockConvertibleBondPutProvision](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondputprovision-backersponsor)：每檔可轉債的賣回基準日、賣回金額、賣回收益率，含未來已公告場次；資料區間 2011-06-22 ~ now

#### 2026-07-21
* 新增 [台股產業鏈資金流向 TaiwanStockIndustryChainMoneyFlow](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockindustrychainmoneyflow-sponsor)：資料區間 1992-01-04 ~ now

#### 2026-07-13
* 新增 [主動式ETF每日持股明細 TaiwanStockActiveETFHolding](https://finmind.github.io/tutor/TaiwanMarket/Chip/#etf-taiwanstockactiveetfholding-sponsor)：資料區間 2025-05-05 ~ now
* 新增 [主動式ETF每日持股異動（買賣）TaiwanStockActiveETFHoldingChange](https://finmind.github.io/tutor/TaiwanMarket/Chip/#etftaiwanstockactiveetfholdingchange-sponsor)：資料區間 2025-05-05 ~ now
* 新增 [主動式ETF清單 TaiwanStockActiveETFInfo](https://finmind.github.io/tutor/TaiwanMarket/Chip/#etf-taiwanstockactiveetfinfo)：台灣掛牌主動式 ETF（上市 TWSE + 上櫃 TPEX）清單／基本資料，欄位含 `date`、`stock_id`（ETF 代號）、`stock_name`（ETF 名稱）、`category`（ETF 分類：domestic 國內／foreign 跨國）、`type`（市場別：twse 上市／tpex 上櫃）

#### 2026-07-12
* 新增 [免責聲明與資料授權說明](https://finmind.github.io/Disclaimer/) 頁面：說明 FinMind 之資料來源與授權依據（經政府資料開放平臺取得之資料，依《政府資料開放授權條款》使用）、使用者取得之授權範圍（本服務之使用權，不含對外再散布／轉售／鏡像），以及資料僅供參考等免責事項

#### 2026-07-01
* 新增 [臺指選擇權波動率指數 TaiwanOptionVix](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptionvix-backersponsor)：資料區間 2026-03-01 ~ now
* 新增 [可轉換公司債月份分析表 TaiwanStockConvertibleBondMonthlyAnalysis](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondmonthlyanalysis-backersponsor)：資料區間 2026-05-01 ~ now

#### 2026-06-15
* [台股權證標的對照表 TaiwanStockInfoWithWarrantSummary](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockinfowithwarrantsummary-sponsor) 新增**上櫃 (TPEX)** 權證的標的（母股）對照涵蓋（原本僅上市 TWSE）；上櫃權證標的對照歷史回溯至 2011-01-03，可用母股代碼反查其對應權證（含已到期、代碼重用的歷史權證）
* [台股權證分點資料表 TaiwanStockWarrantTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#query-by-taiwanstockwarranttradingdailyreport-sponsor) 新增 storage_objects 一次取得整日資料的下載方式（只限 sponsorpro 會員）；歷史資料亦可下載

#### 2026-06-13
* 新增 [個股三大法人買賣表（寬表）TaiwanStockInstitutionalInvestorsBuySellWide](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysellwide)：與 `TaiwanStockInstitutionalInvestorsBuySell` 相同資料，改為寬表（橫式），每個交易日一列、各法人別買賣攤平成獨立欄位（外資、外資自營商、投信、自營商及其自行買賣／避險），免自行轉置。欄位涵蓋所有歷史法人別分類，尚未存在的年代該欄為 0（自營商於 2014-12-01 由合併拆為自行買賣／避險、外資自營商於 2018-01-15 起提供）；資料區間 2005-01-01 ~ now
* FinMind Python 套件新增支援 **Python 3.12**（持續支援 Python 3.8–3.11）。本版起套件相依升級為 `pandas>=2.0`、`ta>=0.11`（`numpy`、`pydantic` 維持不變）。
    * 呼叫 FinMind 的程式碼**無需修改**：`DataLoader`、策略 (Strategy)、繪圖等對外介面皆不變。
    * :warning: **升級須知**：安裝／升級會一併將環境中的 `pandas` 升至 2.x、`ta` 升至 0.11。若你**其餘自有程式碼**仍使用 pandas 1.x 在 2.0 已移除的寫法，需自行調整，常見如：`df.append()` → `pd.concat([...])`、`df.to_dict("r")` → `df.to_dict("records")`、`df.iteritems()` → `df.items()`。若暫時無法調整，可先固定安裝舊版 FinMind。

#### 2026-06-09
* 新增 [期貨價差每筆成交資料 TaiwanFuturesSpreadTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesspreadtick-sponsor)（只限 sponsor 會員）：提供期貨價差（近月/遠月）每筆成交，含到期月份、成交時間、價差成交價、成交量、近月價格、遠月價格、是否價差對價差成交；單次請求只提供一天資料，資料自 2026-04-27 起逐交易日累積（暫不含更早歷史回補）

#### 2026-06-05
* [台股分 K TaiwanStockKBar](https://finmind.github.io/tutor/TaiwanMarket/Technical/#k-taiwanstockkbar-sponsor)、[期貨交易明細 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)、[選擇權交易明細 TaiwanOptionTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick-backersponsor) 新增 storage_objects 一次取得整日資料下載方式（只限 sponsorpro 會員）；歷史資料亦可下載

#### 2026-06-03
* 新增 [服務狀態與可用率 ServiceStatus](https://finmind.github.io/ServiceStatus/) 頁面：提供公開即時狀態頁 [status.finmindtrade.com](https://status.finmindtrade.com)，說明 API 可用率 (uptime) 的計算方式與狀態分級（Operational / Degraded Performance / Partial Outage / Major Outage），作為企業方案 SLA 的衡量基準

#### 2026-05-23
* 新增 [台股指數代號對照表 IndexCodes](https://finmind.github.io/tutor/TaiwanMarket/IndexCodes/)：[台股即時資訊 taiwan_stock_tick_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_stock_tick_snapshot-sponsor) 的 `data_id` 除 4 碼個股代號外，亦支援 91 個 3 碼指數代號（例 `001` 加權指數、`101` 櫃買加權），完整對照分為大盤 / 產業 / 主題 Smart Beta / 槓桿反向 五組

#### 2026-05-22
* [月營收表 TaiwanStockMonthRevenue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue) 新增**建立時間** `create_time` 欄位（YYYY-MM-DD）；舊歷史資料為空字串

#### 2026-05-19
* 以下資料集新增**興櫃 (Emerging)** 公司涵蓋（以 `stock_id` 區分上市/上櫃/興櫃，可搭配 `TaiwanStockInfo` 查詢市場別）：
    * [月營收表 TaiwanStockMonthRevenue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue)
    * [綜合損益表 TaiwanStockFinancialStatements](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockfinancialstatements)
    * [資產負債表 TaiwanStockBalanceSheet](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockbalancesheet)
    * [現金流量表 TaiwanStockCashFlowsStatement](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockcashflowsstatement)
    * [個股三大法人買賣表 TaiwanStockInstitutionalInvestorsBuySell](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysell)

#### 2026-05-06
* [台股分點資料表 TaiwanStockTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/) storage_objects 文件補上 FinMind package 範例 (`taiwan_stock_trading_daily_report(use_object=True)`)

#### 2026-05-05
* [台股分點資料表 TaiwanStockTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/) 新增 storage_objects 一次取得整日資料的下載方式（只限 sponsorpro 會員）

#### 2026-05-02
* 新增「[更新 Token](https://finmind.github.io/update_token/)」功能：可在使用者資訊頁面自主重置 Token，舊 Token 立即失效，無需聯繫客服

#### 2026-04-30
* 新增 [借貸款項擔保品餘額表 TaiwanStockLoanCollateralBalance](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockloancollateralbalance-sponsor)

#### 2026-04-28
* 新增 [鉅額交易日成交資訊 TaiwanStockBlockTrade](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockblocktrade-sponsor)

#### 2026-04-19
* 新增 [現股當日沖銷券差借券費率 TaiwanStockDayTradingBorrowingFeeRate](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockdaytradingborrowingfeerate-backersponsor)

#### 2026-04-17
* 新增 [鉅額交易買賣日報表 TaiwanStockBlockTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockblocktradingdailyreport-sponsor)

#### 2026-04-12
* [TaiwanStockPriceLimit](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricelimit-backersponsor) 文件補充：0 代表無漲跌幅限制

#### 2026-04-03
* 新增 async 批次查詢範例

#### 2026-03-28
* 更新 [TaiwanStockDispositionSecuritiesPeriod](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockdispositionsecuritiesperiod-backersponsor) 文件，補充 ESB、TWSE 資料

#### 2026-03-26
* 修正股權持股分級表資料區間誤植

#### 2026-03-21
* [Agent Skill](https://finmind.github.io/tutor/ai/AgentSkill/) 新增 Claude Code、Cursor、Windsurf、Gemini 多工具安裝說明與範例截圖
* 更新 [聯絡方式](https://finmind.github.io/Contact/)：Gitter 改為 Facebook 社團與粉絲專頁

#### 2026-03-20
* 新增 [Agent Skill](https://finmind.github.io/tutor/ai/AgentSkill/) 文件，可在 Claude Code 等工具中透過 skill 快速查詢 FinMind 資料

#### 2026-03-10
* 新增 [llms.txt](https://finmind.github.io/llms.txt) 與 [llms-full.txt](https://finmind.github.io/llms-full.txt)，讓 AI 工具更快速理解 FinMind 文件
* 新增 TaiwanStockPriceTick object method 文件
* 首頁新增 LLM / AI 整合區塊

#### 2026-03-06
* 新增 [每日漲跌停價 TaiwanStockPriceLimit](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricelimit-backersponsor)

#### 2026-02-22
* 更新期貨及選擇權即時資訊文件，補充支援代碼及空值取得全部說明

#### 2026-02-07
* 新增 [期貨價差行情表 TaiwanFuturesSpreadTrading](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesspreadtrading-backersponsor)

#### 2026-02-01
* 新增 [期貨最後結算價 TaiwanFuturesFinalSettlementPrice](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesfinalsettlementprice-backersponsor)
* 新增 [選擇權最後結算價 TaiwanOptionFinalSettlementPrice](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptionfinalsettlementprice-backersponsor)

#### 2026-01-31
* [TaiwanStockSuspended](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstocksuspended-backersponsor)、[TaiwanStockDayTradingSuspension](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockdaytradingsuspension-backersponsor) 新增 FinMind package 範例

#### 2026-01-24
* 新增 [台股暫停交易公告 TaiwanStockSuspended](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstocksuspended-backersponsor)
* 新增 [暫停先賣後買當沖預告表 TaiwanStockDayTradingSuspension](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockdaytradingsuspension-backersponsor)

#### 2026-01-23
* 文件新增英文翻譯

#### 2026-01-22
* 更新 taiwan_options_snapshot 文件

#### 2026-01-18
* 移除 API URL query 中的 token 參數，改由 header 傳遞

#### 2026-01-04
* 移除 `login` 函式，登入僅支援 `login_by_token`

#### 2025-12-15
* 強化 tick data async 使用文件

#### 2025-10-06
* 新增 [股利政策表 TaiwanStockDividend](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdividend)

#### 2025-09-21
* [每 5 秒指數統計 TaiwanStockEvery5SecondsIndex](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockevery5secondsindex-backersponsor) 新增 kind 參數

#### 2025-09-11
* FinMind package 新增 async 批次查詢功能

#### 2025-08-31
* 新增 [台灣股票變更面額恢復買賣參考價格 TaiwanStockParValueChange](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockparvaluechange)

#### 2025-08-13
* 新增暫停先賣後買標記、修正期貨、選擇權三大法人文件

#### 2025-07-20
* 新增 [台股權證標的對照表 TaiwanStockInfoWithWarrantSummary](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockinfowithwarrantsummary-sponsor)
* 新增 [台股交易日 TaiwanStockTradingDate](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstocktradingdate)
* 新增 [台股分割後參考價 TaiwanStockSplitPrice](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstocksplitprice)

#### 2025-05-25
* [台股分點資料表 TaiwanStockTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktradingdailyreport-sponsor) 新增 FinMind package 範例
* [台股權證分點資料表 TaiwanStockWarrantTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockwarranttradingdailyreport-sponsor) 新增 FinMind package 範例

#### 2025-05-11
* 新增 [美國股價分 K 資料表 USStockPriceMinute](https://finmind.github.io/tutor/UnitedStatesMarket/Technical/#usstockpriceminute-backersponsor)
* [個體公司所屬產業鏈 TaiwanStockIndustryChain](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanstockindustrychain-backersponsor) 新增 FinMind package 範例

#### 2025-05-10
* 新增 [每 5 秒指數統計 TaiwanStockEvery5SecondsIndex](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockevery5secondsindex-backersponsor)
* API 驗證方式調整，token 改由 header `Authorization: Bearer <token>` 傳遞

#### 2025-04-06
* 新增 [個體公司所屬產業鏈 TaiwanStockIndustryChain](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanstockindustrychain-backersponsor)

#### 2025-02-09
* 新增 [公布處置有價證券表 TaiwanStockDispositionSecuritiesPeriod](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockdispositionsecuritiesperiod-backersponsor)

#### 2025-01-05
* TaiwanStockConvertibleBond、CnnFearGreedIndex、Futures/OptionOpenInterestLargeTraders、Futures/OptionInstitutionalInvestorsAfterHours、TaiwanStockHoldingSharesPer 開放 backer 會員使用

#### 2024-12-23
* FinMind package 新增 async 批次查詢功能

#### 2024-12-07
* [TaiwanBusinessIndicator](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanbusinessindicator-backersponsor)、[CnnFearGreedIndex](https://finmind.github.io/tutor/Others/#cnnfeargreedindex) 補上資料區間說明

#### 2024-12-01
* 新增 [台灣每月景氣對策信號表 TaiwanBusinessIndicator](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanbusinessindicator-backersponsor)

#### 2024-11-17
* 新增 [台股市值比重表 TaiwanStockMarketValueWeight](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmarketvalueweight-backersponsor)

#### 2024-10-12
* 新增 [期貨大額交易人未沖銷部位 TaiwanFuturesOpenInterestLargeTraders](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesopeninterestlargetraders-backersponsor)
* 新增 [選擇權大額交易人未沖銷部位 TaiwanOptionOpenInterestLargeTraders](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptionopeninterestlargetraders-backersponsor)
* 新增 [期貨夜盤三大法人買賣 TaiwanFuturesInstitutionalInvestorsAfterHours](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesinstitutionalinvestorsafterhours-backersponsor)
* 新增 [選擇權夜盤三大法人買賣 TaiwanOptionInstitutionalInvestorsAfterHours](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptioninstitutionalinvestorsafterhours-backersponsor)

#### 2024-09-28
* 新增 [API 使用量查詢](https://finmind.github.io/api_usage_count/)，可透過 package 查看 api_usage、api_usage_limit

#### 2024-09-26
* [TaiwanStockTradingDailyReportSecIdAgg](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktradingdailyreportsecidagg-sponsor) 新增 securities_trader_id、end_date 參數

#### 2024-08-25
* 新增 [當日卷商分點統計表 TaiwanStockTradingDailyReportSecIdAgg](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktradingdailyreportsecidagg-sponsor)

#### 2024-07-14
* 新增 [台股週 K 資料表 TaiwanStockWeekPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockweekprice-backersponsor)
* 新增 [台股月 K 資料表 TaiwanStockMonthPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockmonthprice-backersponsor)

#### 2024-05-28
* 新增 [台灣大盤融資維持率 TaiwanTotalExchangeMarginMaintenance](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwantotalexchangemarginmaintenance-backersponsor)

#### 2024-05-19
* 新增 [證券商資訊表 TaiwanSecuritiesTraderInfo](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwansecuritiestraderinfo) FinMind package 範例
* 新增 [減資恢復買賣參考價格 TaiwanStockCapitalReductionReferencePrice](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockcapitalreductionreferenceprice) 資料區間說明

#### 2024-05-08
* 移除匯率資料源

#### 2024-04-18
* 新增 [暫停融券賣出表(融券回補日) TaiwanStockMarginShortSaleSuspension](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginshortsalesuspension)

#### 2024-04-01
* [可轉債](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/) 系列資料集新增 FinMind package 範例

#### 2024-03-24
* 新增可轉債系列資料集：
    * [可轉債總覽 TaiwanStockConvertibleBondInfo](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondinfo-backersponsor)
    * [可轉債日成交資訊 TaiwanStockConvertibleBondDaily](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebonddaily-backersponsor)
    * [可轉債三大法人日交易資訊 TaiwanStockConvertibleBondInstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondinstitutionalinvestors-backersponsor)
    * [可轉債每日總覽資訊 TaiwanStockConvertibleBondDailyOverview](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebonddailyoverview-backersponsor)

#### 2024-03-19
* 新增 [台灣股票下市櫃表 TaiwanStockDelisting](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdelisting)

#### 2024-01-27
* 全市場資料集補上欄位 schema 說明文件

#### 2021-10-06
* release FinMind package 1.5.3，處理 connect error 問題
* 增加 FinMind package 文件

#### 2021-08-01
* 由於資料源問題，移除即時報價

#### 2021-05-23
* 新增 [信用額度總量管制餘額表 TaiwanDailyShortSaleBalances](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwandailyshortsalebalances)

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




