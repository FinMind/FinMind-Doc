# TaiwanOptionDaily Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Daily (trading days) |
| Data period | 2001-12-24 to 2026-11-13 |
| Scope of this run | 273 queries, 622,954 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--note">Coverage note</span> | 67 trading days sampled, 67 with data (100.0%); see coverage notes below |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | All 23 Saturday make-up trading days checked, 23 with data (100.0%) |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10-29; 2026-10-30; 2021-10-29; 2016-10-31 — compared row by row with official public data: 13246 of 13246 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 270 of 270 match (100.00%): Options daily × ticks 270/270 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | 622,954 rows checked, consistent with the coverage notes below |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- When the official report shows blank open/high/low/close but a non-zero volume for a contract, open/high/low/close are 0 here and the volume follows the official figure.
- TAIEX options were launched on 2001-12-24; fewer contracts were listed in the first days, so lower row counts are expected.
- Contracts are quoted in different tick sizes: currency futures and options are quoted to 4 decimal places, while index and stock contracts mostly use whole numbers or 1-2 decimals. The mix of listed contracts changes over the years, so the overall decimal-place distribution of price fields differs by year.

## Data maintenance log

No recent maintenance notices for this dataset; see [What's New](https://finmind.github.io/en/WhatIsNew/) for all notices.

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanOptionDaily&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
