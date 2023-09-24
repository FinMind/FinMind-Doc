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

