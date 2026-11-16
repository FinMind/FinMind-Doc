# TaiwanFuturesInstitutionalInvestors Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated</span> |
| Check date | 2026-11-14 |
| Data type | Daily (trading days) |
| Data period | 2018-06-05 to 2026-11-13 |
| Scope of this run | 97 queries, 3,129 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 48 trading days sampled, 48 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | All 1 Saturday make-up trading days checked, 1 with data (100.0%) |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10-28; 2026-10-29; 2026-10-30; 2025-10-31; 2024-10-30 — compared row by row with official public data: 342 of 342 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 1,488 of 1,488 match (100.00%): Futures institutional × combined table 1,488/1,488 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 3,129 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

No coverage notes for this dataset in this edition.

## Data maintenance log

No recent maintenance notices for this dataset; see [What's New](https://finmind.github.io/en/WhatIsNew/) for all notices.

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanFuturesInstitutionalInvestors&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
