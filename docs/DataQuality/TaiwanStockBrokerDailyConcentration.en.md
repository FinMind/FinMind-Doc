# TaiwanStockBrokerDailyConcentration Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated</span> |
| Check date | 2026-11-16 |
| Data type | Daily (trading days) |
| Data period | 2021-06-28 to 2026-11-13 |
| Scope of this run | 87 queries, 105,193 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 40 trading days sampled, 40 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--na">N/A</span> | Not applicable to this type of data |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10-01; 2026-10-30; 2021-10-15 — recomputed from official public data and compared row by row: 15 of 15 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 48 of 48 match (100.00%): Broker concentration × daily volume 48/48 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 105,193 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

No coverage notes for this dataset in this edition.

## Data maintenance log

- 2026-10-23: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-23))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockBrokerDailyConcentration&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
