# EuropeStockPrice Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Overseas daily |
| Data period | 1998-07-20 to 2026-11-13 |
| Scope of this run | 75 queries, 28,704 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 49 trading days sampled, 49 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--na">N/A</span> | Not applicable to this type of data |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10; 2021-10; 2016-10 — compared row by row with the original values from the data source: 320 of 320 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--planned">Planned</span> | Planned for cross-dataset checks |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | 28,704 rows checked, consistent with the coverage notes below |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Adjusted close (Adj_Close) is provided by the data source and is negative on a few early dates because of the source's adjustment calculation; use Close for actual prices.
- Price fields below 1 keep 6 decimal places and values of 1 or more keep 2. Prices below 1 mostly have 1-4 decimal places according to each market's tick size at the time, while prices adjusted backward for stock splits or dividends (including the adjusted close) can have up to 6; the share of prices below 1 differs from year to year, so the maximum number of decimal places differs across years.
- Open, high, low and close are provided by the data source; for some tickers (especially thinly traded ones) the open or close falls outside the day's high/low range, matching the data source. Prices for the most recent trading day are the values the data source provided at the time and are updated along with later updates from the data source.

## Data maintenance log

No recent maintenance notices for this dataset; see [What's New](https://finmind.github.io/en/WhatIsNew/) for all notices.

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=EuropeStockPrice&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
