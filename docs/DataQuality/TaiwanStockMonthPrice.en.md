# TaiwanStockMonthPrice Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Weekly / monthly / quarterly |
| Data period | 1999-12-01 to 2026-10-01 |
| Scope of this run | 81 queries, 1,527,346 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest period 2026-10-01, updated on the publication schedule |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 50 periods sampled, 50 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--na">N/A</span> | Not applicable to this type of data |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-01~2026-10; full year 5 and 10 years earlier — compared row by row with official public data: 98 of 98 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 84 of 84 match (100.00%): Monthly bars × daily bars 84/84 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | 1,527,346 rows checked, consistent with the coverage notes below |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- The monthly open is taken from the first trade of the month; for Emerging Stock Board stocks the opening reference price is the previous trading day's average trade price and can fall outside the month's high/low range.
- Weekly/monthly bars are aggregated from daily bars. When a stock has no regular-session trade during the whole week (month) and only odd-lot, after-hours fixed-price, or block trades, the daily open/high/low/close are all 0, so the weekly/monthly price fields are 0 as well; trading volume and value are the sums of the daily figures, which include odd-lot, after-hours fixed-price, and block trades.

## Data maintenance log

- 2026-09-25: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-25))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockMonthPrice&start_date=2026-10-01&end_date=2026-10-01
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
