在台股籌碼面，我們擁有 10 種資料集，如下:


- [個股融資融劵表 TaiwanStockMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginpurchaseshortsale)
- [整體市場融資融劵表 TaiwanStockTotalMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktotalmarginpurchaseshortsale)
- [個股三大法人買賣表 TaiwanStockInstitutionalInvestorsBuySell](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysell)
- [整體市場三大法人買賣表 TaiwanStockTotalInstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktotalinstitutionalinvestors)
- [外資持股表 TaiwanStockShareholding](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockshareholding)
- [股權持股分級表 TaiwanStockHoldingSharesPer](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockholdingsharesper)
- [借券成交明細 TaiwanStockSecuritiesLending](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocksecuritieslending)
- [融券借券賣出表 TaiwanDailyShortSaleBalances](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwandailyshortsalebalances)
- [證券商資訊表 SecuritiesTraderInfo](https://finmind.github.io/tutor/TaiwanMarket/Chip/#securitiestraderinfo)
- [台股分點資料表(query by 股票代碼) TaiwanStockTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#query-by-taiwanstocktradingdailyreport-backersponsor)
- [台股分點資料表(query by 券商代碼) TaiwanStockTradingDailyReport](https://finmind.github.io/tutor/TaiwanMarket/Chip/#query-by-taiwanstocktradingdailyreport-backersponsor_1)

#### 融資融劵表 TaiwanStockMarginPurchaseShortSale

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
    |    | date       |   stock_id |   MarginPurchaseBuy |   MarginPurchaseCashRepayment |   MarginPurchaseLimit |   MarginPurchaseSell |   MarginPurchaseTodayBalance |   MarginPurchaseYesterdayBalance | Note   |   OffsetLoanAndShort |   ShortSaleBuy |   ShortSaleCashRepayment |   ShortSaleLimit |   ShortSaleSell |   ShortSaleTodayBalance |   ShortSaleYesterdayBalance |
    |---:|:-----------|-----------:|--------------------:|------------------------------:|----------------------:|---------------------:|-----------------------------:|---------------------------------:|:-------|---------------------:|---------------:|-------------------------:|-----------------:|----------------:|------------------------:|----------------------------:|
    |  0 | 2020-04-06 |       2330 |                1914 |                             8 |               6482595 |                 1269 |                        26285 |                            25648 | X      |                    0 |              0 |                       24 |          6482595 |               0 |                       0 |                          24 |
    |  1 | 2020-04-07 |       2330 |                1049 |                            13 |               6482595 |                 2655 |                        24666 |                            26285 | X      |                    0 |              0 |                        0 |          6482595 |               0 |                       0 |                           0 |
    |  2 | 2020-04-08 |       2330 |                1192 |                             3 |               6482595 |                 1569 |                        24286 |                            24666 |        |                    0 |              0 |                        0 |          6482595 |               0 |                       0 |                           0 |
    |  3 | 2020-04-09 |       2330 |                 499 |                            28 |               6482595 |                 1362 |                        23395 |                            24286 |        |                  209 |              0 |                        0 |          6482595 |             398 |                     398 |                           0 |
    |  4 | 2020-04-10 |       2330 |                1227 |                            24 |               6482595 |                  794 |                        23804 |                            23395 |        |                   53 |            156 |                        0 |          6482595 |             156 |                     398 |                         398 |

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
    |    | date       |   stock_id |   MarginPurchaseBuy |   MarginPurchaseCashRepayment |   MarginPurchaseLimit |   MarginPurchaseSell |   MarginPurchaseTodayBalance |   MarginPurchaseYesterdayBalance | Note   |   OffsetLoanAndShort |   ShortSaleBuy |   ShortSaleCashRepayment |   ShortSaleLimit |   ShortSaleSell |   ShortSaleTodayBalance |   ShortSaleYesterdayBalance |
    |---:|:-----------|-----------:|--------------------:|------------------------------:|----------------------:|---------------------:|-----------------------------:|---------------------------------:|:-------|---------------------:|---------------:|-------------------------:|-----------------:|----------------:|------------------------:|----------------------------:|
    |  0 | 2020-04-01 |       0050 |                 193 |                            15 |                263750 |                  163 |                         3189 |                             3174 |        |                    0 |             65 |                        1 |           263750 |              13 |                    2283 |                        2336 |
    |  1 | 2020-04-01 |       0051 |                   0 |                             0 |                  2375 |                    0 |                            5 |                                5 |        |                    0 |              0 |                        0 |             2375 |               0 |                       0 |                           0 |
    |  2 | 2020-04-01 |       0052 |                   0 |                             0 |                  7500 |                    0 |                          128 |                              128 |        |                    0 |              0 |                        0 |             7500 |               0 |                       0 |                           0 |
    |  3 | 2020-04-01 |       0053 |                   0 |                             0 |                  1622 |                    0 |                            1 |                                1 |        |                    0 |              0 |                        0 |             1622 |               0 |                       0 |                           0 |
    |  4 | 2020-04-01 |       0054 |                   0 |                             0 |                  2531 |                    0 |                            0 |                                0 | X      |                    0 |              0 |                        0 |             2531 |               0 |                       0 |                           0 |

#### 台灣市場整體融資融劵表 TaiwanStockTotalMarginPurchaseShortSale

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
    |    |   TodayBalance |   YesBalance |        buy | date       | name                |    Return |       sell |
    |---:|---------------:|-------------:|-----------:|:-----------|:--------------------|----------:|-----------:|
    |  0 |        5463820 |      5471770 |     236127 | 2020-04-01 | MarginPurchase      |     10986 |     233091 |
    |  1 |    91965082000 |  91898116000 | 4046643000 | 2020-04-01 | MarginPurchaseMoney | 196619000 | 3783058000 |
    |  2 |         541704 |       556742 |      57266 | 2020-04-01 | ShortSale           |      6151 |      48379 |
    |  3 |         535401 |       541704 |      50779 | 2020-04-06 | ShortSale           |      3700 |      48176 |
    |  4 |    93198509000 |  91965082000 | 6440842000 | 2020-04-06 | MarginPurchaseMoney |  71638000 | 5135777000 |

#### 法人買賣表 TaiwanStockInstitutionalInvestorsBuySell

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
    |    | date       |   stock_id |      buy | name                |     sell |
    |---:|:-----------|-----------:|---------:|:--------------------|---------:|
    |  0 | 2020-04-01 |       2330 | 31304729 | Foreign_Investor    | 29057663 |
    |  1 | 2020-04-01 |       2330 |        0 | Foreign_Dealer_Self |        0 |
    |  2 | 2020-04-01 |       2330 |   900000 | Investment_Trust    |   239000 |
    |  3 | 2020-04-01 |       2330 |    79000 | Dealer_self         |   807000 |
    |  4 | 2020-04-01 |       2330 |   189000 | Dealer_Hedging      |   493500

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
    |    | date       |   stock_id |     buy | name                |    sell |
    |---:|:-----------|-----------:|--------:|:--------------------|--------:|
    |  0 | 2020-04-01 |       0050 |  458249 | Foreign_Investor    | 4492000 |
    |  1 | 2020-04-01 |       0050 |       0 | Foreign_Dealer_Self |       0 |
    |  2 | 2020-04-01 |       0050 |   54000 | Investment_Trust    |       0 |
    |  3 | 2020-04-01 |       0050 |       0 | Dealer_self         |       0 |
    |  4 | 2020-04-01 |       0050 | 2050000 | Dealer_Hedging      |  905000 |

#### 台灣市場整體法人買賣表 TaiwanStockTotalInstitutionalInvestors

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
    |    |         buy | date       | name                |        sell |
    |---:|------------:|:-----------|:--------------------|------------:|
    |  0 |      123150 | 2020-04-01 | Foreign_Dealer_Self |      266220 |
    |  1 |  3681729831 | 2020-04-01 | Dealer_Hedging      |  5539788946 |
    |  2 | 33759089839 | 2020-04-01 | Foreign_Investor    | 38466572585 |
    |  3 |  3039112340 | 2020-04-01 | Investment_Trust    |   853138940 |
    |  4 |   789316840 | 2020-04-01 | Dealer_self         |   912143500 |

#### 外資持股表 TaiwanStockShareholding

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
    |    | date       |   stock_id | stock_name   | InternationalCode   |   ForeignInvestmentRemainingShares |   ForeignInvestmentShares |   ForeignInvestmentRemainRatio |   ForeignInvestmentSharesRatio |   ForeignInvestmentUpperLimitRatio |   ChineseInvestmentUpperLimitRatio |   NumberOfSharesIssued | RecentlyDeclareDate   | note   |
    |---:|:-----------|-----------:|:-------------|:--------------------|-----------------------------------:|--------------------------:|-------------------------------:|-------------------------------:|-----------------------------------:|-----------------------------------:|-----------------------:|:----------------------|:-------|
    |  0 | 2020-04-01 |       2330 | 台積電       | TW0002330008        |                         6309042842 |               19621337616 |                          24.33 |                          75.66 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
    |  1 | 2020-04-06 |       2330 | 台積電       | TW0002330008        |                         6304552683 |               19625827775 |                          24.31 |                          75.68 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
    |  2 | 2020-04-07 |       2330 | 台積電       | TW0002330008        |                         6283562246 |               19646818212 |                          24.23 |                          75.76 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
    |  3 | 2020-04-08 |       2330 | 台積電       | TW0002330008        |                         6273338931 |               19657041527 |                          24.19 |                          75.8  |                                100 |                                100 |            25930380458 | 2019-05-27            |        |
    |  4 | 2020-04-09 |       2330 | 台積電       | TW0002330008        |                         6267988722 |               19662391736 |                          24.17 |                          75.82 |                                100 |                                100 |            25930380458 | 2019-05-27            |        |


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
    |    | date       |   stock_id | stock_name   | InternationalCode   |   ForeignInvestmentRemainingShares |   ForeignInvestmentShares |   ForeignInvestmentRemainRatio |   ForeignInvestmentSharesRatio |   ForeignInvestmentUpperLimitRatio |   ChineseInvestmentUpperLimitRatio |   NumberOfSharesIssued | RecentlyDeclareDate   | note   |
    |---:|:-----------|-----------:|:-------------|:--------------------|-----------------------------------:|--------------------------:|-------------------------------:|-------------------------------:|-----------------------------------:|-----------------------------------:|-----------------------:|:----------------------|:-------|
    |  0 | 2020-04-01 |       0050 | 元大台灣50   | TW0000050004        |                          960256795 |                  94743205 |                          91.01 |                           8.98 |                                100 |                                100 |             1055000000 | 2019-07-18            |        |
    |  1 | 2020-04-01 |       0051 | 元大中型100  | TW0000051002        |                            9471000 |                     29000 |                          99.69 |                           0.3  |                                100 |                                100 |                9500000 | 2019-07-18            |        |
    |  2 | 2020-04-01 |       0052 | 富邦科技     | TW0000052000        |                           29957000 |                     43000 |                          99.85 |                           0.14 |                                100 |                                100 |               30000000 | 2019-07-18            |        |
    |  3 | 2020-04-01 |       0053 | 元大電子     | TW0000053008        |                            6466950 |                     21050 |                          99.67 |                           0.32 |                                100 |                                100 |                6488000 | 2019-07-18            |        |
    |  4 | 2020-04-01 |       0054 | 元大台商50   | TW0000054006        |                            9955000 |                    169000 |                          98.33 |                           1.66 |                                100 |                                100 |               10124000 | 2019-07-18            |        |

#### 股東持股分級表 TaiwanStockHoldingSharesPer

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
    |    | date       |   stock_id | HoldingSharesLevel   |   people |   percent |      unit |
    |---:|:-----------|-----------:|:---------------------|---------:|----------:|----------:|
    |  0 | 2020-04-01 |       2330 | 1-999                |   165122 |      0.12 |  33289900 |
    |  1 | 2020-04-01 |       2330 | 1,000-5,000          |   227692 |      1.69 | 440404454 |
    |  2 | 2020-04-01 |       2330 | 10,001-15,000        |    10408 |      0.49 | 128127693 |
    |  3 | 2020-04-01 |       2330 | 100,001-200,000      |     1628 |      0.86 | 225202876 |
    |  4 | 2020-04-01 |       2330 | 15,001-20,000        |     5068 |      0.34 |  89929303 |

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
    |    | date       |   stock_id | HoldingSharesLevel   |   people |   percent |      unit |
    |---:|:-----------|-----------:|:---------------------|---------:|----------:|----------:|
    |  0 | 2020-04-01 |       0050 | 1-999                |    44173 |      1.02 |  10834763 |
    |  1 | 2020-04-01 |       0050 | 1,000-5,000          |    96465 |     17.7  | 186791648 |
    |  2 | 2020-04-01 |       0050 | 5,001-10,000         |    10364 |      7.57 |  79902735 |
    |  3 | 2020-04-01 |       0050 | 10,001-15,000        |     2819 |      3.41 |  36075583 |
    |  4 | 2020-04-01 |       0050 | 15,001-20,000        |     1557 |      2.69 |  28426726 |


#### 借券成交明細 TaiwanStockSecuritiesLending

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
    |    | date       |   stock_id | transaction_type   |   volume |   fee_rate |   close | original_return_date   |   original_lending_period |
    |---:|:-----------|-----------:|:-------------------|---------:|-----------:|--------:|:-----------------------|--------------------------:|
    |  0 | 2020-04-01 |       2330 | 議借               |     1330 |       1.36 |   271.5 | 2020-09-30             |                       182 |
    |  1 | 2020-04-01 |       2330 | 議借               |      800 |       0.41 |   271.5 | 2020-09-30             |                       182 |
    |  2 | 2020-04-01 |       2330 | 議借               |      850 |       0.41 |   271.5 | 2020-09-30             |                       182 |
    |  3 | 2020-04-01 |       2330 | 議借               |      500 |       0.5  |   271.5 | 2020-09-30             |                       182 |
    |  4 | 2020-04-01 |       2330 | 議借               |      160 |       0.36 |   271.5 | 2020-09-30             |                       182 |

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
    |    | date       |   stock_id | transaction_type   |   volume |   fee_rate |   close | original_return_date   |   original_lending_period |
    |---:|:-----------|-----------:|:-------------------|---------:|-----------:|--------:|:-----------------------|--------------------------:|
    |  0 | 2020-04-01 |       1101 | 議借               |      760 |       0.25 |    39   | 2020-09-30             |                       182 |
    |  1 | 2020-04-01 |       1101 | 議借               |      397 |       0.25 |    39   | 2020-09-30             |                       182 |
    |  2 | 2020-04-01 |       1101 | 競價               |      436 |       0.7  |    39   | 2020-09-30             |                       182 |
    |  3 | 2020-04-01 |       1102 | 議借               |      150 |       0.25 |    38.6 | 2020-09-30             |                       182 |
    |  4 | 2020-04-01 |       1102 | 議借               |      770 |       1.05 |    38.6 | 2020-09-30             |                       182 |

#### 融券借券賣出表 TaiwanDailyShortSaleBalances

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
    |    |   stock_id |   MarginShortSalesPreviousDayBalance |   MarginShortSalesShortSales |   MarginShortSalesShortCovering |   MarginShortSalesStockRedemption |   MarginShortSalesCurrentDayBalance |   MarginShortSalesQuota |   SBLShortSalesPreviousDayBalance |   SBLShortSalesShortSales |   SBLShortSalesReturns |   SBLShortSalesAdjustments |   SBLShortSalesCurrentDayBalance |   SBLShortSalesQuota |   SBLShortSalesShortCovering | date       |
    |---:|-----------:|-------------------------------------:|-----------------------------:|--------------------------------:|----------------------------------:|------------------------------------:|------------------------:|----------------------------------:|--------------------------:|-----------------------:|---------------------------:|---------------------------------:|---------------------:|-----------------------------:|:-----------|
    |  0 |       2330 |                              1975000 |                            0 |                         1573000 |                            378000 |                               24000 |             -2107339478 |                          47947858 |                    487000 |                      0 |                          0 |                         48434858 |              7526895 |                            0 | 2020-04-01 |
    |  1 |       2330 |                                24000 |                            0 |                               0 |                             24000 |                                   0 |             -2107339478 |                          48434858 |                     44000 |                  60000 |                          0 |                         48418858 |              7563083 |                            0 | 2020-04-06 |
    |  2 |       2330 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |             -2107339478 |                          48418858 |                     62000 |                      0 |                          0 |                         48480858 |              7635835 |                            0 | 2020-04-07 |
    |  3 |       2330 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |             -2107339478 |                          48480858 |                    933000 |                7345000 |                          0 |                         42068858 |              7688249 |                            0 | 2020-04-08 |
    |  4 |       2330 |                                    0 |                       398000 |                               0 |                                 0 |                              398000 |             -2107339478 |                          42068858 |                     46000 |                   2000 |                          0 |                         42112858 |              7642682 |                            0 | 2020-04-09 |

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
    |    |   stock_id |   MarginShortSalesPreviousDayBalance |   MarginShortSalesShortSales |   MarginShortSalesShortCovering |   MarginShortSalesStockRedemption |   MarginShortSalesCurrentDayBalance |   MarginShortSalesQuota |   SBLShortSalesPreviousDayBalance |   SBLShortSalesShortSales |   SBLShortSalesReturns |   SBLShortSalesAdjustments |   SBLShortSalesCurrentDayBalance |   SBLShortSalesQuota |   SBLShortSalesShortCovering | date       |
    |---:|-----------:|-------------------------------------:|-----------------------------:|--------------------------------:|----------------------------------:|------------------------------------:|------------------------:|----------------------------------:|--------------------------:|-----------------------:|---------------------------:|---------------------------------:|---------------------:|-----------------------------:|:-----------|
    |  0 |       0050 |                              2336000 |                        13000 |                           65000 |                              1000 |                             2283000 |               263750000 |                          25527000 |                         0 |                      0 |                          0 |                         25527000 |              2397551 |                            0 | 2020-04-01 |
    |  1 |       0051 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |                 2375000 |                              1000 |                         0 |                      0 |                          0 |                             1000 |                 4053 |                            0 | 2020-04-01 |
    |  2 |       0052 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |                 7500000 |                             34000 |                         0 |                      0 |                          0 |                            34000 |                17168 |                            0 | 2020-04-01 |
    |  3 |       0053 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |                 1622000 |                                 0 |                         0 |                      0 |                          0 |                                0 |                 3158 |                            0 | 2020-04-01 |
    |  4 |       0054 |                                    0 |                            0 |                               0 |                                 0 |                                   0 |                 2531000 |                                 0 |                         0 |                      0 |                          0 |                                0 |                 1357 |                            0 | 2020-04-01 |


#### 證券商資訊表 SecuritiesTraderInfo

- 提供證券商相關資訊，用於台股分點資料表(TaiwanStockTradingDailyReport )，使用卷商代碼，查詢特定卷商所有股票進出。

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "SecuritiesTraderInfo",
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
            dataset = "SecuritiesTraderInfo",
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
    |    |   securities_trader_id | securities_trader   | date       | address                                                                                      | phone       |
    |---:|-----------------------:|:--------------------|:-----------|:---------------------------------------------------------------------------------------------|:------------|
    |  0 |                   1020 | 合庫                | 2011-12-02 | 台北市大安區忠孝東路四段325號2樓(部分)、經紀部複委託科地址：台北市松山區長安東路二段225號5樓 | 02-27528000 |
    |  1 |                   1021 | 合庫- 台中          | 2011-12-02 | 台中市西區民權路91號6樓                                                                      | 04-22255141 |
    |  2 |                   1022 | 合庫-台南           | 2011-12-02 | 台南市北區成功路48號3樓                                                                      | 06-2260148  |
    |  3 |                   1023 | 合庫-高雄           | 2011-12-02 | 高雄市大勇路97號5樓                                                                          | 07-5319755  |
    |  4 |                   1024 | 合庫-嘉義           | 2011-12-02 | 嘉義市國華街279號2樓                                                                         | 05-2220016  |


#### 台股分點資料表(query by 股票代碼) TaiwanStockTradingDailyReport (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
資料時間長度：2021-06-30 ~ now

(由於資料量過大，單次請求只提供一天資料)

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
|    | securities_trader   |   price |   buy |   sell |   securities_trader_id |   stock_id | date       |
|---:|:--------------------|--------:|------:|-------:|-----------------------:|-----------:|:-----------|
|  0 | 合庫                |     508 |  4000 |   2000 |                   1020 |       2330 | 2022-06-16 |
|  1 | 合庫                |     509 |  3480 |      0 |                   1020 |       2330 | 2022-06-16 |
|  2 | 合庫                |     510 |  2310 |     50 |                   1020 |       2330 | 2022-06-16 |
|  3 | 合庫                |     511 |  1169 |      0 |                   1020 |       2330 | 2022-06-16 |
|  4 | 合庫                |     512 |  1300 |  10000 |                   1020 |       2330 | 2022-06-16 |

#### 台股分點資料表(query by 券商代碼) TaiwanStockTradingDailyReport (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
資料時間長度：2021-06-30 ~ now

(由於資料量過大，單次請求只提供一天資料)

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

