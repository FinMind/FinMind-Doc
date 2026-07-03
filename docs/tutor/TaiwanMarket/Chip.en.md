In Taiwan stock chip data, we have 21 datasets as follows:


- [Individual Stock Margin Purchase / Short Sale TaiwanStockMarginPurchaseShortSale](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockmarginpurchaseshortsale)
- [Total Market Margin Purchase / Short Sale TaiwanStockTotalMarginPurchaseShortSale](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstocktotalmarginpurchaseshortsale)
- [Individual Stock Institutional Investors Buy/Sell TaiwanStockInstitutionalInvestorsBuySell](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysell)
- [Individual Stock Institutional Investors Buy/Sell (Wide) TaiwanStockInstitutionalInvestorsBuySellWide](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysellwide)
- [Total Market Institutional Investors Buy/Sell TaiwanStockTotalInstitutionalInvestors](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstocktotalinstitutionalinvestors)
- [Foreign Investor Shareholding TaiwanStockShareholding](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockshareholding)
- [Shareholders Holding Shares Distribution TaiwanStockHoldingSharesPer](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockholdingsharesper-backersponsor)
- [Securities Lending Transaction Details TaiwanStockSecuritiesLending](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstocksecuritieslending)
- [Margin Short Sale Suspension (Short Sale Covering Date) TaiwanStockMarginShortSaleSuspension](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockmarginshortsalesuspension)
- [Credit Limit Daily Short Sale Balances TaiwanDailyShortSaleBalances](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwandailyshortsalebalances)
- [Securities Trader Information TaiwanSecuritiesTraderInfo](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwansecuritiestraderinfo)
- [Taiwan Stock Trading Daily Report by Branch (query by stock_id) TaiwanStockTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#query-by-taiwanstocktradingdailyreport-sponsor)
- [Taiwan Stock Trading Daily Report by Branch (query by securities_trader_id) TaiwanStockTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#query-by-taiwanstocktradingdailyreport-sponsor_1)
- [Taiwan Stock Warrant Trading Daily Report by Branch (query by stock_id) TaiwanStockWarrantTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#query-by-taiwanstockwarranttradingdailyreport-sponsor)
- [Taiwan Stock Warrant Trading Daily Report by Branch (query by securities_trader_id) TaiwanStockWarrantTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#query-by-taiwanstockwarranttradingdailyreport-sponsor_1)
- [Taiwan Stock Government Bank Buy/Sell TaiwanstockGovernmentBankBuySell](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockgovernmentbankbuysell-sponsor)
- [Taiwan Total Exchange Margin Maintenance TaiwanTotalExchangeMarginMaintenance](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwantotalexchangemarginmaintenance-backersponsor)
- [Daily Securities Trader Branch Aggregate Statistics TaiwanStockTradingDailyReportSecIdAgg](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstocktradingdailyreportsecidagg-sponsor)
- [Block Trading Daily Report TaiwanStockBlockTradingDailyReport](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockblocktradingdailyreport-sponsor)
- [Block Trade Daily Transactions TaiwanStockBlockTrade](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockblocktrade-sponsor)
- [Loan Collateral Balance TaiwanStockLoanCollateralBalance](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockloancollateralbalance-sponsor)
- [Disposition Securities Period TaiwanStockDispositionSecuritiesPeriod](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockdispositionsecuritiesperiod-backersponsor)
- [Day Trading Borrowing Fee Rate TaiwanStockDayTradingBorrowingFeeRate](https://finmind.github.io/en/tutor/TaiwanMarket/Chip/#taiwanstockdaytradingborrowingfeerate-backersponsor)


----------------------------------
#### Individual Stock Margin Purchase / Short Sale TaiwanStockMarginPurchaseShortSale

- Data range: 2001-01-01 ~ now
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_margin_purchase_short_sale(
            stock_id="2330",
            start_date='2020-04-02',
            end_date='2020-04-12',
        )
        ```
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarginPurchaseShortSale",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarginPurchaseShortSale",
                data_id= "2330",
                start_date= "2020-01-02",
                end_date= "2020-04-12",
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_margin_purchase_short_sale(
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
        |    | date       |   stock_id |   MarginPurchaseBuy |   MarginPurchaseCashRepayment |   MarginPurchaseLimit |   MarginPurchaseSell |   MarginPurchaseTodayBalance |   MarginPurchaseYesterdayBalance | Note   |   OffsetLoanAndShort |   ShortSaleBuy |   ShortSaleCashRepayment |   ShortSaleLimit |   ShortSaleSell |   ShortSaleTodayBalance |   ShortSaleYesterdayBalance |
        |---:|:-----------|-----------:|--------------------:|------------------------------:|----------------------:|---------------------:|-----------------------------:|---------------------------------:|:-------|---------------------:|---------------:|-------------------------:|-----------------:|----------------:|------------------------:|----------------------------:|
        |  0 | 2020-04-06 |       2330 |                1914 |                             8 |               6482595 |                 1269 |                        26285 |                            25648 | X      |                    0 |              0 |                       24 |          6482595 |               0 |                       0 |                          24 |
        |  1 | 2020-04-07 |       2330 |                1049 |                            13 |               6482595 |                 2655 |                        24666 |                            26285 | X      |                    0 |              0 |                        0 |          6482595 |               0 |                       0 |                           0 |
        |  2 | 2020-04-08 |       2330 |                1192 |                             3 |               6482595 |                 1569 |                        24286 |                            24666 |        |                    0 |              0 |                        0 |          6482595 |               0 |                       0 |                           0 |
        |  3 | 2020-04-09 |       2330 |                 499 |                            28 |               6482595 |                 1362 |                        23395 |                            24286 |        |                  209 |              0 |                        0 |          6482595 |             398 |                     398 |                           0 |
        |  4 | 2020-04-10 |       2330 |                1227 |                            24 |               6482595 |                  794 |                        23804 |                            23395 |        |                   53 |            156 |                        0 |          6482595 |             156 |                     398 |                         398 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            MarginPurchaseBuy: int64, # margin purchase buy
            MarginPurchaseCashRepayment: int64, # margin purchase cash repayment
            MarginPurchaseLimit: int64, # margin purchase limit
            MarginPurchaseSell: int64, # margin purchase sell
            MarginPurchaseTodayBalance: int64, # margin purchase today balance
            MarginPurchaseYesterdayBalance: int64, # margin purchase yesterday balance
            Note: str, # note
            OffsetLoanAndShort: int64, # offset loan and short
            ShortSaleBuy: int64, # short sale buy
            ShortSaleCashRepayment: int64, # short sale cash repayment
            ShortSaleLimit: int64, # short sale limit
            ShortSaleSell: int64, # short sale sell
            ShortSaleTodayBalance: int64, # short sale today balance
            ShortSaleYesterdayBalance: int64 # short sale yesterday balance
        }
        ```

#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_margin_purchase_short_sale(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarginPurchaseShortSale",
            "start_date": "2020-04-01",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarginPurchaseShortSale",
                start_date= "2020-01-02"
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
        |    | date       |   stock_id |   MarginPurchaseBuy |   MarginPurchaseCashRepayment |   MarginPurchaseLimit |   MarginPurchaseSell |   MarginPurchaseTodayBalance |   MarginPurchaseYesterdayBalance | Note   |   OffsetLoanAndShort |   ShortSaleBuy |   ShortSaleCashRepayment |   ShortSaleLimit |   ShortSaleSell |   ShortSaleTodayBalance |   ShortSaleYesterdayBalance |
        |---:|:-----------|-----------:|--------------------:|------------------------------:|----------------------:|---------------------:|-----------------------------:|---------------------------------:|:-------|---------------------:|---------------:|-------------------------:|-----------------:|----------------:|------------------------:|----------------------------:|
        |  0 | 2020-04-01 |       0050 |                 193 |                            15 |                263750 |                  163 |                         3189 |                             3174 |        |                    0 |             65 |                        1 |           263750 |              13 |                    2283 |                        2336 |
        |  1 | 2020-04-01 |       0051 |                   0 |                             0 |                  2375 |                    0 |                            5 |                                5 |        |                    0 |              0 |                        0 |             2375 |               0 |                       0 |                           0 |
        |  2 | 2020-04-01 |       0052 |                   0 |                             0 |                  7500 |                    0 |                          128 |                              128 |        |                    0 |              0 |                        0 |             7500 |               0 |                       0 |                           0 |
        |  3 | 2020-04-01 |       0053 |                   0 |                             0 |                  1622 |                    0 |                            1 |                                1 |        |                    0 |              0 |                        0 |             1622 |               0 |                       0 |                           0 |
        |  4 | 2020-04-01 |       0054 |                   0 |                             0 |                  2531 |                    0 |                            0 |                                0 | X      |                    0 |              0 |                        0 |             2531 |               0 |                       0 |                           0 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            MarginPurchaseBuy: int64, # margin purchase buy
            MarginPurchaseCashRepayment: int64, # margin purchase cash repayment
            MarginPurchaseLimit: int64, # margin purchase limit
            MarginPurchaseSell: int64, # margin purchase sell
            MarginPurchaseTodayBalance: int64, # margin purchase today balance
            MarginPurchaseYesterdayBalance: int64, # margin purchase yesterday balance
            Note: str, # note
            OffsetLoanAndShort: int64, # offset loan and short
            ShortSaleBuy: int64, # short sale buy
            ShortSaleCashRepayment: int64, # short sale cash repayment
            ShortSaleLimit: int64, # short sale limit
            ShortSaleSell: int64, # short sale sell
            ShortSaleTodayBalance: int64, # short sale today balance
            ShortSaleYesterdayBalance: int64 # short sale yesterday balance
        }
        ```

----------------------------------
#### Taiwan Total Market Margin Purchase / Short Sale TaiwanStockTotalMarginPurchaseShortSale

- Data range: 2001-01-01 ~ now
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_margin_purchase_short_sale_total(
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockTotalMarginPurchaseShortSale",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockTotalMarginPurchaseShortSale",
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

!!! output
    === "DataFrame"
        |    |   TodayBalance |   YesBalance |        buy | date       | name                |    Return |       sell |
        |---:|---------------:|-------------:|-----------:|:-----------|:--------------------|----------:|-----------:|
        |  0 |        5463820 |      5471770 |     236127 | 2020-04-01 | MarginPurchase      |     10986 |     233091 |
        |  1 |    91965082000 |  91898116000 | 4046643000 | 2020-04-01 | MarginPurchaseMoney | 196619000 | 3783058000 |
        |  2 |         541704 |       556742 |      57266 | 2020-04-01 | ShortSale           |      6151 |      48379 |
        |  3 |         535401 |       541704 |      50779 | 2020-04-06 | ShortSale           |      3700 |      48176 |
        |  4 |    93198509000 |  91965082000 | 6440842000 | 2020-04-06 | MarginPurchaseMoney |  71638000 | 5135777000 |
    === "Schema"
        ```
        {
            TodayBalance: int64, # today balance
            YesBalance: int64, # yesterday balance
            buy: int64, # buy
            date: str, # date
            name: str, # category
            Return: int64, # cash/securities repayment
            sell: int64 # sell
        }
        ```

----------------------------------
#### Institutional Investors Buy/Sell TaiwanStockInstitutionalInvestorsBuySell

- Data range: 2005-01-01 ~ now
- Coverage: listed (TWSE), OTC (TPEx) and emerging market companies, distinguished by `stock_id` (use `TaiwanStockInfo` to look up market type)
- Data update time **Monday to Friday 20:00**, the actual update time is based on the API data.

!!! note "Values may be updated slightly after the initial release"
    This data is the **original-trade statistics** of each institutional investor for the day. A small number of trades (e.g. after-hours fixed-price or block/matched trades) may be tallied into the day's statistics only after the initial release, so a given day's **buy/sell totals can be topped up afterwards**; when both sides of such a trade belong to the same investor category, buy and sell increase by the same amount and the **net (buy minus sell) is unaffected**. This is the completion of the day's original trades — not a data error, and not an error-account correction. There is no fixed "finalized" time; treat the value currently returned by the API as the latest. If you need finalized figures, retrieve them one or two business days after the trading day.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_institutional_investors(
            stock_id="2330",
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockInstitutionalInvestorsBuySell",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockInstitutionalInvestorsBuySell",
                data_id= "2330",
                start_date= "2020-04-01",
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
        df = api.taiwan_stock_institutional_investors(
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
        |    | date       |   stock_id |      buy | name                |     sell |
        |---:|:-----------|-----------:|---------:|:--------------------|---------:|
        |  0 | 2020-04-01 |       2330 | 31304729 | Foreign_Investor    | 29057663 |
        |  1 | 2020-04-01 |       2330 |        0 | Foreign_Dealer_Self |        0 |
        |  2 | 2020-04-01 |       2330 |   900000 | Investment_Trust    |   239000 |
        |  3 | 2020-04-01 |       2330 |    79000 | Dealer_self         |   807000 |
        |  4 | 2020-04-01 |       2330 |   189000 | Dealer_Hedging      |   493500
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            buy: int64, # buy
            name: str, # category
            sell: int64 # sell
        }
        ```

#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_institutional_investors(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockInstitutionalInvestorsBuySell",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockInstitutionalInvestorsBuySell",
                start_date= "2020-01-02"
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
        |    | date       |   stock_id |     buy | name                |    sell |
        |---:|:-----------|-----------:|--------:|:--------------------|--------:|
        |  0 | 2020-04-01 |       0050 |  458249 | Foreign_Investor    | 4492000 |
        |  1 | 2020-04-01 |       0050 |       0 | Foreign_Dealer_Self |       0 |
        |  2 | 2020-04-01 |       0050 |   54000 | Investment_Trust    |       0 |
        |  3 | 2020-04-01 |       0050 |       0 | Dealer_self         |       0 |
        |  4 | 2020-04-01 |       0050 | 2050000 | Dealer_Hedging      |  905000 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            buy: int64, # buy
            name: str, # category
            sell: int64 # sell
        }
        ```

----------------------------------
#### Institutional Investors Buy/Sell (Wide) TaiwanStockInstitutionalInvestorsBuySellWide

- Same source data as `TaiwanStockInstitutionalInvestorsBuySell`, but in **wide format**: one row per trading day, with each institutional investor's buy/sell flattened into its own column — no manual pivot needed.
- Data range: 2005-01-01 ~ now
- Coverage: listed (TWSE), OTC (TPEx) and emerging market companies, distinguished by `stock_id` (use `TaiwanStockInfo` to look up market type)
- Data update time **Monday to Friday 20:00**, the actual update time is based on the API data.

!!! note "Values may be updated slightly after the initial release"
    This data is the **original-trade statistics** of each institutional investor for the day. A small number of trades (e.g. after-hours fixed-price or block/matched trades) may be tallied into the day's statistics only after the initial release, so a given day's **buy/sell totals can be topped up afterwards**; when both sides of such a trade belong to the same investor category, buy and sell increase by the same amount and the **net (buy minus sell) is unaffected**. This is the completion of the day's original trades — not a data error, and not an error-account correction. There is no fixed "finalized" time; treat the value currently returned by the API as the latest. If you need finalized figures, retrieve them one or two business days after the trading day.

!!! note "New vs old era columns (important)"
    The classification of the three institutional investors has changed over the years. This wide table includes **all historical classifications**; a classification is always `0` in eras where it did not yet exist:

    | Column | Available era | Other eras |
    |--------|---------------|------------|
    | `Foreign_Investor` (foreign, excl. foreign dealer self) | all | — |
    | `Investment_Trust` | all | — |
    | `Dealer` (dealer, combined) | **old era** (before ~2014-12-01) and Emerging | `0` afterwards |
    | `Dealer_self` (dealer, proprietary) | **new era** (from 2014-12-01) | `0` before |
    | `Dealer_Hedging` (dealer, hedging) | **new era** (from 2014-12-01) | `0` before |
    | `Foreign_Dealer_Self` (foreign dealer self) | **new era** (from 2018-01-15) | `0` before |

    - From **2014-12-01**, the combined `Dealer` was split into `Dealer_self` (proprietary) and `Dealer_Hedging` (hedging).
    - From **2018-01-15**, `Foreign_Dealer_Self` was split out from foreign investors.
    - For a continuous "dealer total" across eras, sum `Dealer + Dealer_self + Dealer_Hedging` (only one group is non-zero in any era, so there is no double counting).

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_institutional_investors_wide(
            stock_id="2330",
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # login to get the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockInstitutionalInvestorsBuySellWide",
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
        token = "" # login to get the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockInstitutionalInvestorsBuySellWide",
                data_id= "2330",
                start_date= "2020-04-01",
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

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   Foreign_Investor_buy |   Foreign_Investor_sell |   Foreign_Dealer_Self_buy |   Foreign_Dealer_Self_sell |   Investment_Trust_buy |   Investment_Trust_sell |   Dealer_buy |   Dealer_sell |   Dealer_self_buy |   Dealer_self_sell |   Dealer_Hedging_buy |   Dealer_Hedging_sell |
        |---:|:-----------|-----------:|-----------------------:|------------------------:|--------------------------:|---------------------------:|-----------------------:|------------------------:|-------------:|--------------:|------------------:|-------------------:|---------------------:|----------------------:|
        |  0 | 2020-04-01 |       2330 |               31304729 |                29057663 |                         0 |                          0 |                 900000 |                  239000 |            0 |             0 |             79000 |             807000 |               189000 |                493500 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock id
            Foreign_Investor_buy: int64, # foreign investor buy
            Foreign_Investor_sell: int64, # foreign investor sell
            Foreign_Dealer_Self_buy: int64, # foreign dealer self buy
            Foreign_Dealer_Self_sell: int64, # foreign dealer self sell
            Investment_Trust_buy: int64, # investment trust buy
            Investment_Trust_sell: int64, # investment trust sell
            Dealer_buy: int64, # dealer buy (combined, old era)
            Dealer_sell: int64, # dealer sell (combined, old era)
            Dealer_self_buy: int64, # dealer proprietary buy
            Dealer_self_sell: int64, # dealer proprietary sell
            Dealer_Hedging_buy: int64, # dealer hedging buy
            Dealer_Hedging_sell: int64 # dealer hedging sell
        }
        ```

----------------------------------
#### Taiwan Total Market Institutional Investors Buy/Sell TaiwanStockTotalInstitutionalInvestors

- Data range: 2004-04-01 ~ now
- Data update time **Monday to Friday 15:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_institutional_investors_total(
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockTotalInstitutionalInvestors",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockTotalInstitutionalInvestors",
                start_date= "2020-01-02",
                end_date='2020-04-12'
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
        |    |         buy | date       | name                |        sell |
        |---:|------------:|:-----------|:--------------------|------------:|
        |  0 |      123150 | 2020-04-01 | Foreign_Dealer_Self |      266220 |
        |  1 |  3681729831 | 2020-04-01 | Dealer_Hedging      |  5539788946 |
        |  2 | 33759089839 | 2020-04-01 | Foreign_Investor    | 38466572585 |
        |  3 |  3039112340 | 2020-04-01 | Investment_Trust    |   853138940 |
        |  4 |   789316840 | 2020-04-01 | Dealer_self         |   912143500 |
    === "Schema"
        ```
        {
            buy: int64, # buy
            date: str, # date
            name: str, # category
            sell: int64 # sell
        }
        ```

----------------------------------
#### Foreign Investor Shareholding TaiwanStockShareholding

- Data range: 2004-02-01 ~ now
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_shareholding(
            stock_id="2330",
            start_date='2020-04-01',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockShareholding",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockShareholding",
                data_id= "2330",
                start_date= "2020-01-02",
                end_date="2020-04-12"
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
        df = api.taiwan_stock_shareholding(
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
        |    | date       |   stock_id | stock_name   | InternationalCode   |   ForeignInvestmentRemainingShares |   ForeignInvestmentShares |   ForeignInvestmentRemainRatio |   ForeignInvestmentSharesRatio |   ForeignInvestmentUpperLimitRatio |   ChineseInvestmentUpperLimitRatio |   NumberOfSharesIssued | RecentlyDeclareDate   | note   |
        |---:|:-----------|-----------:|:-------------|:--------------------|-----------------------------------:|--------------------------:|-------------------------------:|-------------------------------:|-----------------------------------:|-----------------------------------:|-----------------------:|:----------------------|:-------|
        |  0 | 2020-04-01 |       2330 | 台積電       | TW0002330008        |                         6309042842 |               19621337616 |                          24.33 |                          75.66 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
        |  1 | 2020-04-06 |       2330 | 台積電       | TW0002330008        |                         6304552683 |               19625827775 |                          24.31 |                          75.68 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
        |  2 | 2020-04-07 |       2330 | 台積電       | TW0002330008        |                         6283562246 |               19646818212 |                          24.23 |                          75.76 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
        |  3 | 2020-04-08 |       2330 | 台積電       | TW0002330008        |                         6273338931 |               19657041527 |                          24.19 |                          75.8  |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
        |  4 | 2020-04-09 |       2330 | 台積電       | TW0002330008        |                         6267988722 |               19662391736 |                          24.17 |                          75.82 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            stock_name: str, # stock name
            InternationalCode: str, # international stock code
            ForeignInvestmentRemainingShares: int64, # remaining shares available for foreign investment
            ForeignInvestmentShares: int64, # shares held by foreign investors
            ForeignInvestmentRemainRatio: float64, # ratio of shares available for foreign investment
            ForeignInvestmentSharesRatio: float64, # foreign shareholding ratio
            ForeignInvestmentUpperLimitRatio: float64, # foreign investment upper limit
            ChineseInvestmentUpperLimitRatio: float64, # mainland Chinese investment upper limit
            NumberOfSharesIssued: int64, # number of shares issued
            RecentlyDeclareDate: str, # most recent declaration date
            note: str # note
        }
        ```

#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_shareholding(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockShareholding",
            "start_date": "2020-04-01",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockShareholding",
                start_date= "2020-01-02"
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
        |    | date       |   stock_id | stock_name   | InternationalCode   |   ForeignInvestmentRemainingShares |   ForeignInvestmentShares |   ForeignInvestmentRemainRatio |   ForeignInvestmentSharesRatio |   ForeignInvestmentUpperLimitRatio |   ChineseInvestmentUpperLimitRatio |   NumberOfSharesIssued | RecentlyDeclareDate   | note   |
        |---:|:-----------|-----------:|:-------------|:--------------------|-----------------------------------:|--------------------------:|-------------------------------:|-------------------------------:|-----------------------------------:|-----------------------------------:|-----------------------:|:----------------------|:-------|
        |  0 | 2020-04-01 |       0050 | 元大台灣50   | TW0000050004        |                          960256795 |                  94743205 |                          91.01 |                           8.98 |                                100 |                                100 |             1055000000 | 2019-07-18            |        |
        |  1 | 2020-04-01 |       0051 | 元大中型100  | TW0000051002        |                            9471000 |                     29000 |                          99.69 |                           0.3  |                                100 |                                100 |                9500000 | 2019-07-18            |        |
        |  2 | 2020-04-01 |       0052 | 富邦科技     | TW0000052000        |                           29957000 |                     43000 |                          99.85 |                           0.14 |                                100 |                                100 |               30000000 | 2019-07-18            |        |
        |  3 | 2020-04-01 |       0053 | 元大電子     | TW0000053008        |                            6466950 |                     21050 |                          99.67 |                           0.32 |                                100 |                                100 |                6488000 | 2019-07-18            |        |
        |  4 | 2020-04-01 |       0054 | 元大台商50   | TW0000054006        |                            9955000 |                    169000 |                          98.33 |                           1.66 |                                100 |                                100 |               10124000 | 2019-07-18            |        |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            stock_name: str, # stock name
            InternationalCode: str, # international stock code
            ForeignInvestmentRemainingShares: int64, # remaining shares available for foreign investment
            ForeignInvestmentShares: int64, # shares held by foreign investors
            ForeignInvestmentRemainRatio: float64, # ratio of shares available for foreign investment
            ForeignInvestmentSharesRatio: float64, # foreign shareholding ratio
            ForeignInvestmentUpperLimitRatio: float64, # foreign investment upper limit
            ChineseInvestmentUpperLimitRatio: float64, # mainland Chinese investment upper limit
            NumberOfSharesIssued: int64, # number of shares issued
            RecentlyDeclareDate: str, # most recent declaration date
            note: str # note
        }
        ```

----------------------------------
#### Shareholders Holding Shares Distribution TaiwanStockHoldingSharesPer (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2010-01-29 ~ now
!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_holding_shares_per(
            stock_id="2330",
            start_date='2020-04-01',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockHoldingSharesPer",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockHoldingSharesPer",
                data_id= "2330",
                start_date= "2020-01-02",
                end_date='2020-04-12'
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
        df = api.taiwan_stock_holding_shares_per(
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
        |    | date       |   stock_id | HoldingSharesLevel   |   people |   percent |      unit |
        |---:|:-----------|-----------:|:---------------------|---------:|----------:|----------:|
        |  0 | 2020-04-01 |       2330 | 1-999                |   165122 |      0.12 |  33289900 |
        |  1 | 2020-04-01 |       2330 | 1000-5000            |   227692 |      1.69 | 440404454 |
        |  2 | 2020-04-01 |       2330 | 10001-15000          |    10408 |      0.49 | 128127693 |
        |  3 | 2020-04-01 |       2330 | 100001-200000        |     1628 |      0.86 | 225202876 |
        |  4 | 2020-04-01 |       2330 | 15001-20000          |     5068 |      0.34 |  89929303 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            HoldingSharesLevel: str, # shareholding level
            people: int64, # number of people
            percent: float64, # ratio
            unit: int64 # number of shares
        }
        ```

#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_holding_shares_per(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockHoldingSharesPer",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockHoldingSharesPer",
                start_date= "2020-04-01"
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
        |    | date       |   stock_id | HoldingSharesLevel   |   people |   percent |      unit |
        |---:|:-----------|-----------:|:---------------------|---------:|----------:|----------:|
        |  0 | 2020-04-01 |       0050 | 1-999                |    44173 |      1.02 |  10834763 |
        |  1 | 2020-04-01 |       0050 | 1000-5000            |    96465 |     17.7  | 186791648 |
        |  2 | 2020-04-01 |       0050 | 5001-10000           |    10364 |      7.57 |  79902735 |
        |  3 | 2020-04-01 |       0050 | 10001-15000          |     2819 |      3.41 |  36075583 |
        |  4 | 2020-04-01 |       0050 | 15001-20000          |     1557 |      2.69 |  28426726 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            HoldingSharesLevel: str, # shareholding level
            people: int64, # number of people
            percent: float64, # ratio
            unit: int64 # number of shares
        }
        ```

----------------------------------
#### Securities Lending Transaction Details TaiwanStockSecuritiesLending

- Data range: 2001-05-01 ~ now
- Data update time **Monday to Friday 15:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_securities_lending(
            stock_id="2330",
            start_date='2020-04-01',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockSecuritiesLending",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
        url = url,
            query = list(
                dataset="TaiwanStockSecuritiesLending",
                data_id="2330",
                start_date= "2020-01-02",
                end_date='2020-04-12'
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
        df = api.taiwan_stock_securities_lending(
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
        |    | date       |   stock_id | transaction_type   |   volume |   fee_rate |   close | original_return_date   |   original_lending_period |
        |---:|:-----------|-----------:|:-------------------|---------:|-----------:|--------:|:-----------------------|--------------------------:|
        |  0 | 2020-04-01 |       2330 | 議借               |     1330 |       1.36 |   271.5 | 2020-09-30             |                       182 |
        |  1 | 2020-04-01 |       2330 | 議借               |      800 |       0.41 |   271.5 | 2020-09-30             |                       182 |
        |  2 | 2020-04-01 |       2330 | 議借               |      850 |       0.41 |   271.5 | 2020-09-30             |                       182 |
        |  3 | 2020-04-01 |       2330 | 議借               |      500 |       0.5  |   271.5 | 2020-09-30             |                       182 |
        |  4 | 2020-04-01 |       2330 | 議借               |      160 |       0.36 |   271.5 | 2020-09-30             |                       182 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            transaction_type: str, # transaction type
            volume: int64, # transaction volume
            fee_rate: float64, # transaction fee rate
            close: float64, # closing price
            original_return_date: str, # agreed return date
            original_lending_period: int64 # agreed lending period (days)
        }
        ```

#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_securities_lending(
            start_date='2020-04-01',
        )
        ```
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockSecuritiesLending",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockSecuritiesLending",
                start_date= "2020-01-02"
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
        |    | date       |   stock_id | transaction_type   |   volume |   fee_rate |   close | original_return_date   |   original_lending_period |
        |---:|:-----------|-----------:|:-------------------|---------:|-----------:|--------:|:-----------------------|--------------------------:|
        |  0 | 2020-04-01 |       1101 | 議借               |      760 |       0.25 |    39   | 2020-09-30             |                       182 |
        |  1 | 2020-04-01 |       1101 | 議借               |      397 |       0.25 |    39   | 2020-09-30             |                       182 |
        |  2 | 2020-04-01 |       1101 | 競價               |      436 |       0.7  |    39   | 2020-09-30             |                       182 |
        |  3 | 2020-04-01 |       1102 | 議借               |      150 |       0.25 |    38.6 | 2020-09-30             |                       182 |
        |  4 | 2020-04-01 |       1102 | 議借               |      770 |       1.05 |    38.6 | 2020-09-30             |                       182 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            transaction_type: str, # transaction type
            volume: int64, # transaction volume
            fee_rate: float64, # transaction fee rate
            close: float64, # closing price
            original_return_date: str, # agreed return date
            original_lending_period: int64 # agreed lending period (days)
        }
        ```


----------------------------------
#### Margin Short Sale Suspension (Short Sale Covering Date) TaiwanStockMarginShortSaleSuspension

- Data range: 2015-01-01 ~ now
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarginShortSaleSuspension",
            "data_id": "0050",
            "start_date": "2015-01-01",
            "end_date": "2015-04-12",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarginShortSaleSuspension",
                data_id="0050",
                start_date= "2015-01-01",
                end_date= "2015-04-12"
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
        df = api.taiwan_stock_margin_short_sale_suspension(
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
        |    |   stock_id | date       | end_date   | reason   |
        |---:|-----------:|:-----------|:-----------|:---------|
        |  0 |       0050 | 2015-10-20 | 2015-10-23 | 分配收益 |
        |  1 |       0050 | 2016-07-22 | 2016-07-27 | 分配收益 |
        |  2 |       0050 | 2017-02-02 | 2017-02-07 | 分配收益 |
        |  3 |       0050 | 2017-07-25 | 2017-07-28 | 分配收益 |
        |  4 |       0050 | 2018-01-23 | 2018-01-26 | 分配收益 |
    === "Schema"
        ```
        {
            stock_id: str, # stock symbol
            date: str, # start date
            end_date: str, # end date
            reason: str # suspension reason
        }
        ```

#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarginShortSaleSuspension",
            "start_date": "2015-10-20",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarginShortSaleSuspension",
                start_date= "2015-10-20"
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
        |    |   stock_id | date       | end_date   | reason   |
        |---:|-----------:|:-----------|:-----------|:---------|
        |  0 |       0050 | 2015-10-20 | 2015-10-23 | 分配收益 |
        |  1 |       0056 | 2015-10-20 | 2015-10-23 | 分配收益 |
    === "Schema"
        ```
        {
            stock_id: str, # stock symbol
            date: str, # start date
            end_date: str, # end date
            reason: str # suspension reason
        }
        ```


----------------------------------
#### Credit Limit Daily Short Sale Balances TaiwanDailyShortSaleBalances

- Data range: 2005-07-01 ~ now
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_daily_short_sale_balances(
            stock_id="2330",
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanDailyShortSaleBalances",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
        url = url,
            query = list(
                dataset="TaiwanDailyShortSaleBalances",
                data_id="2330",
                start_date= "2020-01-02",
                end_date='2020-04-12'
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
        df = api.taiwan_daily_short_sale_balances(
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
        |    |   stock_id |   MarginShortSalesPreviousDayBalance |   MarginShortSalesShortSales |   MarginShortSalesShortCovering |   MarginShortSalesStockRedemption |   MarginShortSalesCurrentDayBalance |   MarginShortSalesQuota |   SBLShortSalesPreviousDayBalance |   SBLShortSalesShortSales |   SBLShortSalesReturns |   SBLShortSalesAdjustments |   SBLShortSalesCurrentDayBalance |   SBLShortSalesQuota |   SBLShortSalesShortCovering | date       |
        |---:|-----------:|-------------------------------------:|-----------------------------:|--------------------------------:|----------------------------------:|------------------------------------:|------------------------:|----------------------------------:|--------------------------:|-----------------------:|---------------------------:|---------------------------------:|---------------------:|-----------------------------:|:-----------|
        |  0 |       2330 |                              1975000 |                            0 |                         1573000 |                            378000 |                               24000 |             -2107339478 |                          47947858 |                    487000 |                      0 |                          0 |                         48434858 |              7526895 |                            0 | 2020-04-01 |
        |  1 |       2330 |                                24000 |                            0 |                               0 |                             24000 |                                   0 |             -2107339478 |                          48434858 |                     44000 |                  60000 |                          0 |                         48418858 |              7563083 |                            0 | 2020-04-06 |
        |  2 |       2330 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |             -2107339478 |                          48418858 |                     62000 |                      0 |                          0 |                         48480858 |              7635835 |                            0 | 2020-04-07 |
        |  3 |       2330 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |             -2107339478 |                          48480858 |                    933000 |                7345000 |                          0 |                         42068858 |              7688249 |                            0 | 2020-04-08 |
        |  4 |       2330 |                                    0 |                       398000 |                               0 |                                 0 |                              398000 |             -2107339478 |                          42068858 |                     46000 |                   2000 |                          0 |                         42112858 |              7642682 |                            0 | 2020-04-09 |
    === "Schema"
        ```
        {
            stock_id: str, # stock symbol
            MarginShortSalesPreviousDayBalance: int32, # previous day balance (margin short sales)
            MarginShortSalesShortSales: int32, # sell (margin short sales)
            MarginShortSalesShortCovering: int32, # buy (margin short sales)
            MarginShortSalesStockRedemption: int32, # stock redemption (margin short sales)
            MarginShortSalesCurrentDayBalance: int32, # current day balance (margin short sales)
            MarginShortSalesQuota: int32, # quota (margin short sales)
            SBLShortSalesPreviousDayBalance: int32, # previous day balance (SBL short sales)
            SBLShortSalesShortSales: int32, # sell (SBL short sales)
            SBLShortSalesReturns: int32, # returns (SBL short sales)
            SBLShortSalesAdjustments: int32, # current day adjustment (SBL short sales)
            SBLShortSalesCurrentDayBalance: int32, # current day balance (SBL short sales)
            SBLShortSalesQuota: int32, # quota (SBL short sales)
            SBLShortSalesShortCovering: int32, # inventory adjustment (SBL short sales)
            date: str # date
        }
        ```

#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_daily_short_sale_balances(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanDailyShortSaleBalances",
            "start_date": "2021-05-20",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
        url = url,
            query = list(
                dataset="TaiwanDailyShortSaleBalances",
                start_date= "2020-01-02"
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
        |    |   stock_id |   MarginShortSalesPreviousDayBalance |   MarginShortSalesShortSales |   MarginShortSalesShortCovering |   MarginShortSalesStockRedemption |   MarginShortSalesCurrentDayBalance |   MarginShortSalesQuota |   SBLShortSalesPreviousDayBalance |   SBLShortSalesShortSales |   SBLShortSalesReturns |   SBLShortSalesAdjustments |   SBLShortSalesCurrentDayBalance |   SBLShortSalesQuota |   SBLShortSalesShortCovering | date       |
        |---:|-----------:|-------------------------------------:|-----------------------------:|--------------------------------:|----------------------------------:|------------------------------------:|------------------------:|----------------------------------:|--------------------------:|-----------------------:|---------------------------:|---------------------------------:|---------------------:|-----------------------------:|:-----------|
        |  0 |       0050 |                              2336000 |                        13000 |                           65000 |                              1000 |                             2283000 |               263750000 |                          25527000 |                         0 |                      0 |                          0 |                         25527000 |              2397551 |                            0 | 2020-04-01 |
        |  1 |       0051 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |                 2375000 |                              1000 |                         0 |                      0 |                          0 |                             1000 |                 4053 |                            0 | 2020-04-01 |
        |  2 |       0052 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |                 7500000 |                             34000 |                         0 |                      0 |                          0 |                            34000 |                17168 |                            0 | 2020-04-01 |
        |  3 |       0053 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |                 1622000 |                                 0 |                         0 |                      0 |                          0 |                                0 |                 3158 |                            0 | 2020-04-01 |
        |  4 |       0054 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |                 2531000 |                                 0 |                         0 |                      0 |                          0 |                                0 |                 1357 |                            0 | 2020-04-01 |
    === "Schema"
        ```
        {
            stock_id: str, # stock symbol
            MarginShortSalesPreviousDayBalance: int32, # previous day balance (margin short sales)
            MarginShortSalesShortSales: int32, # sell (margin short sales)
            MarginShortSalesShortCovering: int32, # buy (margin short sales)
            MarginShortSalesStockRedemption: int32, # stock redemption (margin short sales)
            MarginShortSalesCurrentDayBalance: int32, # current day balance (margin short sales)
            MarginShortSalesQuota: int32, # quota (margin short sales)
            SBLShortSalesPreviousDayBalance: int32, # previous day balance (SBL short sales)
            SBLShortSalesShortSales: int32, # sell (SBL short sales)
            SBLShortSalesReturns: int32, # returns (SBL short sales)
            SBLShortSalesAdjustments: int32, # current day adjustment (SBL short sales)
            SBLShortSalesCurrentDayBalance: int32, # current day balance (SBL short sales)
            SBLShortSalesQuota: int32, # quota (SBL short sales)
            SBLShortSalesShortCovering: int32, # inventory adjustment (SBL short sales)
            date: str # date
        }
        ```

----------------------------------
#### Securities Trader Information TaiwanSecuritiesTraderInfo

- Provides securities trader related information, used with the Taiwan Stock Trading Daily Report by Branch (TaiwanStockTradingDailyReport). Use the securities_trader_id to query all stock transactions of a particular securities trader.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_securities_trader_info()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanSecuritiesTraderInfo",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset = "TaiwanSecuritiesTraderInfo"
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
        |    |   securities_trader_id | securities_trader   | date       | address                                                                                      | phone       |
        |---:|-----------------------:|:--------------------|:-----------|:---------------------------------------------------------------------------------------------|:------------|
        |  0 |                   1020 | 合庫                | 2011-12-02 | 台北市大安區忠孝東路四段325號2樓(部分)、經紀部複委託科地址：台北市松山區長安東路二段225號5樓 | 02-27528000 |
        |  1 |                   1021 | 合庫- 台中          | 2011-12-02 | 台中市西區民權路91號6樓                                                                      | 04-22255141 |
        |  2 |                   1022 | 合庫-台南           | 2011-12-02 | 台南市北區成功路48號3樓                                                                      | 06-2260148  |
        |  3 |                   1023 | 合庫-高雄           | 2011-12-02 | 高雄市大勇路97號5樓                                                                          | 07-5319755  |
        |  4 |                   1024 | 合庫-嘉義           | 2011-12-02 | 嘉義市國華街279號2樓                                                                         | 05-2220016  |
    === "Schema"
        ```
        {
            securities_trader_id: str, # securities trader code
            securities_trader: str, # securities trader name
            date: str, # opening date
            address: str, # address
            phone: str # phone
        }
        ```

----------------------------------
#### Taiwan Stock Trading Daily Report by Branch (query by stock_id) TaiwanStockTradingDailyReport (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Provides Taiwan stock trading by branch information for listed (TWSE), OTC, and emerging stocks!
- Data range: 2021-06-30 ~ now
- Due to the large data volume, only one day of data is provided per request.
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.
- Some data is missing on the following dates: 2022-10-31~2022-11-03, 2023-01-11~2023-01-17.
- Enabling Async can significantly reduce data fetch time. In Colab tests, downloading 2,175 stocks takes only 4 minutes 20 seconds.

??? note "A `price` of 0 on emerging-stock dealer (自營商) branches is expected, not missing data"
    Emerging stocks (where `TaiwanStockInfo` reports the `stock_id` as `emerging`) trade on a **quote-driven negotiation market run by recommending securities firms**, unlike the central-matching auction used for listed/OTC stocks. The recommending firms act as market makers, **continuously quoting bid/ask and filling orders with their own capital and inventory — i.e. the dealer (自營商) branch, whose `securities_trader_id` ends in `T`**. Because that daily market-making position trades both sides across many price levels, there is no single representative execution price, so `price` is reported as `0` for that branch row (`buy`/`sell` share counts are still correct).

    - This is a structural characteristic of the emerging market, **not missing or erroneous data**; ordinary (non-dealer) branches of the same emerging stock still carry normal execution prices.
    - Listed (TWSE) and OTC stocks are unaffected — every branch, including dealers, has an execution price.
    - Reference: [TPEx — Emerging Stock Trading System](https://www.tpex.org.tw/web/emergingstock/trading_rule/rule.php?l=zh-tw).

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_trading_daily_report(
            stock_id="2330",
            date='2022-06-16',
        )
        print(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        token = ""

        data_loader = DataLoader()
        data_loader.login_by_token(token)

        date = "2025-12-08"
        start = datetime.datetime.now()
        df = data_loader.taiwan_stock_trading_daily_report(
            date=date,
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        # 0:04:20
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report'
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "data_id": "2330",
            "date": "2022-06-16",
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
        token = "" # Refer to login to obtain the API key
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report'
        response = httr::GET(
            url = url,
            query = list(
                data_id="2330",
                start_date= "2022-06-16",
                token = token # Refer to login to obtain the API key
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
        |    | securities_trader   |   price |   buy |   sell |   securities_trader_id |   stock_id | date       |
        |---:|:--------------------|--------:|------:|-------:|-----------------------:|-----------:|:-----------|
        |  0 | 合庫                |     508 |  4000 |   2000 |                   1020 |       2330 | 2022-06-16 |
        |  1 | 合庫                |     509 |  3480 |      0 |                   1020 |       2330 | 2022-06-16 |
        |  2 | 合庫                |     510 |  2310 |     50 |                   1020 |       2330 | 2022-06-16 |
        |  3 | 合庫                |     511 |  1169 |      0 |                   1020 |       2330 | 2022-06-16 |
        |  4 | 合庫                |     512 |  1300 |  10000 |                   1020 |       2330 | 2022-06-16 |
    === "Schema"
        ```
        {
            securities_trader: str, # securities trader name
            price: float64, # transaction price
            buy: int32, # shares bought
            sell: int32, # shares sold
            securities_trader_id: str, # securities trader code
            stock_id: str, # stock symbol
            date: str # date
        }
        ```

----------------------------------
#### Taiwan Stock Trading Daily Report by Branch (query by securities_trader_id) TaiwanStockTradingDailyReport (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Provides Taiwan stock trading by branch information for listed (TWSE), OTC, and emerging stocks!
- Data range: 2021-06-30 ~ now
- Due to the large data volume, only one day of data is provided per request.
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.
- Some data is missing on the following dates: 2022-10-31~2022-11-03, 2023-01-11~2023-01-17.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_trading_daily_report(
            securities_trader_id="1102",
            date='2022-06-16',
        )
        print(df)
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report'
        parameter = {
            "securities_trader_id": "1020",
            "date": "2022-06-16",
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
        token = "" # Refer to login to obtain the API key
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report'
        response = httr::GET(
            url = url,
            query = list(
                securities_trader_id="1020",
                start_date= "2022-06-16",
                token = token # Refer to login to obtain the API key
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
        |      | securities_trader   |   price |   buy |   sell |   securities_trader_id |   stock_id | date       |
        |-----:|:--------------------|--------:|------:|-------:|-----------------------:|-----------:|:-----------|
        |    0 | 合庫                |  122.25 | 19000 |      0 |                   1020 |       0050 | 2022-06-16 |
        |    1 | 合庫                |  122.3  | 80000 |      0 |                   1020 |       0050 | 2022-06-16 |
        |    2 | 合庫                |  122.35 | 10000 |      0 |                   1020 |       0050 | 2022-06-16 |
        |    3 | 合庫                |  122.5  |  1300 |      0 |                   1020 |       0050 | 2022-06-16 |
        |    4 | 合庫                |  122.55 | 20000 |      0 |                   1020 |       0050 | 2022-06-16 |
        |  ... | ...                 |  ...    | ...   |   ... |                   ...   |       ...  | ...        |
        | 3211 | 合庫                |  107    |  1000 |  50000 |                   1020 |       9958 | 2022-06-16 |
        | 3212 | 合庫                |  107.5  |     0 |  32000 |                   1020 |       9958 | 2022-06-16 |
        | 3213 | 合庫                |  108    |     0 |   2000 |                   1020 |       9958 | 2022-06-16 |
        | 3214 | 合庫                |  108.5  |   150 |      0 |                   1020 |       9958 | 2022-06-16 |
        | 3215 | 合庫                |   16.05 |  1000 |      0 |                   1020 |       9962 | 2022-06-16 |
    === "Schema"
        ```
        {
            securities_trader: str, # securities trader name
            price: float64, # transaction price
            buy: int32, # shares bought
            sell: int32, # shares sold
            securities_trader_id: str, # securities trader code
            stock_id: str, # stock symbol
            date: str # date
        }
        ```

#### Fetch all data for a specific date at once (available only to [sponsorpro](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one day's data.)

- Data range: 2021-06-30 ~ now.
- Providing the dataset and date parameters returns the branch-level trading data of all stocks for that day.
- Downloads the whole-day parquet via a signed URL, avoiding file-by-file queries — suitable for batch analysis covering the entire market.
- Data update time: **Monday to Friday 21:00**. The actual update time is based on the API data.
- Some data is missing on these dates: 2022-10-31~2022-11-03, 2023-01-11~2023-01-17.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_trading_daily_report(
            date='2022-06-16',
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
            "dataset": "TaiwanStockTradingDailyReport",
            "date": "2022-06-16",
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
                dataset="TaiwanStockTradingDailyReport",
                date= "2022-06-16"
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
        |    | securities_trader   |   price |   buy |   sell |   securities_trader_id |   stock_id | date       |
        |---:|:--------------------|--------:|------:|-------:|-----------------------:|-----------:|:-----------|
        |  0 | 合庫                |     508 |  4000 |   2000 |                   1020 |       2330 | 2022-06-16 |
        |  1 | 合庫                |     509 |  3480 |      0 |                   1020 |       2330 | 2022-06-16 |
        |  2 | 合庫                |     510 |  2310 |     50 |                   1020 |       2330 | 2022-06-16 |
        |  3 | 合庫                |     511 |  1169 |      0 |                   1020 |       2330 | 2022-06-16 |
        |  4 | 合庫                |     512 |  1300 |  10000 |                   1020 |       2330 | 2022-06-16 |
    === "Schema"
        ```
        {
            securities_trader: str, # securities trader name
            price: float64, # deal price
            buy: int32, # shares bought
            sell: int32, # shares sold
            securities_trader_id: str, # securities trader code
            stock_id: str, # stock symbol
            date: str # date
        }
        ```

----------------------------------
#### Taiwan Stock Warrant Trading Daily Report by Branch (query by stock_id) TaiwanStockWarrantTradingDailyReport (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2023-06-21 ~ now
- Due to the large data volume, only one day of data is provided per request.
- Data update time **Monday to Friday 01:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_warrant_trading_daily_report(
            stock_id="084655",
            date='2023-06-21',
        )
        print(df)
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_warrant_trading_daily_report'
        parameter = {
            "data_id": "084655",
            "date": "2023-06-21",
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
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_warrant_trading_daily_report'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                data_id="084655",
                start_date= "2023-06-21",
                token = token # Refer to login to obtain the API key
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
        df = api.taiwan_stock_warrant_trading_daily_report(
            date=date,
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | securities_trader   |   price |   buy |   sell |   securities_trader_id |   stock_id | date       |
        |---:|:--------------------|--------:|------:|-------:|-----------------------:|-----------:|:-----------|
        |  0 | 元富                |    2.48 |     0 |   4000 |                   5920 |     084655 | 2023-06-21 |
        |  1 | 凱基                |    2.48 |  4000 |      0 |                   9200 |     084655 | 2023-06-21 |
    === "Schema"
        ```
        {
            securities_trader: str, # securities trader name
            price: float64, # transaction price
            buy: int32, # shares bought
            sell: int32, # shares sold
            securities_trader_id: str, # securities trader code
            stock_id: str, # stock symbol
            date: str # date
        }
        ```

----------------------------------
#### Taiwan Stock Warrant Trading Daily Report by Branch (query by securities_trader_id) TaiwanStockWarrantTradingDailyReport (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2023-06-21 ~ now
- Due to the large data volume, only one day of data is provided per request.
- Data update time **Monday to Friday 23:00**, the actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_warrant_trading_daily_report'
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "securities_trader_id": "5920",
            "date": "2023-06-21",
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
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_warrant_trading_daily_report'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                securities_trader_id="5920",
                start_date= "2023-06-21",
                token = token # Refer to login to obtain the API key
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
        |     | securities_trader   |   price |    buy |   sell |   securities_trader_id | stock_id   | date       |
        |----:|:--------------------|--------:|-------:|-------:|-----------------------:|:-----------|:-----------|
        |   0 | 元富                |    0.97 |  50000 |      0 |                   5920 | 07741U     | 2023-06-21 |
        |   1 | 元富                |    0.98 |  50000 |      0 |                   5920 | 07741U     | 2023-06-21 |
        |   2 | 元富                |    1.52 | 100000 |      0 |                   5920 | 07742U     | 2023-06-21 |
        |   3 | 元富                |    1.56 |  49000 |      0 |                   5920 | 07742U     | 2023-06-21 |
    === "Schema"
        ```
        {
            securities_trader: str, # securities trader name
            price: float64, # transaction price
            buy: int32, # shares bought
            sell: int32, # shares sold
            securities_trader_id: str, # securities trader code
            stock_id: str, # stock symbol
            date: str # date
        }
        ```

#### Fetch all warrant trading data for a specific date at once (available only to [sponsorpro](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one day's data.)

- Data range: 2023-06-21 ~ now.
- Providing the dataset and date parameters returns the branch-level trading data of all warrants for that day.
- Downloads the whole-day parquet via a signed URL, avoiding file-by-file queries — suitable for batch analysis covering all warrants in the market.
- Updated daily. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_warrant_trading_daily_report(
            date='2023-06-21',
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
            "dataset": "TaiwanStockWarrantTradingDailyReport",
            "date": "2023-06-21",
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
                dataset="TaiwanStockWarrantTradingDailyReport",
                date= "2023-06-21"
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
        |    | securities_trader   |   price |   buy |   sell |   securities_trader_id |   stock_id | date       |
        |---:|:--------------------|--------:|------:|-------:|-----------------------:|-----------:|:-----------|
        |  0 | 元富                |    2.48 |     0 |   4000 |                   5920 |     084655 | 2023-06-21 |
        |  1 | 凱基                |    2.48 |  4000 |      0 |                   9200 |     084655 | 2023-06-21 |
    === "Schema"
        ```
        {
            securities_trader: str, # securities trader name
            price: float64, # deal price
            buy: int32, # shares bought
            sell: int32, # shares sold
            securities_trader_id: str, # securities trader code
            stock_id: str, # stock symbol
            date: str # date
        }
        ```

----------------------------------
#### Taiwan Stock Government Bank Buy/Sell TaiwanStockGovernmentBankBuySell (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2021-06-30 ~ now
- Due to the large data volume, only one day of data is provided per request.
- Data update time **Monday to Friday 23:30**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_government_bank_buy_sell(
            start_date='2023-01-17',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockGovernmentBankBuySell",
            "start_date": "2023-01-17",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockGovernmentBankBuySell",
                start_date= "2023-01-17"
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
        |     |       date       | stock_id |  buy_amount  |  sell_amount  |  buy   |  sell  |  bank_name |
        |----:|:-----------------|---------:|-------------:|--------------:|-------:|-------:|-----------:|
        |  0  |    2023-01-17    |   0050   |  43992298.6  |  53309904.25  |372595  |451744  |      兆豐  |
        |  1  |    2023-01-17    |  5202    |       288.0  |       303.50  |    20  |    20  |      第一  |
        |  2  |    2023-01-17    |  5202    |         0.0  |        59.45  |     0  |     4  |      華南  |
        |  3  |    2023-01-17    |  5203    |     82800.0  |         0.00  |  1000  |     0  |      兆豐  |
        |  4  |    2023-01-17    |  5203    |    249000.0  |    583600.00  |  3000  |  7000  |      臺銀  |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            buy_amount: float64, # buy amount
            sell_amount: float64, # sell amount
            buy: int64, # shares bought
            sell: int64, # shares sold
            bank_name: str # bank name
        }
        ```

#### Taiwan Total Exchange Margin Maintenance TaiwanTotalExchangeMarginMaintenance (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2001-01-05 ~ now
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_total_exchange_margin_maintenance(
            start_date='2024-04-01',
            end_date='2024-05-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanTotalExchangeMarginMaintenance",
            "start_date": "2020-04-01",
            "end_date": "2020-05-01",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanTotalExchangeMarginMaintenance",
                start_date= "2024-04-01",
                end_date='2024-05-01'
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
        |    |   date | TotalExchangeMarginMaintenance       |
        |---:|--------:|-------------------------------------:|
        |  0  |    2024-04-01    |   166.007    |
        |  1  |    2024-04-02    |   167.079    |
        |  2  |    2024-04-03    |   167.085    |
        |  3  |    2024-04-08    |   167.119    |
        |  4  |    2024-04-09    |   167.095    |
    === "Schema"
        ```
        {
            date: str, # date
            TotalExchangeMarginMaintenance: float64 # total exchange margin maintenance ratio
        }
        ```

#### Daily Securities Trader Branch Aggregate Statistics TaiwanStockTradingDailyReportSecIdAgg (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Provides Taiwan stock trading by branch information for listed (TWSE), OTC, and emerging stocks!
- Data range: 2021-06-30 ~ now
- Data update time **Monday to Friday 21:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_trading_daily_report_secid_agg(
            stock_id="2330",
            securities_trader_id="1020",
            start_date= "2024-07-01",
            end_date="2024-07-15",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report_secid_agg"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "data_id": "2330",
            "securities_trader_id": "1020",
            "start_date": "2024-07-01",
            "end_date": '2024-07-15',
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
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report_secid_agg'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                data_id="2330",
                securities_trader_id="1020",
                start_date= "2024-07-01",
                end_date='2024-07-15'
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
        |    | securities_trader | securities_trader_id |   stock_id |      date     |   buy_volume |  sell_volume | buy_price  | sell_price |
        |---:|:------------------|---------------------:|-----------:|---------------:|------------:|-------------:|------------|:-----------|
        |  0 | 合庫             |        1020          |     2330   |   2024-07-01  |    12157     |    12460     |    968.08   |   973.84    |
        |  0 | 合庫             |        1020          |     2330   |   2024-07-02  |    12735     |    21885     |    964.54   |   964.63    |
        |  0 | 合庫             |        1020          |     2330   |   2024-07-03  |    10535     |    29381     |    973.16   |   974.69    |
        |  0 | 合庫             |        1020          |     2330   |   2024-07-04  |    28107     |    59459     |    1001.99  |   1000.88   |
        |  0 | 合庫             |        1020          |     2330   |   2024-07-05  |    10435     |    11075     |    1004.18  |    1004.5   |
    === "Schema"
        ```
        {
            securities_trader: str, # securities trader name
            securities_trader_id: str, # securities trader code
            stock_id: str, # stock symbol
            date: str, # date
            buy_volume: int64, # total shares bought
            sell_volume: int64, # total shares sold
            buy_price: float, # average buy price
            sell_price: float, # average sell price
        }
        ```

#### Block Trading Daily Report TaiwanStockBlockTradingDailyReport (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2026-04-28 ~ now
- Only requires a date input, no stock symbol needed.

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        parameter = {
            "dataset": "TaiwanStockBlockTradingDailyReport",
            "start_date": "2026-04-28",
            "token": token,
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = "https://api.finmindtrade.com/api/v4/data"
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockBlockTradingDailyReport",
                start_date="2026-04-28",
                token=""
            )
        )
        data = content(response)
        df = do.call('rbind', lapply(data$data, as.data.frame))
        head(df)
        ```

!!! output
    === "Schema"
        ```
        {
            securities_trader: str, # securities trader
            price: float, # price
            buy: int, # shares bought
            sell: int, # shares sold
            trade_type: str, # trade type (paired/conversion, etc.)
            securities_trader_id: str, # securities trader code
            stock_id: str, # stock symbol
            date: str, # date
        }
        ```

#### Block Trade Daily Transactions TaiwanStockBlockTrade (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2005-04-04 ~ now
- Covers block trades (tick-by-tick) for listed (TWSE) and OTC stocks.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_block_trade(
            stock_id="2330",
            start_date="2026-04-01",
            end_date="2026-04-30",
        )
        ```
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockBlockTrade",
            "data_id": "2330",
            "start_date": "2026-04-01",
            "end_date": "2026-04-30",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data["data"])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockBlockTrade",
                data_id="2330",
                start_date="2026-04-01",
                end_date="2026-04-30",
                token=token
            )
        )
        data = content(response)
        df = do.call("rbind", lapply(data$data, as.data.frame))
        head(df)
        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | trade_type   |   price |   volume |   trading_money |
        |---:|:-----------|-----------:|:-------------|--------:|---------:|----------------:|
        |  0 | 2026-04-01 |       2330 | 配對交易     | 1871.29 |    25000 |        46782250 |
        |  1 | 2026-04-01 |       2330 | 配對交易     | 1871.28 |    25000 |        46782000 |
        |  2 | 2026-04-01 |       2330 | 配對交易     | 1865.28 |    15000 |        27979200 |
        |  3 | 2026-04-01 |       2330 | 配對交易     | 1855    |  1078000 |      1999690000 |
        |  4 | 2026-04-01 |       2330 | 配對交易     | 1849.42 |   137104 |       253562880 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            trade_type: str, # trade type (paired trade, etc.)
            price: float, # transaction price
            volume: int, # transaction volume
            trading_money: int, # trading money
        }
        ```

#### Loan Collateral Balance TaiwanStockLoanCollateralBalance (only available for [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2006-10-02 ~ now
- Data update time **Monday to Friday after market close**, the actual update time is based on the API data.
- Includes the collateral balance (in thousand shares) for margin purchase, securities firm securities-business loans, securities firm unrestricted-purpose loans, securities finance secured loans, and securities finance settlement margin for listed (TWSE) and OTC stocks.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_loan_collateral_balance(
            stock_id="2330",
            start_date="2026-04-01",
            end_date="2026-04-30",
        )
        ```
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockLoanCollateralBalance",
            "data_id": "2330",
            "start_date": "2026-04-01",
            "end_date": "2026-04-30",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data["data"])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockLoanCollateralBalance",
                data_id="2330",
                start_date="2026-04-01",
                end_date="2026-04-30",
                token=token
            )
        )
        data = content(response)
        df = do.call("rbind", lapply(data$data, as.data.frame))
        head(df)
        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | market   |   MarginPreviousDayBalance |   MarginBuy |   MarginSell |   MarginCashRedemption |   MarginCurrentDayBalance |   MarginNextDayQuota |   SecuritiesFirmLoanPreviousDayBalance |   SecuritiesFirmLoanBuy |   SecuritiesFirmLoanSell |   SecuritiesFirmLoanCashRedemption |   SecuritiesFirmLoanReplacement |   SecuritiesFirmLoanCurrentDayBalance |   SecuritiesFirmLoanNextDayQuota |   UnrestrictedLoanPreviousDayBalance |   UnrestrictedLoanBuy |   UnrestrictedLoanSell |   UnrestrictedLoanCashRedemption |   UnrestrictedLoanReplacement |   UnrestrictedLoanCurrentDayBalance |   UnrestrictedLoanNextDayQuota |   SecuritiesFinanceSecuredLoanPreviousDayBalance |   SecuritiesFinanceSecuredLoanBuy |   SecuritiesFinanceSecuredLoanSell |   SecuritiesFinanceSecuredLoanCashRedemption |   SecuritiesFinanceSecuredLoanReplacement |   SecuritiesFinanceSecuredLoanCurrentDayBalance |   SecuritiesFinanceSecuredLoanNextDayQuota |   SettlementMarginPreviousDayBalance |   SettlementMarginBuy |   SettlementMarginSell |   SettlementMarginCashRedemption |   SettlementMarginReplacement |   SettlementMarginCurrentDayBalance |   SettlementMarginNextDayQuota |
        |---:|:-----------|-----------:|:---------|---------------------------:|------------:|-------------:|-----------------------:|--------------------------:|---------------------:|---------------------------------------:|------------------------:|-------------------------:|-----------------------------------:|--------------------------------:|--------------------------------------:|---------------------------------:|-------------------------------------:|----------------------:|-----------------------:|---------------------------------:|------------------------------:|------------------------------------:|-------------------------------:|-------------------------------------------------:|----------------------------------:|-----------------------------------:|---------------------------------------------:|------------------------------------------:|------------------------------------------------:|-------------------------------------------:|-------------------------------------:|----------------------:|-----------------------:|---------------------------------:|------------------------------:|------------------------------------:|-------------------------------:|
        |  0 | 2026-04-01 |       2330 | 集中市場 |                      26608 |        1268 |         1485 |                     38 |                     26353 |              6483131 |                                     21 |                       0 |                        0 |                                  0 |                               0 |                                    21 |                          1296626 |                               119953 |                   851 |                    142 |                               46 |                           215 |                              120401 |                        2593252 |                                            16700 |                               111 |                                 11 |                                           30 |                                         6 |                                           16764 |                                          0 |                                    0 |                     0 |                      0 |                                0 |                             0 |                                   0 |                        1296626 |
        |  1 | 2026-04-02 |       2330 | 集中市場 |                      26353 |        1312 |          873 |                    194 |                     26598 |              6483131 |                                     21 |                       0 |                        0 |                                  0 |                               0 |                                    21 |                          1296626 |                               120401 |                   621 |                    139 |                               70 |                           416 |                              120397 |                        2593252 |                                            16764 |                               134 |                                  6 |                                           19 |                                        18 |                                           16855 |                                          0 |                                    0 |                     0 |                      0 |                                0 |                             0 |                                   0 |                        1296626 |
        |  2 | 2026-04-07 |       2330 | 集中市場 |                      26598 |         391 |          970 |                     19 |                     26000 |              6483131 |                                     21 |                       0 |                        0 |                                  0 |                               0 |                                    21 |                          1296626 |                               120397 |                   539 |                     54 |                               36 |                           236 |                              120610 |                        2593252 |                                            16855 |                               160 |                                  2 |                                           67 |                                        29 |                                           16917 |                                          0 |                                    0 |                     0 |                      0 |                                0 |                             0 |                                   0 |                        1296626 |
        |  3 | 2026-04-08 |       2330 | 集中市場 |                      26000 |        2882 |         2057 |                     28 |                     26797 |              6483131 |                                     21 |                      65 |                        0 |                                  0 |                               0 |                                    86 |                          1296626 |                               120616 |                   776 |                     75 |                              134 |                           222 |                              120961 |                        2593252 |                                            16917 |                                88 |                                 21 |                                           28 |                                         9 |                                           16947 |                                          0 |                                    0 |                     0 |                      0 |                                0 |                             0 |                                   0 |                        1296626 |
        |  4 | 2026-04-09 |       2330 | 集中市場 |                      26604 |         998 |          953 |                     13 |                     26636 |              6483131 |                                     86 |                       0 |                       65 |                                  0 |                               0 |                                    21 |                          1296626 |                               120961 |                   481 |                     19 |                               83 |                           198 |                              121142 |                        2593252 |                                            16947 |                               126 |                                  1 |                                           27 |                                        13 |                                           17032 |                                          0 |                                    0 |                     0 |                      0 |                                0 |                             0 |                                   0 |                        1296626 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock symbol
            market: str, # market type (TWSE/OTC)
            MarginPreviousDayBalance: int, # margin purchase - previous day balance
            MarginBuy: int, # margin purchase - buy
            MarginSell: int, # margin purchase - sell
            MarginCashRedemption: int, # margin purchase - cash redemption
            MarginCurrentDayBalance: int, # margin purchase - current day balance
            MarginNextDayQuota: int, # margin purchase - next business day quota
            SecuritiesFirmLoanPreviousDayBalance: int, # securities firm securities-business loan - previous day balance
            SecuritiesFirmLoanBuy: int, # securities firm securities-business loan - buy
            SecuritiesFirmLoanSell: int, # securities firm securities-business loan - sell
            SecuritiesFirmLoanCashRedemption: int, # securities firm securities-business loan - cash redemption
            SecuritiesFirmLoanReplacement: int, # securities firm securities-business loan - replacement
            SecuritiesFirmLoanCurrentDayBalance: int, # securities firm securities-business loan - current day balance
            SecuritiesFirmLoanNextDayQuota: int, # securities firm securities-business loan - next business day quota
            UnrestrictedLoanPreviousDayBalance: int, # securities firm unrestricted-purpose loan - previous day balance
            UnrestrictedLoanBuy: int, # securities firm unrestricted-purpose loan - buy
            UnrestrictedLoanSell: int, # securities firm unrestricted-purpose loan - sell
            UnrestrictedLoanCashRedemption: int, # securities firm unrestricted-purpose loan - cash redemption
            UnrestrictedLoanReplacement: int, # securities firm unrestricted-purpose loan - replacement
            UnrestrictedLoanCurrentDayBalance: int, # securities firm unrestricted-purpose loan - current day balance
            UnrestrictedLoanNextDayQuota: int, # securities firm unrestricted-purpose loan - next business day quota
            SecuritiesFinanceSecuredLoanPreviousDayBalance: int, # securities finance secured loan - previous day balance
            SecuritiesFinanceSecuredLoanBuy: int, # securities finance secured loan - buy
            SecuritiesFinanceSecuredLoanSell: int, # securities finance secured loan - sell
            SecuritiesFinanceSecuredLoanCashRedemption: int, # securities finance secured loan - cash redemption
            SecuritiesFinanceSecuredLoanReplacement: int, # securities finance secured loan - replacement
            SecuritiesFinanceSecuredLoanCurrentDayBalance: int, # securities finance secured loan - current day balance
            SecuritiesFinanceSecuredLoanNextDayQuota: int, # securities finance secured loan - next business day quota
            SettlementMarginPreviousDayBalance: int, # securities finance settlement margin - previous day balance
            SettlementMarginBuy: int, # securities finance settlement margin - buy
            SettlementMarginSell: int, # securities finance settlement margin - sell
            SettlementMarginCashRedemption: int, # securities finance settlement margin - cash redemption
            SettlementMarginReplacement: int, # securities finance settlement margin - replacement
            SettlementMarginCurrentDayBalance: int, # securities finance settlement margin - current day balance
            SettlementMarginNextDayQuota: int, # securities finance settlement margin - next business day quota
        }
        ```

#### Disposition Securities Period TaiwanStockDispositionSecuritiesPeriod (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2001-01-01 ~ now
- Data covers listed (TWSE), OTC, and emerging stocks.
- Data update time **Monday to Saturday 20:00~23:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_disposition_securities_period(
            stock_id="6477",
            start_date='2025-01-01',
            end_date='2025-02-01',
        )
        ```
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDispositionSecuritiesPeriod",
            "data_id": "6477",
            "start_date": "2025-01-01",
            "end_date": "2025-02-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDispositionSecuritiesPeriod",
                data_id= "6477",
                start_date= "2025-01-01",
                end_date= "2025-02-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   stock_name |   disposition_cnt |       condition     |   measure   |   period_start |   period_end |
        |---:|:-----------|-----------:|-------------:|------------------:|--------------------:|-------------:|---------------|---------------|
        |  0 | 2025-01-09 |       6477 |      安集    |         1         | 連續三次及當日沖銷標準 |   第一次處置 |    2025-01-10 |   2025-02-05 |
    === "Schema"
        ```
        {
            date: str, # announcement date
            stock_id: str, # stock symbol
            stock_name: str, # stock name
            disposition_cnt: int32, # cumulative count
            condition: str, # disposition condition
            measure: str, # disposition measure
            period_start: str, # disposition start date
            period_end: str, # disposition end date
        }
        ```


#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_disposition_securities_period(
            start_date='2025-01-09',
            end_date: "2025-01-09",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDispositionSecuritiesPeriod",
            "start_date": "2025-01-09",
            "end_date": "2025-01-09",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDispositionSecuritiesPeriod",
                start_date= "2025-01-09",
                end_date: "2025-01-09",
                token = "" # Refer to login to obtain the API key
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
        |    | date       |   stock_id |   stock_name |   disposition_cnt |       condition     |   measure   |   period_start |   period_end |
        |---:|:-----------|-----------:|-------------:|------------------:|--------------------:|-------------:|---------------|---------------|
        |  0 | 2025-01-09 |       6477 |      安集    |         1         | 連續三次及當日沖銷標準 |   第一次處置 |    2025-01-10 |   2025-02-05 |
        |  1 | 2025-01-09 |       9103 | 美德醫療-DR  |         1         | 最近十個營業日已有六次 |   第二次處置 |    2025-01-10 |   2025-02-03 |
    === "Schema"
        ```
        {
            date: str, # announcement date
            stock_id: str, # stock symbol
            stock_name: str, # stock name
            disposition_cnt: int32, # cumulative count
            condition: str, # disposition condition
            measure: str, # disposition measure
            period_start: str, # disposition start date
            period_end: str, # disposition end date
        }
        ```

----------------------------------

#### Day Trading Borrowing Fee Rate TaiwanStockDayTradingBorrowingFeeRate (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2015-06-01 ~ now
- Data update time **Monday to Friday 19:00~22:00**, the actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_day_trading_borrowing_fee_rate(
            stock_id="2330",
            start_date='2024-12-01',
            end_date='2025-01-01',
        )
        ```
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDayTradingBorrowingFeeRate",
            "data_id": "2330",
            "start_date": "2024-12-01",
            "end_date": "2025-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDayTradingBorrowingFeeRate",
                data_id= "2330",
                start_date= "2024-12-01",
                end_date= "2025-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   stock_name | InvestorBorrowedShares |  InvestorBorrowingFeeRate  |
        |---:|:-----------|-----------:|-------------:|-----------------------:|---------------------------:|
        |  0 | 2024-12-02 |       6477 |      安集    |         15000           |              7             |
    === "Schema"
        ```
        {
            date: str, # announcement date
            stock_id: str, # stock symbol
            stock_name: str, # stock name
            InvestorBorrowedShares: int32, # borrowed shares
            InvestorBorrowingFeeRate: float64, # borrowing fee rate
        }
        ```


#### Get all data for a specific date in one request (only available for [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_disposition_securities_period(
            start_date='2024-12-02',
            end_date: "2024-12-02",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the API key
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDayTradingBorrowingFeeRate",
            "start_date": "2024-12-02",
            "end_date": "2024-12-02",
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
        token = "" # Refer to login to obtain the API key
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDayTradingBorrowingFeeRate",
                start_date= "2024-12-02",
                end_date: "2024-12-02",
                token = "" # Refer to login to obtain the API key
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
        |    | date       |   stock_id |   stock_name     |   InvestorBorrowedShares |   InvestorBorrowingFeeRate   |
        |---:|:-----------|-----------:|-----------------:|-------------------------:|-----------------------------:|
        |  0 | 2024-12-02 |     00631L |   元大台灣50正2   |            5000          |              1               |
        |  1 | 2024-12-02 |       1438 |      三地開發     |              1           |              3               |
        |  2 | 2024-12-02 |       2312 |      金寶        |             1000          |              2               |
        |  3 | 2024-12-02 |       2324 |      仁寶        |             1000          |            0.1               |
        |  4 | 2024-12-02 |       2330 |      台積電      |            15000          |              7               |
    === "Schema"
        ```
        {
            date: str, # announcement date
            stock_id: str, # stock symbol
            stock_name: str, # stock name
            InvestorBorrowedShares: int32, # borrowed shares
            InvestorBorrowingFeeRate: float64, # borrowing fee rate
        }
        ```

----------------------------------
