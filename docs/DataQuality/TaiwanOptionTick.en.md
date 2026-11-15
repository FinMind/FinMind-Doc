# TaiwanOptionTick Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Tick / minute |
| Data period | 2011-01-03 to 2026-11-12 |
| Scope of this run | 133 queries, 15,492 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-12, updated on the publication schedule |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 78 id-days sampled, 78 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | Checked by data characteristics |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10-29; 2026-10-30 — compared row by row with official public data: 107 of 107 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 270 of 270 match (100.00%): Options daily × ticks 270/270 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 15,492 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Low-volume contracts such as Electronic Sector Index Options (TEO) and Finance Sector Index Options (TFO) have no trades at all on some trading days, so tick data for those days is empty (e.g. TEO on 2026-07-02, 11-05 and 11-09 to 11-11). The check confirms such days against a daily volume of 0.
- The number of decimal places in option trade prices depends on the premium tick size and the traded price level at the time: for Electronic Sector Index Options (TEO), lower-priced contracts had a tick size of 0.005 or 0.025 points up to 2025-12-05, so trade prices could have 3 decimal places; from 2025-12-08 official prices have at most 2 decimal places. Low-priced contracts do not trade every day, so the maximum number of decimal places in tick prices differs by year.

## Data maintenance log

- 2026-09-02: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-02))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanOptionTick&start_date=2026-11-12&end_date=2026-11-12
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
