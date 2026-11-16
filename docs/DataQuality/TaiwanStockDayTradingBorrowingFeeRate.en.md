# TaiwanStockDayTradingBorrowingFeeRate Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Daily (trading days) |
| Data period | 2015-06-04 to 2026-11-13 |
| Scope of this run | 103 queries, 5,216 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 52 trading days sampled, 52 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | All 8 Saturday make-up trading days checked, 8 with data (100.0%) |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10-01; 2026-10-30; 2021-10-01; 2021-10-29; 2016-10-03; 2016-10-31 — compared row by row with official public data: 241 of 241 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--planned">Planned</span> | Planned for cross-dataset checks |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 5,216 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Borrowing fee rates follow the officially published figures: most are whole numbers or have 1 decimal place and only a few have 2-3 decimal places; the number of such rates varies from year to year, so the decimal-place distribution differs across years.

## Data maintenance log

No recent maintenance notices for this dataset; see [What's New](https://finmind.github.io/en/WhatIsNew/) for all notices.

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockDayTradingBorrowingFeeRate&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
