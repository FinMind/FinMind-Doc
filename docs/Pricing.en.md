---
description: FinMind pricing — Free, Backer NT$699/month, Sponsor NT$999/month, Sponsor Pro NT$3,330/month. Compare API rate limits, datasets and license terms of each plan.
---

# Pricing

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "FinMind API",
  "description": "Taiwan and international financial data API (stock prices, institutional trading, financial statements, futures & options, convertible bonds, real-time data) via RESTful API and Python SDK.",
  "brand": {"@type": "Brand", "name": "FinMind"},
  "url": "https://finmind.github.io/en/Pricing/",
  "offers": [
    {"@type": "Offer", "name": "Free", "price": "0", "priceCurrency": "TWD", "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Backer (monthly)", "price": "699", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "699", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "MON"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Backer (yearly)", "price": "5499", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "5499", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "ANN"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Sponsor (monthly)", "price": "999", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "999", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "MON"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Sponsor (yearly)", "price": "8888", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "8888", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "ANN"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Sponsor Pro (monthly)", "price": "3330", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "3330", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "MON"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"},
    {"@type": "Offer", "name": "Sponsor Pro (yearly)", "price": "29620", "priceCurrency": "TWD", "priceSpecification": {"@type": "UnitPriceSpecification", "price": "29620", "priceCurrency": "TWD", "referenceQuantity": {"@type": "QuantitativeValue", "value": 1, "unitCode": "ANN"}}, "url": "https://finmindtrade.com/analysis/#/Sponsor/sponsor"}
  ]
}
</script>

All prices are in **New Taiwan Dollars (TWD)** and can be purchased on the [FinMind sponsor page](https://finmindtrade.com/analysis/#/Sponsor/sponsor).

## Plans at a Glance

| Plan | Monthly | Yearly | API / Download Limit | Datasets | License |
|:---:|:---:|:---:|:---:|:---:|:---:|
| Free | Free | Free | 300 req/hour (600 req/hour for registered members) | 45 | Non-commercial |
| Backer | NT$699 | NT$5,499 | 1,600 req/hour | 81 | Non-commercial |
| **Sponsor** (recommended) | NT$999 | NT$8,888 | 6,000 req/hour | 97 | Non-commercial |
| Sponsor Pro | NT$3,330 | NT$29,620 | 20,000 req/hour | 97 + whole-day all-symbol download | **Commercial** |

- Each higher plan includes everything in the lower plans (Backer ⊃ Free, Sponsor ⊃ Backer, Sponsor Pro ⊃ Sponsor).
- Check your current usage and quota via [API Usage Count](api_usage_count.md).
- The tier required by each dataset is marked in the [dataset documentation](tutor/TaiwanMarket/DataList.md).

## Payment and Upgrades

- **One-time payment, no auto-renewal**: when a plan expires it falls back to Free automatically — nothing to cancel. To keep using it, simply pay again.
- **Upgrade anytime**: Backer or Sponsor holders can upgrade by paying the prorated difference for the remaining days (minimum NT$100). Nothing already paid is wasted.
- **Company invoices**: enter your company tax ID on the order confirmation page.
- **Campus program**: schools can download the campus program brochure from the [sponsor page](https://finmindtrade.com/analysis/#/Sponsor/sponsor).

## Datasets Added by Each Plan

### Free

- **Technical**: Taiwan stock info (incl. warrants), active ETF list, daily stock price, trading dates, sector price index, PER/PBR, 5-second order/trade statistics, TAIEX, day-trading targets and volume, total return indices
- **Chip**: margin purchase / short sale (per stock and market-wide), institutional investors buy/sell (per stock and market-wide), foreign shareholding, securities lending, short-sale suspension, margin quota balance, securities trader info
- **Fundamental**: cash flow statement, income statement, balance sheet, dividend policy, ex-dividend results, monthly revenue, capital reduction / split / par-value change reference prices, delisting
- **Derivative**: futures & options daily overview, futures & options real-time quote overview, futures daily, options daily, futures / options institutional investors, futures / options dealer daily volume
- **Others**: news, gold price, crude oil (Brent, WTI), US stock price, exchange rates (19 currencies), central bank interest rates (12 countries), US government bond yields (1M–30Y, 12 maturities)

### Backer (includes Free)

- Download **all stocks for a given date** in one request (without `data_id`) for stock prices, institutional investors, margin trading and more
- **Technical**: adjusted stock price, historical stock tick, weekly K, monthly K, 10-year line, 5-second index statistics, trading suspension notices, day-trading suspension notices, daily price limits
- **Chip**: market margin maintenance ratio, shareholding distribution, disposition securities, day-trading securities lending fee
- **Fundamental**: market value, market value weight, monthly business indicator, industry chain
- **Derivative**: futures tick, options tick, large traders' open interest (futures / options), night-session institutional investors (futures / options), final settlement price (futures / options), futures spread trading, TAIEX options VIX, asset swap fixed income / options daily
- **Convertible Bond**: CB info, CB daily, CB institutional investors, CB daily overview, CB monthly analysis, CB put provision schedule
- **Others**: CNN Fear & Greed Index, US stock minute K

### Sponsor (includes Backer)

- **Technical**: stock minute K, warrant underlying mapping
- **Chip**: broker branch trading report, eight government banks buy/sell, broker branch daily statistics, block trade daily report, block trade daily, loan collateral balance, per-stock margin maintenance ratio, active ETF daily holdings, active ETF holding changes, industry chain money flow
- **Real-time**: Taiwan stock, futures and options real-time data
- **Derivative**: futures spread tick, futures minute K

### Sponsor Pro (includes Sponsor)

- **Download all symbols for a given date**: stock tick, broker branch trading report, warrant broker branch trading report, stock minute K, futures tick, options tick

## License

| | Free / Backer / Sponsor | Sponsor Pro |
|:---|:---:|:---:|
| Personal, academic, web / app development and other non-commercial use | ✅ | ✅ |
| Commercial use: SaaS, AI, web / app, internal company systems | ❌ | ✅ |
| Integrate into commercial products for sale | ❌ | ✅ |
| Redistribute raw data or build a mirror API | ❌ | ❌ |
| Display real-time data directly on public web / app interfaces | ❌ | ❌ |
| Attribution "FinMind" required | Yes | Yes |

FinMind is not responsible for any use beyond the licensed scope. See [Disclaimer & Data Licensing](Disclaimer.md) and [Terms of Use & Privacy Policy](PrivacyPolicy.md).

## FAQ

??? note "Will I be charged automatically?"
    No. All plans are one-time payments and fall back to Free when they expire — nothing to cancel.

??? note "Which plan do I need for a commercial product (SaaS, app, AI service)?"
    Commercial use requires Sponsor Pro. Free, Backer and Sponsor are for non-commercial use only.

??? note "Not sure which plan to choose?"
    Start with Backer, then upgrade to Sponsor or Sponsor Pro anytime by paying the prorated difference.

For other questions, email finmind.tw@gmail.com.
