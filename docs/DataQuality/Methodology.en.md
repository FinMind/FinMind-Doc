# Data Quality Assurance

FinMind data comes from official public disclosure channels. To make sure every record you receive matches the official source, we run a continuous validation process and publish the results every month on the [Data Quality Overview](index.md).

## How we ensure data quality

<div class="dq-pillars" markdown>
<div class="dq-pillar" markdown>
<span class="dq-pillar__no">01</span>
**Validated against official sources**

For a sample of representative ids and periods, FinMind values are compared cell by cell with the same figures in official public disclosures, and the match rate is reported.
</div>
<div class="dq-pillar" markdown>
<span class="dq-pillar__no">02</span>
**Full check every month**

Every month each dataset goes through 9 automated checks covering update timeliness, trading-day coverage, official-source and cross-dataset reconciliation, query consistency and value consistency, all through the public API.
</div>
<div class="dq-pillar" markdown>
<span class="dq-pillar__no">03</span>
**Kept in sync with official sources**

When an official source updates or supplements its data, we update ours and explain it in [What's New](../WhatIsNew.md); each dataset report lists the related data maintenance entries.
</div>
</div>

## Checks

Each dataset runs the checks that apply to its type; checks that do not apply (for example, trading-day coverage for a reference list) are marked "N/A".

| Check | How it works |
|---|---|
| Update timeliness | Compare the latest date with the most recent trading day (or expected period) to confirm the data is updated on its publication schedule. |
| Trading-day coverage | Sample trading days from the official calendar (recent period plus samples from every year) and query the whole-market row count per day, confirming every trading day has data with row counts in line with neighbouring days. |
| Make-up trading-day coverage | Query every Saturday make-up trading day in the period and confirm it is covered with row counts in line with the previous trading day. |
| Match rate vs. official sources | Sample the previous month plus representative historical periods (for reference lists, the full current list) and cross-check FinMind values cell by cell with the same figures in official public disclosures, reporting the match rate. Data provided by a third-party data source, such as international stock prices, is compared with the original values from that source. |
| Cross-dataset consistency | Using the public FinMind API, we sample several trading days of the previous month plus one historical period and reconcile related datasets against each other (e.g. daily volume vs. summed ticks, per-stock institutional trades vs. market totals, financial-statement subtotals vs. their components), allowing for documented differences in definition, and report the share of consistent values. |
| Consistency across query styles | Query the same day with different parameters (single day, date range, specific id) and confirm every cell matches. |
| Field format consistency | Profile decimal places and types of numeric fields per year and confirm formats are consistent across periods. |
| Value and key consistency | Confirm quantities and amounts are non-negative, prices and volumes correspond, high is not below low, open/close lie within the high-low range, net equals buy minus sell, and primary-key fields are complete and unique. |
| Day-level content uniqueness | Fingerprint each day's full data (excluding the date column) and confirm the content of different dates is distinct. |

## Result labels

| Label | Meaning |
|---|---|
| <span class="dq-pill dq-pill--ok">Validated</span> | Every applicable check passed for this dataset in this edition. |
| <span class="dq-pill dq-pill--pass">Passed</span> | The check passed in this edition. |
| <span class="dq-pill dq-pill--note">Coverage note</span> | The result reflects a characteristic of the data itself (for example, when the official source began publishing, or market trading rules); the report explains it. |
| <span class="dq-pill dq-pill--na">N/A</span> | The check does not apply to this type of data. |
| <span class="dq-pill dq-pill--planned">Planned</span> | The dataset will be added to this check in a later edition (currently used for cross-dataset consistency). |

## Monthly updates

- A full validation runs early every month; the [overview](index.md) and every dataset report are then updated, with the edition month and check date shown at the top.
- Every dataset report includes reproducible query parameters, so you can verify the results with your own token through the FinMind API.
- Data maintenance entries only link to published [What's New](../WhatIsNew.md) notices and stay consistent with them.

??? note "Scope of sample-based checks"

    Checks such as trading-day coverage and the official-source match rate are sample-based, covering the recent period and representative dates from every year with a reasonable number of queries. Conclusions apply to the sampled scope of each edition; if you have any questions, please [contact us](../Contact.md).
