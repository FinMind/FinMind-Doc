
在台股基本面，我們擁有 6 種資料集，如下:

- [綜合損益表 FinancialStatements](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#financialstatements)
- [資產負債表 BalanceSheet](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#balancesheet)
- [現金流量表 TaiwanCashFlowsStatement](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwancashflowsstatement)
- [股利政策表 StockDividend](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#stockdividend)
- [除權除息結果表 StockDividendResult](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#stockdividendresult)
- [月營收表 TaiwanStockMonthRevenue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue)

#### 綜合損益表 FinancialStatements

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "FinancialStatements",
            "stock_id": "2330",
            "date": "2019-01-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

                date stock_id             type           value             origin_name
        0  2019-03-31     2330             ASSO     433491000.0  採用權益法認列之關聯企業及合資損益之份額淨額
        1  2019-03-31     2330  CostOfGoodsSold  128352000000.0                  營業成本合計
        2  2019-03-31     2330              EPS            2.37                  基本每股盈餘
        3  2019-03-31     2330             EXDF    3218080000.0       國外營運機構財務報表換算之兌換差額
        4  2019-03-31     2330    FinancialCost     899065000.0                  財務成本淨額
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="FinancialStatements",
                            stock_id="2330",
                            date= "2019-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)
                date stock_id            type          value                                  origin_name
        1: 2019-03-31     2330            ASSO    433491000.0 採用權益法認列之關聯企業及合資損益之份額淨額
        2: 2019-03-31     2330 CostOfGoodsSold 128352000000.0                                 營業成本合計
        3: 2019-03-31     2330             EPS           2.37                                 基本每股盈餘
        4: 2019-03-31     2330            EXDF   3218080000.0           國外營運機構財務報表換算之兌換差額
        5: 2019-03-31     2330   FinancialCost    899065000.0                                 財務成本淨額
        6: 2019-03-31     2330     GrossProfit  90352100000.0                               營業毛利(毛損)
        ```


#### 資產負債表 BalanceSheet

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "BalanceSheet",
            "stock_id": "2330",
            "date": "2019-01-01",
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
        url = 'http://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="BalanceSheet",
                            stock_id="2330",
                            date= "2019-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)
                date stock_id                                           type         value          origin_name
        1: 2019-03-31     2330                                AccountsPayable 27100909000.0             應付帳款
        2: 2019-03-31     2330                            AccountsPayable_per           1.0             應付帳款
        3: 2019-03-31     2330                AccountsPayableToRelatedParties   560941000.0     應付帳款－關係人
        4: 2019-03-31     2330            AccountsPayableToRelatedParties_per           0.0     應付帳款－關係人
        5: 2019-03-31     2330     AccountsReceivableDuefromRelatedPartiesNet   309821000.0 應收帳款－關係人淨額
        6: 2019-03-31     2330 AccountsReceivableDuefromRelatedPartiesNet_per           0.0 應收帳款－關係人淨額
        ```


#### 現金流量表 TaiwanCashFlowsStatement

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanCashFlowsStatement",
            "stock_id": "2330",
            "date": "2019-01-01",
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
        url = 'http://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanCashFlowsStatement",
                            stock_id="2330",
                            date= "2019-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)
                date stock_id                          type          value                      origin_name
        1: 2019-03-31     2330               AccountsPayable   6105110000.0               應付帳款增加(減少)
        2: 2019-03-31     2330           AmortizationExpense   1355340000.0                         攤銷費用
        3: 2019-03-31     2330     AmountDueToRelatedParties    815558000.0        應付帳款-關係人增加(減少)
        4: 2019-03-31     2330 CashBalancesBeginningOfPeriod 577815000000.0           期初現金及約當現金餘額
        5: 2019-03-31     2330       CashBalancesEndOfPeriod 645671000000.0           期末現金及約當現金餘額
        6: 2019-03-31     2330          CashBalancesIncrease  67855900000.0 本期現金及約當現金增加（減少）數
        ```

#### 股利政策表 StockDividend

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "StockDividend",
            "stock_id": "2330",
            "date": "2019-01-01",
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
        url = 'http://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="StockDividend",
                            stock_id="2330",
                            date= "2019-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
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


#### 除權除息結果表 StockDividendResult

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "StockDividendResult",
            "stock_id": "2330",
            "date": "2019-01-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

                date stock_id          type   value
        0  2019-06-24     2330   after_price  240.50
        1  2019-06-24     2330  before_price  248.50
        2  2019-06-24     2330     max_price  264.50
        3  2019-06-24     2330     min_price  216.50
        4  2019-06-24     2330    open_price  240.50
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="StockDividendResult",
                            stock_id="2330",
                            date= "2019-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)
                date stock_id            type  value
        1: 2019-06-24     2330     after_price 240.50
        2: 2019-06-24     2330    before_price 248.50
        3: 2019-06-24     2330       max_price 264.50
        4: 2019-06-24     2330       min_price 216.50
        5: 2019-06-24     2330      open_price 240.50
        6: 2019-06-24     2330 reference_price 240.50
        ```

#### 月營收表 TaiwanStockMonthRevenue

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "StockDividendResult",
            "stock_id": "2330",
            "date": "2019-01-01",
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
        url = 'http://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="StockDividendResult",
                            stock_id="2330",
                            date= "2019-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)
                date stock_id country     revenue revenue_month revenue_year
        1: 2019-02-01     2330  Taiwan 78093827000             1         2019
        2: 2019-03-01     2330  Taiwan 60889055000             2         2019
        3: 2019-04-01     2330  Taiwan 79721587000             3         2019
        4: 2019-05-01     2330  Taiwan 74693615000             4         2019
        5: 2019-06-01     2330  Taiwan 80436931000             5         2019
        6: 2019-07-01     2330  Taiwan 85867929000             6         2019
        ```