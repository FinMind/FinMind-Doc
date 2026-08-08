In Taiwan stock technical data, we have 20 datasets, as follows:

- [Taiwan Stock Overview TaiwanStockInfo](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockinfo)
- [Taiwan Stock Overview (with Warrants) TaiwanStockInfoWithWarrant](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockinfowithwarrant)
- [Taiwan Warrant Underlying Reference Table TaiwanStockInfoWithWarrantSummary](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockinfowithwarrantsummary-sponsor)
- [Taiwan Stock Trading Date TaiwanStockTradingDate](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstocktradingdate)
- [Taiwan Stock Price Table TaiwanStockPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockprice)
- [Taiwan Stock Weekly K Table TaiwanStockWeekPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#k-taiwanstockweekprice-backersponsor)
- [Taiwan Stock Monthly K Table TaiwanStockMonthPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#k-taiwanstockmonthprice-backersponsor)
- [Taiwan Adjusted Stock Price Table TaiwanStockPriceAdj](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockpriceadj-backersponsor)
- [Taiwan Stock Historical Tick Data Table TaiwanStockPriceTick](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockpricetick-backersponsor)
- [Taiwan Individual Stock PER, PBR Table TaiwanStockPER](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#perpbr-taiwanstockper)
- [Order and Trade Statistics Every 5 Seconds TaiwanStockStatisticsOfOrderBookAndTrade](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#5-taiwanstockstatisticsoforderbookandtrade)
- [Taiwan Weighted Index TaiwanVariousIndicators5Seconds](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanvariousindicators5seconds)
- [Day Trading Targets and Volume/Value TaiwanStockDayTrading](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockdaytrading)
- [Weighted/OTC Total Return Index TaiwanStockTotalReturnIndex](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstocktotalreturnindex)
- [Taiwan Individual Stock 10-Year Line Table TaiwanStock10Year](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstock10year-backersponsor)
- [Taiwan Stock Minute K Table TaiwanStockKBar](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#k-taiwanstockkbar-sponsor)
- [Index Statistics Every 5 Seconds TaiwanStockEvery5SecondsIndex](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#5-taiwanstockevery5secondsindex-backersponsor)
- [Taiwan Stock Suspension Announcement TaiwanStockSuspended](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstocksuspended-backersponsor)
- [Day Trading Sell-First-Then-Buy Suspension Notice TaiwanStockDayTradingSuspension](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockdaytradingsuspension-backersponsor)
- [Daily Price Limit TaiwanStockPriceLimit](https://finmind.github.io/en/tutor/TaiwanMarket/Technical/#taiwanstockpricelimit-backersponsor)


----------------------------------
#### Taiwan Stock Overview TaiwanStockInfo

- This table mainly lists all Taiwan listed (TWSE), OTC (TPEx), and Emerging stocks, including stock names, codes, and industry categories!
- Data update time: **1:30 daily**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_info()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockInfo",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset = "TaiwanStockInfo"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | industry_category   |   stock_id | stock_name   | type   | date       |
        |---:|:--------------------|-----------:|:-------------|:-------|:-----------|
        |  0 | ETF                 |       0050 | 元大台灣50   | twse   | 2021-10-05 |
        |  1 | ETF                 |       0051 | 元大中型100  | twse   | 2021-10-05 |
        |  2 | ETF                 |       0052 | 富邦科技     | twse   | 2021-10-05 |
        |  3 | ETF                 |       0053 | 元大電子     | twse   | 2021-10-05 |
        |  4 | ETF                 |       0054 | 元大台商50   | twse   | 2021-10-05 |
    === "Schema"
        ```
        {
            industry_category: str, # industry category
            stock_id: str, # stock code
            stock_name: str, # stock name
            type: str, # market type
            date: str # update date
        }
        ```


----------------------------------
#### Taiwan Stock Overview (with Warrants) TaiwanStockInfoWithWarrant

- This table mainly lists all Taiwan listed (TWSE), OTC (TPEx), and Emerging stocks and warrants, including names, codes, and industry categories!
- Total record count exceeds 50,000.
- Data update time: **1:30 daily**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_info_with_warrant()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockInfoWithWarrant",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset = "TaiwanStockInfoWithWarrant"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | industry_category   |   stock_id | stock_name   | type   | date       |
        |---:|:--------------------|-----------:|:-------------|:-------|:-----------|
        |  0 | ETF                 |       0050 | 元大台灣50   | twse   | 2021-10-05 |
        |  1 | ETF                 |       0051 | 元大中型100  | twse   | 2021-10-05 |
        |  2 | ETF                 |       0052 | 富邦科技     | twse   | 2021-10-05 |
        |  3 | ETF                 |       0053 | 元大電子     | twse   | 2021-10-05 |
        |  4 | ETF                 |       0054 | 元大台商50   | twse   | 2021-10-05 |
    === "Schema"
        ```
        {
            industry_category: str, # industry category
            stock_id: str, # stock code
            stock_name: str, # stock name
            type: str, # market type
            date: str # update date
        }
        ```

----------------------------------
#### Taiwan Warrant Underlying Reference Table TaiwanStockInfoWithWarrantSummary (available only to [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Provides the warrant underlying reference table. (Since it includes warrant data, the data volume is large and takes about a minute.)
- Covers both **listed (TWSE) and OTC (TPEX)** warrants' underlying (`target_stock_id`) reference; OTC warrant underlying history goes back to **2011-01-03**, so you can look up the warrants of a given underlying (including expired and code-reused historical warrants).
- Data update time: **1:30 daily**. The actual update time is based on the API data.

??? note "A single warrant code may map to different underlying stocks"
    Warrants have an expiration date. **Once a warrant code (`stock_id`) expires and is delisted, that code is recycled and reissued to a new warrant on a (possibly different) underlying stock.** As a result, the same `stock_id` may appear in multiple rows in this table, each mapping to a different underlying (`target_stock_id`) and each with its own `date` (listing date) and `end_date` (last trading date).

    To determine which underlying a warrant code maps to on a given day, match by **"the query date falls within that row's `date` ~ `end_date` interval"**; reused codes from different periods are naturally distinguished by their non-overlapping intervals.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockInfoWithWarrantSummary",
            "data_id": "2330",# optional parameter
            "start_date": "2020-04-06",# optional parameter
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset = "TaiwanStockInfoWithWarrantSummary",
                data_id = "2330",# optional parameter
                start_date = "2020-04-06"# optional parameter
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    |   stock_id | date       |   close |   target_stock_id |   target_close | type   | fulfillment_method   | end_date   | fulfillment_start_date   | fulfillment_end_date   |   exercise_ratio |   fulfillment_price |
        |---:|-----------:|:-----------|--------:|------------------:|---------------:|:-------|:---------------------|:-----------|:-------------------------|:-----------------------|-----------------:|--------------------:|
        |  0 |     052018 | 2023-07-18 |       0 |              2330 |              0 | 認購   | 美式                 | 2025-07-15 | 2023-07-18               | 2025-07-17             |             0.1  |                   0 |
        |  1 |     052405 | 2023-07-21 |       0 |              2330 |              0 | 認購   | 美式                 | 2025-07-17 | 2023-07-21               | 2025-07-21             |             0.01 |                   0 |
        |  2 |     057397 | 2023-09-04 |       0 |              2330 |              0 | 認購   | 美式                 | 2025-09-01 | 2023-09-04               | 2025-09-03             |             0.03 |                   0 |
        |  3 |     057607 | 2023-09-06 |       0 |              2330 |              0 | 認購   | 美式                 | 2025-09-03 | 2023-09-06               | 2025-09-05             |             0.06 |                   0 |
        |  4 |     060985 | 2023-10-03 |       0 |              2330 |              0 | 認購   | 美式                 | 2025-09-30 | 2023-10-03               | 2025-10-02             |             0.03 |                   0 |
    === "Schema"
        ```
        {
            stock_id: str, # stock code
            date: str, # listing date
            close: float, # closing price
            target_stock_id: str, # underlying stock code
            target_close: float, # underlying closing price
            type: str, # warrant type
            fulfillment_method: str, # exercise method
            end_date: str, # last trading date
            fulfillment_start_date: str, # exercise start date
            fulfillment_end_date: str, # exercise end date
            exercise_ratio: float, # exercise ratio
            fulfillment_price: float # exercise price
        }
        ```

----------------------------------
#### Taiwan Stock Trading Date TaiwanStockTradingDate

- Provides Taiwan stock trading dates.
- Data update time: Monday to Friday 18:00. The actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockTradingDate",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset = "TaiwanStockTradingDate"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | date       |
        |---:|:-----------|
        |  0 | 2005-01-03 |
        |  1 | 2005-01-04 |
        |  2 | 2005-01-05 |
        |  3 | 2005-01-06 |
        |  4 | 2005-01-07 |
    === "Schema"
        ```
        {
            date: str # trading date
        }
        ```

----------------------------------
#### Daily Stock Price Information TaiwanStockPrice

- Provides daily trading information for Taiwan listed (TWSE), OTC (TPEx), and Emerging stocks!
- Data range: 1994-10-01 ~ now
- Data update time: **Monday to Friday 17:30**. The actual update time is based on the API data.

??? warning "Emerging stocks: `open` is the *previous-day average price*, and may fall outside the day's high/low (not a data error)"
    Emerging-board stocks trade by negotiation and **have no opening price**. For emerging stocks this table therefore fills `open` with the **previous-day average price**, not an opening price; `max` / `min` / `close` are still the day's high / low / last traded price and are correct.

    As a result, an emerging stock's `open` can sit above `max` or below `min` on volatile days. This is a **field-definition difference, not corrupt data**. For candlestick charts, use `max` / `min` / `close`, or treat `open` as the previous-day average.

    **Example**: 6515 穎崴 on 2020-03-19 (emerging at the time) → `open=218.06`, `max=200`, `min=170`, `close=174.9`; 218.06 is exactly the previous-day average that day. The stock later moved to TWSE, after which its data is normal.

    **A related case: `open=0` on an emerging stock's first trading day.** Since an emerging stock's `open` is the *previous-day average*, on a stock's **very first trading day** there is no previous day to average, so `open` shows as `0`; `max` / `min` / `close` are still the day's correct values, and from the next day onward `open` carries a normal previous-day average. This too is a field-definition difference, not corrupt data.

    **Example**: 8272 全景 on 2023-10-17 (its first day on the emerging board) → `open=0`, `max=136`, `min=112.5`, `close=130`; the next day, 2023-10-18, `open=129.39`, which is 2023-10-17's average price. The same rule holds for `TaiwanStockPriceAdj` (adjusted price): the adjusted price is the raw price times an adjustment factor, so `0` carries through unchanged.

??? warning "When no traded price is published for a stock on a given day, `open` / `max` / `min` / `close` are all `0` (not a data error)"
    In the daily quote published by TWSE / TPEx, a stock with **no published traded price for that day** has its open/high/low/close shown as `--`. This table follows the original publication and converts that to the numeric value `0`, so `open` / `max` / `min` / `close` / `spread` are all `0` for that stock on that day. **The source publication itself carries no price** — this is not a crawling gap.

    This can happen **in any market** (TWSE, TPEx, and Emerging alike) and is unrelated to the emerging-board `open` definition described above. A halted stock, a day with no trades at all, or a day with only sporadic trades that produce no published price all fall into this category.

    **Example 1 (no trades at all)**: 2317 鴻海 on 2025-07-30 → `Trading_Volume=0`, and `open`/`max`/`min`/`close` are all `0`; the TWSE publication for that day literally reads "volume 0, open/high/low/close `--`". The previous trading day 2025-07-29 (`close=171.5`) and the next one 2025-07-31 (`close=178`) are both normal.

    **Example 2 (volume present but no published price)**: 9929 秋雨 on 2025-07-31 → `Trading_Volume=451`, yet `open`/`max`/`min`/`close` are still `0`; the TWSE publication reads "volume 451, open/high/low/close `--`".

    **How to detect it**: because of Example 2, **do not filter on `Trading_Volume > 0` alone** — that condition misses rows that have volume but no price. Filter on the price columns instead:

    ```python
    df = df[df["close"] > 0]          # keep only days with a published traded price
    # or forward-fill from the previous trading day's close
    df["close"] = df["close"].replace(0, method="ffill")
    ```

    **Difference from `TaiwanStockPriceAdj`**: the adjusted-price table is **not** `0` on these days — it carries forward the previous trading day's adjusted price (while `Trading_Volume` keeps the day's actual value). For instance, 2317 鴻海 on 2025-07-30 in `TaiwanStockPriceAdj` is `open=169.94`, `max=170.43`, `min=166.06`, `close=166.54`, i.e. 2025-07-29's adjusted price. Use `TaiwanStockPriceAdj` if you want a series with no `0` gaps; use `TaiwanStockPrice`'s `0` if you need to identify which days had no published price.

??? note "Listed (TWSE) data before 2005: the history of delisted securities may be incomplete — mind survivorship bias in long backtests"
    For the **listed (TWSE)** market **before 2005**, the universe covered by this table consists mainly of securities that kept trading afterwards. Securities that **were trading at the time but have since been delisted** may not have their history for that period fully covered, so the number of securities present is smaller than the number actually listed back then.

    Some stocks also start **later in this table than their real listing date**. For example, 2311 and 2325 begin no earlier than `2004-02-11` here, and 2319 is absent entirely.

    **Impact on backtests**: building a stock universe, an industry population or a custom index directly from this table's pre-2005 listed data skews the sample toward the securities that survived, which **systematically overstates returns and understates risk** (survivorship bias). We suggest:

    - starting long backtests **after 2005**; or
    - if you must cover earlier periods, stating explicitly in your methodology and conclusions that the pre-2005 listed sample is not the complete universe of that time, so the bias is not mistaken for strategy performance.

    **OTC (TPEx) data is unaffected** — the pre-2005 OTC universe is normal. The same note applies to `TaiwanStockPriceAdj` (adjusted price), which is derived from this table.

??? note "OTC (TPEx) daily quotes are missing for 2007-01-02 ~ 2007-04-20 (not published at the source)"
    For the **OTC (TPEx)** market, this table has no per-stock daily trading information across the 71 trading days from **2007-01-02 to 2007-04-20**. TPEx did not publish a corresponding per-stock daily quote for that window, so this is **a gap at the source, not a crawling omission**.

    **What you can observe**: 2006-12-29 and 2007-04-23 each carry roughly 400 OTC stocks, while the 71 trading days in between carry only a handful (mostly securities that traded on another board at the time and moved to TPEx later). **Listed (TWSE) data over the same period is normal.**

    **Practical advice**: if your analysis window covers the first half of 2007, treat OTC data on those 71 trading days as **missing**, not as "no trades that day". Feeding them in as zeros distorts returns, turnover and market-breadth calculations; prefer listed data for that window, or skip the OTC sample there.

??? note "When fetching a whole day without `data_id`, `stock_id` also contains index codes (not stocks)"
    When you query with the "all data for a given date" form (no `data_id`), the response contains — besides stocks, ETFs and warrants — about **30 index rows** (currently 32 codes). Their `stock_id` is an **English index name** rather than a numeric code, for example:

    - Market indices: `TAIEX` (the capitalization-weighted index) and `TPEx` (the OTC weighted index)
    - Sector indices: `Cement`, `Food`, `Plastics`, `Semiconductor`, `FinancialInsurance`, `Optoelectronic`, and 24 more

    On index rows, `open` / `max` / `min` / `close` are **index points** (e.g. `TAIEX` closed at `22553.72` on 2025-07-01), while `Trading_Volume` / `Trading_money` are that sector's traded volume and value for the day. If a downstream step treats every `stock_id` as a stock code (looking each one up for K-bars, chip data or financials, say), these index rows get picked up and return nothing.

    **Two ways to filter them out**:

    ```python
    # Option 1: keep only codes starting with a digit (stocks, ETFs, warrants)
    df = df[df["stock_id"].str[0].str.isdigit()]

    # Option 2: exclude them via TaiwanStockInfo's industry_category
    stock_info = api.taiwan_stock_info()
    index_ids = stock_info.loc[
        stock_info["industry_category"].isin(["大盤", "Index"]), "stock_id"
    ]
    df = df[~df["stock_id"].isin(index_ids)]
    ```

    Conversely, if the market and sector indices are exactly what you want, just invert either condition.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_daily(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPrice",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPrice",
                data_id= "2330",
                start_date= "2020-04-02",
                end_date= "2020-04-08"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_daily(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id |   Trading_Volume |   Trading_money |   open |   max |   min |   close |   spread |   Trading_turnover |
        |---:|:-----------|-----------:|-----------------:|----------------:|-------:|------:|------:|--------:|---------:|-------------------:|
        |  0 | 2020-04-06 |       2330 |         59712754 |     16324198154 |  273   | 275.5 | 270   |   275.5 |      4   |              19971 |
        |  1 | 2020-04-07 |       2330 |         48887346 |     13817936851 |  283.5 | 284   | 280.5 |   283   |      7.5 |              24281 |
        |  2 | 2020-04-08 |       2330 |         38698826 |     11016972354 |  285   | 285.5 | 283   |   285   |      2   |              19126 |
        |  3 | 2020-04-09 |       2330 |         29276430 |      8346209654 |  287.5 | 288   | 282.5 |   283   |     -2   |              15271 |
        |  4 | 2020-04-10 |       2330 |         28206858 |      7894277586 |  280   | 282   | 279   |   279.5 |     -3.5 |              15833 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            Trading_Volume: int64, # trading volume
            Trading_money: int64, # trading amount
            open: float64, # open price
            max: float64, # max price
            min: float64, # min price
            close: float64, # close price
            spread: float64, # price change
            Trading_turnover: float32 # number of trades
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_daily(
            start_date='2020-04-06',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPrice",
            "start_date": "2020-04-06",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPrice",
                start_date= "2020-04-06"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   Trading_Volume |   Trading_money |   open |   max |   min |   close |   spread |   Trading_turnover |
        |---:|:-----------|-----------:|-----------------:|----------------:|-------:|------:|------:|--------:|---------:|-------------------:|
        |  0 | 2020-04-06 |       0050 |         12207626 |       935731083 |  76.95 | 77.1  | 75.75 |   77.05 |     1.15 |               5824 |
        |  1 | 2020-04-06 |       0051 |            33000 |          953030 |  29.05 | 29.05 | 28.74 |   29.05 |     0.38 |                 21 |
        |  2 | 2020-04-06 |       0052 |           178700 |        10660088 |  59.4  | 60.05 | 58.75 |   60    |     1.25 |                 56 |
        |  3 | 2020-04-06 |       0053 |            17000 |          589750 |  34.66 | 35    | 34.48 |   34.84 |     0.18 |                 17 |
        |  4 | 2020-04-06 |       0054 |            10000 |          200040 |  19.87 | 20.03 | 19.87 |   20.03 |     0    |                  4 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            Trading_Volume: int64, # trading volume
            Trading_money: int64, # trading amount
            open: float64, # open price
            max: float64, # max price
            min: float64, # min price
            close: float64, # close price
            spread: float64, # price change
            Trading_turnover: int64 # number of trades
        }
        ```


----------------------------------

#### Taiwan Stock Weekly K Table TaiwanStockWeekPrice (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Provides daily trading information for Taiwan listed (TWSE), OTC (TPEx), and Emerging stocks!
- Data range: 2000-01-01 ~ now
- Data update time: **Monday to Friday 17:30**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_weekly(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockWeekPrice",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockWeekPrice",
                data_id= "2330",
                start_date= "2020-04-02",
                end_date= "2020-04-08"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_weekly(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    |  stock_id  |  yweek  | max | min | trading_volume | trading_money | trading_turnover |    date    |  close  |   open |   spread |
        |---:|:-----------|:--------|-----|----:|---------------:|--------------:|-----------------:|-----------:|--------:|-------:|---------:|
        |  0 |    2330    | 2020W15 | 288 | 270 |    409564428   |  114799189198 |      188964      | 2020-04-06 |  279.5  |   273  |      8   |

    === "Schema"
        ```
        {
            stock_id: str, # stock code
            yweek: str, # weekly date
            max: float64, # max price
            min: float64, # min price
            trading_volume: int64, # trading volume
            trading_money: int64, # trading amount
            trading_turnover: float32, # number of trades
            date: str, # date
            close: float64, # close price
            open: float64, # open price
            spread: float64 # price change
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockWeekPrice",
            "start_date": "2020-04-06",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockWeekPrice",
                start_date= "2020-04-06"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    |  stock_id  |  yweek  | max | min | trading_volume | trading_money | trading_turnover |    date    |  close  |   open |   spread |
        |---:|:-----------|:--------|-----|----:|---------------:|--------------:|-----------------:|-----------:|--------:|-------:|---------:|
        |  0 |    2330    | 2020W15 | 288 | 270 |    409564428   |  114799189198 |      188964      | 2020-04-06 |  279.5  |   273  |      8   |

    === "Schema"
        ```
        {
            stock_id: str, # stock code
            yweek: str, # weekly date
            max: float64, # max price
            min: float64, # min price
            trading_volume: int64, # trading volume
            trading_money: int64, # trading amount
            trading_turnover: float32, # number of trades
            date: str, # date
            close: float64, # close price
            open: float64, # open price
            spread: float64 # price change
        }
        ```


#### Taiwan Stock Monthly K Table TaiwanStockMonthPrice (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Provides daily trading information for Taiwan listed (TWSE), OTC (TPEx), and Emerging stocks!
- Data range: 2000-01-01 ~ now
- Data update time: **Monday to Friday 17:30**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_monthly(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMonthPrice",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMonthPrice",
                data_id= "2330",
                start_date= "2020-04-02",
                end_date= "2020-05-08"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_monthly(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    |  stock_id  |  ymonth  |  max  |  min  | trading_volume | trading_money | trading_turnover |    date    |  close  |   open   |  spread   |
        |---:|:-----------|:---------|-------|------:|---------------:|--------------:|-----------------:|-----------:|--------:|---------:|----------:|
        |  0 |    2330    | 2020M05  | 301.5 | 288.5 |   1744651784   |  513799591970 |      788158      | 2020-05-01 |   292   |   294.5  |   -12.5   |

    === "Schema"
        ```
        {
            stock_id: str, # stock code
            ymonth: str, # monthly date
            max: float64, # max price
            min: float64, # min price
            trading_volume: int64, # trading volume
            trading_money: int64, # trading amount
            trading_turnover: float32, # number of trades
            date: str, # date
            close: float64, # close price
            open: float64, # open price
            spread: float64 # price change
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMonthPrice",
            "start_date": "2020-04-06",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMonthPrice",
                start_date= "2020-04-06"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    |  stock_id  |  ymonth  |  max  |  min  | trading_volume | trading_money | trading_turnover |    date    |  close  |   open   |  spread   |
        |---:|:-----------|:---------|-------|------:|---------------:|--------------:|-----------------:|-----------:|--------:|---------:|----------:|
        |  0 |    2330    | 2020M05  | 301.5 | 288.5 |   1744651784   |  513799591970 |      788158      | 2020-05-01 |   292   |   294.5  |   -12.5   |

    === "Schema"
        ```
        {
            stock_id: str, # stock code
            ymonth: str, # monthly date
            max: float64, # max price
            min: float64, # min price
            trading_volume: int64, # trading volume
            trading_money: int64, # trading amount
            trading_turnover: float32, # number of trades
            date: str, # date
            close: float64, # close price
            open: float64, # open price
            spread: float64 # price change
        }
        ```


#### Taiwan Adjusted Stock Price Table TaiwanStockPriceAdj (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 1994-10-01 ~ now
- Data update time: **Monday to Friday 17:30**. The actual update time is based on the API data.

??? note "When the adjustment factor updates, and which day is the baseline"
    Adjusted prices are computed backwards: the most recent trading day in the data is the baseline, and adjustment factors are applied cumulatively to earlier days. As a result, **the adjusted price on the event day itself always equals that day's raw price** — the adjustment shows up in the history *before* that day.

    For ex-dividend / ex-rights, capital reduction, stock split and par value change events, the adjustment factor is applied **in the post-close update on the event day itself**; it is not deferred to the next trading day.

    If a scheduled event date falls on a market-wide closure (a typhoon suspension, for example) and is postponed, the adjustment follows **the day trading actually took place**, not the originally scheduled date.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_daily_adj(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPriceAdj",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPriceAdj",
                data_id= "2330",
                start_date= "2020-04-02",
                end_date= "2020-04-08"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_daily_adj(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id |   Trading_Volume |   Trading_money |   open |   max |   min |   close |   spread |   Trading_turnover |
        |---:|:-----------|-----------:|-----------------:|----------------:|-------:|------:|------:|--------:|---------:|-------------------:|
        |  0 | 2020-04-06 |       2330 |         59712754 |     16324198154 |  273   | 275.5 | 270   |   275.5 |      4   |              19971 |
        |  1 | 2020-04-07 |       2330 |         48887346 |     13817936851 |  283.5 | 284   | 280.5 |   283   |      7.5 |              24281 |
        |  2 | 2020-04-08 |       2330 |         38698826 |     11016972354 |  285   | 285.5 | 283   |   285   |      2   |              19126 |
        |  3 | 2020-04-09 |       2330 |         29276430 |      8346209654 |  287.5 | 288   | 282.5 |   283   |     -2   |              15271 |
        |  4 | 2020-04-10 |       2330 |         28206858 |      7894277586 |  280   | 282   | 279   |   279.5 |     -3.5 |              15833 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            Trading_Volume: int64, # trading volume
            Trading_money: int64, # trading amount
            open: float64, # open price
            max: float64, # max price
            min: float64, # min price
            close: float64, # close price
            spread: float64, # price change
            Trading_turnover: float32 # number of trades
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPriceAdj",
            "start_date": "2020-04-06",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPriceAdj",
                start_date= "2020-04-06"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   Trading_Volume |   Trading_money |   open |   max |   min |   close |   spread |   Trading_turnover |
        |---:|:-----------|-----------:|-----------------:|----------------:|-------:|------:|------:|--------:|---------:|-------------------:|
        |  0 | 2020-04-06 |       0050 |         12207626 |       935731083 |  76.95 | 77.1  | 75.75 |   77.05 |     1.15 |               5824 |
        |  1 | 2020-04-06 |       0051 |            33000 |          953030 |  29.05 | 29.05 | 28.74 |   29.05 |     0.38 |                 21 |
        |  2 | 2020-04-06 |       0052 |           178700 |        10660088 |  59.4  | 60.05 | 58.75 |   60    |     1.25 |                 56 |
        |  3 | 2020-04-06 |       0053 |            17000 |          589750 |  34.66 | 35    | 34.48 |   34.84 |     0.18 |                 17 |
        |  4 | 2020-04-06 |       0054 |            10000 |          200040 |  19.87 | 20.03 | 19.87 |   20.03 |     0    |                  4 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            Trading_Volume: int64, # trading volume
            Trading_money: int64, # trading amount
            open: float64, # open price
            max: float64, # max price
            min: float64, # min price
            close: float64, # close price
            spread: float64, # price change
            Trading_turnover: float32 # number of trades
        }
        ```


----------------------------------
#### Taiwan Stock Historical Tick Data Table TaiwanStockPriceTick (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one stock's data for one day.)

- Data range: 2019-01-01 ~ now.
- Providing the dataset, stock_id, and start_date parameters returns data for that day.
- Data update time: **Monday to Friday 15:30**. The actual update time is based on the API data.
- Some data is missing on this date: 2019-02-20.
- Enabling Async significantly reduces the data update time. In a Colab test, downloading 2,236 stocks took only 3 minutes 40 seconds.

??? note "Historical limitation of TickType in 2019"
    For all of 2019 (2019-01-01 ~ 2019-12-31), the TickType column is always 1, so buy/sell-side classification is not available for that year. Complete TickType values (0: unknown, 1: buyer-initiated (trade at ask), 2: seller-initiated (trade at bid)) are available from 2020-01-02 onward. Do not use TickType for buy/sell-side analysis on 2019 data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_tick(
            stock_id='2330',
            date='2020-01-02'
        )
        ```
    === "Python-request"
        ```python
        import io
        import requests
        import pandas as pd

        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPriceTick",
            "data_id": "2330",
            "start_date": "2020-01-02",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        token = ""

        data_loader = DataLoader()
        data_loader.login_by_token(token)

        date = '2025-12-08'
        start = datetime.datetime.now()
        df = data_loader.taiwan_stock_tick(
            date=date,
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        # 00:03:41
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPriceTick",
                data_id= "2330",
                start_date= "2020-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = do.call('cbind',data$data) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   deal_price |   volume | Time         |   TickType |
        |---:|:-----------|-----------:|-------------:|---------:|:-------------|-----------:|
        |  0 | 2020-01-02 |       2330 |        332.5 |      520 | 09:00:00.000 |          0 |
        |  1 | 2020-01-02 |       2330 |        332.5 |      520 | 09:00:00.646 |          0 |
        |  2 | 2020-01-02 |       2330 |        333   |       45 | 09:00:05.000 |          0 |
        |  3 | 2020-01-02 |       2330 |        333   |       45 | 09:00:05.660 |          0 |
        |  4 | 2020-01-02 |       2330 |        333   |       22 | 09:00:10.000 |          0 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            deal_price: float64, # deal price
            volume: int64, # volume
            Time: str, # time
            TickType: str # tick type (0: undetermined, 1: buyer-initiated (trade at ask), 2: seller-initiated (trade at bid))
        }
        ```


#### Fetch all data for a specific date at once (available only to [sponsorpro](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one day's data.)

- Data range: 2019-01-01 ~ now.
- Providing the dataset and date parameters returns data for that day.
- Data update time: **Monday to Friday 15:30**. The actual update time is based on the API data.
- Some data is missing on this date: 2019-02-20.

??? note "Historical limitation of TickType in 2019"
    For all of 2019 (2019-01-01 ~ 2019-12-31), the TickType column is always 1, so buy/sell-side classification is not available for that year. Complete TickType values (0: unknown, 1: buyer-initiated (trade at ask), 2: seller-initiated (trade at bid)) are available from 2020-01-02 onward. Do not use TickType for buy/sell-side analysis on 2019 data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_tick(
            date='2019-01-02',
            use_object=True,
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        url = "https://api.finmindtrade.com/api/v4/storage_objects"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPriceTick",
            "date": '2019-01-02',
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = pd.read_parquet(io.BytesIO(resp.content))
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        library(arrow)

        url = 'https://api.finmindtrade.com/api/v4/storage_objects'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPriceTick",
                date= "2019-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        con = content(response, "raw")
        data <- read_parquet(con)
        close(con)
        head(data)
        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   deal_price |   volume | Time     |   TickType |
        |---:|:-----------|-----------:|-------------:|---------:|:---------|-----------:|
        |  0 | 2019-01-02 |       0050 |        75.85 |      167 | 09:00:03 |          1 |
        |  1 | 2019-01-02 |       0050 |        75.90 |       11 | 09:00:08 |          1 |
        |  2 | 2019-01-02 |       0050 |        75.85 |        2 | 09:00:18 |          1 |
        |  3 | 2019-01-02 |       0050 |        75.85 |       31 | 09:00:23 |          1 |
        |  4 | 2019-01-02 |       0050 |        75.85 |       19 | 09:00:28 |          1 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            deal_price: float64, # deal price
            volume: int64, # volume
            Time: str, # time
            TickType: str # tick type (0: undetermined, 1: buyer-initiated (trade at ask), 2: seller-initiated (trade at bid))
        }
        ```


----------------------------------
#### Individual Stock PER, PBR Table TaiwanStockPER

- Data range: 2005-10-01 ~ now
- Data update time: **Monday to Friday 18:00**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_per_pbr(
            stock_id='2330',
            start_date='2020-01-02',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPER",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPER",
                data_id= "2330",
                start_date= "2020-01-02",
                end_date= "2020-04-12"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_per_pbr(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   dividend_yield |   PER |   PBR |
        |---:|:-----------|-----------:|-----------------:|------:|------:|
        |  0 | 2020-01-02 |       2330 |             2.36 | 26.69 |  5.54 |
        |  1 | 2020-01-03 |       2330 |             2.36 | 26.73 |  5.55 |
        |  2 | 2020-01-06 |       2330 |             2.41 | 26.14 |  5.42 |
        |  3 | 2020-01-07 |       2330 |             2.43 | 25.94 |  5.38 |
        |  4 | 2020-01-08 |       2330 |             2.43 | 25.94 |  5.38 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            dividend_yield: float64, # dividend yield
            PER: float64, # price-to-earnings ratio
            PBR: float64 # price-to-book ratio
        }
        ```

----------------------------------
#### Order and Trade Statistics Every 5 Seconds TaiwanStockStatisticsOfOrderBookAndTrade
(Due to the large data volume, each request only provides one day's data.)

- Data range: 2005-01-01 ~ now

??? note "The disclosure interval varies by era — early data is not one row every 5 seconds"
    Despite the "every 5 seconds" name, **TWSE raised its disclosure frequency over the years**, so earlier data comes at a coarser interval. Rows per trading day:

    | Period | Disclosure interval | Rows per trading day |
    |---|---|---|
    | 2005-01-03 ~ 2011-01-14 | 60 seconds | 271 |
    | 2011-01-17 ~ 2014-02-21 | 15 seconds | 1,081 |
    | 2014-02-24 ~ 2014-12-27 | 10 seconds | 1,621 |
    | 2014-12-29 ~ now | 5 seconds | 3,241 |

    This is **the granularity published at the source at the time, not a gap in this table**: TWSE's own publication for those dates carries the same number of rows (2005-09-28, for instance, is 271 rows officially).

    **Practical advice**: do not assume 3,241 rows on every trading day. When aligning time series across eras or computing fixed 5-second increments, resample on the day's actual `Time` column rather than slicing by a fixed row count or positional index.

??? note "On 2023-08-04 the `09:00:00` open carries an extra row with the previous session's closing cumulative values"
    Every column in this table is a **running total for the day** (cumulative order count/volume, cumulative deal count/volume/value), so `09:00:00` normally starts near zero. On **2023-08-04**, however, `09:00:00` carries — in addition to the normal opening row — a second row whose seven numeric columns are identical to the **previous trading day's close, 2023-08-02 `13:30:00`** (08-03 that week was a typhoon closure). **The TWSE source file for that day already contains this value**; it is not a processing error on our side.

    **Practical impact**: if you difference this table (`diff()`) to recover the per-5-second increments, the first bar of that day comes out as a large negative number.

    In spot checks across the 5-second era (from 2014-12-29) this is the only such case; no other trading day shows the same pattern. Before differencing, you can recover the true opening row by keeping only the smallest cumulative value per timestamp:

    ```python
    df = df.sort_values(["date", "Time"])
    # where a timestamp has several rows, keep the smallest running total (the real opening row)
    df = df.loc[df.groupby(["date", "Time"])["TotalDealVolume"].idxmin()]
    inc = df.groupby("date")[["TotalDealVolume", "TotalDealMoney"]].diff()
    ```

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_book_and_trade(
            date='2021-01-07'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockStatisticsOfOrderBookAndTrade",
            "start_date": "2021-01-07",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockStatisticsOfOrderBookAndTrade",
                start_date= "2021-01-07"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```

!!! output
    === "DataFrame"
        |    | Time     |   TotalBuyOrder |   TotalBuyVolume |   TotalSellOrder |   TotalSellVolume |   TotalDealOrder |   TotalDealVolume |   TotalDealMoney | date       |
        |---:|:---------|----------------:|-----------------:|-----------------:|------------------:|-----------------:|------------------:|-----------------:|:-----------|
        |  0 | 09:00:00 |          298618 |          3229222 |           365465 |           1730137 |                0 |                 0 |                0 | 2021-01-07 |
        |  1 | 09:00:05 |          301246 |          3254929 |           367886 |           1751034 |            17535 |             97251 |             4515 | 2021-01-07 |
        |  2 | 09:00:10 |          304171 |          3283698 |           370338 |           1770414 |            31370 |            150557 |             7041 | 2021-01-07 |
        |  3 | 09:00:15 |          307686 |          3325195 |           372828 |           1782960 |            40083 |            177080 |             8088 | 2021-01-07 |
        |  4 | 09:00:20 |          310927 |          3345735 |           375220 |           1792055 |            47250 |            198536 |             9137 | 2021-01-07 |
    === "Schema"
        ```
        {
            Time: str, # time
            TotalBuyOrder: str, # cumulative number of buy orders
            TotalBuyVolume: int64, # cumulative buy order volume
            TotalSellOrder: int64, # cumulative number of sell orders
            TotalSellVolume: int64, # cumulative sell order volume
            TotalDealOrder: int64, # cumulative number of trades
            TotalDealVolume: int64, # cumulative trade volume
            TotalDealMoney: int64, # cumulative trade amount
            date: str # date
        }
        ```

----------------------------------
#### Weighted Index TaiwanVariousIndicators5Seconds
(Due to the large data volume, each request only provides one day's data.)

- Data range: 2005-01-01 ~ now

??? note "The disclosure interval varies by era — early data is not one row every 5 seconds"
    Despite the "every 5 seconds" name, **TWSE raised its disclosure frequency over the years**, so earlier data comes at a coarser interval. Rows per trading day:

    | Period | Disclosure interval | Rows per trading day |
    |---|---|---|
    | 2005-01-03 ~ 2011-01-14 | 60 seconds | 271 |
    | 2011-01-17 ~ 2014-02-21 | 15 seconds | 1,081 |
    | 2014-02-24 ~ 2014-12-27 | 10 seconds | 1,621 |
    | 2014-12-29 ~ now | 5 seconds | 3,241 |

    This is **the granularity published at the source at the time, not a gap in this table**: TWSE's own publication for those dates carries the same number of rows (2005-09-28, for instance, is 271 rows officially).

    **Practical advice**: do not assume 3,241 rows on every trading day. When computing returns or volatility across eras, or aligning time series, resample on the day's actual `date` column (which carries the time) rather than slicing by a fixed row count or positional index.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.tse(
            date='2020-07-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanVariousIndicators5Seconds",
            "start_date": "2020-07-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanVariousIndicators5Seconds",
                start_date="2020-07-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        date = '2025-12-08'
        start = datetime.datetime.now()
        df = api.taiwan_stock_various_indicators_5_seconds(
            data_id_list=['發行量加權股價指數', '未含金融保險股指數'],
            date=date,
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date                |   TAIEX |
        |---:|:--------------------|--------:|
        |  0 | 2020-07-01 09:00:00 | 11621.2 |
        |  1 | 2020-07-01 09:00:05 | 11622.6 |
        |  2 | 2020-07-01 09:00:10 | 11632.4 |
        |  3 | 2020-07-01 09:00:15 | 11643.5 |
        |  4 | 2020-07-01 09:00:20 | 11644.2 |
    === "Schema"
        ```
        {
            date: str, # date
            TAIEX: float64 # weighted index
        }
        ```

----------------------------------
#### Day Trading Targets and Volume/Value TaiwanStockDayTrading

- Data range: 2014-01-01 ~ now
- Data update time: the day-trading target list and the sell-first-then-buy marker (BuyAfterSale) are available before market open on the same day; the same-day day-trading volume/value (Volume, BuyAmount, SellAmount) is updated after market close at 21:30. The actual update time is based on the API data.
- Sell-first-then-buy marker BuyAfterSale: ＊ = sell-first-then-buy suspended (intraday only buy-first-then-sell is allowed; day trading is still permitted); Y / blank = both buy-first-then-sell and sell-first-then-buy are allowed
- Note: BuyAfterSale reflects the exchange-level eligibility for an individual security (i.e. whether the stock is on the suspended-sell-first list). Whether you can actually sell first still depends on your own account eligibility (completion of the required sell-first agreements and your trading quota) and your broker's current securities-lending availability. Therefore it is normal for a broker's software to show "buy-first-then-sell only" while this field shows both directions; the actual permission follows your individual broker's account eligibility and inventory


!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_day_trading(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDayTrading",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDayTrading",
                data_id= "2330",
                start_date= "2020-04-02",
                end_date= "2020-04-08"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_day_trading(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    |   stock_id | date       | BuyAfterSale   |   Volume |   BuyAmount |   SellAmount |
        |---:|-----------:|:-----------|:---------------|---------:|------------:|-------------:|
        |  0 |       2330 | 2020-04-06 | Y              |  8122000 |  2215280000 |   2218094500 |
        |  1 |       2330 | 2020-04-07 | Y              |  5128000 |  1450483500 |   1447872000 |
        |  2 |       2330 | 2020-04-08 | Y              |  2467000 |   702411500 |    702367000 |
        |  3 |       2330 | 2020-04-09 | Y              |  2583000 |   736745500 |    734035500 |
        |  4 |       2330 | 2020-04-10 | Y              |  1590000 |   445516000 |    444576000 |
    === "Schema"
        ```
        {
            stock_id: str, # stock code
            date: str, # date
            BuyAfterSale: str, # day-trading allowed
            Volume: int64, # trading volume
            BuyAmount: int64, # buy amount
            SellAmount: int64 # sell amount
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_day_trading(
            start_date='2020-04-06',
        )
        ```
    === "Python-request"
        ```python
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDayTrading",
            "start_date": "2020-04-06",
        }
        res = requests.get(url, headers=headers, params=parameter)
        temp = res.json()
        data = pd.DataFrame(temp["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDayTrading",
                start_date= "2020-04-06"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    |   stock_id | date       | BuyAfterSale   |   Volume |   BuyAmount |   SellAmount |
        |---:|-----------:|:-----------|:---------------|---------:|------------:|-------------:|
        |  0 |       0050 | 2020-04-06 |                |  1296000 |    99116100 |     99343200 |
        |  1 |       0051 | 2020-04-06 |                |     2000 |       57680 |        57560 |
        |  2 |       0052 | 2020-04-06 |                |     9000 |      536200 |       537700 |
        |  3 |       0053 | 2020-04-06 |                |        0 |           0 |            0 |
        |  4 |       0054 | 2020-04-06 |                |        0 |           0 |            0 |
    === "Schema"
        ```
        {
            stock_id: str, # stock code
            date: str, # date
            BuyAfterSale: str, # day-trading allowed
            Volume: int64, # trading volume
            BuyAmount: int64, # buy amount
            SellAmount: int64 # sell amount
        }
        ```

----------------------------------
#### Weighted/OTC Total Return Index TaiwanStockTotalReturnIndex

- Data range: 2003-01-01 ~ now
- Data update time: **Monday to Friday 16:50**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_total_return_index(
            index_id="TAIEX",
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockTotalReturnIndex",
            "data_id": "TAIEX", # TAIEX total return index
            # "data_id": "TPEx", # TPEx index and total return index
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockTotalReturnIndex",
                data_id= "TAIEX", # TAIEX total return index
                # data_id= "TPEx", # TPEx index and total return index
                start_date= "2020-04-02",
                end_date= "2020-04-08"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    |   price | stock_id   | date       |
        |---:|--------:|:-----------|:-----------|
        |  0 | 18356.5 | TAIEX      | 2020-04-06 |
        |  1 | 18688.6 | TAIEX      | 2020-04-07 |
        |  2 | 18952.7 | TAIEX      | 2020-04-08 |
        |  3 | 18922.6 | TAIEX      | 2020-04-09 |
        |  4 | 18994   | TAIEX      | 2020-04-10 |
    === "Schema"
        ```
        {
            price: float64, # total return index
            stock_id: str, # index code
            date: str # date
        }
        ```

----------------------------------
#### Taiwan Individual Stock 10-Year Line Table TaiwanStock10Year (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2011-01-24 ~ now
- The average price is calculated over 2,500 trading days.
- Data update time: **Monday to Friday 20:00**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_10year(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStock10Year",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStock10Year",
                data_id= "2330",
                start_date= "2020-04-02",
                end_date= "2020-04-12"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_10year(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id |    close |
        |---:|:-----------|-----------:|-----------------:|
        |  0 | 2020-04-06 |       2330 | 150.16 |
        |  1 | 2020-04-07 |       2330 | 150.25 |
        |  2 | 2020-04-08 |       2330 | 150.34 |
        |  3 | 2020-04-09 |       2330 | 150.43 |
        |  4 | 2020-04-10 |       2330 | 150.52 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            close: float64 # stock price
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_10year(
            start_date='2020-04-06',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStock10Year",
            "start_date": "2020-04-06",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStock10Year",
                start_date= "2020-04-06"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   close |
        |---:|:-----------|-----------:|--------:|
        |  0 | 2020-04-06 |       0050 |   66.5  |
        |  1 | 2020-04-06 |       0053 |   28.68 |
        |  2 | 2020-04-06 |       0055 |   14.31 |
        |  3 | 2020-04-06 |       0056 |   24.59 |
        |  4 | 2020-04-06 |       0061 |   16.28 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            close: float64 # stock price
        }
        ```


----------------------------------
#### Taiwan Stock Minute K Table TaiwanStockKBar (available only to [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one day's data.)

- Data range: 2019-01-01 ~ now
- Data update time: **Monday to Friday 15:50**. The actual update time is based on the API data.
- Some data is missing on this date: 2019-02-20.
- Enabling Async significantly reduces the data update time. In a Colab test, downloading 2,175 stocks took only 2 minutes 31 seconds.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_kbar(
            stock_id='2330',
            date="2023-09-22"
        )
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        token = ""

        data_loader = DataLoader()
        data_loader.login_by_token(token)

        date = '2024-12-20'
        taiwan_stock_price_df = data_loader.taiwan_stock_daily(start_date=date)
        # Only fetch stocks with trading volume greater than 0 on the day
        taiwan_stock_price_df = taiwan_stock_price_df[
            ["stock_id", "Trading_Volume"]
        ]
        taiwan_stock_price_df = taiwan_stock_price_df[
            taiwan_stock_price_df["Trading_Volume"] > 0
        ]
        # Fetch IDs of all listed/OTC stocks whose industry_category is not market index, Index, or all securities,
        # because these instruments do not have broker breakdown data
        stock_info_df = data_loader.taiwan_stock_info()
        stock_info = stock_info_df[stock_info_df["type"].isin(["twse", "tpex"])]
        cate_mask = stock_info["industry_category"].isin(
            ["大盤", "Index", "所有證券"]
        )
        id_mask = stock_info["stock_id"].isin(["TAIEX", "TPEx"])
        stock_info = stock_info[~(cate_mask | id_mask)]
        stock_info = stock_info.merge(
            taiwan_stock_price_df, how="inner", on=["stock_id"]
        )
        stock_info = stock_info[~stock_info["stock_id"].isin(taiwan_stock_price_df)]
        stock_id_list = list(set(stock_info["stock_id"].values))
        logger.info(f"len: {len(stock_id_list)}")  # 2175
        start = datetime.datetime.now()
        df = data_loader.taiwan_stock_kbar(
            stock_id_list=stock_id_list,
            date=date,
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        # 0:02:31.357733
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockKBar",
            "data_id": "2330",
            "start_date": "2023-09-22",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockKBar",
                data_id= "2330",
                start_date= "2023-09-22"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       | minute   |   stock_id |   open |   high |   low |   close |   volume |
        |---:|:-----------|:---------|-----------:|-------:|-------:|------:|--------:|---------:|
        |  0 | 2023-09-22 | 09:00:00 |       2330 |    523 |    524 |   522 |     524 |     3893 |
        |  1 | 2023-09-22 | 09:01:00 |       2330 |    524 |    524 |   523 |     524 |      159 |
        |  2 | 2023-09-22 | 09:02:00 |       2330 |    523 |    524 |   522 |     523 |      548 |
        |  3 | 2023-09-22 | 09:03:00 |       2330 |    522 |    523 |   522 |     522 |      208 |
        |  4 | 2023-09-22 | 09:04:00 |       2330 |    522 |    523 |   522 |     522 |      179 |
    === "Schema"
        ```
        {
            date: str, # date
            minute: str, # minute
            stock_id: str, # stock code
            open: float64, # open price
            high: float64, # high price
            low: float64, # low price
            close: float64, # close price
            volume: float32 # trading volume
        }
        ```

#### Fetch all data for a specific date at once (available only to [sponsorpro](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one day's data.)

- Data range: 2019-01-02 ~ now, one trading day at a time.
- Providing the dataset and date parameters returns all market data for that day.
- Downloads the whole-day parquet via a signed URL — no need to query stock by stock.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_kbar(
            date='2026-01-02',
            use_object=True,
        )
        ```
    === "Python-request"
        ```python
        import io
        import requests
        import pandas as pd

        url = "https://api.finmindtrade.com/api/v4/storage_objects"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockKBar",
            "date": '2026-01-02',
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = pd.read_parquet(io.BytesIO(resp.content))
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        library(arrow)

        url = 'https://api.finmindtrade.com/api/v4/storage_objects'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockKBar",
                date= "2026-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        con = content(response, "raw")
        data <- read_parquet(con)
        close(con)
        head(data)
        ```

!!! output
    === "DataFrame"
        |    | date       | minute   |   stock_id |   open |   high |   low |   close |   volume |
        |---:|:-----------|:---------|-----------:|-------:|-------:|------:|--------:|---------:|
        |  0 | 2026-01-02 | 09:00:00 |       2330 |    990 |    995 |   988 |     992 |     4100 |
        |  1 | 2026-01-02 | 09:01:00 |       2330 |    992 |    993 |   990 |     991 |      210 |
        |  2 | 2026-01-02 | 09:02:00 |       2330 |    991 |    992 |   990 |     990 |      310 |
        |  3 | 2026-01-02 | 09:03:00 |       2330 |    990 |    991 |   989 |     990 |      190 |
        |  4 | 2026-01-02 | 09:04:00 |       2330 |    990 |    991 |   989 |     991 |      170 |
    === "Schema"
        ```
        {
            date: str, # date
            minute: str, # minute
            stock_id: str, # stock code
            open: float64, # open price
            high: float64, # high price
            low: float64, # low price
            close: float64, # close price
            volume: float32 # trading volume
        }
        ```
---------------------------------------

#### Index Statistics Every 5 Seconds TaiwanStockEvery5SecondsIndex (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one day's data.)

- Data range: 2005-01-03 ~ now

??? note "The disclosure interval varies by era — early data is not one row every 5 seconds"
    Despite the "every 5 seconds" name, **TWSE raised its disclosure frequency over the years**, so earlier data comes at a coarser interval. Rows per trading day, per index:

    | Period | Disclosure interval | Rows per trading day (per index) |
    |---|---|---|
    | 2005-01-03 ~ 2011-01-14 | 60 seconds | 271 |
    | 2011-01-17 ~ 2014-02-21 | 15 seconds | 1,081 |
    | 2014-02-24 ~ 2014-12-27 | 10 seconds | 1,621 |
    | 2014-12-29 ~ now | 5 seconds | 3,241 |

    This is **the granularity published at the source at the time, not a gap in this table**: TWSE's own publication for those dates carries the same number of rows (2005-09-28, for instance, is 271 rows officially).

    **Practical advice**: do not assume 3,241 rows per index on every trading day. When aligning time series across eras or computing index momentum, resample on the day's actual `time` column rather than slicing by a fixed row count or positional index.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_every5seconds_index(
            date='2025-05-09'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockEvery5SecondsIndex",
            "start_date": "2025-05-09",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockEvery5SecondsIndex",
                start_date="2025-05-09"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        date = '2025-12-08'
        start = datetime.datetime.now()
        df = api.taiwan_stock_every5seconds_index(
            data_id_list=['發行量加權股價指數', '未含金融保險股指數'],
            date=date,
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       | time     | stock_id   |   price | kind   |
        |---:|:-----------|:---------|:-----------|--------:|:-------|
        |  0 | 2025-05-09 | 09:00:00 | Automobile |  358.19 | twse   |
        |  1 | 2025-05-09 | 09:00:05 | Automobile |  358.45 | twse   |
        |  2 | 2025-05-09 | 09:00:10 | Automobile |  358.19 | twse   |
        |  3 | 2025-05-09 | 09:00:15 | Automobile |  357.63 | twse   |
        |  4 | 2025-05-09 | 09:00:20 | Automobile |  357.65 | twse   |
    === "Schema"
        ```
        {
            date: str, # date
            time: str, # time
            stock_id: str, # industry code
            price: float, # price
            kind: str # market type
        }
        ```

----------------------------------
#### Taiwan Stock Suspension Announcement TaiwanStockSuspended (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2011-10-06 ~ now
- Records announcements of trading suspension on individual stocks due to material information, shareholder meetings, disposition, etc., including suspension start date/time and expected resumption date/time.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_suspended(
            start_date='2017-04-01',
            end_date='2025-01-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockSuspended",
            "start_date": "2017-04-01",
            "end_date": "2025-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockSuspended",
                start_date= "2017-04-01",
                end_date= "2025-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    | date       | stock_id | suspension_time | resumption_date | resumption_time |
        |---:|:-----------|:---------|:----------------|:----------------|:----------------|
        |  0 | 2017-04-19 | 1101     | 8:00            | 2017-04-21      | 8:00            |
    === "Schema"
        ```
        {
            stock_id: str, # stock code
            date: str, # suspension date
            suspension_time: str, # suspension time
            resumption_date: str, # resumption date
            resumption_time: str # resumption time
        }
        ```

----------------------------------
#### Day Trading Sell-First-Then-Buy Suspension Notice TaiwanStockDayTradingSuspension (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2014-06-01 ~ now
- Records advance notices of suspension of "sell-first-then-buy" day trading on individual stocks, with common reasons including ex-rights and ex-dividend events, and includes the suspension start and end dates.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_day_trading_suspension(
            start_date='2024-12-01',
            end_date='2025-01-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDayTradingSuspension",
            "start_date": "2024-12-01",
            "end_date": "2025-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDayTradingSuspension",
                start_date= "2024-12-01",
                end_date= "2025-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    | stock_id | date       | end_date   | reason |
        |---:|:---------|:-----------|:-----------|:-------|
        |  0 | 00940    | 2024-12-27 | 2025-01-03 | 除息   |
    === "Schema"
        ```
        {
            stock_id: str, # stock code
            date: str, # sell-first-then-buy suspension start date
            end_date: str, # sell-first-then-buy suspension end date
            reason: str # reason
        }
        ```

----------------------------------
#### Daily Price Limit TaiwanStockPriceLimit (available only to backer, sponsor members)

- Data range: 2000-01-01 ~ now
- Data update time: **Monday to Friday 18:00**

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_price_limit(
            stock_id='2330',
            start_date='2023-01-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPriceLimit",
            "data_id": "2330",
            "start_date": "2023-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPriceLimit",
                data_id="2330",
                start_date= "2023-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_price_limit(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       | stock_id | reference_price | limit_up | limit_down |
        |---:|:-----------|:---------|----------------:|---------:|-----------:|
        |  0 | 2023-01-03 | 2330     |          450.00 |   495.00 |     405.00 |
        |  1 | 2023-01-04 | 2330     |          452.00 |   497.00 |     407.00 |
        |  2 | 2023-01-05 | 2330     |          452.50 |   497.50 |     407.50 |
        |  3 | 2023-01-06 | 2330     |          454.50 |   500.00 |     409.00 |
        |  4 | 2023-01-09 | 2330     |          458.00 |   503.50 |     412.50 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            reference_price: float64, # reference price
            limit_up: float64, # limit-up price (0 means no price-limit applies)
            limit_down: float64 # limit-down price (0 means no price-limit applies)
        }
        ```

??? note
    When `limit_up` and `limit_down` are **0**, this means the instrument has no price-limit, including:

    - Leveraged ETFs (e.g., 00631L)
    - Inverse ETFs (e.g., 00632R)
    - Emerging stocks

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_price_limit(
            start_date='2023-01-03',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPriceLimit",
            "start_date": "2023-01-03",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPriceLimit",
                start_date= "2023-01-03"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
