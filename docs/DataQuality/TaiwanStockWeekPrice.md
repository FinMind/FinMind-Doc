# TaiwanStockWeekPrice 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證・附資料特性說明</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 週／月／季頻 |
| 資料期間 | 1999-12-20 ～ 2026-11-09 |
| 本期驗證規模 | 查詢 72 次、檢查 1,220,319 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新期別 2026-11-09，依發布週期更新 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 53 期，有資料 53（100.0%） |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026-10；5、10 年前同月，以官方公開資料重算後逐筆核對：交叉核對 55 筆，一致 55 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 交叉核對 294 筆，一致 294 筆（100.00%）：週 K × 日 K 294/294 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 檢查 1,220,319 列，符合下方資料特性說明 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

- 興櫃股票的開盤參考價為前一交易日的成交均價，因此可能落在當日最高／最低價區間之外。
- 週／月 K 由日 K 彙總。整週（整月）都沒有一般交易成交、只有零股、盤後定價或鉅額交易時，各日的開盤、最高、最低、收盤價皆為 0，週／月 K 的價格欄因此也是 0；成交股數、成交金額為各日加總，包含零股、盤後定價與鉅額交易。

## 資料維護紀錄

- 2026-09-25：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-09-25)）

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanStockWeekPrice&start_date=2026-11-09&end_date=2026-11-09
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
