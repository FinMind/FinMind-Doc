# llms.txt / llms-full.txt

Want to query FinMind datasets and APIs through **web** AI tools such as ChatGPT or Claude? Paste the links below into your AI assistant to start chatting — no install, no setup. Once the AI has read them it understands every FinMind dataset, API endpoint, and usage pattern, and can help you explore datasets, write code, and assemble API requests.

- [llms.txt](https://finmind.github.io/llms.txt) — concise version, dataset index and API overview
- [llms-full.txt](https://finmind.github.io/llms-full.txt) — full version, with all dataset columns, SDK methods, and parameter examples

We also provide [openapi.yaml](https://finmind.github.io/openapi.yaml) (an OpenAPI 3.1 schema) for use with GPTs, Dify, Coze, and other platforms.

!!! tip "How the three methods differ"
    - **llms.txt (this page)**: best for web ChatGPT / Claude — the AI understands the API and helps you **generate code, assemble API requests, and explain datasets**, with no install.
    - **[Agent Skill](AgentSkill.md)**: download the `/finmind` command file into CLI tools such as Claude Code or Cursor to **fetch real data**.
    - **[MCP Server](Mcp.md)**: MCP-capable tools call the official server automatically to **fetch real data**.

## How to Use

1. Copy the `llms.txt` link above (or the more detailed `llms-full.txt`).
2. Paste the link into ChatGPT / Claude and ask the AI to read it first, for example:
   > Please read this document first: https://finmind.github.io/llms-full.txt — I'll then ask you about FinMind data.
3. Then just ask in natural language.

## Examples { #examples }

> These examples focus on **understanding the API and generating code**, suited to web AI tools. To have a tool fetch data directly and plot charts, use [Agent Skill](AgentSkill.md) or [MCP](Mcp.md) instead.

### Discover Datasets

```
What Taiwan stock chip/institutional datasets does FinMind have, and what is each dataset name?
```

> Expected result: based on llms.txt, the AI lists chip datasets such as TaiwanStockInstitutionalInvestorsBuySell (institutional trading), TaiwanStockShareholding (foreign holdings), and TaiwanStockMarginPurchaseShortSale (margin trading), with their purposes.

### Generate Python Code

```
Using FinMind's Python SDK, write code to fetch TSMC (2330) daily prices for the past year.
```

> Expected result: the AI generates code using `DataLoader`, calling `taiwan_stock_daily(stock_id='2330', start_date=...)` with a token.

### Assemble an API Request

```
Help me build a FinMind API request URL to query TAIEX futures (TX) daily trading info, and list the required parameters.
```

> Expected result: the AI produces a request like `GET https://api.finmindtrade.com/api/v4/data?dataset=TaiwanFuturesDaily&data_id=TX&start_date=...&token=...`.

### Batch / Async Queries

```
I want to fetch prices for 2330, 2317, and 2454 at once — how do I use the FinMind SDK's async mode to speed it up?
```

> Expected result: the AI explains using `stock_id_list` with `use_async=True` for concurrent batch queries and generates the corresponding code.
