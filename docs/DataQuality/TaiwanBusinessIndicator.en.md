# TaiwanBusinessIndicator Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated</span> |
| Check date | 2026-11-14 |
| Data type | Time series |
| Data period | 1990-01-01 to 2026-09-01 |
| Scope of this run | 9 queries, 441 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-09-01 |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | No fixed trading calendar; checked by date gaps |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--na">N/A</span> | Not applicable to this type of data |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled last 12 months; 2021, 2016 — compared row by row with official public data: 36 of 36 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--planned">Planned</span> | Planned for cross-dataset checks |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 441 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--na">N/A</span> | Not applicable to this type of data |

## Coverage notes

No coverage notes for this dataset in this edition.

## Data maintenance log

No recent maintenance notices for this dataset; see [What's New](https://finmind.github.io/en/WhatIsNew/) for all notices.

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanBusinessIndicator&start_date=2026-09-01&end_date=2026-09-01
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
