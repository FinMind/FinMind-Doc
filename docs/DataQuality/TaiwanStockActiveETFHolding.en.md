# TaiwanStockActiveETFHolding Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Daily (trading days) |
| Data period | 2025-05-02 to 2026-11-13 |
| Scope of this run | 76 queries, 80,550 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--note">Coverage note</span> | 32 trading days sampled, 32 with data (100.0%); see coverage notes below |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--na">N/A</span> | Not applicable to this type of data |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled last 3 trading days of the previous month; last trading day of the same month 1 year earlier — compared row by row with official public data: 424 of 424 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 612 of 612 match (100.00%): ETF holding changes × holdings 612/612 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | 80,550 rows checked, consistent with the coverage notes below |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Short option/futures positions held by an ETF are shown with negative shares, weight and market value.
- Items such as securities receivable/payable, cash net of payables, and short option/futures positions can have a negative market value.
- Active bond ETFs investing in overseas bonds (codes ending in D) usually do not calculate NAV or publish holdings on U.S. bond-market holidays (e.g. Labor Day, Columbus Day, Veterans Day), so on those dates only the other ETFs have data and the row count is lower.

## Data maintenance log

- 2026-09-24: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-24))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockActiveETFHolding&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
