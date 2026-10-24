## version: 2.1.0 (2026-10-24)

## What's Changed
* chore(deps): upgrade dependencies with known security vulnerabilities by @linsamtw in https://github.com/FinMind/FinMind/pull/480

## Upgrade Notes
* Upgrades dependencies with known security vulnerabilities; the minimum `ipython` version is now 8.10.0 (previously `<8.0.0`). Code that calls FinMind **needs no changes**.
* `pip install -U FinMind` does not upgrade other packages already installed in your environment, so upgrade them together: `pip install -U FinMind certifi aiohttp urllib3 requests pyarrow numpy`
* Patched releases of some packages no longer support Python 3.8 / 3.9; Python 3.10 or later is recommended.
* `pyarrow` 26 requires `numpy` 2.x; if downloading whole-day data with `use_object=True` fails with an error saying pyarrow cannot be found, upgrade `numpy`.



:zap: release_at: 2026-10-24 04:25:15

## version: 2.0.13 (2026-10-23)

## What's Changed
* feat: add Taiwan stock financial report and annual report files TaiwanStockFinancialReportFile (Sponsor Pro) by @linsamtw in https://github.com/FinMind/FinMind/pull/477
* feat: taiwan_stock_financial_report_file now queries by year + quarter by @linsamtw in https://github.com/FinMind/FinMind/pull/478
* feat: add TaiwanStockAfterHoursFixedPriceTrading by @linsamtw in https://github.com/FinMind/FinMind/pull/476




:zap: release_at: 2026-10-23 18:06:35

## version: 2.0.12 (2026-10-17)

## What's Changed
* docs: clarify point-in-time semantics for fundamental data by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/446
* docs(skill): add TaiwanFuturesKBar to the whole-day market-wide download list by @linsamtw in https://github.com/FinMind/FinMind/pull/473
* feat(sdk): taiwan_stock_trading_daily_report_secid_agg supports use_object whole-day download by @linsamtw in https://github.com/FinMind/FinMind/pull/474




:zap: release_at: 2026-10-17 05:21:29

## version: 2.0.11 (2026-10-04)

## What's Changed
* feat: tick / minute K queries without an ID now raise an error; taiwan_futures_kbar supports use_object by @linsamtw in https://github.com/FinMind/FinMind/pull/470
* feat: add daily stock broker concentration TaiwanStockBrokerDailyConcentration by @machineCYC in https://github.com/FinMind/FinMind/pull/471




:zap: release_at: 2026-10-04 02:23:20

## version: 2.0.10 (2026-09-17)

## What's Changed
* feat(taiwan_stock_kbar): document the TAIEX index stock_id="TAIEX" in the docstring and add tests by @linsamtw in https://github.com/FinMind/FinMind/pull/466
* Feat/taiwan futures k bar by @machineCYC in https://github.com/FinMind/FinMind/pull/458
* feat: get_object automatically resumes interrupted downloads with Range requests and verifies integrity by @linsamtw in https://github.com/FinMind/FinMind/pull/469




:zap: release_at: 2026-09-17 10:56:02

## version: 2.0.9 (2026-08-19)

## What's Changed
* fix(backtest): stock dividends should not increase total holding cost (#453) by @linsamtw in https://github.com/FinMind/FinMind/pull/457
* ci: run the full test suite on fork PRs too (dual triggers + fork-ci approval gate) by @linsamtw in https://github.com/FinMind/FinMind/pull/460
* ci: fix checkout for fork PRs (lint back on pull_request, build opt-in) by @linsamtw in https://github.com/FinMind/FinMind/pull/462
* fix: replace deprecated Pydantic dict calls by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/451
* docs: add contributor setup and refresh repository links by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/450
* fix: include transaction fee in buy affordability check by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/448
* ci: make every check name unique and use a gate job so branch protection actually takes effect by @linsamtw in https://github.com/FinMind/FinMind/pull/463
* test: remove false-positive and shadowed tests by @ting-hong-shieh in https://github.com/FinMind/FinMind/pull/447
* fix: TPEx ETF backtests were charged 3x the securities transaction tax by @linsamtw in https://github.com/FinMind/FinMind/pull/464

## New Contributors
* @ting-hong-shieh made their first contribution in https://github.com/FinMind/FinMind/pull/451



:zap: release_at: 2026-08-19 18:51:49

## version: 2.0.8 (2026-08-15)

## What's Changed
* fix: support installation on Python 3.13 / 3.14 (relax the lxml upper bound) by @linsamtw in https://github.com/FinMind/FinMind/pull/456




:zap: release_at: 2026-08-15 11:38:23

## version: 2.0.7 (2026-08-10)

## What's Changed
* feat: add TaiwanStockIndustryChainMoneyFlow (Taiwan stock industry chain money flow) by @linsamtw in https://github.com/FinMind/FinMind/pull/438
* feat: add taiwan_stock_convertible_bond_put_provision (convertible bond put provision schedule) by @linsamtw in https://github.com/FinMind/FinMind/pull/439
* docs(skill): remove "no historical backfill" from storage whole-day downloads and add the earliest available date for each dataset by @linsamtw in https://github.com/FinMind/FinMind/pull/444
* feat: add TaiwanStockMarginMaintenance (individual stock margin maintenance ratio) by @linsamtw in https://github.com/FinMind/FinMind/pull/443
* fix: get_asset_underlying_type is no longer affected by the return order of duplicate TaiwanStockInfo rows by @linsamtw in https://github.com/FinMind/FinMind/pull/445




:zap: release_at: 2026-08-10 11:45:23

## version: 2.0.6 (2026-07-25)

## What's Changed
* add: taiwan asset sqap daily data by @machineCYC in https://github.com/FinMind/FinMind/pull/440




:zap: release_at: 2026-07-25 13:10:21

## version: 2.0.5 (2026-07-18)

## What's Changed
* docs(skill): add TaiwanOptionVix & ConvertibleBondMonthlyAnalysis to the skill dataset list by @linsamtw in https://github.com/FinMind/FinMind/pull/430
* feat: SDK support for the three active ETF datasets (holdings + holding changes + list) by @linsamtw in https://github.com/FinMind/FinMind/pull/436




:zap: release_at: 2026-07-18 05:31:15

## version: 2.0.4 (2026-06-26)

## What's Changed
* docs(skill): add emerging-board data caveats to dataset reference by @linsamtw in https://github.com/FinMind/FinMind/pull/426
* Add taiwan_option_vix dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/428
* Add: taiwan_stock_convertible_bond_monthly_analysis dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/429




:zap: release_at: 2026-06-26 13:01:24

## version: 2.0.3 (2026-06-15)

## What's Changed
* fix: automatically use async when stock_id_list is passed, fixing empty DataFrame results by @linsamtw in https://github.com/FinMind/FinMind/pull/423




:zap: release_at: 2026-06-15 16:42:15

## version: 2.0.2 (2026-06-15)

## What's Changed
* feat: taiwan_stock_warrant_trading_daily_report supports use_object whole-day download by @linsamtw in https://github.com/FinMind/FinMind/pull/421
* deps: relax version upper bounds and upgrade to pydantic v2 to eliminate pip install conflicts by @linsamtw in https://github.com/FinMind/FinMind/pull/422




:zap: release_at: 2026-06-15 16:26:22

## version: 2.0.1 (2026-06-14)

## What's Changed
* feat: add taiwan_stock_institutional_investors_wide (institutional investors buy/sell, wide table) by @linsamtw in https://github.com/FinMind/FinMind/pull/418




:zap: release_at: 2026-06-14 05:39:02

## version: 2.0.0 (2026-06-13)

## What's Changed
* fix: support Python 3.12 (upgrade to pandas 2.x, ta 0.11) by @linsamtw in https://github.com/FinMind/FinMind/pull/420

## Upgrade Notes
- Adds support for **Python 3.12** (3.8–3.11 remain supported).
- Starting from this release, dependencies are upgraded to `pandas>=2.0` and `ta>=0.11` (`numpy` and `pydantic` unchanged).
- **Code that calls FinMind needs no changes**: public interfaces such as `DataLoader`, strategies and plotting are unchanged.
- :warning: Installing / upgrading also upgrades `pandas` in your environment to 2.x and `ta` to 0.11. If **your own code** still uses pandas 1.x APIs removed in 2.0, you need to update it; common cases:
    - `df.append()` → `pd.concat([...])`
    - `df.to_dict("r")` → `df.to_dict("records")`
    - `df.iteritems()` → `df.items()`
- If you cannot update it yet, pin an older FinMind version for now.



:zap: release_at: 2026-06-13 07:21:03

## version: 1.9.12 (2026-06-09)

## What's Changed
* ci: migrate from pipenv to uv by @linsamtw in https://github.com/FinMind/FinMind/pull/407
* docs(finmind skill): document use_object whole-day market-wide batch download (PR #415) by @linsamtw in https://github.com/FinMind/FinMind/pull/416
* feat: add taiwan_futures_spread_tick (futures spread tick data) by @linsamtw in https://github.com/FinMind/FinMind/pull/417




:zap: release_at: 2026-06-09 14:05:33

## version: 1.9.11 (2026-06-05)

## What's Changed
* docs: finmind skill charts use Chinese labels; register wqy-zenhei to fix CJK rendering by @linsamtw in https://github.com/FinMind/FinMind/pull/410
* docs: taiwan_stock_tick_snapshot documents index codes for data_id by @linsamtw in https://github.com/FinMind/FinMind/pull/413
* feat: taiwan_stock_kbar/futures_tick/option_tick support use_object whole-day download by @linsamtw in https://github.com/FinMind/FinMind/pull/415




:zap: release_at: 2026-06-05 13:28:56

## version: 1.9.10 (2026-05-05)

## What's Changed
* ci: add --dist=loadfile to pytest-xdist to fix random KeyError in test_base.py by @linsamtw in https://github.com/FinMind/FinMind/pull/409
* feat: taiwan_stock_trading_daily_report supports use_object whole-day download by @linsamtw in https://github.com/FinMind/FinMind/pull/408




:zap: release_at: 2026-05-05 16:21:41

## version: 1.9.9 (2026-05-02)

## What's Changed
* docs: add TaiwanStockBlockTrade / TaiwanStockLoanCollateralBalance to the agent skill by @linsamtw in https://github.com/FinMind/FinMind/pull/405
* ci: upgrade GitHub Actions versions and fix workflow issues by @linsamtw in https://github.com/FinMind/FinMind/pull/402
* feat: add taiwan_stock_block_trade and taiwan_stock_loan_collateral_balance by @linsamtw in https://github.com/FinMind/FinMind/pull/406




:zap: release_at: 2026-05-02 05:02:06

## version: 1.9.8 (2026-04-22)

## What's Changed
* fix: raise informative error when API response lacks 'data' key by @linsamtw in https://github.com/FinMind/FinMind/pull/401




:zap: release_at: 2026-04-22 01:11:49

## version: 1.9.7 (2026-04-14)

## What's Changed
* TaiwanStockPriceTick data with object download by @machineCYC in https://github.com/FinMind/FinMind/pull/382
* feat: add a data loader method for TaiwanStockPriceLimit by @linsamtw in https://github.com/FinMind/FinMind/pull/384
* docs: add an LLM / AI Integration section to the README by @linsamtw in https://github.com/FinMind/FinMind/pull/385
* feat: add llms-full.txt link to LLM/AI Integration section in README by @linsamtw in https://github.com/FinMind/FinMind/pull/386
* docs: unify llms-full.txt links to finmind.github.io by @linsamtw in https://github.com/FinMind/FinMind/pull/387
* feat: mv LLM / AI Integration to Top by @linsamtw in https://github.com/FinMind/FinMind/pull/388
* feat: add the Claude Code /finmind slash command by @linsamtw in https://github.com/FinMind/FinMind/pull/389
* docs: add an Agent Skill tutorial link to the README by @linsamtw in https://github.com/FinMind/FinMind/pull/390
* docs: update finmind skill with special endpoints and data ranges by @linsamtw in https://github.com/FinMind/FinMind/pull/394
* docs: update finmind skill rate limits by @linsamtw in https://github.com/FinMind/FinMind/pull/396
* docs: rewrite finmind skill to improve structure and query efficiency by @linsamtw in https://github.com/FinMind/FinMind/pull/399
* Add taiwanstockdaytradingborrowingfeerate dataset by @machineCYC in https://github.com/FinMind/FinMind/pull/393




:zap: release_at: 2026-04-14 16:48:46

## version: 1.9.6 (2026-02-22)

## What's Changed
* feat: add TaiwanFuturesSpreadTrading futures spread trading table by @linsamtw in https://github.com/FinMind/FinMind/pull/379




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

1️⃣ Batching and concurrency control

Avoids network errors or refused connections caused by sending a large number (e.g. 2000) of async requests at once
Adds a semaphore to limit the number of concurrent requests
Supports batch processing; the batch size can be set manually or tuned automatically from machine resources
2️⃣ Shared Session for efficiency

All requests share one requests.Session and reuse TCP connections
Reduces connection setup cost and speeds up fetching
3️⃣ Error handling and retry

Failed requests are retried automatically, reducing fetch failures
None results from async requests are filtered out automatically to avoid AttributeError
4️⃣ Progress tracking

Uses tqdm to show the completion progress of each batch
Fetch progress is visible in real time
5️⃣ Automatic performance tuning (auto_tune)

Automatically adjusts max_concurrency based on CPU cores and available memory
Adapts to different environments for better stability and efficiency



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
* feat: update FinMind campus program PDF (FinMind 校園推廣方案.pdf) by @linsamtw in https://github.com/FinMind/FinMind/pull/321




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
* 292 overall market margin maintenance ratio by @machineCYC in https://github.com/FinMind/FinMind/pull/300




:zap: release_at: 2024-05-27 15:46:14

## version: 1.6.7 (2024-05-23)

## What's Changed
* feat: add short sale suspension table (short covering dates) TaiwanStockMarginShortSaleSuspension by @linsamtw in https://github.com/FinMind/FinMind/pull/296
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

* feat: add Capital Reduction Reference Price

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

- Fix adjusted stock price spread

:zap: release_at: 2021-03-21 13:03:10

## version: 1.3.7 (2021-03-16)

- Add Taiwan stock retroactive_price (adjusted stock price)

:zap: release_at: 2021-03-16 14:05:41

## version: 1.3.6 (2021-03-09)

* feat: add EarningsDistribution 

:zap: release_at: 2021-03-09 05:49:14

## version: 1.3.5 (2021-03-08)

* fix: TAIEX dropna 

:zap: release_at: 2021-03-08 10:52:44

## version: 1.3.4 (2021-01-24)

- Add backtesting Taiwan market same-period annualized return
- Remove tax and fee from the trade_detail property in backtesting
- Add EverytimeTotalProfit (total assets) to the trade_detail property in backtesting
- Add descriptions for the kd, Naitvekd, and ContinueHolding strategies
- Add the first day backtesting result

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

- Fix sell action not selling

:zap: release_at: 2020-12-12 14:47:43

## version: 1.2.6 (2020-11-20)

* feat: add version

:zap: release_at: 2020-11-20 15:14:56

