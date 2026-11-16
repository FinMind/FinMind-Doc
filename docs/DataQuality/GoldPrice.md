# GoldPrice 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 時間序列 |
| 資料期間 | 2000-01-03 ～ 2026-11-13 |
| 本期驗證規模 | 查詢 31 次、檢查 641,480 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新資料日 2026-11-13 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 無固定交易日曆，以資料間隔查核 |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026-10、2012-10、2017-10，逐筆對照資料來源原始值：交叉核對 838 筆，一致 838 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--planned">規劃中</span> | 規劃於後續納入跨資料集交叉核對 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 檢查 641,480 列，全部規則通過 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |

## 資料特性說明

本資料集本期沒有需要特別說明的資料特性。

## 資料維護紀錄

本資料集近期沒有資料維護公告；所有公告見[更新公告](https://finmind.github.io/WhatIsNew/)。

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=GoldPrice&start_date=2026-11-13&end_date=2026-11-13
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
