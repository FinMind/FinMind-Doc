---
description: FinMind 方案與價格：Free 免費、Backer 每月 NT$699、Sponsor 每月 NT$999、Sponsor Pro 每月 NT$3,330，各方案 API 流量上限、資料集與使用授權比較。
---

# 方案與價格

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "FinMind API",
  "description": "台灣與國際金融資料 API（股價、籌碼、財報、期貨選擇權、可轉債、即時資料），提供 RESTful API 與 Python SDK。",
  "brand": {"@type": "Brand", "name": "FinMind"},
  "url": "https://finmind.github.io/Pricing/",
  "offers": [
    {"@type": "Offer", "name": "Free", "price": "0", "priceCurrency": "TWD", "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Backer（月繳）", "price": "699", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "699", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "MON"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Backer（年繳）", "price": "5499", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "5499", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "ANN"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Sponsor（月繳）", "price": "999", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "999", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "MON"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Sponsor（年繳）", "price": "8888", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "8888", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "ANN"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Sponsor Pro（月繳）", "price": "3330", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "3330", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "MON"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Sponsor Pro（年繳）", "price": "29620", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "29620", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "ANN"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"}
  ]
}
</script>

所有價格皆為**新台幣（TWD）**，於 [FinMind 官網贊助頁面](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 購買。

## 方案總覽

| 方案 | 月繳 | 年繳 | API／下載上限 | 資料集數 | 使用授權 |
|:---:|:---:|:---:|:---:|:---:|:---:|
| Free | 免費 | 免費 | 300 次／小時（註冊會員 600 次／小時） | 45 種 | 非商業用途 |
| Backer | NT$699 | NT$5,499 | 1,600 次／小時 | 81 種 | 非商業用途 |
| **Sponsor**（建議方案） | NT$999 | NT$8,888 | 6,000 次／小時 | 97 種 | 非商業用途 |
| Sponsor Pro | NT$3,330 | NT$29,620 | 20,000 次／小時 | 97 種＋整日全商品下載 | **商業用途** |

- 高階方案包含低階方案的所有權限（Backer ⊃ Free、Sponsor ⊃ Backer、Sponsor Pro ⊃ Sponsor）。
- 目前用量與上限可用 [API 使用次數](api_usage_count.md) 查詢。
- 各資料集所需等級，標示於[資料集文件](tutor/TaiwanMarket/DataList.md)中。

## 付款與升級

- **單次付款，不會自動扣款**：到期後權限自動回到 Free，無需任何取消手續；若要續用，再次手動付款即可。
- **可隨時升級**：已購買 Backer 或 Sponsor，可依剩餘天數補差額升級（最低 NT$100），已付費用不會浪費。
- **統編發票**：如需開立統編發票，請在訂單確認頁面輸入統編。
- **校園推廣方案**：學校單位可於[贊助頁面](https://finmindtrade.com/analysis/#/Sponsor/sponsor)下載校園推廣方案說明。

## 各方案新增的資料集

### Free

- **技術面**：台股總覽、台股總覽(含權證)、主動式ETF清單、台灣股價資料表、台股交易日、台灣類股股價表、個股 PER/PBR 資料表、每 5 秒委託成交統計、台股加權指數、當日沖銷交易標的及成交量值、加權/櫃買報酬指數
- **籌碼面**：個股融資融券表、整體市場融資融券表、個股三大法人買賣表、整體市場三大法人買賣表、外資持股表、借券成交明細、暫停融券賣出表(融券回補日)、信用額度總量管制餘額表、證券商資訊表
- **基本面**：現金流量表、綜合損益表、資產負債表、股利政策表、除權除息結果表、月營收表、減資恢復買賣參考價格、台股下市資料表、台股分割後參考價、變更面額恢復買賣參考價格
- **衍生性金融商品**：期貨/選擇權日成交資訊總覽、期貨/選擇權即時報價總覽、期貨日成交資訊、選擇權日成交資訊、期貨三大法人買賣、選擇權三大法人買賣、期貨各券商每日交易、選擇權各券商每日交易
- **其他**：相關新聞、黃金價格、原油價格(Brent、WTI)、美股股價、外幣對台幣匯率(19 種幣別)、央行利率(12 個國家)、美國國債殖利率(1 個月~30 年，12 種)

### Backer（包含 Free 所有權限）

- 可單次下載**特定日期、全部股票**的股價、三大法人、融資融券等資料（不帶 `data_id`）
- **技術面**：台灣還原股價、台灣股價歷史逐筆資料、台股週 K、台股月 K、個股十年線、每 5 秒指數統計、台股暫停交易公告、暫停先賣後買當沖預告表、每日漲跌停價
- **籌碼面**：大盤融資維持率、股權持股分級表、公布處置有價證券表、現股當日沖銷券差借券費率
- **基本面**：台灣股價市值表、台股市值比重表、台灣每月景氣對策信號、個體公司所屬產業鏈
- **衍生性金融商品**：期貨交易明細、選擇權交易明細、期貨/選擇權大額交易人未沖銷部位、期貨/選擇權夜盤三大法人買賣、期貨/選擇權最後結算價、期貨價差行情表、臺指選擇權波動率指數、資產交換固定收益/選擇權日成交資訊
- **可轉債**：可轉債總覽、可轉債日成交資訊、可轉債三大法人日交易資訊、可轉債每日總覽資訊、可轉換公司債月份分析表、可轉債賣回權時程
- **其他**：恐懼與貪婪指數、美國股價分 K

### Sponsor（包含 Backer 所有權限）

- **技術面**：台股分 K、台股權證標的對照表
- **籌碼面**：台股分點資料、台股八大行庫買賣表、當日券商分點統計表、鉅額交易買賣日報表、鉅額交易日成交資訊、借貸款項擔保品餘額表、個股融資維持率、主動式ETF每日持股明細、主動式ETF每日持股異動、台股產業鏈資金流向
- **即時資訊**：台股即時資訊、期貨即時資訊、選擇權即時資訊
- **衍生性金融商品**：期貨價差每筆成交資料、期貨分 K

### Sponsor Pro（包含 Sponsor 所有權限）

- 可**下載特定日期的全部商品資料**：台股逐筆交易、台股分點、台股權證分點、台股分 K、期貨交易明細、選擇權交易明細

## 使用授權

| | Free／Backer／Sponsor | Sponsor Pro |
|:---|:---:|:---:|
| 個人、學術、web／app 開發等非商業用途 | ✅ | ✅ |
| SaaS、AI、web／app、公司內部系統等商業用途 | ❌ | ✅ |
| 整合至商業產品並對外販售 | ❌ | ✅ |
| 再散布原始資料、建立鏡像 API | ❌ | ❌ |
| 將即時資料直接呈現於 web、App 等對外介面 | ❌ | ❌ |
| 需標示資料來源「FinMind」 | 需要 | 需要 |

超出授權範圍之使用，FinMind 概不負責。詳見[免責聲明與資料授權](Disclaimer.md)與[使用條款與隱私權政策](PrivacyPolicy.md)。

## 常見問題

??? note "會自動續約扣款嗎？"
    不會。所有方案都是單次付款，到期自動回到 Free，不需取消。

??? note "要做商業產品（SaaS、App、AI 服務）該選哪個方案？"
    商業用途請選擇 Sponsor Pro；Free、Backer、Sponsor 僅限非商業用途。

??? note "不確定要選哪個方案？"
    可先從 Backer 開始，之後依剩餘天數補差額升級到 Sponsor 或 Sponsor Pro。

如有其他問題，請來信 finmind.tw@gmail.com。
