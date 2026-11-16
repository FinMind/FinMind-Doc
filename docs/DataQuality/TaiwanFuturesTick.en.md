# TaiwanFuturesTick Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated</span> |
| Check date | 2026-11-14 |
| Data type | Tick / minute |
| Data period | 2011-01-03 to 2026-11-13 |
| Scope of this run | 134 queries, 10,295,270 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 80 id-days sampled, 80 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | Checked by data characteristics |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10-29; 2026-10-30 — compared row by row with official public data: 19 of 19 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 340 of 340 match (100.00%): Futures daily × ticks 340/340 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 10,295,270 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

No coverage notes for this dataset in this edition.

## Data maintenance log

- 2026-09-20: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-20))
- 2026-09-19: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-19))
- 2026-09-17: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-17))
- 2026-09-02: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-02))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanFuturesTick&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
