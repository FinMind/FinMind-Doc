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
