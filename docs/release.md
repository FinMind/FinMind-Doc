## version: 2.1.0 (2026-10-24)

## What's Changed
* chore(deps): 升級有資安漏洞的相依套件 by @linsamtw in https://github.com/FinMind/FinMind/pull/480

## 升級須知
* 升級有資安漏洞的相依套件；`ipython` 最低版本改為 8.10.0（原本為 `<8.0.0`）。呼叫 FinMind 的程式碼**無需修改**。
* `pip install -U FinMind` 不會自動升級環境中已安裝的其他套件，建議一併升級：`pip install -U FinMind certifi aiohttp urllib3 requests pyarrow numpy`
* 部分套件的修補版已不支援 Python 3.8、3.9，建議改用 Python 3.10 以上。
* `pyarrow` 26 需搭配 `numpy` 2.x；若以 `use_object=True` 下載整日資料時出現找不到 pyarrow 的錯誤，請升級 `numpy`。



:zap: release_at: 2026-10-24 04:25:15

## version: 2.0.13 (2026-10-23)

## What's Changed
* feat: 新增台股財報與年報檔案 TaiwanStockFinancialReportFile (Sponsor Pro) by @linsamtw in https://github.com/FinMind/FinMind/pull/477
* feat: taiwan_stock_financial_report_file 改為 year + quarter 查詢 by @linsamtw in https://github.com/FinMind/FinMind/pull/478
* feat: add TaiwanStockAfterHoursFixedPriceTrading by @linsamtw in https://github.com/FinMind/FinMind/pull/476




:zap: release_at: 2026-10-23 18:06:35

## version: 2.0.12 (2026-10-17)

## What's Changed
* docs: clarify point-in-time semantics for fundamental data by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/446
* docs(skill): 整日全市場下載清單補上 TaiwanFuturesKBar by @linsamtw in https://github.com/FinMind/FinMind/pull/473
* feat(sdk): taiwan_stock_trading_daily_report_secid_agg 支援 use_object 整日下載 by @linsamtw in https://github.com/FinMind/FinMind/pull/474




:zap: release_at: 2026-10-17 05:21:29

## version: 2.0.11 (2026-10-04)

## What's Changed
* feat: 逐筆／分K 不帶代號直接報錯；taiwan_futures_kbar 支援 use_object by @linsamtw in https://github.com/FinMind/FinMind/pull/470
* feat: 新增每日個股主力集中度 TaiwanStockBrokerDailyConcentration by @machineCYC in https://github.com/FinMind/FinMind/pull/471




:zap: release_at: 2026-10-04 02:23:20

## version: 2.0.10 (2026-09-17)

## What's Changed
* feat(taiwan_stock_kbar): docstring 補上加權指數 stock_id="TAIEX" 並加測試 by @linsamtw in https://github.com/FinMind/FinMind/pull/466
* Feat/taiwan futures k bar by @machineCYC in https://github.com/FinMind/FinMind/pull/458
* feat: get_object 下載中斷時自動以 Range 續傳並驗證完整性 by @linsamtw in https://github.com/FinMind/FinMind/pull/469




:zap: release_at: 2026-09-17 10:56:02

## version: 2.0.9 (2026-08-19)

## What's Changed
* fix(backtest): 配股不應增加總持有成本 (#453) by @linsamtw in https://github.com/FinMind/FinMind/pull/457
* ci: 讓 fork PR 也能跑完整測試（雙觸發器 + fork-ci 核准閘門） by @linsamtw in https://github.com/FinMind/FinMind/pull/460
* ci: 修好 fork PR 的 checkout（lint 移回 pull_request、build opt-in） by @linsamtw in https://github.com/FinMind/FinMind/pull/462
* fix: replace deprecated Pydantic dict calls by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/451
* docs: add contributor setup and refresh repository links by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/450
* fix: include transaction fee in buy affordability check by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/448
* ci: 讓每個 check 名稱唯一，並用 gate job 讓 branch protection 真正有效 by @linsamtw in https://github.com/FinMind/FinMind/pull/463
* test: remove false-positive and shadowed tests by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/447
* fix: 上櫃 ETF 回測被課 3 倍證交稅 by @linsamtw in https://github.com/FinMind/FinMind/pull/464

## New Contributors
* @ting-hong-shieh made their first contribution in https://github.com/FinMind/FinMind/pull/451



:zap: release_at: 2026-08-19 18:51:49

## version: 2.0.8 (2026-08-15)

## What's Changed
* fix: 支援 Python 3.13 / 3.14 安裝（放寬 lxml 上限） by @linsamtw in https://github.com/FinMind/FinMind/pull/456




:zap: release_at: 2026-08-15 11:38:23

## version: 2.0.7 (2026-08-10)

## What's Changed
* feat: add TaiwanStockIndustryChainMoneyFlow (台股產業鏈資金流向) by @linsamtw in https://github.com/FinMind/FinMind/pull/438
* feat: add taiwan_stock_convertible_bond_put_provision（可轉債賣回權時程） by @linsamtw in https://github.com/FinMind/FinMind/pull/439
* docs(skill): storage 整日下載移除「無歷史回補」，補各資料集最早可取得日 by @linsamtw in https://github.com/FinMind/FinMind/pull/444
* feat: 新增 TaiwanStockMarginMaintenance（個股融資維持率） by @linsamtw in https://github.com/FinMind/FinMind/pull/443
* fix: get_asset_underlying_type 不再受 TaiwanStockInfo 重複列的回傳順序影響 by @linsamtw in https://github.com/FinMind/FinMind/pull/445




:zap: release_at: 2026-08-10 11:45:23

## version: 2.0.6 (2026-07-25)

## What's Changed
* add: taiwan asset sqap daily data by @machineCYC in https://github.com/FinMind/FinMind/pull/440




:zap: release_at: 2026-07-25 13:10:21

## version: 2.0.5 (2026-07-18)

## What's Changed
* docs(skill): 新增 TaiwanOptionVix & ConvertibleBondMonthlyAnalysis 至 skill 資料集清單 by @linsamtw in https://github.com/FinMind/FinMind/pull/430
* feat: 主動式ETF 三資料集 SDK（持股明細 + 持股異動 + 清單）合併 by @linsamtw in https://github.com/FinMind/FinMind/pull/436




:zap: release_at: 2026-07-18 05:31:15

## version: 2.0.4 (2026-06-26)

## What's Changed
* docs(skill): add emerging-board data caveats to dataset reference by @linsamtw in https://github.com/FinMind/FinMind/pull/426
* Add taiwan_option_vix dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/428
* Add: taiwan_stock_convertible_bond_monthly_analysis dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/429




:zap: release_at: 2026-06-26 13:01:24

## version: 2.0.3 (2026-06-15)

## What's Changed
* fix: 傳入 stock_id_list 時自動走 async，修正回傳空 DataFrame by @linsamtw in https://github.com/FinMind/FinMind/pull/423




:zap: release_at: 2026-06-15 16:42:15

## version: 2.0.2 (2026-06-15)

## What's Changed
* feat: taiwan_stock_warrant_trading_daily_report 支援 use_object 整日下載 by @linsamtw in https://github.com/FinMind/FinMind/pull/421
* deps: 放寬版本上限並升級至 pydantic v2，消除 pip 安裝衝突 by @linsamtw in https://github.com/FinMind/FinMind/pull/422




:zap: release_at: 2026-06-15 16:26:22

## version: 2.0.1 (2026-06-14)

## What's Changed
* feat: add taiwan_stock_institutional_investors_wide (個股三大法人買賣表寬表) by @linsamtw in https://github.com/FinMind/FinMind/pull/418




:zap: release_at: 2026-06-14 05:39:02

## version: 2.0.0 (2026-06-13)

## What's Changed
* fix: 支援 Python 3.12（升級 pandas 2.x、ta 0.11） by @linsamtw in https://github.com/FinMind/FinMind/pull/420

## 升級須知 / Upgrade Notes
- 新增支援 **Python 3.12**（持續支援 3.8–3.11）。
- 本版起相依升級為 `pandas>=2.0`、`ta>=0.11`（`numpy`、`pydantic` 不變）。
- **呼叫 FinMind 的程式碼無需修改**：`DataLoader`、策略、繪圖等對外介面皆不變。
- :warning: 安裝／升級會一併把環境中的 `pandas` 升到 2.x、`ta` 升到 0.11。若你**其餘自有程式碼**仍使用 pandas 1.x 在 2.0 已移除的寫法，需自行調整，常見如：
    - `df.append()` → `pd.concat([...])`
    - `df.to_dict("r")` → `df.to_dict("records")`
    - `df.iteritems()` → `df.items()`
- 若暫時無法調整，可先固定安裝舊版 FinMind。



:zap: release_at: 2026-06-13 07:21:03

## version: 1.9.12 (2026-06-09)

## What's Changed
* ci: 從 pipenv 遷移到 uv by @linsamtw in https://github.com/FinMind/FinMind/pull/407
* docs(finmind skill): 補上 use_object 整日全市場批次下載說明 (PR #415) by @linsamtw in https://github.com/FinMind/FinMind/pull/416
* feat: add taiwan_futures_spread_tick (期貨價差每筆成交資料) by @linsamtw in https://github.com/FinMind/FinMind/pull/417




:zap: release_at: 2026-06-09 14:05:33

## version: 1.9.11 (2026-06-05)

## What's Changed
* docs: finmind skill 圖表改用中文，註冊 wqy-zenhei 解決 CJK 渲染 by @linsamtw in https://github.com/FinMind/FinMind/pull/410
* docs: taiwan_stock_tick_snapshot 補 data_id 指數代號說明 by @linsamtw in https://github.com/FinMind/FinMind/pull/413
* feat: taiwan_stock_kbar/futures_tick/option_tick 支援 use_object 整日下載 by @linsamtw in https://github.com/FinMind/FinMind/pull/415




:zap: release_at: 2026-06-05 13:28:56

## version: 1.9.10 (2026-05-05)

## What's Changed
* ci: pytest-xdist 加 --dist=loadfile，修 test_base.py 隨機 KeyError by @linsamtw in https://github.com/FinMind/FinMind/pull/409
* feat: taiwan_stock_trading_daily_report 支援 use_object 整日下載 by @linsamtw in https://github.com/FinMind/FinMind/pull/408




:zap: release_at: 2026-05-05 16:21:41

## version: 1.9.9 (2026-05-02)

## What's Changed
* docs: agent skill 補上 TaiwanStockBlockTrade / TaiwanStockLoanCollateralBalance by @linsamtw in https://github.com/FinMind/FinMind/pull/405
* ci: 升級 GitHub Actions 版本並修正 workflow 問題 by @linsamtw in https://github.com/FinMind/FinMind/pull/402
* feat: 新增 taiwan_stock_block_trade 與 taiwan_stock_loan_collateral_balance by @linsamtw in https://github.com/FinMind/FinMind/pull/406




:zap: release_at: 2026-05-02 05:02:06

## version: 1.9.8 (2026-04-22)

## What's Changed
* fix: raise informative error when API response lacks 'data' key by @linsamtw in https://github.com/FinMind/FinMind/pull/401




:zap: release_at: 2026-04-22 01:11:49

## version: 1.9.7 (2026-04-14)

## What's Changed
* TaiwanStockPriceTick data with object download by @machineCYC in https://github.com/FinMind/FinMind/pull/382
* feat: 新增 TaiwanStockPriceLimit 資料載入方法 by @linsamtw in https://github.com/FinMind/FinMind/pull/384
* docs: README 新增 LLM / AI Integration 區塊 by @linsamtw in https://github.com/FinMind/FinMind/pull/385
* feat: add llms-full.txt link to LLM/AI Integration section in README by @linsamtw in https://github.com/FinMind/FinMind/pull/386
* docs: 統一 llms-full.txt 連結為 finmind.github.io by @linsamtw in https://github.com/FinMind/FinMind/pull/387
* feat: mv LLM / AI 整合 to Top by @linsamtw in https://github.com/FinMind/FinMind/pull/388
* feat: 新增 Claude Code /finmind slash command by @linsamtw in https://github.com/FinMind/FinMind/pull/389
* docs: README 新增 Agent Skill 教學連結 by @linsamtw in https://github.com/FinMind/FinMind/pull/390
* docs: 更新 finmind skill 新增特殊 endpoint 與資料區間 by @linsamtw in https://github.com/FinMind/FinMind/pull/394
* docs: 更新 finmind skill rate limits by @linsamtw in https://github.com/FinMind/FinMind/pull/396
* docs: 重寫 finmind skill，改善結構與查詢效率 by @linsamtw in https://github.com/FinMind/FinMind/pull/399
* Add taiwanstockdaytradingborrowingfeerate dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/393




:zap: release_at: 2026-04-14 16:48:46

## version: 1.9.6 (2026-02-22)

## What's Changed
* feat: add TaiwanFuturesSpreadTrading 期貨價差行情表 by @linsamtw in https://github.com/FinMind/FinMind/pull/379




:zap: release_at: 2026-02-22 16:11:23

## version: 1.9.5 (2026-02-03)

## What's Changed
* feat: add taiwan futures/option final settlement price methods by @linsamtw in https://github.com/FinMind/FinMind/pull/378




:zap: release_at: 2026-02-03 17:04:24

## version: 1.9.4 (2026-01-31)

## What's Changed
* feat: add TaiwanStockSuspended and TaiwanStockDayTradingSuspension datasets by @linsamtw in https://github.com/FinMind/FinMind/pull/377




:zap: release_at: 2026-01-31 02:16:26

## version: 1.9.3 (2026-01-04)

## What's Changed
* feat: The login function has been removed; only login_by_token can be used. by @linsamtw in https://github.com/FinMind/FinMind/pull/375




:zap: release_at: 2026-01-04 14:06:32

## version: 1.9.2 (2025-12-15)

## What's Changed
* feat: add unique in _get_stock_id_list by @linsamtw in https://github.com/FinMind/FinMind/pull/373




:zap: release_at: 2025-12-15 12:53:25

## version: 1.9.1 (2025-12-10)

## What's Changed
* add: stock id list auto in taiwan_stock_trading_daily_report function by @machineCYC in https://github.com/FinMind/FinMind/pull/372




:zap: release_at: 2025-12-10 14:58:16

## version: 1.9.0 (2025-11-23)

## What's Changed
* feat: enhance async by @linsamtw in https://github.com/FinMind/FinMind/pull/366

1️⃣ 批次與併發控制

避免一次大量（例如 2000 筆） async request 導致網路錯誤或連線被拒
新增 semaphore 控制同時執行的 request 數量
支援分批處理（batch），每批數量可手動設定或自動依機器資源調整
2️⃣ 共享 Session 提升效率

所有 request 使用同一個 requests.Session，重複利用 TCP 連線
減少連線建立成本，提高抓取速度
3️⃣ 錯誤處理與 retry 機制

request 若失敗會自動 retry，減少抓取失敗
非同步請求回傳 None 時會自動過濾，避免 AttributeError
4️⃣ 進度追蹤

使用 tqdm 顯示每批 request 完成進度
可以即時看到抓取進度
5️⃣ 自動調整性能 (auto_tune)

根據機器 CPU 核心數與可用記憶體，自動調整 max_concurrency
適應不同環境，提高穩定性與效率



:zap: release_at: 2025-11-23 09:16:17

## version: 1.8.3 (2025-11-04)

## What's Changed
* feat: add verbose params, and replace logger.warning to logger.debug by @linsamtw in https://github.com/FinMind/FinMind/pull/365




:zap: release_at: 2025-11-04 15:47:29

## version: 1.8.2 (2025-08-09)

## What's Changed
* feat: add use_async in taiwan_stock_tick by @linsamtw in https://github.com/FinMind/FinMind/pull/353
* Add taiwan_stock_trading_date data by @machineCYC in https://github.com/FinMind/FinMind/pull/357
* Add new datasets by @machineCYC in https://github.com/FinMind/FinMind/pull/359




:zap: release_at: 2025-08-09 15:09:31

## version: 1.8.1 (2025-05-25)

## What's Changed
* feat: add taiwan_stock_warrant_trading_daily_report by @linsamtw in https://github.com/FinMind/FinMind/pull/349




:zap: release_at: 2025-05-25 13:48:01

## version: 1.8.0 (2025-05-10)

## What's Changed
* feat: rename setup-name by @linsamtw in https://github.com/FinMind/FinMind/pull/347
* feat: move token from params to headers by @linsamtw in https://github.com/FinMind/FinMind/pull/348




:zap: release_at: 2025-05-10 08:56:57

## version: 1.7.9 (2025-05-10)

## What's Changed
* feat: allow stock_ID to use List type in taiwan_stock_tick_snapshot by @linsamtw in https://github.com/FinMind/FinMind/pull/335
* add: TaiwanStockDispositionSecuritiesPeriod dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/340
* fix: typo by @linsamtw in https://github.com/FinMind/FinMind/pull/341
* New data TaiwanStockIndustryChain by @machineCYC in https://github.com/FinMind/FinMind/pull/343
* feat: add TaiwanStockEvery5SecondsIndex by @linsamtw in https://github.com/FinMind/FinMind/pull/346




:zap: release_at: 2025-05-10 05:10:47

## version: 1.7.8 (2024-12-25)

## What's Changed
* feat: add get taiwan_stock_trading_daily_report by async by @linsamtw in https://github.com/FinMind/FinMind/pull/331
* feat: add taiwan_stock_kbar use_async by @linsamtw in https://github.com/FinMind/FinMind/pull/333
* feat: add nest_asyncio for Jupyter Notebook by @linsamtw in https://github.com/FinMind/FinMind/pull/334




:zap: release_at: 2024-12-25 11:18:11

## version: 1.7.5 (2024-12-07)

## What's Changed
* feat: update taiwan_stock_market_value_weight tw name by @linsamtw in https://github.com/FinMind/FinMind/pull/329
* add: taiwan_business_indicator by @machineCYC in https://github.com/FinMind/FinMind/pull/330




:zap: release_at: 2024-12-07 02:31:43

## version: 1.7.4 (2024-11-23)

## What's Changed
* add: TaiwanStockMarketValueWeight data by @machineCYC in https://github.com/FinMind/FinMind/pull/327
* feat: add futures/option CNN_Cnn_Fear_Greed_Index by @richardkuo1999 in https://github.com/FinMind/FinMind/pull/328

## New Contributors
* @richardkuo1999 made their first contribution in https://github.com/FinMind/FinMind/pull/328



:zap: release_at: 2024-11-23 08:24:41

## version: 1.7.3 (2024-10-13)

## What's Changed
* feat: add futures/option institutional_investors_after_hours by @linsamtw in https://github.com/FinMind/FinMind/pull/322




:zap: release_at: 2024-10-13 16:46:34

## version: 1.7.2 (2024-10-13)

## What's Changed
* add: OpenInterestLargeTraders for option and futures by @machineCYC in https://github.com/FinMind/FinMind/pull/320
* feat: update FinMind 校園推廣方案.pdf by @linsamtw in https://github.com/FinMind/FinMind/pull/321




:zap: release_at: 2024-10-13 04:21:29

## version: 1.7.1 (2024-09-28)

## What's Changed
* feat: add api_usage_limit by @linsamtw in https://github.com/FinMind/FinMind/pull/318




:zap: release_at: 2024-09-28 09:55:48

## version: 1.7.0 (2024-09-26)

## What's Changed
* add: tw week and month price data by @machineCYC in https://github.com/FinMind/FinMind/pull/301
* add: taiwan_stock_trading_daily_report_secid_agg dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/302
* Add taiwan_stock_trading_daily_report_secid_agg and taiwan_stock_trading_daily_report  api by @machineCYC in https://github.com/FinMind/FinMind/pull/314
* feat: add format check in CI by @linsamtw in https://github.com/FinMind/FinMind/pull/313
* add: start and end date for taiwan_stock_trading_daily_report_secid_a… by @machineCYC in https://github.com/FinMind/FinMind/pull/317
* feat: add api_usage by @linsamtw in https://github.com/FinMind/FinMind/pull/315




:zap: release_at: 2024-09-26 15:21:47

## version: 1.6.9 (2024-05-27)

## What's Changed
* add: taiwan_total_exchange_margin_maintenance dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/298
* 292 大盤融資維持率 by @machineCYC in https://github.com/FinMind/FinMind/pull/300




:zap: release_at: 2024-05-27 15:46:14

## version: 1.6.7 (2024-05-23)

## What's Changed
* feat: add 暫停融券賣出表(融券回補日) TaiwanStockMarginShortSaleSuspension by @linsamtw in https://github.com/FinMind/FinMind/pull/296
* fix: backtest compute_div_income by @linsamtw in https://github.com/FinMind/FinMind/pull/297




:zap: release_at: 2024-05-23 05:42:24

## version: 1.6.6 (2024-03-31)

## What's Changed
* add taiwanstockdelisting dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/290
* fix: fractional part from stock_div must be cash refunds (#273) by @sakkyoi in https://github.com/FinMind/FinMind/pull/288
* feat: add ConvertibleBond by @linsamtw in https://github.com/FinMind/FinMind/pull/291

## New Contributors
* @sakkyoi made their first contribution in https://github.com/FinMind/FinMind/pull/288



:zap: release_at: 2024-03-31 16:22:36

## version: 1.6.5 (2024-01-15)

## What's Changed
* feat: raise Exception on request_get by @linsamtw in https://github.com/FinMind/FinMind/pull/286




:zap: release_at: 2024-01-15 13:48:26

## version: 1.6.4 (2023-12-06)

## What's Changed
* refactor: backtest by @linsamtw in https://github.com/FinMind/FinMind/pull/274
* feat: rm typing.Dict on add_indicators, add_buy_rule, add_sell_rule by @linsamtw in https://github.com/FinMind/FinMind/pull/276
* feat: add KdCrossOver, MAGoldenDeathCrossOver, InstitutionalInvestorsOverBuy, ShortSaleMarginPurchaseRatio by @linsamtw in https://github.com/FinMind/FinMind/pull/277




:zap: release_at: 2023-12-06 14:34:54

## version: 1.6.3 (2023-10-29)

## What's Changed
* add taiwan stock kbar data by @machineCYC in https://github.com/FinMind/FinMind/pull/272




:zap: release_at: 2023-10-29 12:54:42

## version: 1.6.2 (2023-09-24)

## What's Changed
* add: change the status code by @machineCYC in https://github.com/FinMind/FinMind/pull/262
* add: tw 10 year avg close by @machineCYC in https://github.com/FinMind/FinMind/pull/267
* add: remove the adj calculate code by @machineCYC in https://github.com/FinMind/FinMind/pull/269
* feat: Use pandas concat instead of append by @linsamtw in https://github.com/FinMind/FinMind/pull/265


:zap: release_at: 2023-09-24 07:24:55

## version: 1.6.1 (2023-06-22)

## What's Changed
* fix: ex_dividend_price end date need to be the same as the stock_price by @machineCYC in https://github.com/FinMind/FinMind/pull/252
* add: taiwan_securities_trader_info api in finmind package by @machineCYC in https://github.com/FinMind/FinMind/pull/256
* add: taiwan stock market value by @machineCYC in https://github.com/FinMind/FinMind/pull/257
* feat: add taiwan_stock_info_with_warrant, taiwan_stock_tick_snapshot, taiwan_futures_snapshot, taiwan_options_snapshot by @linsamtw in https://github.com/FinMind/FinMind/pull/258




:zap: release_at: 2023-06-22 05:51:52

## version: 1.5.8 (2022-09-13)

* feat: add 減資恢復買賣參考價格

:zap: release_at: 2022-09-13 15:47:08

## version: 1.5.7 (2022-09-06)

* feat: remove taiwan futopt institutional investors api, add taiwan_future_institutional_investors and taiwan_option_institutional_investors api

:zap: release_at: 2022-09-06 15:42:02

## version: 1.5.6 (2022-06-16)



:zap: release_at: 2022-06-16 10:45:04

## version: 1.5.5 (2021-11-02)

* feat: reset timeout defacut value None and logger.info timeout msg (#192)

:zap: release_at: 2021-11-02 11:15:11

## version: 1.5.4 (2021-10-31)

* Hotfix: fix some dependency issue (#190), 
* fix: remove error msg not show issue (#191)

:zap: release_at: 2021-10-31 16:53:19

## version: 1.5.3 (2021-10-06)

* fix: taiwan_futopt_daily_info (#189)

:zap: release_at: 2021-10-06 12:10:04

## version: 1.5.2 (2021-10-06)

* debug: Unable to parse datetime string 

:zap: release_at: 2021-10-06 11:17:40

## version: 1.5.1 (2021-10-05)

* feat: handle connection errors


:zap: release_at: 2021-10-05 17:29:22

## version: 1.5.0 (2021-09-11)

* feat: add timeout and retry on request get 
* feat: add timeout params, default 30 seconds

:zap: release_at: 2021-09-11 18:00:16

## version: 1.4.9 (2021-07-25)

* feat: add flask post.html 

:zap: release_at: 2021-07-25 05:52:39

## version: 1.4.8 (2021-07-11)

* feat: add bar, line, pie plot, 
* feat: add TaiwanStockTotalReturnIndex
* feat: change numpy version

:zap: release_at: 2021-07-11 14:30:37

## version: 1.4.7 (2021-07-03)

* fix: data loader pd.Period convert 

:zap: release_at: 2021-07-03 11:02:53

## version: 1.4.6 (2021-06-27)

* feat: add kline_margin_purchase_short_sale, 
* fix: taiwan_stock_daily_adj

:zap: release_at: 2021-06-27 14:13:56

## version: 1.4.5 (2021-06-20)

* feat: add kline institutional_investors
* fix issue #153 

:zap: release_at: 2021-06-20 05:25:40

## version: 1.4.4 (2021-06-13)

* feat: add start_date, end_date transfer, 
* fix: [issue](https://github.com/FinMind/FinMind/issues/142) remove suspension trading data 

:zap: release_at: 2021-06-13 07:14:19

## version: 1.4.3 (2021-05-24)

* feat: add streaming_all_data

:zap: release_at: 2021-05-24 16:36:52

## version: 1.4.2 (2021-05-24)

* fix: event loop can not exit issue 

:zap: release_at: 2021-05-24 12:57:07

## version: 1.4.1 (2021-05-23)

* feat: data loader add dataset
* feat: add docstrings

:zap: release_at: 2021-05-23 17:44:18

## version: 1.4.0 (2021-05-23)

* feat: add DataSubscriber
* fix: kline ex-devidend date and trading date not match

:zap: release_at: 2021-05-23 09:12:20

## version: 1.3.9 (2021-04-26)

* feat: add data loader, plotting

:zap: release_at: 2021-04-26 00:36:30

## version: 1.3.8 (2021-03-21)

- 修復還原股價 spread

:zap: release_at: 2021-03-21 13:03:10

## version: 1.3.7 (2021-03-16)

- 新增 台股還原股價 retroactive_price

:zap: release_at: 2021-03-16 14:05:41

## version: 1.3.6 (2021-03-09)

* feat: add EarningsDistribution 

:zap: release_at: 2021-03-09 05:49:14

## version: 1.3.5 (2021-03-08)

* fix: TAIEX dropna 

:zap: release_at: 2021-03-08 10:52:44

## version: 1.3.4 (2021-01-24)

- 新增 回測 台灣大盤同期年化報酬率
- 移除 回測 trade_detail property 中的 tax, fee
- 新增 回測 trade_detail property 中的 EverytimeTotalProfit(總資產)
- 新增 策略 kd, Naitvekd, ContinueHolding 描述
- 新增 第一天回測結果

:zap: release_at: 2021-01-24 08:22:30

## version: 1.3.3 (2021-01-14)

* feat: update pandas version

:zap: release_at: 2021-01-14 07:45:49

## version: 1.3.2 (2021-01-14)

* feat: add add_strategy

:zap: release_at: 2021-01-14 07:17:41

## version: 1.3.0 (2021-01-10)

* fix: version

:zap: release_at: 2021-01-10 13:33:35

## version: 1.2.8 (2020-12-12)

- 修復 sell action 沒有賣出

:zap: release_at: 2020-12-12 14:47:43

## version: 1.2.6 (2020-11-20)

* feat: add version

:zap: release_at: 2020-11-20 15:14:56

