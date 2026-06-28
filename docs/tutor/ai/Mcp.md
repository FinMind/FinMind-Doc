# MCP Server

若你的 AI 工具支援 [MCP（Model Context Protocol）](https://modelcontextprotocol.io/)，可改用 FinMind 官方 MCP server [`finmind-mcp`](https://pypi.org/project/finmind-mcp/)，由工具自動呼叫並**實際抓取資料**，不需手動下載 skill 檔。適合多輪、agentic 的查詢與分析。

!!! tip "其他串接方式"
    - 網頁版 ChatGPT / Claude：用 [llms.txt](Llms.md)，免安裝。
    - CLI 工具想用指令檔：用 [Agent Skill](AgentSkill.md)。

## 安裝 { #install }

請先至 [FinMind](https://finmindtrade.com/analysis/#/account/register) 註冊取得 Token，並安裝 [uv](https://docs.astral.sh/uv/)。

**Claude Code（一鍵安裝）：** 先 `export FINMIND_TOKEN=your_token_here`，再於 Claude Code 內輸入：

```
/plugin marketplace add FinMind/FinMind-MCP
/plugin install finmind-mcp@finmind-official
```

裝好後 `/reload-plugins` 連線、`/mcp` 確認。（plugin 讀環境變數 `${FINMIND_TOKEN}`，需在啟動 Claude Code 前先 export。）

**其他工具（Claude Desktop / Cursor / Windsurf / Gemini CLI）：** 在該工具的 MCP 設定檔加入：

```json
{
  "mcpServers": {
    "finmind": {
      "command": "uvx",
      "args": ["finmind-mcp"],
      "env": { "FINMIND_TOKEN": "your_token_here" }
    }
  }
}
```

**Codex CLI** 的設定格式不同（用 `~/.codex/config.toml` 的 `[mcp_servers]`），或一行 `codex mcp add finmind --env FINMIND_TOKEN=... -- uvx finmind-mcp`。

各 host 的設定檔位置、`claude mcp add` / `gemini mcp add` / `codex mcp add` 指令與驗證方式，詳見 [FinMind-MCP 安裝指南](https://github.com/FinMind/FinMind-MCP/tree/master/install)。

## 範例 { #examples }

> MCP 由工具自動呼叫，直接用自然語言提問即可，**不需要加 `/finmind`**。最適合連續追問、跨資料集的 agentic 分析。

### 直接提問

```
台積電最近一個月股價走勢如何？
```

> 預期結果：工具自動呼叫 `taiwan_stock_daily`，回傳台積電（2330）近一個月每日股價並摘要走勢。


### 多輪追問

```
2330 三大法人近一週買賣超是多少？外資是偏買還是偏賣？
再幫我跟 2317 做同期比較。
```

> 預期結果：先回傳台積電三大法人買賣超並判讀外資方向，接著在同一對話延續查詢鴻海並對照，不需重新輸入條件。

### 跨資料集分析

```
幫我分析台積電近一年的股價報酬率，並對照同期的月營收成長趨勢，給我結論。
```

> 預期結果：工具分別抓取股價與月營收資料，計算報酬率與營收年增率，並綜合成一段分析結論。

### 條件篩選

```
今天三大法人買超金額最高的前 5 檔股票是哪些？
```

> 預期結果：工具查詢當日三大法人買賣資料，排序後回傳買超金額前 5 名的個股清單。
