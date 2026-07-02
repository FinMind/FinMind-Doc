# MCP Server

If your AI tool supports [MCP (Model Context Protocol)](https://modelcontextprotocol.io/), you can use the official FinMind MCP server [`finmind-mcp`](https://pypi.org/project/finmind-mcp/) instead — the tool calls it automatically and **fetches real data**, with no skill file to download. It is best suited to multi-turn, agentic queries and analysis.

!!! tip "Other connection methods"
    - Web ChatGPT / Claude: use [llms.txt](Llms.md) — no install.
    - CLI tools that prefer a command file: use [Agent Skill](AgentSkill.md).

## Installation { #install }

First register at [FinMind](https://finmindtrade.com/analysis/#/account/register) to get a token, and install [uv](https://docs.astral.sh/uv/).

**Claude Code (one-click):** first `export FINMIND_TOKEN=your_token_here`, then run inside Claude Code:

```
/plugin marketplace add FinMind/FinMind-MCP
/plugin install finmind-mcp@finmind-official
```

After install, run `/reload-plugins` to connect and `/mcp` to verify. (The plugin reads `${FINMIND_TOKEN}` from the environment, so export it before launching Claude Code.)

**Other tools (Claude Desktop / Cursor / Windsurf / Gemini CLI):** add this to the tool's MCP config file:

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

**Codex CLI** uses a different config format (`[mcp_servers]` in `~/.codex/config.toml`), or a one-liner: `codex mcp add finmind --env FINMIND_TOKEN=... -- uvx finmind-mcp`.

For per-host config file locations, the `claude mcp add` / `gemini mcp add` / `codex mcp add` one-liners, and verification steps, see the [FinMind-MCP install guides](https://github.com/FinMind/FinMind-MCP/tree/master/install).

## Examples { #examples }

> MCP is called automatically by the tool, so just ask in natural language — **no `/finmind` prefix needed**. It is best for follow-up questions and cross-dataset agentic analysis.

### Ask Directly

```
How have TSMC's stock prices trended over the past month?
```

> Expected result: the tool automatically calls `taiwan_stock_daily`, returns TSMC (2330) daily prices for the past month, and summarizes the trend.

![TSMC stock prices for the past month](../../img/tsmc_1m_price.png)

### Multi-Turn Follow-Up

```
What were 2330's institutional net buy/sell over the past week? Are foreign investors net buyers or sellers?
Then compare it with 2317 over the same period.
```

> Expected result: it first returns TSMC institutional net buy/sell and reads the foreign-investor direction, then continues in the same conversation to query Hon Hai and compare — no need to re-enter the conditions.

### Cross-Dataset Analysis

```
Analyze TSMC's stock return over the past year, compare it against monthly revenue growth over the same period, and give me a conclusion.
```

> Expected result: the tool fetches price and monthly-revenue data separately, computes the return and YoY revenue growth, and synthesizes a written conclusion.

### Conditional Screening

```
Which 5 stocks had the highest institutional net-buy value today?
```

> Expected result: the tool queries today's institutional trading data, sorts it, and returns the top 5 stocks by net-buy value.

## Data field caveats { #caveats }

The following are common field-definition differences to keep in mind when an AI agent interprets query results (Taiwan stock prices, futures ticks). They are not data errors:

??? warning "Emerging stocks: `open` is the *previous-day average price*, and may fall outside the day's high/low (not a data error)"
    Emerging-board stocks trade by negotiation and **have no opening price**. For emerging stocks this table therefore fills `open` with the **previous-day average price** published by the Taipei Exchange (TPEx), not an opening price; `max` / `min` / `close` are still the day's high / low / last traded price and are correct.

    As a result, an emerging stock's `open` can sit above `max` or below `min` on volatile days. This is a **field-definition difference, not corrupt data**. For candlestick charts, use `max` / `min` / `close`, or treat `open` as the previous-day average.

    **Example**: 6515 穎崴 on 2020-03-19 (emerging at the time) → `open=218.06`, `max=200`, `min=170`, `close=174.9`; 218.06 is exactly TPEx's previous-day average that day. The stock later moved to TWSE, after which its data is normal.

??? note "Futures ticks (TaiwanFuturesTick): how volume is counted"
    Tick volume is counted on a **double-sided** basis: each matched trade records both the buy side and the sell side once. As a result, the summed tick volume is about **2×** the (single-side) volume in the daily data TaiwanFuturesDaily; for spread / combination orders, which contain two legs, the tick volume is about **4×** the daily volume. Convert accordingly when reconciling tick volume against daily volume.

??? note "Futures ticks: trading-day attribution of after-hours ticks"
    The after-hours (night) session follows the TAIFEX rule of being attributed to the **next business day**. The after-hours session for trading day D is the segment running from 15:00 on the previous business day until 05:00 on day D. Therefore, within a tick file:

    - **00:00–05:00** ticks belong to the after-hours (after_market) session of **trading day D** in TaiwanFuturesDaily.
    - **08:45–13:45** ticks belong to the regular session (position) of trading day D.
    - **15:00–24:00** ticks belong to the after-hours session of the **next trading day**.
