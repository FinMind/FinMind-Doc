# TaiwanStockTradingDailyReportSecIdAgg 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證</span> |
| 檢測日期 | 2026-11-16 |
| 資料類型 | 逐筆／分鐘 |
| 資料期間 | 2021-06-30 ～ 2026-11-13 |
| 本期驗證規模 | 查詢 73 次、檢查 40 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新資料日 2026-11-13，與最近交易日同步 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 40 個代號-交易日，有資料 40（100.0%） |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026-10-01、2026-10-30、2021-10-15，以官方公開資料重算後逐筆核對：交叉核對 18 筆，一致 18 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 交叉核對 32 筆，一致 32 筆（100.00%）：券商分點彙總 × 日 K 32/32 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 檢查 40 列，全部規則通過 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

本資料集本期沒有需要特別說明的資料特性。

## 資料維護紀錄

- 2026-10-23：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-10-23)）
- 2026-10-19：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-10-19)）

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report_secid_agg` 自行驗證（需自備 token）：

```text
data_id=2330&securities_trader_id=9800&start_date=2026-11-13&end_date=2026-11-13
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
