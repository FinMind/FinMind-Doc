
在台股基本面，我們擁有 8 種資料集，如下:

- [綜合損益表 TaiwanStockFinancialStatements](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockfinancialstatements)
- [資產負債表 TaiwanStockBalanceSheet](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockbalancesheet)
- [現金流量表 TaiwanStockCashFlowsStatement](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockcashflowsstatement)
- [股利政策表 TaiwanStockDividend](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdividend)
- [除權除息結果表 TaiwanStockDividendResult](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdividendresult)
- [月營收表 TaiwanStockMonthRevenue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue)
- [減資恢復買賣參考價格 TaiwanStockCapitalReductionReferencePrice](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockcapitalreductionreferenceprice)
- [台灣股價市值表 TaiwanStockMarketValue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmarketvalue)

#### 綜合損益表 TaiwanStockFinancialStatements

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_financial_statement(
            stock_id="2330",
            start_date='2019-01-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockFinancialStatements",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
            dataset="TaiwanStockFinancialStatements",
            data_id="2330",
            start_date= "2019-01-02",
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
    |    | date       |   stock_id | type                               |       value | origin_name                  |
    |---:|:-----------|-----------:|:-----------------------------------|------------:|:-----------------------------|
    |  0 | 2019-03-31 |       2330 | CostOfGoodsSold                    | 1.28352e+11 | 營業成本                     |
    |  1 | 2019-03-31 |       2330 | EPS                                | 2.37        | 基本每股盈餘（元）           |
    |  2 | 2019-03-31 |       2330 | EquityAttributableToOwnersOfParent | 6.60098e+10 | 綜合損益總額歸屬於母公司業主 |
    |  3 | 2019-03-31 |       2330 | GrossProfit                        | 9.03576e+10 | 營業毛利（毛損）淨額         |
    |  4 | 2019-03-31 |       2330 | IncomeAfterTaxes                   | 6.13873e+10 | 本期淨利（淨損）             |

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_financial_statement(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockFinancialStatements",
            "start_date": "2019-03-31",
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
            dataset="TaiwanStockFinancialStatements",
            start_date= "2019-03-31",
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
    |    | date       |   stock_id | type                               |       value | origin_name                  |
    |---:|:-----------|-----------:|:-----------------------------------|------------:|:-----------------------------|
    |  0 | 2019-03-31 |     000116 | EPS                                | 0.24        | 基本每股盈餘（元）           |
    |  1 | 2019-03-31 |     000116 | EquityAttributableToOwnersOfParent | 4.65569e+08 | 綜合損益總額歸屬於母公司業主 |
    |  2 | 2019-03-31 |     000116 | Expense                            | 8.95498e+08 | 支出及費用                   |
    |  3 | 2019-03-31 |     000116 | Income                             | 1.07791e+09 | 收益                         |
    |  4 | 2019-03-31 |     000116 | IncomeAfterTaxes                   | 2.74322e+08 | 本期淨利（淨損）             |

#### 資產負債表 TaiwanStockBalanceSheet

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_balance_sheet(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockBalanceSheet",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
            dataset="TaiwanStockBalanceSheet",
            data_id="2330",
            start_date= "2019-01-02",
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
    |    | date       |   stock_id | type                                       |       value | origin_name          |
    |---:|:-----------|-----------:|:-------------------------------------------|------------:|:---------------------|
    |  0 | 2019-03-31 |       2330 | AccountsPayable                            | 2.71009e+10 | 應付帳款             |
    |  1 | 2019-03-31 |       2330 | AccountsPayable_per                        | 1.24        | 應付帳款             |
    |  2 | 2019-03-31 |       2330 | AccountsPayableToRelatedParties            | 5.60941e+08 | 應付帳款－關係人     |
    |  3 | 2019-03-31 |       2330 | AccountsPayableToRelatedParties_per        | 0.03        | 應付帳款－關係人     |
    |  4 | 2019-03-31 |       2330 | AccountsReceivableDuefromRelatedPartiesNet | 3.09821e+08 | 應收帳款－關係人淨額 |

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_balance_sheet(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockBalanceSheet",
            "start_date": "2019-03-31",
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
            dataset="TaiwanStockBalanceSheet",
            start_date= "2019-03-31",
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
    |    | date       |   stock_id | type                                           |       value | origin_name          |
    |---:|:-----------|-----------:|:-----------------------------------------------|------------:|:---------------------|
    |  0 | 2019-03-31 |       1101 | AccountsPayable                                | 7.84411e+09 | 應付帳款             |
    |  1 | 2019-03-31 |       1101 | AccountsPayable_per                            | 2.15        | 應付帳款             |
    |  2 | 2019-03-31 |       1101 | AccountsReceivableDuefromRelatedPartiesNet     | 2.64638e+08 | 應收帳款－關係人淨額 |
    |  3 | 2019-03-31 |       1101 | AccountsReceivableDuefromRelatedPartiesNet_per | 0.07        | 應收帳款－關係人淨額 |
    |  4 | 2019-03-31 |       1101 | AccountsReceivableNet                          | 8.3396e+09  | 應收帳款淨額         |

#### 現金流量表 TaiwanStockCashFlowsStatement

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_cash_flows_statement(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockCashFlowsStatement",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
            dataset="TaiwanStockCashFlowsStatement",
            data_id="2330",
            start_date= "2019-01-02",
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
    |    | date       |   stock_id | type                              |        value | origin_name                      |
    |---:|:-----------|-----------:|:----------------------------------|-------------:|:---------------------------------|
    |  0 | 2019-03-31 |       2330 | HedgingFinancialLiabilities       | -2.27383e+08 | 除列避險之金融負債               |
    |  1 | 2019-03-31 |       2330 | CashFlowsFromOperatingActivities  |  1.5267e+11  | 營業活動之淨現金流入（流出）     |
    |  2 | 2019-03-31 |       2330 | CashProvidedByInvestingActivities | -6.41885e+10 | 投資活動之淨現金流入(流出)       |
    |  3 | 2019-03-31 |       2330 | CashBalancesIncrease              |  6.78559e+10 | 本期現金及約當現金增加（減少）數 |
    |  4 | 2019-03-31 |       2330 | NetIncomeBeforeTax                |  6.81817e+10 | 本期稅前淨利（淨損）             |


#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_cash_flows_statement(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockCashFlowsStatement",
            "start_date": "2019-03-31",
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
            dataset="TaiwanStockCashFlowsStatement",
            start_date= "2019-03-31",
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
    |    | date       |   stock_id | type                              |        value | origin_name                |
    |---:|:-----------|-----------:|:----------------------------------|-------------:|:---------------------------|
    |  0 | 2019-03-31 |       1101 | DecreaseInShortTermLoans          |  7.59053e+09 | 短期借款減少               |
    |  1 | 2019-03-31 |       1101 | ReceivableIncrease                | -1.15069e+08 | 應收帳款(增加)減少         |
    |  2 | 2019-03-31 |       1101 | PropertyAndPlantAndEquipment      | -1.48367e+09 | 取得不動產、廠房及設備     |
    |  3 | 2019-03-31 |       1101 | NetIncomeBeforeTax                |  5.6035e+09  | 本期稅前淨利（淨損）       |
    |  4 | 2019-03-31 |       1101 | CashProvidedByInvestingActivities | -4.31058e+09 | 投資活動之淨現金流入(流出) |

#### 股利政策表 TaiwanStockDividend

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_dividend(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockDividend",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
            dataset="TaiwanStockStockDividend",
            data_id="2330",
            start_date= "2019-01-02",
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
    |    | date       |   stock_id | year       |   StockEarningsDistribution |   StockStatutorySurplus | StockExDividendTradingDate   |   TotalEmployeeStockDividend |   TotalEmployeeStockDividendAmount |   RatioOfEmployeeStockDividendOfTotal |   RatioOfEmployeeStockDividend |   CashEarningsDistribution |   CashStatutorySurplus | CashExDividendTradingDate   | CashDividendPaymentDate   |   TotalEmployeeCashDividend |   TotalNumberOfCashCapitalIncrease |   CashIncreaseSubscriptionRate |   CashIncreaseSubscriptionpRrice |   RemunerationOfDirectorsAndSupervisors |   ParticipateDistributionOfTotalShares | AnnouncementDate   | AnnouncementTime   |
    |---:|:-----------|-----------:|:-----------|----------------------------:|------------------------:|:-----------------------------|-----------------------------:|-----------------------------------:|--------------------------------------:|-------------------------------:|---------------------------:|-----------------------:|:----------------------------|:--------------------------|----------------------------:|-----------------------------------:|-------------------------------:|---------------------------------:|----------------------------------------:|---------------------------------------:|:-------------------|:-------------------|
    |  0 | 2019-06-30 |       2330 | 107年      |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        8   |                      0 | 2019-06-24                  | 2019-07-18                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-06-06         | 15:47:30           |
    |  1 | 2019-09-25 |       2330 | 108年第1季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2   |                      0 | 2019-09-19                  | 2019-10-17                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-07-09         | 18:33:02           |
    |  2 | 2019-12-25 |       2330 | 108年第2季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2019-12-19                  | 2020-01-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-08-14         | 15:27:02           |
    |  3 | 2020-03-25 |       2330 | 108年第3季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2020-03-19                  | 2020-04-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-11-14         | 17:01:07           |
    |  4 | 2020-06-24 |       2330 | 108年第4季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2020-06-18                  | 2020-07-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2020-02-14         | 15:10:50           |


#### 除權除息結果表 TaiwanStockDividendResult

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_dividend_result(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockDividendResult",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
            dataset="TaiwanStockDividendResult",
            data_id="2330",
            start_date= "2019-01-02",
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
    |    | date       |   stock_id |   before_price |   after_price |   stock_and_cache_dividend | stock_or_cache_dividend   |   max_price |   min_price |   open_price |   reference_price |
    |---:|:-----------|-----------:|---------------:|--------------:|---------------------------:|:--------------------------|------------:|------------:|-------------:|------------------:|
    |  0 | 2019-06-24 |       2330 |          248.5 |         240.5 |                        8   | 息                        |       264.5 |       216.5 |        240.5 |             240.5 |
    |  1 | 2019-09-19 |       2330 |          267   |         265   |                        2   | 息                        |       291.5 |       238.5 |        265   |             265   |
    |  2 | 2019-12-19 |       2330 |          344.5 |         342   |                        2.5 | 息                        |       376   |       308   |        342   |             342   |
    |  3 | 2020-03-19 |       2330 |          260   |         257.5 |                        2.5 | 息                        |       283   |       232   |        257.5 |             257.5 |
    |  4 | 2020-06-18 |       2330 |          315   |         312.5 |                        2.5 | 息                        |       343.5 |       281.5 |        312.5 |             312.5 |

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_dividend_result(
            start_date='2019-06-24',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockDividendResult",
            "start_date": "2019-06-24",
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
            dataset="TaiwanStockDividendResult",
            start_date= "2019-06-24",
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
    |    | date       | stock_id   |   before_price |   after_price |   stock_and_cache_dividend | stock_or_cache_dividend   |   max_price |   min_price |   open_price |   reference_price |
    |---:|:-----------|:-----------|---------------:|--------------:|---------------------------:|:--------------------------|------------:|------------:|-------------:|------------------:|
    |  0 | 2019-06-24 | 00697B     |          42.48 |         42.21 |                       0.27 | 除息                      |     9999.95 |        0.01 |        42.21 |             42.21 |
    |  1 | 2019-06-24 | 00751B     |          46.05 |         45.46 |                       0.59 | 除息                      |     9999.95 |        0.01 |        45.46 |             45.46 |
    |  2 | 2019-06-24 | 1707       |         220    |        213.5  |                       6.5  | 息                        |      234.5  |      192.5  |       213.5  |            213.5  |
    |  3 | 2019-06-24 | 1711       |          17    |         16.5  |                       0.5  | 息                        |       18.15 |       14.85 |        16.5  |             16.5  |
    |  4 | 2019-06-24 | 1906       |          13.55 |         13.05 |                       0.5  | 息                        |       14.35 |       11.75 |        13.05 |             13.05 |


#### 月營收表 TaiwanStockMonthRevenue

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_month_revenue(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMonthRevenue",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
            dataset="TaiwanStockMonthRevenue",
            data_id="2330",
            start_date= "2019-01-02",
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
    |    | date       |   stock_id | country   |     revenue |   revenue_month |   revenue_year |
    |---:|:-----------|-----------:|:----------|------------:|----------------:|---------------:|
    |  0 | 2019-04-01 |       2330 | Taiwan    | 79721587000 |               3 |           2019 |
    |  1 | 2019-05-01 |       2330 | Taiwan    | 74693615000 |               4 |           2019 |
    |  2 | 2019-06-01 |       2330 | Taiwan    | 80436931000 |               5 |           2019 |
    |  3 | 2019-07-01 |       2330 | Taiwan    | 85867929000 |               6 |           2019 |
    |  4 | 2019-08-01 |       2330 | Taiwan    | 84757724000 |               7 |           2019 |

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_month_revenue(
            start_date='2019-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMonthRevenue",
            "start_date": "2019-01-01",
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
            dataset="TaiwanStockMonthRevenue",
            start_date= "2019-01-01",
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
    |    | date       |   stock_id | country   |     revenue |   revenue_month |   revenue_year |
    |---:|:-----------|-----------:|:----------|------------:|----------------:|---------------:|
    |  0 | 2019-05-01 |       1101 | Taiwan    | 10596314000 |               4 |           2019 |
    |  1 | 2019-05-01 |       1102 | Taiwan    |  8434811000 |               4 |           2019 |
    |  2 | 2019-05-01 |       1103 | Taiwan    |   160751000 |               4 |           2019 |
    |  3 | 2019-05-01 |       1104 | Taiwan    |   418992000 |               4 |           2019 |
    |  4 | 2019-05-01 |       1108 | Taiwan    |   323834000 |               4 |           2019 |

#### 減資恢復買賣參考價格 TaiwanStockCapitalReductionReferencePrice

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockCapitalReductionReferencePrice",
            "data_id": "2327",
            "start_date": "2010-01-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

                date stock_id  ClosingPriceonTheLastTradingDay  PostReductionReferencePrice  LimitUp  LimitDown  OpeningReferencePrice  ExrightReferencePrice ReasonforCapitalReduction
        0  2013-09-18     2327                            10.20                        10.28    10.95       9.57                   10.3                   -1.0               Cash refund
        1  2014-10-09     2327                            22.05                        49.82    53.30      46.35                   49.8                   -1.0               Cash refund
        2  2016-08-15     2327                            54.80                        65.96    72.50      59.40                   66.0                   -1.0               Cash refund
        3  2017-08-18     2327                           120.50                       168.13   184.50     151.50                  168.0                   -1.0               Cash refund
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
            dataset="TaiwanStockCapitalReductionReferencePrice",
            data_id="2327",
            start_date= "2010-01-01",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

                date stock_id  ClosingPriceonTheLastTradingDay  PostReductionReferencePrice  LimitUp  LimitDown  OpeningReferencePrice  ExrightReferencePrice ReasonforCapitalReduction
        1  2013-09-18     2327                            10.20                        10.28    10.95       9.57                   10.3                   -1.0               Cash refund
        2  2014-10-09     2327                            22.05                        49.82    53.30      46.35                   49.8                   -1.0               Cash refund
        3  2016-08-15     2327                            54.80                        65.96    72.50      59.40                   66.0                   -1.0               Cash refund
        4  2017-08-18     2327                           120.50                       168.13   184.50     151.50                  168.0                   -1.0               Cash refund
        ```


#### 台灣股價市值表 TaiwanStockMarketValue (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料時間長度：2004-01-01 ~ now
- 資料更新時間 **星期一至五 23:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_market_value(
            stock_id='2330',
            start_date='2023-01-01',
            end_date='2024-01-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMarketValue",
            "data_id": "2330",
            "start_date": "2023-01-01",
            "end_date": "2024-01-01",
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
            dataset="TaiwanStockMarketValue",
            data_id= "2330",
            start_date= "2023-01-01",
            end_date= "2024-01-01",
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
    |    | date       |   stock_id |   market_value |
    |---:|:-----------|-----------:|-----------------:|
    |  0 | 2023-01-03 |       2330 |         1.174646e+13 |
    |  1 | 2023-01-04 |       2330 |         1.165571e+13 |
    |  2 | 2023-01-05 |       2330 |         1.188908e+13 |
    |  3 | 2023-01-06 |       2330 |         1.188908e+13 |
    |  4 | 2023-01-09 |       2330 |         1.247251e+13 |


#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_daily(
            start_date='2023-01-03',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockPrice",
            "start_date": "2023-01-03",
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
            dataset="TaiwanStockPrice",
            start_date= "2023-01-03",
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
    |    | date       |   stock_id |     market_value |
    |---:|:-----------|-----------:|-----------------:|
    |  0 | 2023-01-03 |       0050 |     2.561094e+11 |
    |  1 | 2023-01-03 |       0051 |     7.967000e+08 |
    |  2 | 2023-01-03 |       0052 |     5.644650e+09 |
    |  3 | 2023-01-03 |       0053 |     2.611218e+08 |
    |  4 | 2023-01-03 |       0055 |     1.625804e+09 |

