# TaiwanStockPrice 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證・附資料特性說明</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 日頻（交易日） |
| 資料期間 | 1999-01-05 ～ 2026-11-13 |
| 本期驗證規模 | 查詢 209 次、檢查 2,673,534 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新資料日 2026-11-13，與最近交易日同步 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 86 個交易日，有資料 86（100.0%） |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--pass">通過</span> | 期間內 74 個週六補行交易日全數查核，有資料 74（100.0%） |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026-10，逐筆對照官方公開資料：交叉核對 95 筆，一致 95 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 交叉核對 384 筆，一致 384 筆（100.00%）：日 K × 逐筆 144/144；分 K × 日 K × 逐筆 240/240 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 檢查 2,673,534 列，符合下方資料特性說明 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

- 興櫃股票的開盤參考價為前一交易日的成交均價，因此可能落在當日最高／最低價區間之外。
- 當日沒有一般交易成交、只有零股、盤後定價或鉅額交易時，官方每日收盤行情的開盤、最高、最低、收盤價為「--」，此時價格欄以 0 表示；成交股數、成交金額依官方統計，包含零股、盤後定價與鉅額交易。

## 資料維護紀錄

- 2026-09-25：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-09-25)）

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanStockPrice&start_date=2026-11-13&end_date=2026-11-13
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
