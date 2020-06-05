在台股籌碼面，我們擁有 7 種資料集，如下:


- [融資融劵表 TaiwanStockMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginpurchaseshortsale)
- [台灣市場整體融資融劵表 TotalMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#totalmarginpurchaseshortsale)
- [三大法人買賣表 InstitutionalInvestorsBuySell](https://finmind.github.io/tutor/TaiwanMarket/Chip/#institutionalinvestorsbuysell)
- [台灣市場整體法人買賣表 InstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/Chip/#institutionalinvestors)
- [股東結構表 Shareholding](https://finmind.github.io/tutor/TaiwanMarket/Chip/#shareholding)
- [股東持股分級表 TaiwanStockHoldingSharesPer](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockholdingsharesper)
- [借券成交明細 SecuritiesLending](https://finmind.github.io/tutor/TaiwanMarket/Chip/#securitieslending)

#### 融資融劵表 TaiwanStockMarginPurchaseShortSale

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v2/data"
        parameter = {
            "dataset": "TaiwanStockMarginPurchaseShortSale",
            "stock_id": "2330",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date stock_id MarginPurchaseBuy MarginPurchaseCashRepayment MarginPurchaseLimit  ... ShortSaleCashRepayment ShortSaleLimit ShortSaleSell ShortSaleTodayBalance ShortSaleYesterdayBalance
        0  2019-01-02     2330              1013                           7             6482595  ...                    0.0        6482595            66                  2782                      3179
        1  2019-01-03     2330               830                           0             6482595  ...                    0.0        6482595           133                  2475                      2782
        2  2019-01-04     2330              2153                           2             6482595  ...                    0.0        6482595           496                  2164                      2475
        3  2019-01-07     2330               296                           7             6482595  ...                    0.0        6482595           198                  2154                      2164
        4  2019-01-08     2330               264                           4             6482595  ...                    0.0        6482595           150                  2219                      2154
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v2/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanStockMarginPurchaseShortSale",
                            stock_id= "2330",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

                date stock_id MarginPurchaseBuy MarginPurchaseCashRepayment MarginPurchaseLimit
        1: 2019-01-02     2330              1013                           7             6482595
        2: 2019-01-03     2330               830                           0             6482595
        3: 2019-01-04     2330              2153                           2             6482595
        4: 2019-01-07     2330               296                           7             6482595
        5: 2019-01-08     2330               264                           4             6482595
        6: 2019-01-09     2330               173                          10             6482595
        MarginPurchaseSell MarginPurchaseTodayBalance MarginPurchaseYesterdayBalance Note OffsetLoanAndShort
        1:                221                      13389                          12604 None                  6
        2:                120                      14099                          13389 None                 16
        3:               1163                      15087                          14099 None                 25
        4:               1188                      14188                          15087 None                  7
        5:                201                      14247                          14188 None                  2
        6:               1147                      13263                          14247 None                  3
        ShortSaleBuy ShortSaleCashRepayment ShortSaleLimit ShortSaleSell ShortSaleTodayBalance
        1:          463                    0.0        6482595            66                  2782
        2:          440                    0.0        6482595           133                  2475
        3:          807                    0.0        6482595           496                  2164
        4:          208                    0.0        6482595           198                  2154
        5:           85                    0.0        6482595           150                  2219
        6:          136                    0.0        6482595           342                  2425
        ShortSaleYesterdayBalance
        1:                      3179
        2:                      2782
        3:                      2475
        4:                      2164
        5:                      2154
        6:                      2219
        ```


#### 台灣市場整體融資融劵表 TotalMarginPurchaseShortSale

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v2/data"
        parameter = {
            "dataset": "TotalMarginPurchaseShortSale",
            "stock_id": "2330",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        TodayBalance  YesBalance     buy        date            name    sell
        0       7394954     7355321  173277  2019-01-02  MarginPurchase  129650
        1       7359773     7394951  132298  2019-01-03  MarginPurchase  157962
        2       7279580     7359772  156698  2019-01-04  MarginPurchase  230462
        3       7297059     7279573  203646  2019-01-07  MarginPurchase  180036
        4       7299390     7297056  133556  2019-01-08  MarginPurchase  127360
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v2/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TotalMarginPurchaseShortSale",
                            stock_id= "2330",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

        TodayBalance YesBalance    buy       date           name   sell
        1:      7394954    7355321 173277 2019-01-02 MarginPurchase 129650
        2:      7359773    7394951 132298 2019-01-03 MarginPurchase 157962
        3:      7279580    7359772 156698 2019-01-04 MarginPurchase 230462
        4:      7297059    7279573 203646 2019-01-07 MarginPurchase 180036
        5:      7299390    7297056 133556 2019-01-08 MarginPurchase 127360
        6:      7243011    7299388 205733 2019-01-09 MarginPurchase 256017
        ```


#### 法人買賣表 InstitutionalInvestorsBuySell

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v2/data"
        parameter = {
            "dataset": "InstitutionalInvestorsBuySell",
            "stock_id": "2330",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date stock_id         buy                 name        sell
        0  2019-01-02     2330    183000.0       Dealer_Hedging    344000.0
        1  2019-01-02     2330    742000.0          Dealer_self   1375000.0
        2  2019-01-02     2330         0.0  Foreign_Dealer_Self         0.0
        3  2019-01-02     2330  13633825.0     Foreign_Investor  22365017.0
        4  2019-01-02     2330    175000.0     Investment_Trust    166000.0
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v2/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="InstitutionalInvestorsBuySell",
                            stock_id= "2330",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

                date stock_id        buy                name       sell
        1: 2019-01-02     2330   183000.0      Dealer_Hedging   344000.0
        2: 2019-01-02     2330   742000.0         Dealer_self  1375000.0
        3: 2019-01-02     2330        0.0 Foreign_Dealer_Self        0.0
        4: 2019-01-02     2330 13633825.0    Foreign_Investor 22365017.0
        5: 2019-01-02     2330   175000.0    Investment_Trust   166000.0
        6: 2019-01-03     2330  1114000.0      Dealer_Hedging    81000.0
        ```

#### 台灣市場整體法人買賣表 InstitutionalInvestors

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v2/data"
        parameter = {
            "dataset": "InstitutionalInvestors",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                buy        date                 name         sell
        0      3997640  2019-01-02  Foreign_Dealer_Self      7825870
        1  21588186132  2019-01-02                total  31594136973
        2      7084620  2019-01-03  Foreign_Dealer_Self      5933140
        3  32376561148  2019-01-03                total  38612010183
        4      6378810  2019-01-04  Foreign_Dealer_Self      5684420
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v2/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="InstitutionalInvestors",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

                buy       date                name        sell
        1:     3997640 2019-01-02 Foreign_Dealer_Self     7825870
        2: 21588186132 2019-01-02               total 31594136973
        3:     7084620 2019-01-03 Foreign_Dealer_Self     5933140
        4: 32376561148 2019-01-03               total 38612010183
        5:     6378810 2019-01-04 Foreign_Dealer_Self     5684420
        6: 38029457325 2019-01-04               total 43592013337
        ```

#### 股東結構表 Shareholding

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v2/data"
        parameter = {
            "dataset": "Shareholding",
            "stock_id": "2330",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date stock_id ChineseInvestmentUpperLimitRatio ForeignInvestmentRemainingShares ForeignInvestmentShares  ... InternationalCode NumberOfSharesIssued RecentlyDeclareDate  note stock_name
        0  2019-01-02     2330                            100.0                       5912146944             20018233344  ...      TW0002330008          25930381312          2018-05-28  None        台積電
        1  2019-01-03     2330                            100.0                       5931491328             19998887936  ...      TW0002330008          25930381312          2018-05-28  None        台積電
        2  2019-01-04     2330                            100.0                       5957547520             19972833280  ...      TW0002330008          25930381312          2018-05-28  None        台積電
        3  2019-01-07     2330                            100.0                       5953922560             19976458240  ...      TW0002330008          25930381312          2018-05-28  None        台積電
        4  2019-01-08     2330                            100.0                       5953176576             19977203712  ...      TW0002330008          25930381312          2018-05-28  None        台積電
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v2/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="Shareholding",
                            stock_id= "2330",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

                date stock_id ChineseInvestmentUpperLimitRatio ForeignInvestmentRemainingShares
        1: 2019-01-02     2330                            100.0                       5912146944
        2: 2019-01-03     2330                            100.0                       5931491328
        3: 2019-01-04     2330                            100.0                       5957547520
        4: 2019-01-07     2330                            100.0                       5953922560
        5: 2019-01-08     2330                            100.0                       5953176576
        6: 2019-01-10     2330                            100.0                       5944186368
        ForeignInvestmentShares ForeignInvestmentUpperLimitRatio InternationalCode NumberOfSharesIssued
        1:             20018233344                            100.0      TW0002330008          25930381312
        2:             19998887936                            100.0      TW0002330008          25930381312
        3:             19972833280                            100.0      TW0002330008          25930381312
        4:             19976458240                            100.0      TW0002330008          25930381312
        5:             19977203712                            100.0      TW0002330008          25930381312
        6:             19986194432                            100.0      TW0002330008          25930381312
        RecentlyDeclareDate note stock_name
        1:          2018-05-28 None     台積電
        2:          2018-05-28 None     台積電
        3:          2018-05-28 None     台積電
        4:          2018-05-28 None     台積電
        5:          2018-05-28 None     台積電
        6:          2018-05-28 None     台積電
        ```

#### 股東持股分級表 TaiwanStockHoldingSharesPer

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v2/data"
        parameter = {
            "dataset": "TaiwanStockHoldingSharesPer",
            "stock_id": "2330",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date stock_id HoldingSharesLevel    people percent       unit
        0  2019-01-19     2330              1-999  144921.0    0.12   31366096
        1  2019-01-19     2330        1,000-5,000  153113.0    1.19  311094603
        2  2019-01-19     2330      10,001-15,000    9248.0    0.43  112987890
        3  2019-01-19     2330    100,001-200,000    1585.0    0.85  220910983
        4  2019-01-19     2330      15,001-20,000    4411.0    0.29   77704397
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v2/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanStockHoldingSharesPer",
                            stock_id= "2330",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

                date stock_id HoldingSharesLevel   people percent      unit
        1: 2019-01-19     2330              1-999 144921.0    0.12  31366096
        2: 2019-01-19     2330        1,000-5,000 153113.0    1.19 311094603
        3: 2019-01-19     2330      10,001-15,000   9248.0    0.43 112987890
        4: 2019-01-19     2330    100,001-200,000   1585.0    0.85 220910983
        5: 2019-01-19     2330      15,001-20,000   4411.0    0.29  77704397
        6: 2019-01-19     2330      20,001-30,000   4715.0    0.44 115199487
        ```

#### 借券成交明細 SecuritiesLending

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v2/data"
        parameter = {
            "dataset": "SecuritiesLending",
            "stock_id": "2330",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date stock_id transaction_type volume fee_rate  close original_return_date original_lending_period
        0  2019-01-02     2330               競價    122      0.1  219.5           2019-07-02                     181
        1  2019-01-03     2330               議借    600     0.17  215.5           2019-07-03                     181
        2  2019-01-04     2330               競價    178      0.1  208.0           2019-07-04                     181
        3  2019-01-07     2330               競價     64      0.1  213.0           2019-07-05                     179
        4  2019-01-08     2330               議借    450     0.59  211.0           2019-07-08                     181
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'http://api.finmindtrade.com/api/v2/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="SecuritiesLending",
                            stock_id="2330",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

                date stock_id transaction_type volume fee_rate close original_return_date
        1: 2019-01-02     2330             競價    122      0.1 219.5           2019-07-02
        2: 2019-01-03     2330             議借    600     0.17 215.5           2019-07-03
        3: 2019-01-04     2330             競價    178      0.1 208.0           2019-07-04
        4: 2019-01-07     2330             競價     64      0.1 213.0           2019-07-05
        5: 2019-01-08     2330             議借    450     0.59 211.0           2019-07-08
        6: 2019-01-09     2330             議借   3000     0.59 215.5           2019-07-09
        original_lending_period
        1:                     181
        2:                     181
        3:                     181
        4:                     179
        5:                     181
        6:                     181
        ```
