# TaiwanStockKBar Data Quality Report (2026-11)

[← Back to overview](index.md)　|　[Methodology](Methodology.md)

| Item | Value |
|---|---|
| Result | <span class="dq-pill dq-pill--ok">Validated · with coverage notes</span> |
| Check date | 2026-11-14 |
| Data type | Tick / minute |
| Data period | 2018-12-07 to 2026-11-13 |
| Scope of this run | 116 queries, 22,040 rows checked |

## Key indicators

| Check | Result | Details |
|---|---|---|
| Update timeliness | <span class="dq-pill dq-pill--pass">Passed</span> | Latest date 2026-11-13, in sync with the most recent trading day |
| Trading-day coverage | <span class="dq-pill dq-pill--pass">Passed</span> | 84 id-days sampled, 84 with data (100.0%) |
| Make-up trading-day coverage | <span class="dq-pill dq-pill--note">Coverage note</span> | Checked by data characteristics; see coverage notes below |
| Match rate vs. official sources | <span class="dq-pill dq-pill--pass">Passed</span> | Sampled 2026-10-01; 2026-10-30; 2021-10-15 — compared row by row with official public data: 9 of 9 match (100.00%) |
| Cross-dataset consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 240 of 240 match (100.00%): Minute bars × daily bars × ticks 240/240 |

## Additional checks

| Check | Result | Details |
|---|---|---|
| Consistency across query styles | <span class="dq-pill dq-pill--pass">Passed</span> | Single-day, range and per-id queries return the same data |
| Field format consistency | <span class="dq-pill dq-pill--pass">Passed</span> | Field formats consistent across years |
| Value and key consistency | <span class="dq-pill dq-pill--pass">Passed</span> | 22,040 rows checked, all rules passed |
| Day-level content uniqueness | <span class="dq-pill dq-pill--pass">Passed</span> | Each day's content is distinct |

## Coverage notes

- Tick-level trades are not publicly available for 2018-12-22 (a Saturday make-up trading day), so there is no tick or minute-K data for that date.
- For Emerging Stock Board stocks from 2023-01-30 to 2025-03-31 (except 2024-03-12 to 03-29), tick-level trades are publicly available only up to 14:31:05 each day; trades from then until the 15:00 close are not provided, so tick and minute-K data for these stocks cover trading up to 14:31 and the summed tick volume is slightly below the daily volume.
- On 2020-03-23 and 03-24 (the first two days of continuous trading for OTC stocks), the opening and closing call-auction trades of OTC stocks are not publicly available at tick level, so on these two days the first tick and minute bar of OTC stocks are not the opening auction and the last trade is around 13:25, without the 13:30 closing trade.
- From 2023 to Q1 2025, for some listed stocks on individual days the summed tick volume is slightly below the day's volume excluding odd-lot and block trades; tick and minute-K data follow the tick-level trades publicly provided at the time.
- On 2018-12-07 and 12-10, the first tick of some Emerging Stock Board stocks shows a volume of 500 shares as provided by the public source, so the summed tick volume can differ from the daily volume by a few hundred shares.

## Data maintenance log

- 2026-10-19: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-19))
- 2026-10-17: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-17))
- 2026-10-11: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-11))
- 2026-10-10: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-10))
- 2026-10-05: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-05))
- 2026-10-04: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-04))
- 2026-10-01: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-10-01))
- 2026-09-29: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-29))
- 2026-09-28: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-28))
- 2026-09-25: updated from official sources (see [What's New](https://finmind.github.io/en/WhatIsNew/#2026-09-25))

## Reproduce this check

Send these parameters to `https://api.finmindtrade.com/api/v4/data` to verify on your own (your own token is required):

```text
dataset=TaiwanStockKBar&start_date=2026-11-13&end_date=2026-11-13
```

---

All figures were obtained through the public FinMind API and official public data. Checks are sample-based and the conclusions apply to the sampled scope of this edition. See [Methodology](Methodology.md) for how each check works.
