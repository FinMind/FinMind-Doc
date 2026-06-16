FinMind provides an AI Agent Skill that lets you query 75+ FinMind datasets through natural language inside AI tools such as [Gemini](https://gemini.google.com/), [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview), [Codex](https://github.com/openai/codex), [Cursor](https://www.cursor.com/), and [Windsurf](https://windsurf.com/), without having to assemble API parameters yourself.

There are two ways to use it — pick whichever fits:

1. **Agent Skill file (CLI tools)**: download the `/finmind` command file into Claude Code / Codex / Cursor / Windsurf / Gemini — see "Installation" below.
2. **MCP Server**: tools that support [MCP](https://modelcontextprotocol.io/) (Claude Desktop / Claude Code, Cursor, Windsurf, Gemini CLI) can connect directly to the official FinMind MCP server — see "MCP Server".

## Installation

### Step 1: Download the Skill

!!! example
    === "Claude Code"
        ```bash
        mkdir -p ~/.claude/commands
        curl -o ~/.claude/commands/finmind.md https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```
    === "Codex"
        ```bash
        curl -o AGENTS.md https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```
    === "Cursor"
        ```bash
        mkdir -p .cursor/rules
        curl -o .cursor/rules/finmind.mdc https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```
    === "Windsurf"
        ```bash
        curl -o .windsurfrules https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```
    === "Gemini"
        ```bash
        curl -o GEMINI.md https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```

??? note "🪟 Windows (PowerShell) install commands"
    Windows 10/11 ships with `curl.exe` built in. Use the PowerShell versions below instead of the commands above (note the `.exe`: PowerShell's bare `curl` is an alias for `Invoke-WebRequest` and uses different syntax).
    === "Claude Code"
        ```powershell
        mkdir $HOME\.claude\commands -Force
        curl.exe -o $HOME\.claude\commands\finmind.md https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```
    === "Codex"
        ```powershell
        curl.exe -o AGENTS.md https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```
    === "Cursor"
        ```powershell
        mkdir .cursor\rules -Force
        curl.exe -o .cursor\rules\finmind.mdc https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```
    === "Windsurf"
        ```powershell
        curl.exe -o .windsurfrules https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```
    === "Gemini"
        ```powershell
        curl.exe -o GEMINI.md https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
        ```

    > If you use **WSL** or **Git Bash**, the macOS / Linux commands above work as-is — no changes needed.

### Step 2: Set Up the Token

Register at [FinMind](https://finmindtrade.com/analysis/#/account/register) and verify your email to obtain a token.

```bash
export FINMIND_TOKEN="your_token_here"
```

We recommend adding this to `~/.bashrc` or `~/.zshrc` so it loads automatically every time you open a terminal.

??? note "🪟 Windows (PowerShell) — set the Token"
    PowerShell does not use `export`. Use this instead:

    ```powershell
    $env:FINMIND_TOKEN="your_token_here"   # current terminal only
    setx FINMIND_TOKEN "your_token_here"   # persists (reopen the terminal to take effect)
    ```

    On **WSL** or **Git Bash**, `export` and `~/.bashrc` work the same as macOS / Linux.

### Step 3: Use It

In Claude Code, type `/finmind` followed by what you want to query:

```
/finmind TSMC stock prices for the past month
```

---

## MCP Server

If your AI tool supports [MCP (Model Context Protocol)](https://modelcontextprotocol.io/), you can use the official FinMind MCP server [`finmind-mcp`](https://pypi.org/project/finmind-mcp/) instead — the tool calls it automatically, with no skill file to download. First get your Token (see "Step 2" above) and install [uv](https://docs.astral.sh/uv/).

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

## Examples

> The queries below work with both methods: with the **Skill file** prefix them with `/finmind`; with **MCP** just ask in natural language.

### Stock Price Queries

```
/finmind TSMC stock prices for the past month
```

> Expected result: returns a daily stock price table for TSMC (2330) over the past month, including columns such as date, open, high, low, close, and volume.

![TSMC stock prices for the past month](../img/tsmc_1m_price.png)

```
/finmind Compare 2330 and 2317 stock prices over the past three months
```

> Expected result: queries TSMC and Hon Hai stock prices over the past three months and presents a closing-price comparison of both stocks in a table.

![Compare 2330 and 2317 stock prices over the past three months](../img/compare_2330_2317.png)

### Chip / Institutional Data

```
/finmind 2330 institutional investors trading over the past week
```

> Expected result: returns daily net buy/sell volumes (in lots) for foreign investors, investment trusts, and dealers for TSMC over the past week.

![2330 institutional investors trading over the past week](../img/institutional_2330.png)

```
/finmind TSMC foreign investor shareholding ratio history
```

> Expected result: returns a historical table of TSMC's foreign investor shareholding (in lots) and shareholding ratio.

![TSMC foreign investor shareholding ratio history](../img/tsmc_foreign_shareholding.png)

### Fundamentals

```
/finmind TSMC monthly revenue this year
```

> Expected result: returns TSMC's monthly revenue figures for the current year.

![TSMC monthly revenue this year](../img/tsmc_monthly_revenue.png)

```
/finmind 2330 PER trend over the past five years
```

> Expected result: returns TSMC's historical price-to-earnings ratio (PER), price-to-book ratio (PBR), and dividend yield over the past five years.

### Futures and Options

```
/finmind TAIEX near-month futures contract weekly trading info
```

> Expected result: returns daily open/high/low/close, volume, and open interest for TAIEX futures (TX) over the past week.

![TAIEX near-month futures contract weekly trading info](../img/taiex_futures_weekly.png)

```
/finmind TAIEX options institutional investors trading today
```

> Expected result: returns today's long/short trading volumes (in contracts) and amounts by the three institutional investors for TAIEX options (TXO).

### Macroeconomy

```
/finmind USD/TWD exchange rate trend over the past six months
```

> Expected result: returns daily spot buy/sell USD/TWD exchange rates over the past six months.

![USD/TWD exchange rate trend over the past six months](../img/usd_twd_exchange_rate.png)

```
/finmind Federal Reserve interest rate changes over the past ten years
```

> Expected result: returns the Fed's historical interest rate adjustment records over the past ten years.

```
/finmind Gold price trend over the past year
```

> Expected result: returns daily gold prices over the past year.

### Charts

```
/finmind TSMC candlestick chart for the past three months
```

> Expected result: generates a candlestick chart for TSMC over the past three months, including OHLC, moving averages, and volume, saved as an image file.

![TSMC 2330 Candlestick Chart](../img/tsmc_3m_kbar.png)

```
/finmind Compare 2330 and 2317 stock prices over the past six months, plot a chart
```

> Expected result: generates a line chart comparing the closing prices of the two stocks, saved as an image file.

![2330 vs 2317 Stock Comparison](../img/stock_comparison_2330_2317.png)

```
/finmind USD exchange rate trend chart for the past year
```

> Expected result: generates a USD/TWD exchange rate line chart, saved as an image file.

### Advanced Analysis

```
/finmind Compare TSMC and MediaTek stock returns over the past year
```

> Expected result: calculates the cumulative return rates of both stocks over the past year and presents the comparison in a table or chart.

```
/finmind 2330 dividend policy summary for the past three years
```

> Expected result: summarizes TSMC's cash dividends, stock dividends, ex-dividend dates, and payment dates for the past three years.

```
/finmind TAIEX index every-5-second trend today
```

> Expected result: returns the TAIEX weighted index value every 5 seconds for today, showing the intraday trend.
