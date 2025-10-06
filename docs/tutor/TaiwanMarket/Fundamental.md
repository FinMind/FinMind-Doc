
在台股基本面，我們擁有 12 種資料集，如下:

- [綜合損益表 TaiwanStockFinancialStatements](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockfinancialstatements)
- [資產負債表 TaiwanStockBalanceSheet](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockbalancesheet)
- [現金流量表 TaiwanStockCashFlowsStatement](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockcashflowsstatement)
- [股利政策表 TaiwanStockDividend](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdividend)
- [除權除息結果表 TaiwanStockDividendResult](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdividendresult)
- [月營收表 TaiwanStockMonthRevenue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue)
- [減資恢復買賣參考價格 TaiwanStockCapitalReductionReferencePrice](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockcapitalreductionreferenceprice)
- [台灣股價市值表 TaiwanStockMarketValue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmarketvalue-backersponsor)
- [台灣股票下市櫃表 TaiwanStockDelisting](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdelisting)
- [台股市值比重表 TaiwanStockMarketValueWeight](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmarketvalueweight-backersponsor)
- [台股分割後參考價 TaiwanStockSplitPrice](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstocksplitprice)
- [台灣股票變更面額恢復買賣參考價格 TaiwanStockParValueChange](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockparvaluechange)

----------------------------------
#### 綜合損益表 TaiwanStockFinancialStatements

- 資料區間：1990-03-01 ~ now

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockFinancialStatements",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockFinancialStatements",
                data_id="2330",
                start_date= "2019-01-02"
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
        |    | date       |   stock_id | type                               |       value | origin_name                  |
        |---:|:-----------|-----------:|:-----------------------------------|------------:|:-----------------------------|
        |  0 | 2019-03-31 |       2330 | CostOfGoodsSold                    | 1.28352e+11 | 營業成本                     |
        |  1 | 2019-03-31 |       2330 | EPS                                | 2.37        | 基本每股盈餘（元）           |
        |  2 | 2019-03-31 |       2330 | EquityAttributableToOwnersOfParent | 6.60098e+10 | 綜合損益總額歸屬於母公司業主 |
        |  3 | 2019-03-31 |       2330 | GrossProfit                        | 9.03576e+10 | 營業毛利（毛損）淨額         |
        |  4 | 2019-03-31 |       2330 | IncomeAfterTaxes                   | 6.13873e+10 | 本期淨利（淨損）             |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            type: str,
            value: float64,
            origin_name: str
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
        df = api.taiwan_stock_financial_statement(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockFinancialStatements",
            "start_date": "2019-03-31",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockFinancialStatements",
                start_date= "2019-03-31"
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
        |    | date       |   stock_id | type                               |       value | origin_name                  |
        |---:|:-----------|-----------:|:-----------------------------------|------------:|:-----------------------------|
        |  0 | 2019-03-31 |     000116 | EPS                                | 0.24        | 基本每股盈餘（元）           |
        |  1 | 2019-03-31 |     000116 | EquityAttributableToOwnersOfParent | 4.65569e+08 | 綜合損益總額歸屬於母公司業主 |
        |  2 | 2019-03-31 |     000116 | Expense                            | 8.95498e+08 | 支出及費用                   |
        |  3 | 2019-03-31 |     000116 | Income                             | 1.07791e+09 | 收益                         |
        |  4 | 2019-03-31 |     000116 | IncomeAfterTaxes                   | 2.74322e+08 | 本期淨利（淨損）             |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            type: str,
            value: float64,
            origin_name: str
        }
        ```

----------------------------------
#### 資產負債表 TaiwanStockBalanceSheet

- 資料區間：2011-12-01 ~ now

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockBalanceSheet",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockBalanceSheet",
                data_id="2330",
                start_date= "2019-01-02"
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
        |    | date       |   stock_id | type                                       |       value | origin_name          |
        |---:|:-----------|-----------:|:-------------------------------------------|------------:|:---------------------|
        |  0 | 2019-03-31 |       2330 | AccountsPayable                            | 2.71009e+10 | 應付帳款             |
        |  1 | 2019-03-31 |       2330 | AccountsPayable_per                        | 1.24        | 應付帳款             |
        |  2 | 2019-03-31 |       2330 | AccountsPayableToRelatedParties            | 5.60941e+08 | 應付帳款－關係人     |
        |  3 | 2019-03-31 |       2330 | AccountsPayableToRelatedParties_per        | 0.03        | 應付帳款－關係人     |
        |  4 | 2019-03-31 |       2330 | AccountsReceivableDuefromRelatedPartiesNet | 3.09821e+08 | 應收帳款－關係人淨額 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            type: str,
            value: float64,
            origin_name: str
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
        df = api.taiwan_stock_balance_sheet(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockBalanceSheet",
            "start_date": "2019-03-31",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockBalanceSheet",
                start_date= "2019-03-31"
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
        |    | date       |   stock_id | type                                           |       value | origin_name          |
        |---:|:-----------|-----------:|:-----------------------------------------------|------------:|:---------------------|
        |  0 | 2019-03-31 |       1101 | AccountsPayable                                | 7.84411e+09 | 應付帳款             |
        |  1 | 2019-03-31 |       1101 | AccountsPayable_per                            | 2.15        | 應付帳款             |
        |  2 | 2019-03-31 |       1101 | AccountsReceivableDuefromRelatedPartiesNet     | 2.64638e+08 | 應收帳款－關係人淨額 |
        |  3 | 2019-03-31 |       1101 | AccountsReceivableDuefromRelatedPartiesNet_per | 0.07        | 應收帳款－關係人淨額 |
        |  4 | 2019-03-31 |       1101 | AccountsReceivableNet                          | 8.3396e+09  | 應收帳款淨額         |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            type: str,
            value: float64,
            origin_name: str
        }
        ```

----------------------------------
#### 現金流量表 TaiwanStockCashFlowsStatement

- 資料區間：2008-06-01 ~ now

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockCashFlowsStatement",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockCashFlowsStatement",
                data_id="2330",
                start_date= "2019-01-02"
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
        |    | date       |   stock_id | type                              |        value | origin_name                      |
        |---:|:-----------|-----------:|:----------------------------------|-------------:|:---------------------------------|
        |  0 | 2019-03-31 |       2330 | HedgingFinancialLiabilities       | -2.27383e+08 | 除列避險之金融負債               |
        |  1 | 2019-03-31 |       2330 | CashFlowsFromOperatingActivities  |  1.5267e+11  | 營業活動之淨現金流入（流出）     |
        |  2 | 2019-03-31 |       2330 | CashProvidedByInvestingActivities | -6.41885e+10 | 投資活動之淨現金流入(流出)       |
        |  3 | 2019-03-31 |       2330 | CashBalancesIncrease              |  6.78559e+10 | 本期現金及約當現金增加（減少）數 |
        |  4 | 2019-03-31 |       2330 | NetIncomeBeforeTax                |  6.81817e+10 | 本期稅前淨利（淨損）             |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            type: str,
            value: float64,
            origin_name: str
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
        df = api.taiwan_stock_cash_flows_statement(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockCashFlowsStatement",
            "start_date": "2019-03-31",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockCashFlowsStatement",
                start_date= "2019-03-31"
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
        |    | date       |   stock_id | type                              |        value | origin_name                |
        |---:|:-----------|-----------:|:----------------------------------|-------------:|:---------------------------|
        |  0 | 2019-03-31 |       1101 | DecreaseInShortTermLoans          |  7.59053e+09 | 短期借款減少               |
        |  1 | 2019-03-31 |       1101 | ReceivableIncrease                | -1.15069e+08 | 應收帳款(增加)減少         |
        |  2 | 2019-03-31 |       1101 | PropertyAndPlantAndEquipment      | -1.48367e+09 | 取得不動產、廠房及設備     |
        |  3 | 2019-03-31 |       1101 | NetIncomeBeforeTax                |  5.6035e+09  | 本期稅前淨利（淨損）       |
        |  4 | 2019-03-31 |       1101 | CashProvidedByInvestingActivities | -4.31058e+09 | 投資活動之淨現金流入(流出) |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            type: str,
            value: float64,
            origin_name: str
        }
        ```

----------------------------------
#### 股利政策表 TaiwanStockDividend

- 資料區間：2005-05-01 ~ now

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDividend",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockStockDividend",
                data_id="2330",
                start_date= "2019-01-02"
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
        |    | date       |   stock_id | year       |   StockEarningsDistribution |   StockStatutorySurplus | StockExDividendTradingDate   |   TotalEmployeeStockDividend |   TotalEmployeeStockDividendAmount |   RatioOfEmployeeStockDividendOfTotal |   RatioOfEmployeeStockDividend |   CashEarningsDistribution |   CashStatutorySurplus | CashExDividendTradingDate   | CashDividendPaymentDate   |   TotalEmployeeCashDividend |   TotalNumberOfCashCapitalIncrease |   CashIncreaseSubscriptionRate |   CashIncreaseSubscriptionpRrice |   RemunerationOfDirectorsAndSupervisors |   ParticipateDistributionOfTotalShares | AnnouncementDate   | AnnouncementTime   |
        |---:|:-----------|-----------:|:-----------|----------------------------:|------------------------:|:-----------------------------|-----------------------------:|-----------------------------------:|--------------------------------------:|-------------------------------:|---------------------------:|-----------------------:|:----------------------------|:--------------------------|----------------------------:|-----------------------------------:|-------------------------------:|---------------------------------:|----------------------------------------:|---------------------------------------:|:-------------------|:-------------------|
        |  0 | 2019-06-30 |       2330 | 107年      |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        8   |                      0 | 2019-06-24                  | 2019-07-18                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-06-06         | 15:47:30           |
        |  1 | 2019-09-25 |       2330 | 108年第1季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2   |                      0 | 2019-09-19                  | 2019-10-17                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-07-09         | 18:33:02           |
        |  2 | 2019-12-25 |       2330 | 108年第2季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2019-12-19                  | 2020-01-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-08-14         | 15:27:02           |
        |  3 | 2020-03-25 |       2330 | 108年第3季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2020-03-19                  | 2020-04-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-11-14         | 17:01:07           |
        |  4 | 2020-06-24 |       2330 | 108年第4季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2020-06-18                  | 2020-07-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2020-02-14         | 15:10:50           |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            year: str,
            StockEarningsDistribution: float64,
            StockStatutorySurplus: float64,
            StockExDividendTradingDate: str,
            TotalEmployeeStockDividend: float64,
            TotalEmployeeStockDividendAmount: float64,
            RatioOfEmployeeStockDividendOfTotal: float64,
            RatioOfEmployeeStockDividend: float64,
            CashEarningsDistribution: float64,
            CashStatutorySurplus: float64,
            CashExDividendTradingDate: str,
            CashDividendPaymentDate: str,
            TotalEmployeeCashDividend: float64,
            TotalNumberOfCashCapitalIncrease: float64,
            CashIncreaseSubscriptionRate: float64,
            CashIncreaseSubscriptionpRrice: float64,
            RemunerationOfDirectorsAndSupervisors: float64,
            ParticipateDistributionOfTotalShares: float64,
            AnnouncementDate: str,
            AnnouncementTime: str
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
        df = api.taiwan_stock_dividend(
            start_date='2025-10-06',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDividend",
            "start_date": "2025-10-06",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockStockDividend",
                start_date= "2025-10-06"
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
        |    | date       |   stock_id | year   |   StockEarningsDistribution |   StockStatutorySurplus | StockExDividendTradingDate   |   TotalEmployeeStockDividend |   TotalEmployeeStockDividendAmount |   RatioOfEmployeeStockDividendOfTotal |   RatioOfEmployeeStockDividend |   CashEarningsDistribution |   CashStatutorySurplus | CashExDividendTradingDate   | CashDividendPaymentDate   |   TotalEmployeeCashDividend |   TotalNumberOfCashCapitalIncrease |   CashIncreaseSubscriptionRate |   CashIncreaseSubscriptionpRrice |   RemunerationOfDirectorsAndSupervisors |   ParticipateDistributionOfTotalShares | AnnouncementDate   | AnnouncementTime   |
        |---:|:-----------|-----------:|:-------|----------------------------:|------------------------:|:-----------------------------|-----------------------------:|-----------------------------------:|--------------------------------------:|-------------------------------:|---------------------------:|-----------------------:|:----------------------------|:--------------------------|----------------------------:|-----------------------------------:|-------------------------------:|---------------------------------:|----------------------------------------:|---------------------------------------:|:-------------------|:-------------------|
        |  0 | 2025-10-06 |       2540 | 113年  |                           3 |                0.999999 | 2025-09-30                   |                            0 |                                  0 |                                     0 |                              0 |                        0.4 |                    0.6 | 2025-09-30                  | 2025-10-31                |                           0 |                              0     |                           0    |                              0   |                                       0 |                            6.7491e+08  | 2025-09-12         | 17:35:32           |
        |  1 | 2025-10-06 |       3312 | 不適用 |                           0 |                0        | 2025-09-30                   |                            0 |                                  0 |                                     0 |                              0 |                        0   |                    0   |                             |                           |                           0 |                              2e+07 |                           9.84 |                             39.8 |                                       0 |                            1.62627e+08 | 2025-09-22         | 16:52:52           |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            year: str,
            StockEarningsDistribution: float64,
            StockStatutorySurplus: float64,
            StockExDividendTradingDate: str,
            TotalEmployeeStockDividend: float64,
            TotalEmployeeStockDividendAmount: float64,
            RatioOfEmployeeStockDividendOfTotal: float64,
            RatioOfEmployeeStockDividend: float64,
            CashEarningsDistribution: float64,
            CashStatutorySurplus: float64,
            CashExDividendTradingDate: str,
            CashDividendPaymentDate: str,
            TotalEmployeeCashDividend: float64,
            TotalNumberOfCashCapitalIncrease: float64,
            CashIncreaseSubscriptionRate: float64,
            CashIncreaseSubscriptionpRrice: float64,
            RemunerationOfDirectorsAndSupervisors: float64,
            ParticipateDistributionOfTotalShares: float64,
            AnnouncementDate: str,
            AnnouncementTime: str
        }
        ```

----------------------------------
#### 除權除息結果表 TaiwanStockDividendResult

- 資料區間：2003-05-01 ~ now

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDividendResult",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDividendResult",
                data_id="2330",
                start_date= "2019-01-02"
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
        |    | date       |   stock_id |   before_price |   after_price |   stock_and_cache_dividend | stock_or_cache_dividend   |   max_price |   min_price |   open_price |   reference_price |
        |---:|:-----------|-----------:|---------------:|--------------:|---------------------------:|:--------------------------|------------:|------------:|-------------:|------------------:|
        |  0 | 2019-06-24 |       2330 |          248.5 |         240.5 |                        8   | 息                        |       264.5 |       216.5 |        240.5 |             240.5 |
        |  1 | 2019-09-19 |       2330 |          267   |         265   |                        2   | 息                        |       291.5 |       238.5 |        265   |             265   |
        |  2 | 2019-12-19 |       2330 |          344.5 |         342   |                        2.5 | 息                        |       376   |       308   |        342   |             342   |
        |  3 | 2020-03-19 |       2330 |          260   |         257.5 |                        2.5 | 息                        |       283   |       232   |        257.5 |             257.5 |
        |  4 | 2020-06-18 |       2330 |          315   |         312.5 |                        2.5 | 息                        |       343.5 |       281.5 |        312.5 |             312.5 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            before_price: float32,
            after_price: float32,
            stock_and_cache_dividend: float32,
            stock_or_cache_dividend: float32,
            max_price: float32,
            min_price: float32,
            open_price: float32,
            reference_price: float32
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
        df = api.taiwan_stock_dividend_result(
            start_date='2019-06-24',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDividendResult",
            "start_date": "2019-06-24",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDividendResult",
                start_date= "2019-06-24"
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
        |    | date       | stock_id   |   before_price |   after_price |   stock_and_cache_dividend | stock_or_cache_dividend   |   max_price |   min_price |   open_price |   reference_price |
        |---:|:-----------|:-----------|---------------:|--------------:|---------------------------:|:--------------------------|------------:|------------:|-------------:|------------------:|
        |  0 | 2019-06-24 | 00697B     |          42.48 |         42.21 |                       0.27 | 除息                      |     9999.95 |        0.01 |        42.21 |             42.21 |
        |  1 | 2019-06-24 | 00751B     |          46.05 |         45.46 |                       0.59 | 除息                      |     9999.95 |        0.01 |        45.46 |             45.46 |
        |  2 | 2019-06-24 | 1707       |         220    |        213.5  |                       6.5  | 息                        |      234.5  |      192.5  |       213.5  |            213.5  |
        |  3 | 2019-06-24 | 1711       |          17    |         16.5  |                       0.5  | 息                        |       18.15 |       14.85 |        16.5  |             16.5  |
        |  4 | 2019-06-24 | 1906       |          13.55 |         13.05 |                       0.5  | 息                        |       14.35 |       11.75 |        13.05 |             13.05 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            before_price: float32,
            after_price: float32,
            stock_and_cache_dividend: float32,
            stock_or_cache_dividend: float32,
            max_price: float32,
            min_price: float32,
            open_price: float32,
            reference_price: float32
        }
        ```

----------------------------------
#### 月營收表 TaiwanStockMonthRevenue

- 資料區間：2002-02-01 ~ now

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMonthRevenue",
            "data_id": "2330",
            "start_date": "2019-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMonthRevenue",
                data_id="2330",
                start_date= "2019-01-02"
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
        |    | date       |   stock_id | country   |     revenue |   revenue_month |   revenue_year |
        |---:|:-----------|-----------:|:----------|------------:|----------------:|---------------:|
        |  0 | 2019-04-01 |       2330 | Taiwan    | 79721587000 |               3 |           2019 |
        |  1 | 2019-05-01 |       2330 | Taiwan    | 74693615000 |               4 |           2019 |
        |  2 | 2019-06-01 |       2330 | Taiwan    | 80436931000 |               5 |           2019 |
        |  3 | 2019-07-01 |       2330 | Taiwan    | 85867929000 |               6 |           2019 |
        |  4 | 2019-08-01 |       2330 | Taiwan    | 84757724000 |               7 |           2019 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            country: str,
            revenue: int64,
            revenue_month: int64,
            revenue_year: int64
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
        df = api.taiwan_stock_month_revenue(
            start_date='2019-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMonthRevenue",
            "start_date": "2019-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMonthRevenue",
                start_date= "2019-01-01"
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
        |    | date       |   stock_id | country   |     revenue |   revenue_month |   revenue_year |
        |---:|:-----------|-----------:|:----------|------------:|----------------:|---------------:|
        |  0 | 2019-05-01 |       1101 | Taiwan    | 10596314000 |               4 |           2019 |
        |  1 | 2019-05-01 |       1102 | Taiwan    |  8434811000 |               4 |           2019 |
        |  2 | 2019-05-01 |       1103 | Taiwan    |   160751000 |               4 |           2019 |
        |  3 | 2019-05-01 |       1104 | Taiwan    |   418992000 |               4 |           2019 |
        |  4 | 2019-05-01 |       1108 | Taiwan    |   323834000 |               4 |           2019 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            country: str,
            revenue: int64,
            revenue_month: int64,
            revenue_year: int64
        }
        ```
----------------------------------
#### 減資恢復買賣參考價格 TaiwanStockCapitalReductionReferencePrice

- 資料區間：2011-01-01 ~ now

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockCapitalReductionReferencePrice",
            "data_id": "2327",
            "start_date": "2010-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockCapitalReductionReferencePrice",
                data_id="2327",
                start_date= "2010-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
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


----------------------------------
#### 台灣股價市值表 TaiwanStockMarketValue (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：2004-01-01 ~ now
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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarketValue",
            "data_id": "2330",
            "start_date": "2023-01-01",
            "end_date": "2024-01-01",
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
        token = "" # 參考登入，獲取金鑰
            response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarketValue",
                data_id= "2330",
                start_date= "2023-01-01",
                end_date= "2024-01-01"
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
        |    | date       |   stock_id |   market_value |
        |---:|:-----------|-----------:|-----------------:|
        |  0 | 2023-01-03 |       2330 |         1.174646e+13 |
        |  1 | 2023-01-04 |       2330 |         1.165571e+13 |
        |  2 | 2023-01-05 |       2330 |         1.188908e+13 |
        |  3 | 2023-01-06 |       2330 |         1.188908e+13 |
        |  4 | 2023-01-09 |       2330 |         1.247251e+13 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            market_value: int64
        }
        ```

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarketValue",
            "start_date": "2023-01-03",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarketValue",
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

!!! output
    === "DataFrame"
        |    | date       |   stock_id |     market_value |
        |---:|:-----------|-----------:|-----------------:|
        |  0 | 2023-01-03 |       0050 |     2.561094e+11 |
        |  1 | 2023-01-03 |       0051 |     7.967000e+08 |
        |  2 | 2023-01-03 |       0052 |     5.644650e+09 |
        |  3 | 2023-01-03 |       0053 |     2.611218e+08 |
        |  4 | 2023-01-03 |       0055 |     1.625804e+09 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            market_value: int64
        }
        ```


----------------------------------
#### 台灣股票下市櫃表 TaiwanStockDelisting

- 資料區間：2001-01-01 ~ now
- 資料更新時間 **星期一至五 23:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_delisting()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDelisting",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDelisting"
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
        |    | date       |   stock_id |   stock_name |
        |---:|:-----------|-----------:|-------------:|
        |  0 | 2005-10-04 |       1204 |          津津 |
        |  1 | 2001-11-01 |       1230 |      聯成食品 |
        |  2 | 2005-10-04 |       1306 |      合發興業 |
        |  3 | 2006-06-26 |       1408 |      中興紡織 |
        |  4 | 2002-11-08 |       1431 |      新燕實業 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            stock_name: str
        }
        ```


----------------------------------
#### 台股市值比重表 TaiwanStockMarketValueWeight (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：2024-10-30 ~ now
- 資料更新時間 **每月1,2,3,28,29,30,31 23:45**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_market_value_weight(
            stock_id='2330',
            start_date='2024-01-01',
            end_date='2025-01-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarketValueWeight",
            "data_id": "2330",
            "start_date": "2024-01-01",
            "end_date": "2025-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarketValueWeight",
                data_id= "2330",
                start_date= "2024-01-01",
                end_date= "2025-01-01"
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
        |    | rank |  stock_id  |  stock_name |  weight_per  |    date     |   type  |
        |---:|:-----|-----------:|------------:|-------------:|------------:|--------:|
        |  0 |   1  |    2330    |   台積電     |    36.8397   | 2024-10-30  |   twse  |
    === "Schema"
        ```
        {
            rank: int64,
            stock_id: str,
            stock_name: str,
            weight_per: float32,
            date: str,
            type: str
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_market_value_weight(
            start_date='2024-10-30',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarketValueWeight",
            "start_date": "2024-10-30",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarketValueWeight",
                start_date= "2024-10-30"
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
        |    | rank  |  stock_id  |  stock_name |  weight_per  |    date     |   type  |
        |---:|:------|-----------:|------------:|-------------:|------------:|--------:|
        |  0 |   43  |    1101    |   台泥       |    0.3327    | 2024-10-30  |   twse  |
        |  0 |   63  |    1102    |   亞泥       |    0.2282    | 2024-10-30  |   twse  |
        |  0 |   394 |    1103    |   嘉泥       |    0.0192    | 2024-10-30  |   twse  |
        |  0 |   305 |    1104    |   環泥       |    0.0286    | 2024-10-30  |   twse  |
        |  0 |   651 |    1108    |   幸福       |    0.0082    | 2024-10-30  |   twse  |
    === "Schema"
        ```
        {
            rank: int64,
            stock_id: str,
            stock_name: str,
            weight_per: float32,
            date: str,
            type: str
        }
        ```


----------------------------------
#### 台股分割後參考價 TaiwanStockSplitPrice

- 提供台股分割後參考價。
- 資料更新時間-星期一至五 18:00，實際更新時間以 API 資料為主。

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockSplitPrice",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockSplitPrice"
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
        |    | date       | stock_id   | type   |   before_price |   after_price |   max_price |   min_price |   open_price |
        |---:|:-----------|:-----------|:-------|---------------:|--------------:|------------:|------------:|-------------:|
        |  0 | 2024-12-11 | 00632R     | 反分割 |           3.28 |         22.96 |       25.25 |       20.67 |        22.96 |
        |  1 | 2025-02-19 | 00676R     | 反分割 |           2.04 |         12.23 |       13.45 |       11.01 |        12.23 |
        |  2 | 2025-06-11 | 00663L     | 分割   |         170.15 |         24.3  |       29.16 |       19.44 |        24.3  |
        |  3 | 2025-06-18 | 0050       | 分割   |         188.65 |         47.16 |       51.85 |       42.45 |        47.16 |
    === "Schema"
        ```
        {
            date: str
            stock_id: str
            type: str
            before_price: float
            after_price: float
            max_price: float
            min_price: float
            open_price: float
        }
        ```

----------------------------------
#### 台灣股票變更面額恢復買賣參考價格 TaiwanStockParValueChange

- 資料區間：2020-01-01 ~ now

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_par_value_change(
            start_date='2020-01-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockParValueChange",
            "start_date": "2020-01-01",
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
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockParValueChange",
                start_date= "2020-01-01"
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
        |    | date       |   stock_id | stock_name   | before_close | after_ref_close | after_ref_max | after_ref_min | after_ref_open |
        |---:|:-----------|-----------:|-------------:|-------------:|----------------:|-------------:|----------------:|-------------:|
        |  0 | 2020-08-17 |       8070 | 長華         |      190       |      19        |      20.9     |      17.1      |      19      |
        |  1 | 2021-10-18 |       6531 | 愛普         |      750       |     375        |     412.5     |     337.5      |     375      |
        |  2 | 2022-07-13 |       6415 | 矽力-K       |     2485       |     621.25     |     683       |     560        |     621      |
        |  3 | 2024-11-11 |       8476 | 台境         |       58.8     |      29.4      |      32.3     |      26.5      |      29.4    |
        |  4 | 2025-06-30 |       4763 | 材料-KY      |      885       |      88.5      |      97.3     |      79.7      |      88.5    |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            stock_name: str,
            before_close: float64,
            after_ref_close: float64,
            after_ref_max: float64,
            after_ref_min: float64,
            after_ref_open: float64
        }
        ```
