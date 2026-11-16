# TaiwanStockSecuritiesLending 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證・附資料特性說明</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 日頻（交易日） |
| 資料期間 | 2004-01-07 ～ 2026-11-13 |
| 本期驗證規模 | 查詢 147 次、檢查 53,546 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新資料日 2026-11-13，與最近交易日同步 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 76 個交易日，有資料 76（100.0%） |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 期間內 23 個週六補行交易日全數查核，有資料 21（91.3%）；差異日期屬資料特性，見下方說明 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026-10-01、2026-10-30、2021-10-15、2016-10-17，逐筆對照官方公開資料：交叉核對 3142 筆，一致 3142 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--planned">規劃中</span> | 規劃於後續納入跨資料集交叉核對 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 檢查 53,546 列，符合下方資料特性說明 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

- 週六補行交易日的借券成交筆數通常明顯少於一般交易日；2007-03-03、2007-06-23 當日無借券成交，因此沒有資料。
- 官方借券成交明細在 2004-08-10、2004-08-11、2005-06-07、2005-06-08 有部分成交未提供約定還券日期（約定借券天數為 0），這些列的 original_return_date 為空字串、original_lending_period 為 0。

## 資料維護紀錄

本資料集近期沒有資料維護公告；所有公告見[更新公告](https://finmind.github.io/WhatIsNew/)。

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanStockSecuritiesLending&start_date=2026-11-13&end_date=2026-11-13
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
