
在台股基本面，我們擁有 6 種資料集，如下:

- [綜合損益表 TaiwanStockFinancialStatements](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockfinancialstatements)
- [資產負債表 TaiwanStockBalanceSheet](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockbalancesheet)
- [現金流量表 TaiwanCashFlowsStatement](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwancashflowsstatement)
- [股利政策表 TaiwanStockDividend](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdividend)
- [除權除息結果表 TaiwanStockDividendResult](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockdividendresult)
- [月營收表 TaiwanStockMonthRevenue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue)

#### 綜合損益表 TaiwanStockFinancialStatements

!!! example
    === "Python"
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

                date stock_id                                type         value     origin_name
        0  2019-03-31     2330                     CostOfGoodsSold  1.283520e+11            營業成本
        1  2019-03-31     2330                                 EPS  2.370000e+00       基本每股盈餘（元）
        2  2019-03-31     2330  EquityAttributableToOwnersOfParent  6.139390e+10  淨利（淨損）歸屬於母公司業主
        3  2019-03-31     2330                         GrossProfit  9.035210e+10        營業毛利（毛損）
        4  2019-03-31     2330                    IncomeAfterTaxes  6.138730e+10        本期淨利（淨損）
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
                date stock_id            type          value                                  origin_name
        1: 2019-03-31     2330            ASSO    433491000.0 採用權益法認列之關聯企業及合資損益之份額淨額
        2: 2019-03-31     2330 CostOfGoodsSold 128352000000.0                                 營業成本合計
        3: 2019-03-31     2330             EPS           2.37                                 基本每股盈餘
        4: 2019-03-31     2330            EXDF   3218080000.0           國外營運機構財務報表換算之兌換差額
        5: 2019-03-31     2330   FinancialCost    899065000.0                                 財務成本淨額
        6: 2019-03-31     2330     GrossProfit  90352100000.0                               營業毛利(毛損)
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
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

                    date stock_id                                 type         value    origin_name
        0      2019-03-31   000116                                  EPS  2.400000e-01      基本每股盈餘（元）
        1      2019-03-31   000116   EquityAttributableToOwnersOfParent  2.741590e+08  淨利（損）歸屬於母公司業主
        2      2019-03-31   000116                              Expense  8.954980e+08          支出及費用
        3      2019-03-31   000116                               Income  1.077910e+09             收益
        4      2019-03-31   000116                     IncomeAfterTaxes  2.743220e+08       本期淨利（淨損）
        ...           ...      ...                                  ...           ...            ...
        27267  2019-03-31     9960  TotalConsolidatedProfitForThePeriod  1.534400e+07       本期綜合損益總額
        27268  2019-03-31     9960    TotalNonoperatingIncomeAndExpense  5.408000e+06       營業外收入及支出
        27269  2019-03-31     9962                      CostOfGoodsSold  5.369030e+08           營業成本
        27270  2019-03-31     9962                                  EPS -1.400000e-01      基本每股盈餘（元）
        27271  2019-03-31     9962                          GrossProfit  2.721000e+06       營業毛利（毛損）
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
                date stock_id            type          value                                  origin_name
        1: 2019-03-31     2330            ASSO    433491000.0 採用權益法認列之關聯企業及合資損益之份額淨額
        2: 2019-03-31     2330 CostOfGoodsSold 128352000000.0                                 營業成本合計
        3: 2019-03-31     2330             EPS           2.37                                 基本每股盈餘
        4: 2019-03-31     2330            EXDF   3218080000.0           國外營運機構財務報表換算之兌換差額
        5: 2019-03-31     2330   FinancialCost    899065000.0                                 財務成本淨額
        6: 2019-03-31     2330     GrossProfit  90352100000.0                               營業毛利(毛損)
        ```


#### 資產負債表 TaiwanStockBalanceSheet

!!! example
    === "Python"
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

                date stock_id                                        type          value origin_name
        0  2019-03-31     2330                             AccountsPayable  27100909000.0        應付帳款
        1  2019-03-31     2330                         AccountsPayable_per            1.0        應付帳款
        2  2019-03-31     2330             AccountsPayableToRelatedParties    560941000.0    應付帳款－關係人
        3  2019-03-31     2330         AccountsPayableToRelatedParties_per            0.0    應付帳款－關係人
        4  2019-03-31     2330  AccountsReceivableDuefromRelatedPartiesNet    309821000.0  應收帳款－關係人淨額
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

                date stock_id                                           type         value          origin_name
        1: 2019-03-31     2330                                AccountsPayable 27100909000.0             應付帳款
        2: 2019-03-31     2330                            AccountsPayable_per           1.0             應付帳款
        3: 2019-03-31     2330                AccountsPayableToRelatedParties   560941000.0     應付帳款－關係人
        4: 2019-03-31     2330            AccountsPayableToRelatedParties_per           0.0     應付帳款－關係人
        5: 2019-03-31     2330     AccountsReceivableDuefromRelatedPartiesNet   309821000.0 應收帳款－關係人淨額
        6: 2019-03-31     2330 AccountsReceivableDuefromRelatedPartiesNet_per           0.0 應收帳款－關係人淨額
        ```


#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
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

                date stock_id                                        type          value origin_name
        0  2019-03-31     2330                             AccountsPayable  27100909000.0        應付帳款
        1  2019-03-31     2330                         AccountsPayable_per            1.0        應付帳款
        2  2019-03-31     2330             AccountsPayableToRelatedParties    560941000.0    應付帳款－關係人
        3  2019-03-31     2330         AccountsPayableToRelatedParties_per            0.0    應付帳款－關係人
        4  2019-03-31     2330  AccountsReceivableDuefromRelatedPartiesNet    309821000.0  應收帳款－關係人淨額
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

                date stock_id                                           type         value          origin_name
        1: 2019-03-31     2330                                AccountsPayable 27100909000.0             應付帳款
        2: 2019-03-31     2330                            AccountsPayable_per           1.0             應付帳款
        3: 2019-03-31     2330                AccountsPayableToRelatedParties   560941000.0     應付帳款－關係人
        4: 2019-03-31     2330            AccountsPayableToRelatedParties_per           0.0     應付帳款－關係人
        5: 2019-03-31     2330     AccountsReceivableDuefromRelatedPartiesNet   309821000.0 應收帳款－關係人淨額
        6: 2019-03-31     2330 AccountsReceivableDuefromRelatedPartiesNet_per           0.0 應收帳款－關係人淨額
        ```



#### 現金流量表 TaiwanStockCashFlowsStatement

!!! example
    === "Python"
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

                date stock_id                           type           value     origin_name
        0  2019-03-31     2330                AccountsPayable    6105110000.0      應付帳款增加(減少)
        1  2019-03-31     2330            AmortizationExpense    1355340000.0            攤銷費用
        2  2019-03-31     2330      AmountDueToRelatedParties     815558000.0  應付帳款-關係人增加(減少)
        3  2019-03-31     2330  CashBalancesBeginningOfPeriod  577815000000.0     期初現金及約當現金餘額
        4  2019-03-31     2330        CashBalancesEndOfPeriod  645671000000.0     期末現金及約當現金餘額
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

                date stock_id                          type          value                      origin_name
        1: 2019-03-31     2330               AccountsPayable   6105110000.0               應付帳款增加(減少)
        2: 2019-03-31     2330           AmortizationExpense   1355340000.0                         攤銷費用
        3: 2019-03-31     2330     AmountDueToRelatedParties    815558000.0        應付帳款-關係人增加(減少)
        4: 2019-03-31     2330 CashBalancesBeginningOfPeriod 577815000000.0           期初現金及約當現金餘額
        5: 2019-03-31     2330       CashBalancesEndOfPeriod 645671000000.0           期末現金及約當現金餘額
        6: 2019-03-31     2330          CashBalancesIncrease  67855900000.0 本期現金及約當現金增加（減少）數
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
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

                date stock_id                           type           value     origin_name
        0  2019-03-31     2330                AccountsPayable    6105110000.0      應付帳款增加(減少)
        1  2019-03-31     2330            AmortizationExpense    1355340000.0            攤銷費用
        2  2019-03-31     2330      AmountDueToRelatedParties     815558000.0  應付帳款-關係人增加(減少)
        3  2019-03-31     2330  CashBalancesBeginningOfPeriod  577815000000.0     期初現金及約當現金餘額
        4  2019-03-31     2330        CashBalancesEndOfPeriod  645671000000.0     期末現金及約當現金餘額
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

                date stock_id                          type          value                      origin_name
        1: 2019-03-31     2330               AccountsPayable   6105110000.0               應付帳款增加(減少)
        2: 2019-03-31     2330           AmortizationExpense   1355340000.0                         攤銷費用
        3: 2019-03-31     2330     AmountDueToRelatedParties    815558000.0        應付帳款-關係人增加(減少)
        4: 2019-03-31     2330 CashBalancesBeginningOfPeriod 577815000000.0           期初現金及約當現金餘額
        5: 2019-03-31     2330       CashBalancesEndOfPeriod 645671000000.0           期末現金及約當現金餘額
        6: 2019-03-31     2330          CashBalancesIncrease  67855900000.0 本期現金及約當現金增加（減少）數
        ```


#### 股利政策表 TaiwanStockDividend

!!! example
    === "Python"
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

                date stock_id     year StockEarningsDistribution  ... RemunerationOfDirectorsAndSupervisors ParticipateDistributionOfTotalShares AnnouncementDate    AnnouncementTime
        0  2019-06-30     2330     107年                      None  ...                                  None                          25930380458       2019-06-06  15:47:30.000000000
        1  2019-09-25     2330  108年第1季                      None  ...                                  None                          25930380458       2019-07-09  18:33:02.000000000
        2  2019-12-25     2330  108年第2季                      None  ...                                  None                          25930380458       2019-08-14  15:27:02.000000000
        3  2020-03-25     2330  108年第3季                      None  ...                                  None                          25930380458       2019-11-14  17:01:07.000000000
        4  2020-06-24     2330  108年第4季                      None  ...                                  None                          25930380458       2020-02-14  15:10:50.000000000
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

                date stock_id       year StockEarningsDistribution StockStatutorySurplus
        1: 2019-06-30     2330      107年                      None                  None
        2: 2019-09-25     2330 108年第1季                      None                  None
        3: 2019-12-25     2330 108年第2季                      None                  None
        4: 2020-03-25     2330 108年第3季                      None                  None
        5: 2020-06-24     2330 108年第4季                      None                  None
        6: 2020-09-23     2330 109年第1季                      None                  None
        StockExDividendTradingDate TotalEmployeeStockDividend TotalEmployeeStockDividendAmount
        1:                       None                       None                             None
        2:                       None                       None                             None
        3:                       None                       None                             None
        4:                       None                       None                             None
        5:                       None                       None                             None
        6:                       None                       None                             None
        RatioOfEmployeeStockDividendOfTotal RatioOfEmployeeStockDividend CashEarningsDistribution
        1:                                None                         None                      8.0
        2:                                None                         None                      2.0
        3:                                None                         None                      2.5
        4:                                None                         None                      2.5
        5:                                None                         None                      2.5
        6:                                None                         None                      2.5
        CashStatutorySurplus CashExDividendTradingDate CashDividendPaymentDate TotalEmployeeCashDividend
        1:                 None                2019-06-24              2019-07-18                      None
        2:                 None                2019-09-19              2019-10-17                      None
        3:                 None                2019-12-19              2020-01-16                      None
        4:                 None                2020-03-19              2020-04-16                      None
        5:                 None                2020-06-18              2020-07-16                      None
        6:                 None                2020-09-17              2020-10-15                      None
        TotalNumberOfCashCapitalIncrease CashIncreaseSubscriptionRate CashIncreaseSubscriptionpRrice
        1:                             None                         None                           None
        2:                             None                         None                           None
        3:                             None                         None                           None
        4:                             None                         None                           None
        5:                             None                         None                           None
        6:                             None                         None                           None
        RemunerationOfDirectorsAndSupervisors ParticipateDistributionOfTotalShares AnnouncementDate
        1:                                  None                          25930380458       2019-06-06
        2:                                  None                          25930380458       2019-07-09
        3:                                  None                          25930380458       2019-08-14
        4:                                  None                          25930380458       2019-11-14
        5:                                  None                          25930380458       2020-02-14
        6:                                  None                          25930380458       2020-05-14
            AnnouncementTime
        1: 15:47:30.000000000
        2: 18:33:02.000000000
        3: 15:27:02.000000000
        4: 17:01:07.000000000
        5: 15:10:50.000000000
        6: 10:51:55.000000000
        ```


#### 除權除息結果表 TaiwanStockDividendResult

!!! example
    === "Python"
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

                date stock_id  before_price  after_price  stock_and_cache_dividend stock_or_cache_dividend  max_price  min_price  open_price  reference_price
        0  2019-06-24     2330         248.5        240.5                       8.0                       息      264.5      216.5       240.5            240.5
        1  2019-09-19     2330         267.0        265.0                       2.0                       息      291.5      238.5       265.0            265.0
        2  2019-12-19     2330         344.5        342.0                       2.5                       息      376.0      308.0       342.0            342.0
        3  2020-03-19     2330         260.0        257.5                       2.5                       息      283.0      232.0       257.5            257.5
        4  2020-06-18     2330         315.0        312.5                       2.5                       息      343.5      281.5       312.5            312.5
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

                date stock_id before_price after_price stock_and_cache_dividend
        1: 2019-06-24     2330        248.5       240.5                        8
        2: 2019-09-19     2330          267         265                        2
        3: 2019-12-19     2330        344.5         342                      2.5
        4: 2020-03-19     2330          260       257.5                      2.5
        5: 2020-06-18     2330          315       312.5                      2.5
        6: 2020-09-17     2330          458       455.5                      2.5
        stock_or_cache_dividend max_price min_price open_price reference_price
        1:                      息     264.5     216.5      240.5           240.5
        2:                      息     291.5     238.5        265             265
        3:                      息       376       308        342             342
        4:                      息       283       232      257.5           257.5
        5:                      息     343.5     281.5      312.5           312.5
        6:                      息       501       410      455.5           455.5
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
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

                date stock_id  before_price  after_price  stock_and_cache_dividend stock_or_cache_dividend  max_price  min_price  open_price  reference_price
        0  2019-06-24   00697B         42.48        42.21                      0.27                      除息    9999.95       0.01       42.21            42.21
        1  2019-06-24   00751B         46.05        45.46                      0.59                      除息    9999.95       0.01       45.46            45.46
        2  2019-06-24     1707        220.00       213.50                      6.50                       息     234.50     192.50      213.50           213.50
        3  2019-06-24     1711         17.00        16.50                      0.50                       息      18.15      14.85       16.50            16.50
        4  2019-06-24     1906         13.55        13.05                      0.50                       息      14.35      11.75       13.05            13.05
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

                date stock_id before_price after_price stock_and_cache_dividend
        1: 2019-06-24   00697B        42.48       42.21                     0.27
        2: 2019-06-24   00751B        46.05       45.46                     0.59
        3: 2019-06-24     1707          220       213.5                      6.5
        4: 2019-06-24     1711           17        16.5                      0.5
        5: 2019-06-24     1906        13.55       13.05                      0.5
        6: 2019-06-24     2107        17.95       17.27                     0.68
        stock_or_cache_dividend max_price min_price open_price reference_price
        1:                    除息   9999.95      0.01      42.21           42.21
        2:                    除息   9999.95      0.01      45.46           45.46
        3:                      息     234.5     192.5      213.5           213.5
        4:                      息     18.15     14.85       16.5            16.5
        5:                      息     14.35     11.75      13.05           13.05
        6:                      息     18.95     15.55      17.25           17.27
        ```
   

#### 月營收表 TaiwanStockMonthRevenue

!!! example
    === "Python"
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

                date stock_id country      revenue revenue_month revenue_year
        0  2019-01-01     2330  Taiwan  89830598000            12         2018
        1  2019-02-01     2330  Taiwan  78093827000             1         2019
        2  2019-03-01     2330  Taiwan  60889055000             2         2019
        3  2019-04-01     2330  Taiwan  79721587000             3         2019
        4  2019-05-01     2330  Taiwan  74693615000             4         2019
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
        
                date stock_id country     revenue revenue_month revenue_year
        1: 2019-02-01     2330  Taiwan 78093827000             1         2019
        2: 2019-03-01     2330  Taiwan 60889055000             2         2019
        3: 2019-04-01     2330  Taiwan 79721587000             3         2019
        4: 2019-05-01     2330  Taiwan 74693615000             4         2019
        5: 2019-06-01     2330  Taiwan 80436931000             5         2019
        6: 2019-07-01     2330  Taiwan 85867929000             6         2019
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
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

                date stock_id country      revenue  revenue_month  revenue_year
        0  2019-01-01     1101  Taiwan  11404254000             12          2018
        1  2019-01-01     1102  Taiwan   6548928000             12          2018
        2  2019-01-01     1103  Taiwan    234983000             12          2018
        3  2019-01-01     1104  Taiwan    465496000             12          2018
        4  2019-01-01     1108  Taiwan    300034000             12          2018
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
        
                date stock_id country     revenue revenue_month revenue_year
        1: 2019-01-01     1101  Taiwan 11404254000            12         2018
        2: 2019-01-01     1102  Taiwan  6548928000            12         2018
        3: 2019-01-01     1103  Taiwan   234983000            12         2018
        4: 2019-01-01     1104  Taiwan   465496000            12         2018
        5: 2019-01-01     1108  Taiwan   300034000            12         2018
        6: 2019-01-01     1109  Taiwan   707952000            12         2018
        ```
