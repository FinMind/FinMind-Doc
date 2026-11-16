# TaiwanStockConvertibleBondInstitutionalInvestors Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Daily (trading days) |
| Data period | 2009-04-01 to 2026-11-13 |
| Scope of this run | 144 queries, 8,708 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 66 trading days sampled, 66 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--note">Coverage note</span> | All 16 Saturday make-up trading days checked, 0 with data (0.0%); see coverage notes below |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled last 3 trading days of the previous month; last trading day of the same month 1 and 3 years earlier — compared row by row with official public data: 780 of 780 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--planned">Planned</span> | Planned for cross-dataset checks |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 8,708 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Saturday make-up trading days in 2018 and earlier have no convertible bond institutional trading data; the public source currently only provides data from around 2022 onward, so these dates cannot be filled.

## Data maintenance log

No recent maintenance notices for this dataset; see [What's New](https://finmind.github.io/en/WhatIsNew/) for all notices.

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockConvertibleBondInstitutionalInvestors&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
