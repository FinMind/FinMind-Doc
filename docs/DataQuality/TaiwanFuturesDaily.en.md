# TaiwanFuturesDaily Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Daily (trading days) |
| Data period | 1999-01-05 to 2026-11-13 |
| Scope of this run | 324 queries, 139,577 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 86 trading days sampled, 86 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | All 74 Saturday make-up trading days checked, 74 with data (100.0%) |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10 — compared row by row with official public data: 36 of 36 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 340 of 340 match (100.00%): Futures daily × ticks 340/340 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 139,577 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Contracts are quoted in different tick sizes: currency futures and options are quoted to 4 decimal places, while index and stock contracts mostly use whole numbers or 1-2 decimals. The mix of listed contracts changes over the years, so the overall decimal-place distribution of price fields differs by year.

## Data maintenance log

No recent maintenance notices for this dataset; see [What's New](https://finmind.github.io/en/WhatIsNew/) for all notices.

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanFuturesDaily&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
