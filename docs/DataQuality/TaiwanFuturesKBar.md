# TaiwanFuturesKBar 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證</span> |
| 檢測日期 | 2026-11-16 |
| 資料類型 | 逐筆／分鐘 |
| 資料期間 | 2011-01-03 ～ 2026-11-13 |
| 本期驗證規模 | 查詢 124 次、檢查 154,668 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新資料日 2026-11-13，與最近交易日同步 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 80 個代號-交易日，有資料 80（100.0%） |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--pass">通過</span> | 依資料特性查核 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026-10-29、2026-10-30，逐筆對照官方公開資料：交叉核對 7717 筆，一致 7717 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 交叉核對 680 筆，一致 680 筆（100.00%）：期貨分 K × 日行情 × 逐筆 680/680 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 檢查 154,668 列，全部規則通過 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

本資料集本期沒有需要特別說明的資料特性。

## 資料維護紀錄

- 2026-09-20：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-09-20)）
- 2026-09-19：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-09-19)）
- 2026-09-17：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-09-17)）

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanFuturesKBar&start_date=2026-11-13&end_date=2026-11-13
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
