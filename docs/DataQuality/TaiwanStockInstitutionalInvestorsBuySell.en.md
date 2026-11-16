# TaiwanStockInstitutionalInvestorsBuySell Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Daily (trading days) |
| Data period | 2005-01-03 to 2026-11-13 |
| Scope of this run | 166 queries, 5,924,948 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 74 trading days sampled, 74 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--note">Coverage note</span> | All 23 Saturday make-up trading days checked, 23 with data (100.0%); see coverage notes below |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10-01; 2026-10-30; 2021-10-15; 2016-10-17 — compared row by row with official public data: 4598 of 4598 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 907,460 of 907,460 match (100.00%): Per-stock institutional × market total 36/36; Institutional long × wide table 777,792/777,792; Institutional trades × traded volume 129,632/129,632 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 5,924,948 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Before 2012-05-02 only OTC data is available and only stocks with institutional trades that day are listed; Saturday make-up trading days are thin, so fewer rows are expected.

## Data maintenance log

- 2026-09-20: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-20))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockInstitutionalInvestorsBuySell&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
