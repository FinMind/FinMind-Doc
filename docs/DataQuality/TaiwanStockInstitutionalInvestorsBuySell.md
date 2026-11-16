# TaiwanStockInstitutionalInvestorsBuySell 資料品質報告（2026-11）

[← 回資料品質總覽](index.md)　｜　[檢測方法](Methodology.md)

| 項目 | 內容 |
|---|---|
| 驗證結果 | <span class="dq-pill dq-pill--ok">已驗證・附資料特性說明</span> |
| 檢測日期 | 2026-11-14 |
| 資料類型 | 日頻（交易日） |
| 資料期間 | 2005-01-03 ～ 2026-11-13 |
| 本期驗證規模 | 查詢 166 次、檢查 5,924,948 列 |

## 主要指標

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 資料更新時效 | <span class="dq-pill dq-pill--pass">通過</span> | 最新資料日 2026-11-13，與最近交易日同步 |
| 交易日涵蓋率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 74 個交易日，有資料 74（100.0%） |
| 補行交易日涵蓋 | <span class="dq-pill dq-pill--note">資料特性說明</span> | 期間內 23 個週六補行交易日全數查核，有資料 23（100.0%）；差異日期屬資料特性，見下方說明 |
| 與官方來源一致率 | <span class="dq-pill dq-pill--pass">通過</span> | 抽樣 2026-10-01、2026-10-30、2021-10-15、2016-10-17，逐筆對照官方公開資料：交叉核對 4598 筆，一致 4598 筆（100.00%） |
| 跨資料集一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 交叉核對 907,460 筆，一致 907,460 筆（100.00%）：個股法人 × 市場合計 36/36；法人長表 × 寬表 777,792/777,792；法人買賣 × 成交量 129,632/129,632 |

## 其他檢查

| 檢測項目 | 結果 | 說明 |
|---|---|---|
| 查詢方式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 單日、區間、指定代號查詢結果一致 |
| 欄位格式一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 各年度欄位格式一致 |
| 數值與主鍵一致性 | <span class="dq-pill dq-pill--pass">通過</span> | 檢查 5,924,948 列，全部規則通過 |
| 每日內容獨立性 | <span class="dq-pill dq-pill--pass">通過</span> | 各日內容皆獨立 |

## 資料特性說明

- 2012-05-02 以前僅有上櫃資料，且只列出當日有法人交易的股票；週六補行交易日交易清淡，筆數較少屬正常。

## 資料維護紀錄

- 2026-09-20：依官方來源更新（詳見[更新公告](https://finmind.github.io/WhatIsNew/#2026-09-20)）

## 可重現查詢

以下參數可直接帶入 `https://api.finmindtrade.com/api/v4/data` 自行驗證（需自備 token）：

```text
dataset=TaiwanStockInstitutionalInvestorsBuySell&start_date=2026-11-13&end_date=2026-11-13
```

---

本報告所有數據皆透過 FinMind 公開 API 與官方公開資料取得，採抽樣方式驗證，結論適用於本期抽樣範圍。各項目的檢測方式見[檢測方法](Methodology.md)。
