# UKStockPrice Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Overseas daily |
| Data period | 1990-01-01 to 2026-11-13 |
| Scope of this run | 83 queries, 175,987 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 57 trading days sampled, 57 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--na">N/A</span> | Not applicable to this type of data |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10; 2021-10; 2016-10 — compared row by row with the original values from the data source: 320 of 320 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--planned">Planned</span> | Planned for cross-dataset checks |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | 175,987 rows checked, consistent with the coverage notes below |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Price fields below 1 keep 6 decimal places and values of 1 or more keep 2. Adjusted close (Adj_Close) is adjusted backward for dividends, so earlier years contain more values below 1 and therefore show more decimal places.
- Adjusted close (Adj_Close) is provided by the data source; for some tickers (mostly those with dividends large relative to the share price, or thinly traded ones) it is negative because of the source's backward adjustment calculation. Use Close for actual prices.
- Open, high, low and close are provided by the data source. On the London Stock Exchange the open and close come from the opening and closing auctions, so for some tickers (especially thinly traded ones) the open or close can fall outside the day's high/low range, and on a few early dates the high is slightly below the low. Prices for the most recent trading day are updated along with the data source over the following few days.
- For some delisted ultra-low-priced tickers (price below 0.005 per share) whose price history is no longer available from the data source, price fields are 0 on some historical dates while volume is the actual value; exclude rows with a zero price when computing returns.

## Data maintenance log

No recent maintenance notices for this dataset; see [What's New](https://finmind.github.io/en/WhatIsNew/) for all notices.

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=UKStockPrice&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
