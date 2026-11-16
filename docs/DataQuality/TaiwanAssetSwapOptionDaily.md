# TaiwanAssetSwapOptionDaily 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證・附資料特性說明</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 日頻（交易日） |
| 資料期間 | 2011-05-03 ～ 2026-11-12 |
| 本期驗證規模 | 查詢 121 次、檢查 5,577 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新資料日 2026-11-12，依發布週期更新 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 61 個交易日，有資料 61（100.0%） |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--pass">通過</span> | 期間內 14 個週六補行交易日全數查核，有資料 14（100.0%） |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 上個月最後 3 個交易日；5、10 年前同月最後交易日，逐筆對照官方公開資料：交叉核對 401 筆，一致 401 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--planned">規劃中</span> | 規劃於後續納入跨資料集交叉核對 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 檢查 5,577 列，全部規則通過 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

- 權利金最低、最高價依官方公布的數值，多數為 1～2 位小數，只有少數成交為 3～4 位小數；每年出現多位小數的筆數不同，因此各年度最低、最高權利金的小數位數分布不同。

## 資料維護紀錄

本資料集近期沒有資料維護公告；所有公告見[更新公告](https://finmind.github.io/WhatIsNew/)。

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanAssetSwapOptionDaily&start_date=2026-11-12&end_date=2026-11-12
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
