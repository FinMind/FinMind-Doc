# TaiwanStockDividendResult 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 事件日 |
| 資料期間 | 2003-07-07 ～ 2026-09-16 |
| 本期驗證規模 | 查詢 25 次、檢查 263 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新事件日 2026-09-16 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026-10、2021-10、2016-10，逐筆對照官方公開資料：交叉核對 2120 筆，一致 2120 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 交叉核對 9,700 筆，一致 9,700 筆（100.00%）：還原股價 × 除權息 9,700/9,700 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 檢查 263 列，全部規則通過 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |

## 資料特性說明

本資料集本期沒有需要特別說明的資料特性。

## 資料維護紀錄

本資料集近期沒有資料維護公告；所有公告見[更新公告](https://finmind.github.io/WhatIsNew/)。

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanStockDividendResult&start_date=2026-09-16&end_date=2026-09-16
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
