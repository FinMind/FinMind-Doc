# llms.txt / llms-full.txt

想用 ChatGPT、Claude 等**網頁版** AI 工具查詢 FinMind 的資料集與 API？把以下連結貼給 AI 助手即可開始對話，免安裝、免設定。AI 讀過後就能理解 FinMind 的所有資料集、API 端點與使用方式，協助你查資料集、寫程式、組 API 請求。

- [llms.txt](https://finmind.github.io/llms.txt) — 精簡版，資料集索引與 API 概覽
- [llms-full.txt](https://finmind.github.io/llms-full.txt) — 完整版，包含所有資料集的欄位名稱、SDK 方法、參數範例

另提供 [openapi.yaml](https://finmind.github.io/openapi.yaml)（OpenAPI 3.1 schema），可用於 GPTs、Dify、Coze 等平台。

!!! tip "三種串接方式的差別"
    - **llms.txt（本頁）**：適合網頁版 ChatGPT / Claude，AI 理解 API 後幫你**產生程式碼、組 API 請求、解釋資料集**，免安裝。
    - **[Agent Skill](AgentSkill.md)**：在 Claude Code、Cursor 等 CLI 工具中下載 `/finmind` 指令檔，**實際抓取資料**。
    - **[MCP Server](Mcp.md)**：支援 MCP 的工具自動呼叫官方 server，**實際抓取資料**。

## 使用方式

1. 複製上方 `llms.txt`（或資訊更完整的 `llms-full.txt`）連結。
2. 在 ChatGPT / Claude 對話框貼上連結，並請 AI 先讀取內容，例如：
   > 請先讀取這份文件 https://finmind.github.io/llms-full.txt ，之後我會問你關於 FinMind 的資料。
3. 接著用自然語言提問即可。

## 範例 { #examples }

> 以下範例著重在「**理解 API、產生程式碼**」，適合搭配網頁版 AI。若想讓工具直接抓回資料並畫圖，請改用 [Agent Skill](AgentSkill.md) 或 [MCP](Mcp.md)。

### 認識資料集

```
FinMind 有哪些台股籌碼面的資料集？各自的 dataset 名稱是什麼？
```

> 預期結果：AI 依 llms.txt 列出 TaiwanStockInstitutionalInvestorsBuySell（三大法人買賣）、TaiwanStockShareholding（外資持股）、TaiwanStockMarginPurchaseShortSale（融資融券）等籌碼面 dataset 與用途。

### 產生 Python 程式碼

```
用 FinMind 的 Python SDK 寫一段程式，抓台積電 2330 近一年的日股價。
```

> 預期結果：AI 產生使用 `DataLoader` 的程式碼，呼叫 `taiwan_stock_daily(stock_id='2330', start_date=...)` 並帶入 token。

### 組 API 請求

```
幫我組一個查台指期（TX）日成交資訊的 FinMind API 請求 URL，列出必要參數。
```

> 預期結果：AI 產生 `GET https://api.finmindtrade.com/api/v4/data?dataset=TaiwanFuturesDaily&data_id=TX&start_date=...&token=...` 的請求說明。

### 批次與非同步查詢

```
我要一次抓 2330、2317、2454 的股價，FinMind SDK 怎麼用非同步加速？
```

> 預期結果：AI 說明用 `stock_id_list` 搭配 `use_async=True` 批次併發查詢，並產生對應程式碼。
