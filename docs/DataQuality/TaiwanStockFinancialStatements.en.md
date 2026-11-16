# TaiwanStockFinancialStatements Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Weekly / monthly / quarterly |
| Data period | 1990-03-31 to 2026-09-30 |
| Scope of this run | 62 queries, 1,036,300 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest period 2026-09-30, updated on the publication schedule |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 44 periods sampled, 44 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--na">N/A</span> | Not applicable to this type of data |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026 Q2; 2021/2016 Q1 — compared row by row with official public data: 49507 of 49507 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 18,044 of 18,044 match (100.00%): Income-statement identities 18,044/18,044 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--note">Coverage note</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 1,036,300 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- The income statement summaries for 1990-1995 do not report earnings per share, so those years contain only whole-number amounts in dollars and the value column has fewer decimal places than from 1996 onward (when EPS is included).

## Data maintenance log

- 2026-10-11: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-11))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockFinancialStatements&start_date=2026-09-30&end_date=2026-09-30
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
