在台股籌碼面，我們擁有 15 種資料集，如下:


- [個股融資融劵表 TaiwanStockMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginpurchaseshortsale)
- [整體市場融資融劵表 TaiwanStockTotalMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktotalmarginpurchaseshortsale)
- [個股三大法人買賣表 TaiwanStockInstitutionalInvestorsBuySell](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysell)
- [整體市場三大法人買賣表 TaiwanStockTotalInstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktotalinstitutionalinvestors)
- [外資持股表 TaiwanStockShareholding](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockshareholding)
- [股權持股分級表 TaiwanStockHoldingSharesPer](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockholdingsharesper)
- [借券成交明細 TaiwanStockSecuritiesLending](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocksecuritieslending)
- [暫停融券賣出表(融券回補日) TaiwanStockMarginShortSaleSuspension](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginshortsalesuspension)
- [信用額度總量管制餘額表 TaiwanDailyShortSaleBalances](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwandailyshortsalebalances)
- [證券商資訊表 TaiwanSecuritiesTraderInfo](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwansecuritiestraderinfo)
- [台股分點資料表(query by 股票代碼) TaiwanStockTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#query-by-taiwanstocktradingdailyreport-sponsor)
- [台股分點資料表(query by 券商代碼) TaiwanStockTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#query-by-taiwanstocktradingdailyreport-sponsor_1)
- [台股權證分點資料表(query by 股票代碼) TaiwanStockWarrantTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#query-by-taiwanstockwarranttradingdailyreport-sponsor)
- [台股權證分點資料表(query by 券商代碼) TaiwanStockWarrantTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#query-by-taiwanstockwarranttradingdailyreport-sponsor_1)
- [台股八大行庫賣賣表 TaiwanstockGovernmentBankBuySell](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockgovernmentbankbuysell-sponsor)
- [台灣大盤融資維持率 TaiwanTotalExchangeMarginMaintenance](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwantotalexchangemarginmaintenance-backersponsor)
- [當日卷商分點統計表 TaiwanStockTradingDailyReportSecIdAgg](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktradingdailyreportsecidagg-sponsor)


----------------------------------
#### 融資融劵表 TaiwanStockMarginPurchaseShortSale

- 資料區間：2001-01-01 ~ now
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_margin_purchase_short_sale(
            stock_id="2330",
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMarginPurchaseShortSale",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockMarginPurchaseShortSale",
            data_id= "2330",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table

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
            date: str,
            stock_id: str,
            MarginPurchaseBuy: int64,
            MarginPurchaseCashRepayment: int64,
            MarginPurchaseLimit: int64,
            MarginPurchaseSell: int64,
            MarginPurchaseTodayBalance: int64,
            MarginPurchaseYesterdayBalance: int64,
            Note: str,
            OffsetLoanAndShort: int64,
            ShortSaleBuy: int64,
            ShortSaleCashRepayment: int64,
            ShortSaleLimit: int64,
            ShortSaleSell: int64,
            ShortSaleTodayBalance: int64,
            ShortSaleYesterdayBalance: int64
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_margin_purchase_short_sale(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMarginPurchaseShortSale",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockMarginPurchaseShortSale",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
            date: str,
            stock_id: str,
            MarginPurchaseBuy: int64,
            MarginPurchaseCashRepayment: int64,
            MarginPurchaseLimit: int64,
            MarginPurchaseSell: int64,
            MarginPurchaseTodayBalance: int64,
            MarginPurchaseYesterdayBalance: int64,
            Note: str,
            OffsetLoanAndShort: int64,
            ShortSaleBuy: int64,
            ShortSaleCashRepayment: int64,
            ShortSaleLimit: int64,
            ShortSaleSell: int64,
            ShortSaleTodayBalance: int64,
            ShortSaleYesterdayBalance: int64
        }
        ```

----------------------------------
#### 台灣市場整體融資融劵表 TaiwanStockTotalMarginPurchaseShortSale

- 資料區間：2001-01-01 ~ now
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_margin_purchase_short_sale_total(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockTotalMarginPurchaseShortSale",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockTotalMarginPurchaseShortSale",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
            TodayBalance: int64,
            YesBalance: int64,
            buy: int64,
            date: str,
            name: str,
            Return: int64,
            sell: int64
        }
        ```

----------------------------------
#### 法人買賣表 TaiwanStockInstitutionalInvestorsBuySell

- 資料區間：2005-01-01 ~ now
- 資料更新時間 **星期一至五 20:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_institutional_investors(
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
        parameter = {
            "dataset": "TaiwanStockInstitutionalInvestorsBuySell",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockInstitutionalInvestorsBuySell",
            data_id= "2330",
            start_date= "2020-04-01",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

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
            date: str,
            stock_id: str,
            buy: int64,
            name: str,
            sell: int64
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_institutional_investors(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockInstitutionalInvestorsBuySell",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockInstitutionalInvestorsBuySell",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
            date: str,
            stock_id: str,
            buy: int64,
            name: str,
            sell: int64
        }
        ```

----------------------------------
#### 台灣市場整體法人買賣表 TaiwanStockTotalInstitutionalInvestors

- 資料區間：2004-04-01 ~ now
- 資料更新時間 **星期一至五 15:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_institutional_investors_total(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockTotalInstitutionalInvestors",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockTotalInstitutionalInvestors",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
            buy: int64,
            date: str,
            name: str,
            sell: int64
        }
        ```

----------------------------------
#### 外資持股表 TaiwanStockShareholding

- 資料區間：2004-02-01 ~ now
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
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
        parameter = {
            "dataset": "TaiwanStockShareholding",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockShareholding",
            data_id= "2330",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
        |  0 | 2020-04-01 |       2330 | 台積電       | TW0002330008        |                         6309042842 |               19621337616 |                          24.33 |                          75.66 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
        |  1 | 2020-04-06 |       2330 | 台積電       | TW0002330008        |                         6304552683 |               19625827775 |                          24.31 |                          75.68 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
        |  2 | 2020-04-07 |       2330 | 台積電       | TW0002330008        |                         6283562246 |               19646818212 |                          24.23 |                          75.76 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
        |  3 | 2020-04-08 |       2330 | 台積電       | TW0002330008        |                         6273338931 |               19657041527 |                          24.19 |                          75.8  |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
        |  4 | 2020-04-09 |       2330 | 台積電       | TW0002330008        |                         6267988722 |               19662391736 |                          24.17 |                          75.82 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            stock_name: str,
            InternationalCode: str,
            ForeignInvestmentRemainingShares: int64,
            ForeignInvestmentShares: int64,
            ForeignInvestmentRemainRatio: float64,
            ForeignInvestmentSharesRatio: float64,
            ForeignInvestmentUpperLimitRatio: float64,
            ChineseInvestmentUpperLimitRatio: float64,
            NumberOfSharesIssued: int64,
            RecentlyDeclareDate: str,
            note: str
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_shareholding(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockShareholding",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockShareholding",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
            date: str,
            stock_id: str,
            stock_name: str,
            InternationalCode: str,
            ForeignInvestmentRemainingShares: int64,
            ForeignInvestmentShares: int64,
            ForeignInvestmentRemainRatio: float64,
            ForeignInvestmentSharesRatio: float64,
            ForeignInvestmentUpperLimitRatio: float64,
            ChineseInvestmentUpperLimitRatio: float64,
            NumberOfSharesIssued: int64,
            RecentlyDeclareDate: str,
            note: str
        }
        ```

----------------------------------
#### 股東持股分級表 TaiwanStockHoldingSharesPer

- 資料區間：2001-01-01 ~ now
!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
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
        parameter = {
            "dataset": "TaiwanStockHoldingSharesPer",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockHoldingSharesPer",
            data_id= "2330",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
        |  0 | 2020-04-01 |       2330 | 1-999                |   165122 |      0.12 |  33289900 |
        |  1 | 2020-04-01 |       2330 | 1,000-5,000          |   227692 |      1.69 | 440404454 |
        |  2 | 2020-04-01 |       2330 | 10,001-15,000        |    10408 |      0.49 | 128127693 |
        |  3 | 2020-04-01 |       2330 | 100,001-200,000      |     1628 |      0.86 | 225202876 |
        |  4 | 2020-04-01 |       2330 | 15,001-20,000        |     5068 |      0.34 |  89929303 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            HoldingSharesLevel: str,
            people: int64,
            percent: float64,
            unit: int64
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_holding_shares_per(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockHoldingSharesPer",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockHoldingSharesPer",
            start_date= "2020-04-01",
            token = "" # 參考登入，獲取金鑰
        )
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
        |  1 | 2020-04-01 |       0050 | 1,000-5,000          |    96465 |     17.7  | 186791648 |
        |  2 | 2020-04-01 |       0050 | 5,001-10,000         |    10364 |      7.57 |  79902735 |
        |  3 | 2020-04-01 |       0050 | 10,001-15,000        |     2819 |      3.41 |  36075583 |
        |  4 | 2020-04-01 |       0050 | 15,001-20,000        |     1557 |      2.69 |  28426726 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            HoldingSharesLevel: str,
            people: int64,
            percent: float64,
            unit: int64
        }
        ```

----------------------------------
#### 借券成交明細 TaiwanStockSecuritiesLending

- 資料區間：2001-05-01 ~ now
- 資料更新時間 **星期一至五 15:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
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
        parameter = {
            "dataset": "TaiwanStockSecuritiesLending",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockSecuritiesLending",
            data_id="2330",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
        |  0 | 2020-04-01 |       2330 | 議借               |     1330 |       1.36 |   271.5 | 2020-09-30             |                       182 |
        |  1 | 2020-04-01 |       2330 | 議借               |      800 |       0.41 |   271.5 | 2020-09-30             |                       182 |
        |  2 | 2020-04-01 |       2330 | 議借               |      850 |       0.41 |   271.5 | 2020-09-30             |                       182 |
        |  3 | 2020-04-01 |       2330 | 議借               |      500 |       0.5  |   271.5 | 2020-09-30             |                       182 |
        |  4 | 2020-04-01 |       2330 | 議借               |      160 |       0.36 |   271.5 | 2020-09-30             |                       182 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            transaction_type: str,
            volume: int64,
            fee_rate: float64,
            close: float64,
            original_return_date: str,
            original_lending_period: int64
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_securities_lending(
            start_date='2020-04-01',
        )
        ```
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockSecuritiesLending",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockSecuritiesLending",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
            date: str,
            stock_id: str,
            transaction_type: str,
            volume: int64,
            fee_rate: float64,
            close: float64,
            original_return_date: str,
            original_lending_period: int64
        }
        ```


----------------------------------
#### 暫停融券賣出表(融券回補日) TaiwanStockMarginShortSaleSuspension

- 資料區間：2015-01-01 ~ now
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMarginShortSaleSuspension",
            "data_id": "0050",
            "start_date": "2015-01-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockMarginShortSaleSuspension",
            data_id="0050",
            start_date= "2015-01-01",
            token = "" # 參考登入，獲取金鑰
        )
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
        |  1 |       0050 | 2016-07-22 | 2016-07-27 | 分配收益 |
        |  2 |       0050 | 2017-02-02 | 2017-02-07 | 分配收益 |
        |  3 |       0050 | 2017-07-25 | 2017-07-28 | 分配收益 |
        |  4 |       0050 | 2018-01-23 | 2018-01-26 | 分配收益 |
    === "Schema"
        ```
        {
            stock_id: str,
            date: str, # 開始日期
            end_date: str,
            reason: str
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMarginShortSaleSuspension",
            "start_date": "2015-10-20",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockMarginShortSaleSuspension",
            start_date= "2015-10-20",
            token = "" # 參考登入，獲取金鑰
        )
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
            stock_id: str,
            date: str, # 開始日期
            end_date: str,
            reason: str
        }
        ```


----------------------------------
#### 信用額度總量管制餘額表 TaiwanDailyShortSaleBalances

- 資料區間：2005-07-01 ~ now
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_daily_short_sale_balances(
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
        parameter = {
            "dataset": "TaiwanDailyShortSaleBalances",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanDailyShortSaleBalances",
            data_id="2330",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
        |  0 |       2330 |                              1975000 |                            0 |                         1573000 |                            378000 |                               24000 |             -2107339478 |                          47947858 |                    487000 |                      0 |                          0 |                         48434858 |              7526895 |                            0 | 2020-04-01 |
        |  1 |       2330 |                                24000 |                            0 |                               0 |                             24000 |                                   0 |             -2107339478 |                          48434858 |                     44000 |                  60000 |                          0 |                         48418858 |              7563083 |                            0 | 2020-04-06 |
        |  2 |       2330 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |             -2107339478 |                          48418858 |                     62000 |                      0 |                          0 |                         48480858 |              7635835 |                            0 | 2020-04-07 |
        |  3 |       2330 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |             -2107339478 |                          48480858 |                    933000 |                7345000 |                          0 |                         42068858 |              7688249 |                            0 | 2020-04-08 |
        |  4 |       2330 |                                    0 |                       398000 |                               0 |                                 0 |                              398000 |             -2107339478 |                          42068858 |                     46000 |                   2000 |                          0 |                         42112858 |              7642682 |                            0 | 2020-04-09 |
    === "Schema"
        ```
        {
            stock_id: str,
            MarginShortSalesPreviousDayBalance: int32,
            MarginShortSalesShortSales: int32,
            MarginShortSalesShortCovering: int32,
            MarginShortSalesStockRedemption: int32,
            MarginShortSalesCurrentDayBalance: int32,
            MarginShortSalesQuota: int32,
            SBLShortSalesPreviousDayBalance: int32,
            SBLShortSalesShortSales: int32,
            SBLShortSalesReturns: int32,
            SBLShortSalesAdjustments: int32,
            SBLShortSalesCurrentDayBalance: int32,
            SBLShortSalesQuota: int32,
            SBLShortSalesShortCovering: int32,
            date: str
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_daily_short_sale_balances(
            start_date='2020-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanDailyShortSaleBalances",
            "start_date": "2021-05-20",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanDailyShortSaleBalances",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
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
            stock_id: str,
            MarginShortSalesPreviousDayBalance: int32,
            MarginShortSalesShortSales: int32,
            MarginShortSalesShortCovering: int32,
            MarginShortSalesStockRedemption: int32,
            MarginShortSalesCurrentDayBalance: int32,
            MarginShortSalesQuota: int32,
            SBLShortSalesPreviousDayBalance: int32,
            SBLShortSalesShortSales: int32,
            SBLShortSalesReturns: int32,
            SBLShortSalesAdjustments: int32,
            SBLShortSalesCurrentDayBalance: int32,
            SBLShortSalesQuota: int32,
            SBLShortSalesShortCovering: int32,
            date: str
        }
        ```

----------------------------------
#### 證券商資訊表 TaiwanSecuritiesTraderInfo

- 提供證券商相關資訊，用於台股分點資料表(TaiwanStockTradingDailyReport )，使用卷商代碼，查詢特定卷商所有股票進出。

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_securities_trader_info()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanSecuritiesTraderInfo",
            "token": "", # 參考登入，獲取金鑰
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset = "TaiwanSecuritiesTraderInfo",
            token = "" # 參考登入，獲取金鑰
            )
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
            securities_trader_id: str,
            securities_trader: str,
            date: str,
            address: str,
            phone: str
        }
        ```

----------------------------------
#### 台股分點資料表(query by 股票代碼) TaiwanStockTradingDailyReport (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 提供台股，上市、上櫃、興櫃，的分點資訊！
- 資料區間：2021-06-30 ~ now
- 由於資料量過大，單次請求只提供一天資料)
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report'
        parameter = {
            "data_id": "2330",
            "date": "2022-06-16",
            "token": token, # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report'
        response = httr::GET(
        url = url,
        query = list(
            data_id="2330",
            start_date= "2022-06-16",
            token = token # 參考登入，獲取金鑰
        )
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
            securities_trader: str,
            price: float64,
            buy: int32,
            sell: int32,
            securities_trader_id: str,
            stock_id: str,
            date: str
        }
        ```

----------------------------------
#### 台股分點資料表(query by 券商代碼) TaiwanStockTradingDailyReport (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：2021-06-30 ~ now
- 由於資料量過大，單次請求只提供一天資料)
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report'
        parameter = {
            "securities_trader_id": "1020",
            "date": "2022-06-16",
            "token": token, # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_trading_daily_report'
        response = httr::GET(
        url = url,
        query = list(
            securities_trader_id="1020",
            start_date= "2022-06-16",
            token = token # 參考登入，獲取金鑰
        )
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
            securities_trader: str,
            price: float64,
            buy: int32,
            sell: int32,
            securities_trader_id: str,
            stock_id: str,
            date: str
        }
        ```

----------------------------------
#### 台股權證分點資料表(query by 股票代碼) TaiwanStockWarrantTradingDailyReport (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：2023-06-21 ~ now
- 由於資料量過大，單次請求只提供一天資料
- 資料更新時間 **星期一至五 01:00**，實際更新時間以 API 資料為主

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_warrant_trading_daily_report'
        parameter = {
            "data_id": "084655",
            "date": "2023-06-21",
            "token": token, # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            data_id="084655",
            start_date= "2023-06-21",
            token = token # 參考登入，獲取金鑰
        )
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
        |  0 | 元富                |    2.48 |     0 |   4000 |                   5920 |     084655 | 2023-06-21 |
        |  1 | 凱基                |    2.48 |  4000 |      0 |                   9200 |     084655 | 2023-06-21 |
    === "Schema"
        ```
        {
            securities_trader: str,
            price: float64,
            buy: int32,
            sell: int32,
            securities_trader_id: str,
            stock_id: str,
            date: str
        }
        ```

----------------------------------
#### 台股權證分點資料表(query by 券商代碼) TaiwanStockWarrantTradingDailyReport (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：2023-06-21 ~ now
- 由於資料量過大，單次請求只提供一天資料)
- 資料更新時間 **星期一至五 23:00**，實際更新時間以 API 資料為主

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        url = 'https://api.finmindtrade.com/api/v4/taiwan_stock_warrant_trading_daily_report'
        parameter = {
            "securities_trader_id": "5920",
            "date": "2023-06-21",
            "token": token, # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            securities_trader_id="5920",
            start_date= "2023-06-21",
            token = token # 參考登入，獲取金鑰
        )
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
            securities_trader: str,
            price: float64,
            buy: int32,
            sell: int32,
            securities_trader_id: str,
            stock_id: str,
            date: str
        }
        ```

----------------------------------
#### 台股八大行庫買賣表 TaiwanStockGovernmentBankBuySell (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：2021-06-30 ~ now
- 由於資料量過大，單次請求只提供一天資料
- 資料更新時間 **星期一至五 23:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_government_bank_buy_sell(
            start_date='2023-01-17',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockGovernmentBankBuySell",
            "start_date": "2023-01-17",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockGovernmentBankBuySell",
            start_date= "2023-01-17",
            token = "" # 參考登入，獲取金鑰
        )
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
            date: str,
            stock_id: str,
            buy_amount: float64,
            sell_amount: float64,
            buy: int64,
            sell: int64,
            bank_name: str
        }
        ```

#### 台灣大盤融資維持率 TaiwanTotalExchangeMarginMaintenance (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：2001-01-05 ~ now
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
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
        parameter = {
            "dataset": "TaiwanTotalExchangeMarginMaintenance",
            "start_date": "2020-04-01",
            "end_date": "2020-05-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanTotalExchangeMarginMaintenance",
            start_date= "2024-04-01",
            end_date='2024-05-01'
            token = "" # 參考登入，獲取金鑰
        )
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
            date: str,
            TotalExchangeMarginMaintenance: float64
        }
        ```

#### 當日卷商分點統計表 TaiwanStockTradingDailyReportSecIdAgg (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 提供台股，上市、上櫃、興櫃，的分點資訊！
- 資料區間：2021-06-30 ~ now
- 資料更新時間 **星期一至五 21:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_trading_daily_report_secid_agg(
            stock_id="2330",
            start_date='2024-01-31',
            end_date='2024-05-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockTradingDailyReportSecIdAgg",
            "stock_id": "2330",
            "start_date": "2024-01-31",
            "end_date": "2024-05-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
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
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockTradingDailyReportSecIdAgg",
            stock_id="2330",
            start_date= "2024-01-31",
            end_date='2024-05-01'
            token = "" # 參考登入，獲取金鑰
        )
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
        |  0 | 合庫桃園           |        102E          |     2330   |   2024-01-31  |    17764     |    4104     |    630.2   |   630.78    |
        |  0 | 高橋龍潭           |        5321          |     2330   |   2024-01-31  |    17555     |    1000     |    630.74  |   628       |
        |  0 | 高橋              |         5320         |     2330   |   2024-01-31  |    33281     |    15222    |    630.56  |   634.05    |
        |  0 | 兆豐三重           |        7008          |     2330   |   2024-01-31  |    15416     |    3421     |    629.24  |   632.41    |
        |  0 | 新百王             |        6210          |     2330   |   2024-01-31  |    75169     |    57050    |    629.56  |    628.9    |
    === "Schema"
        ```
        {
            securities_trader: str,
            securities_trader_id: str,
            stock_id: str,
            date: str,
            buy_volume: int64,
            sell_volume: int64,
            buy_price: float,
            sell_price: float,
        }
        ```

----------------------------------