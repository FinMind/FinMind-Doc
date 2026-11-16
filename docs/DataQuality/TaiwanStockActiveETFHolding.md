# TaiwanStockActiveETFHolding 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證・附資料特性說明</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 日頻（交易日） |
| 資料期間 | 2025-05-02 ～ 2026-11-13 |
| 本期驗證規模 | 查詢 76 次、檢查 80,550 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新資料日 2026-11-13，與最近交易日同步 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 抽樣 32 個交易日，有資料 32（100.0%）；差異日期屬資料特性，見下方說明 |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--na">不適用</span> | 此類資料不適用 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 上個月最後 3 個交易日、1 年前同月最後交易日，逐筆對照官方公開資料：交叉核對 424 筆，一致 424 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 交叉核對 612 筆，一致 612 筆（100.00%）：ETF 持股異動 × 持股 612/612 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 檢查 80,550 列，符合下方資料特性說明 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

- ETF 持有的選擇權／期貨賣方部位，股數、權重與市值以負數表示。
- 應收（付）證券款、扣除應付款後的現金餘額，以及選擇權／期貨賣方部位等項目，市值可為負數。
- 投資海外債券的債券型主動式 ETF（代號 D 結尾），在美國債券市場休市日（例如 9 月勞動節、10 月哥倫布日、11 月退伍軍人節）通常不計算淨值、不公布當日持股，因此這些日期只有其他 ETF 的資料，筆數較少。

## 資料維護紀錄

- 2026-09-24：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-09-24)）

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanStockActiveETFHolding&start_date=2026-11-13&end_date=2026-11-13
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
