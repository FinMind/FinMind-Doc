# Service Status & Uptime

FinMind publishes a public, real-time status page:

[**status.finmindtrade.com**](https://status.finmindtrade.com)

It shows the current API status, uptime over the past **24 hours** and **90 days**, and a history of past incidents.

This uptime is also the **measurement basis for the FinMind enterprise plan SLA** — enterprise service levels are assessed with the same per-minute algorithm, kept transparent and consistent with what the status page shows.

## How uptime is calculated

Uptime is measured from real API traffic, **minute by minute**. The full formula chain is:

**1. Valid requests**

```text
valid requests = successful requests (2xx / 3xx) + server-side errors
```

- A **server-side error** means an HTTP **5xx** response, plus a connection dropped by a server-side timeout (HTTP **499** — usually caused by the server being busy or slow, so it is treated as a server-side problem).
- Ordinary **client errors** (e.g. `400` / `403` / `404` / `429`, excluding 499) are **not** counted as valid requests and do **not** affect uptime.

**2. Per-minute error rate**

```text
per-minute error rate = server-side errors ÷ valid requests
```

- A minute with **traffic and an error rate > 5%** is counted as **down**.
- Minutes with **no traffic** are **not** counted toward uptime.

**3. Uptime**

```text
uptime % = (minutes with traffic − down minutes) ÷ minutes with traffic × 100
```

- The **24-hour** and **90-day** figures aggregate these per-minute results; the 90-day and monthly numbers are weighted by **minutes with traffic**.
- **Scheduled maintenance** windows may be excluded.

## Status levels

When a time window has traffic, it is classified into four levels by that window's uptime:

| Status | Uptime threshold |
| --- | --- |
| **Operational** | 100% (traffic present, no down minutes) |
| **Degraded Performance** | ≥ 99% (some down minutes, but uptime still ≥ 99%) |
| **Partial Outage** | 95% – 99% (95% ≤ uptime < 99%) |
| **Major Outage** | < 95% |
| **No data** | No traffic in the period |

!!! tip
    The same "How uptime is calculated" note is also available at the bottom of the status page itself.
