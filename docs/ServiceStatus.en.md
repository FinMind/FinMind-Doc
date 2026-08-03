# Service Status & Uptime

FinMind publishes a public, real-time status page:

[**status.finmindtrade.com**](https://status.finmindtrade.com)

It shows the current API status, uptime over the past **24 hours** and **90 days**, and a history of past incidents.

This uptime is also the **measurement basis for the FinMind enterprise plan SLA** — enterprise service levels are assessed with the same algorithm, kept transparent and consistent with what the status page shows.

## How uptime is calculated

Uptime is measured from real API traffic, **request by request**. The full formula chain is:

**1. Valid requests**

```text
valid requests = successful requests (2xx / 3xx) + server-side errors
```

- A **server-side error** means an HTTP **5xx** response, plus a connection dropped by a server-side timeout (HTTP **499** — usually caused by the server being busy or slow, so it is treated as a server-side problem).
- Ordinary **client errors** (e.g. `400` / `403` / `404` / `429`, excluding 499) are **not** counted as valid requests and do **not** affect uptime.

**2. Uptime**

```text
uptime % = successful requests ÷ valid requests × 100
```

- The **24-hour**, **90-day** and **month-to-date** figures each sum the requests in that window and compute the ratio once — they are not averages of per-minute or per-day uptime.
- Windows with **no traffic** are **not** counted toward uptime.
- **Scheduled maintenance** windows may be excluded; their requests count toward neither the numerator nor the denominator.

??? note "Why uptime is request-based"

    With requests as the denominator, an error rate is reflected **proportionally** in uptime: if 1.6% of the requests in a window end in a server-side error, uptime for that window is 98.4%.

    If uptime were instead measured by whether each block of time counts as "down", a persistent but low error rate would leave every block looking healthy and uptime pinned at 100%, hiding an ongoing degradation. Counting requests avoids that blind spot and matches the failure rate you actually experience.

## Status levels

When a time window has traffic, it is classified into four levels by that window's uptime:

| Status | Uptime threshold |
| --- | --- |
| **Operational** | ≥ 99.5% |
| **Elevated Error Rates** | 95% – 99.5% (95% ≤ uptime < 99.5%) |
| **Partial Outage** | 80% – 95% (80% ≤ uptime < 95%) |
| **Major Outage** | < 80% |
| **No data** | No traffic in the period |

!!! tip
    The same "How uptime is calculated" note is also available at the bottom of the status page itself.
