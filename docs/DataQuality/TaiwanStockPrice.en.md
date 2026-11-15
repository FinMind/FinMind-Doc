# TaiwanStockPrice Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Daily (trading days) |
| Data period | 1999-01-05 to 2026-11-13 |
| Scope of this run | 209 queries, 2,673,534 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 86 trading days sampled, 86 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | All 74 Saturday make-up trading days checked, 74 with data (100.0%) |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10 — compared row by row with official public data: 95 of 95 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 384 of 384 match (100.00%): Daily bars × ticks 144/144; Minute bars × daily bars × ticks 240/240 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | 2,673,534 rows checked, consistent with the coverage notes below |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- For Emerging Stock Board stocks, the opening reference price is the previous trading day's average trade price, so it can fall outside the day's high/low range.
- When a stock has no regular-session trade on a day and only odd-lot, after-hours fixed-price, or block trades, the official daily quotes show "--" for open/high/low/close, so the price fields are 0; trading volume and value follow the official statistics, which include odd-lot, after-hours fixed-price, and block trades.

## Data maintenance log

- 2026-09-25: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-25))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockPrice&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
