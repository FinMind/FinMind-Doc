# Service Status & Uptime

FinMind publishes a public, real-time status page:

[**status.finmindtrade.com**](https://status.finmindtrade.com){ target="_blank" }

It shows the current API status, uptime over the past **24 hours** and **90 days**, and a history of past incidents.

## How uptime is calculated

Uptime is measured from real API traffic, **minute by minute**:

- A minute is counted as **down** only when more than **5%** of its valid requests fail with a **server-side error**.
- A **server-side error** means an HTTP **5xx** response, plus a connection dropped by a server-side timeout (HTTP **499** — usually caused by the server being busy or slow, so it is treated as a server-side problem).
- Ordinary **client errors** (e.g. `400` / `403` / `404` / `429`) and minutes with **no traffic** are **not** counted against uptime.

Formula:

```text
uptime % = (minutes with traffic − down minutes) ÷ minutes with traffic
```

- The **24-hour** and **90-day** figures aggregate these per-minute results; the 90-day and monthly numbers are weighted by traffic.
- **Scheduled maintenance** windows may be excluded.

## Status levels

| Status | Meaning |
| --- | --- |
| **Operational** | No down minutes in the period |
| **Degraded** | Some downtime, but uptime ≥ 90% |
| **Outage** | Uptime < 90% |
| **No data** | No traffic in the period |

!!! tip
    The same "How uptime is calculated" note is also available at the bottom of the status page itself.
