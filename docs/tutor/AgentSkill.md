FinMind 提供 [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) Agent Skill，讓你可以在 Claude Code 中，透過自然語言查詢 FinMind 75+ 種資料集，不需要自己組 API 參數。

## 安裝

### 步驟 1: 下載 Skill

```bash
mkdir -p ~/.claude/commands
curl -o ~/.claude/commands/finmind.md https://raw.githubusercontent.com/FinMind/FinMind/master/.claude/commands/finmind.md
```

### 步驟 2: 設定 Token

至 [FinMind](https://finmindtrade.com/analysis/#/account/register) 註冊並驗證信箱後，取得 Token。

```bash
export FINMIND_TOKEN="your_token_here"
```

建議加到 `~/.bashrc` 或 `~/.zshrc`，這樣每次開終端都會自動載入。

### 步驟 3: 使用

在 Claude Code 中輸入 `/finmind`，後面接你想查詢的內容：

```
/finmind 台積電最近一個月股價
```

---

## 範例

### 股價查詢

```
/finmind 台積電最近一個月股價
```

```
/finmind 2330 跟 2317 近三個月股價比較
```

### 籌碼面

```
/finmind 2330 三大法人近一週買賣
```

```
/finmind 台積電外資持股比例變化
```

### 基本面

```
/finmind 台積電今年每月營收
```

```
/finmind 2330 近五年 PER 走勢
```

### 期貨選擇權

```
/finmind 台指期近月合約近一週成交資訊
```

```
/finmind 台指選擇權三大法人今日買賣
```

### 總體經濟

```
/finmind 美元對台幣匯率近半年走勢
```

```
/finmind 聯準會近十年利率變化
```

```
/finmind 黃金價格近一年走勢
```

### 圖表

```
/finmind 台積電近三個月 K 線圖
```

![TSMC 2330 Candlestick Chart](../img/tsmc_3m_kbar.png)

```
/finmind 2330 跟 2317 近半年股價比較，畫圖
```

```
/finmind 美元匯率近一年走勢圖
```

### 進階分析

```
/finmind 比較台積電和聯發科近一年股價報酬率
```

```
/finmind 2330 近三年股利政策整理
```

```
/finmind 台股加權指數今天每 5 秒走勢
```
