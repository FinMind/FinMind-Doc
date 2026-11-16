# TaiwanStockFinancialStatements 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證・附資料特性說明</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 週／月／季頻 |
| 資料期間 | 1990-03-31 ～ 2026-09-30 |
| 本期驗證規模 | 查詢 62 次、檢查 1,036,300 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新期別 2026-09-30，依發布週期更新 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 44 期，有資料 44（100.0%） |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026 年第 2 季；2021、2016 年第 1 季，逐筆對照官方公開資料：交叉核對 49507 筆，一致 49507 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 交叉核對 18,044 筆，一致 18,044 筆（100.00%）：損益表勾稽 18,044/18,044 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 檢查 1,036,300 列，全部規則通過 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

- 1990～1995 年的綜合損益表彙總資料沒有公布每股盈餘，這些年度只有以元為單位的整數金額科目，因此數值欄的小數位數少於 1996 年以後（含每股盈餘）。

## 資料維護紀錄

- 2026-10-11：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-10-11)）

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanStockFinancialStatements&start_date=2026-09-30&end_date=2026-09-30
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
