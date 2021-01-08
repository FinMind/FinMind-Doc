在台股籌碼面，我們擁有 7 種資料集，如下:


- [個股融資融劵表 TaiwanStockMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginpurchaseshortsale)
- [整體市場融資融劵表 TaiwanStockTotalMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktotalmarginpurchaseshortsale)
- [個股三大法人買賣表 TaiwanStockInstitutionalInvestorsBuySell](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockinstitutionalinvestorsbuysell)
- [整體市場三大法人買賣表 TaiwanStockTotalInstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocktotalinstitutionalinvestors)
- [外資持股表 TaiwanStockShareholding](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockshareholding)
- [股權持股分級表 TaiwanStockHoldingSharesPer](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockholdingsharesper)
- [借券成交明細 TaiwanStockSecuritiesLending](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstocksecuritieslending)

#### 融資融劵表 TaiwanStockMarginPurchaseShortSale

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMarginPurchaseShortSale",
            "data_id": "2330",
            "start_date": "2020-04-01",
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockMarginPurchaseShortSale",
            data_id= "2330",
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
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

#### 一次拿特定日期，所有資料(未來將只限贊助會員使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockMarginPurchaseShortSale",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        
            date stock_id  MarginPurchaseBuy  MarginPurchaseCashRepayment  ...  ShortSaleLimit  ShortSaleSell  ShortSaleTodayBalance  ShortSaleYesterdayBalance
        0  2020-04-01     0050                193                           15  ...          263750             13                   2283                       2336
        1  2020-04-01     0051                  0                            0  ...            2375              0                      0                          0
        2  2020-04-01     0052                  0                            0  ...            7500              0                      0                          0
        3  2020-04-01     0053                  0                            0  ...            1622              0                      0                          0
        4  2020-04-01     0054                  0                            0  ...            2531              0                      0                          0
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
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

                date stock_id MarginPurchaseBuy MarginPurchaseCashRepayment
        1: 2020-01-02     0050                20                           0
        2: 2020-01-02     0051                 0                           0
        3: 2020-01-02     0052                 3                           0
        4: 2020-01-02     0053                 0                           0
        5: 2020-01-02     0054                 0                           0
        6: 2020-01-02     0055                 0                           0
        MarginPurchaseLimit MarginPurchaseSell MarginPurchaseTodayBalance
        1:              171750                  6                        374
        2:                2375                  0                          3
        3:                8250                  1                         23
        4:                1372                  0                         52
        5:                2531                  0                          0
        6:                9163                  0                         25
        MarginPurchaseYesterdayBalance Note OffsetLoanAndShort ShortSaleBuy
        1:                            360                       0            1
        2:                              3                       0            0
        3:                             21                       0            0
        4:                             52                       0            0
        5:                              0   X                   0            0
        6:                             25                       0            0
        ShortSaleCashRepayment ShortSaleLimit ShortSaleSell
        1:                      0         171750             2
        2:                      0           2375             0
        3:                      0           8250             0
        4:                      0           1372             0
        5:                      0           2531             0
        6:                      0           9163             0
        ShortSaleTodayBalance ShortSaleYesterdayBalance
        1:                   172                       171
        2:                     0                         0
        3:                     0                         0
        4:                     4                         4
        5:                     0                         0
        6:                     1                         1
        ```



#### 台灣市場整體融資融劵表 TaiwanStockTotalMarginPurchaseShortSale

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockTotalMarginPurchaseShortSale",
            "start_date": "2020-04-01",
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockTotalMarginPurchaseShortSale",
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)


        TodayBalance YesBalance    buy       date           name   sell
        1:      7394954    7355321 173277 2019-01-02 MarginPurchase 129650
        2:      7359773    7394951 132298 2019-01-03 MarginPurchase 157962
        3:      7279580    7359772 156698 2019-01-04 MarginPurchase 230462
        4:      7297059    7279573 203646 2019-01-07 MarginPurchase 180036
        5:      7299390    7297056 133556 2019-01-08 MarginPurchase 127360
        6:      7243011    7299388 205733 2019-01-09 MarginPurchase 256017
        ```


#### 法人買賣表 TaiwanStockInstitutionalInvestorsBuySell

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockInstitutionalInvestorsBuySell",
            "data_id": "2330",
            "start_date": "2020-04-01",
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockInstitutionalInvestorsBuySell",
            data_id= "2330",
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)


                date stock_id        buy                name       sell
        1: 2019-01-02     2330   183000.0      Dealer_Hedging   344000.0
        2: 2019-01-02     2330   742000.0         Dealer_self  1375000.0
        3: 2019-01-02     2330        0.0 Foreign_Dealer_Self        0.0
        4: 2019-01-02     2330 13633825.0    Foreign_Investor 22365017.0
        5: 2019-01-02     2330   175000.0    Investment_Trust   166000.0
        6: 2019-01-03     2330  1114000.0      Dealer_Hedging    81000.0
        ```

#### 一次拿特定日期，所有資料(未來將只限贊助會員使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockInstitutionalInvestorsBuySell",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)

                    date stock_id      buy                 name     sell
        0     2020-04-01     0050  2050000       Dealer_Hedging   905000
        1     2020-04-01     0050        0          Dealer_self        0
        2     2020-04-01     0050        0  Foreign_Dealer_Self        0
        3     2020-04-01     0050   458249     Foreign_Investor  4492000
        4     2020-04-01     0050    54000     Investment_Trust        0
        ...          ...      ...      ...                  ...      ...
        8025  2020-04-01     9958   124000       Dealer_Hedging   199000
        8026  2020-04-01     9958        0          Dealer_self        0
        8027  2020-04-01     9958        0  Foreign_Dealer_Self        0
        8028  2020-04-01     9958   346000     Foreign_Investor  1002000
        8029  2020-04-01     9958   200000     Investment_Trust        0
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
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

                date stock_id    buy                name    sell
        1: 2020-01-02     0050 633000      Dealer_Hedging 1192000
        2: 2020-01-02     0050 197000         Dealer_self  357000
        3: 2020-01-02     0050      0 Foreign_Dealer_Self       0
        4: 2020-01-02     0050  41000    Foreign_Investor 1878000
        5: 2020-01-02     0050 291000    Investment_Trust       0
        6: 2020-01-02     0051  10000      Dealer_Hedging       0
        ```


#### 台灣市場整體法人買賣表 TaiwanStockTotalInstitutionalInvestors

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockTotalInstitutionalInvestors",
            "start_date": "2020-04-01",
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockTotalInstitutionalInvestors",
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

                buy       date                name        sell
        1:     3997640 2019-01-02 Foreign_Dealer_Self     7825870
        2: 21588186132 2019-01-02               total 31594136973
        3:     7084620 2019-01-03 Foreign_Dealer_Self     5933140
        4: 32376561148 2019-01-03               total 38612010183
        5:     6378810 2019-01-04 Foreign_Dealer_Self     5684420
        6: 38029457325 2019-01-04               total 43592013337
        ```

#### 股東結構表 TaiwanStockShareholding

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockShareholding",
            "data_id": "2330",
            "start_date": "2020-04-01",
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockShareholding",
            data_id= "2330",
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
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

#### 一次拿特定日期，所有資料(未來將只限贊助會員使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockShareholding",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date stock_id stock_name  ... NumberOfSharesIssued  RecentlyDeclareDate  note
        0  2020-04-01     0050     元大台灣50  ...           1055000000           2019-07-18      
        1  2020-04-01     0051    元大中型100  ...              9500000           2019-07-18      
        2  2020-04-01     0052       富邦科技  ...             30000000           2019-07-18      
        3  2020-04-01     0053       元大電子  ...              6488000           2019-07-18      
        4  2020-04-01     0054     元大台商50  ...             10124000           2019-07-18   
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
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

                date stock_id   stock_name InternationalCode
        1: 2020-01-02     0050   元大台灣50      TW0000050004
        2: 2020-01-02     0051  元大中型100      TW0000051002
        3: 2020-01-02     0052     富邦科技      TW0000052000
        4: 2020-01-02     0053     元大電子      TW0000053008
        5: 2020-01-02     0054   元大台商50      TW0000054006
        6: 2020-01-02     0055 元大MSCI金融      TW0000055003
        ForeignInvestmentRemainingShares ForeignInvestmentShares
        1:                        495506528               191493472
        2:                          9471000                   29000
        3:                         32955000                   45000
        4:                          5465000                   23000
        5:                          9957000                  167000
        6:                         35465000                 1189000
        ForeignInvestmentRemainRatio ForeignInvestmentSharesRatio
        1:                            0                            0
        2:                            0                            0
        3:                            0                            0
        4:                            0                            0
        5:                            0                            0
        6:                            0                            0
        ForeignInvestmentUpperLimitRatio ChineseInvestmentUpperLimitRatio
        1:                              100                              100
        2:                              100                              100
        3:                              100                              100
        4:                              100                              100
        5:                              100                              100
        6:                              100                              100
        NumberOfSharesIssued RecentlyDeclareDate note
        1:            687000000          2019-07-18     
        2:              9500000          2019-07-18     
        3:             33000000          2019-07-18     
        4:              5488000          2019-07-18     
        5:             10124000          2019-07-18     
        6:             36654000          2019-07-18     
        ```


#### 股東持股分級表 TaiwanStockHoldingSharesPer

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockHoldingSharesPer",
            "data_id": "2330",
            "start_date": "2020-04-01",
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockHoldingSharesPer",
            data_id= "2330",
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

                date stock_id HoldingSharesLevel   people percent      unit
        1: 2019-01-19     2330              1-999 144921.0    0.12  31366096
        2: 2019-01-19     2330        1,000-5,000 153113.0    1.19 311094603
        3: 2019-01-19     2330      10,001-15,000   9248.0    0.43 112987890
        4: 2019-01-19     2330    100,001-200,000   1585.0    0.85 220910983
        5: 2019-01-19     2330      15,001-20,000   4411.0    0.29  77704397
        6: 2019-01-19     2330      20,001-30,000   4715.0    0.44 115199487
        ```

#### 一次拿特定日期，所有資料(未來將只限贊助會員使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockHoldingSharesPer",
            "data_id": "2330",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)
                    date stock_id   HoldingSharesLevel  people  percent       unit
        0      2020-04-01     1101                1-999   78054     0.26   14398612
        1      2020-04-01     1101          1,000-5,000   84289     3.21  175508653
        2      2020-04-01     1101        10,001-15,000    7517     1.65   90220853
        3      2020-04-01     1101      100,001-200,000    1090     2.69  147442198
        4      2020-04-01     1101        15,001-20,000    3273     1.04   57295266
        ...           ...      ...                  ...     ...      ...        ...
        27595  2020-04-01     9962       50,001-100,000      80     6.29    5677217
        27596  2020-04-01     9962      600,001-800,000       3     2.30    2083808
        27597  2020-04-01     9962    800,001-1,000,000       1     0.91     826633
        27598  2020-04-01     9962  more than 1,000,001      17    51.01   46030201
        27599  2020-04-01     9962                total    4138   100.00   90220260
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
            start_date= "2020-04-01"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

                date stock_id HoldingSharesLevel people percent      unit
        1: 2020-04-01     1101              1-999  78054    0.26  14398612
        2: 2020-04-01     1101        1,000-5,000  84289    3.21 175508653
        3: 2020-04-01     1101      10,001-15,000   7517    1.65  90220853
        4: 2020-04-01     1101    100,001-200,000   1090    2.69 147442198
        5: 2020-04-01     1101      15,001-20,000   3273    1.04  57295266
        6: 2020-04-01     1101      20,001-30,000   3670    1.62  88740328
        ```


#### 借券成交明細 TaiwanStockSecuritiesLending

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockSecuritiesLending",
            "data_id": "2330",
            "start_date": "2020-04-01",
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanStockSecuritiesLending",
            data_id="2330",
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
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

#### 一次拿特定日期，所有資料(未來將只限贊助會員使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockSecuritiesLending",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)
                date stock_id transaction_type  volume  fee_rate  close original_return_date  original_lending_period
        0    2020-04-01     1101               競價     436      0.70   39.0           2020-09-30                      182
        1    2020-04-01     1101               議借     397      0.25   39.0           2020-09-30                      182
        2    2020-04-01     1101               議借     760      0.25   39.0           2020-09-30                      182
        3    2020-04-01     1102               議借     150      0.25   38.6           2020-09-30                      182
        4    2020-04-01     1102               議借     770      1.05   38.6           2020-09-30                      182
        ..          ...      ...              ...     ...       ...    ...                  ...                      ...
        500  2020-04-01     9938               議借      60      3.00   53.7           2020-09-30                      182
        501  2020-04-01     9938               議借      60      3.00   53.7           2020-09-30                      182
        502  2020-04-01     9944               議借      16     20.00   15.5           2020-09-30                      182
        503  2020-04-01     9958               競價      60      6.00   78.9           2020-09-30                      182
        504  2020-04-01     9958               競價      60      6.00   78.9           2020-09-30                      182
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
            start_date= "2020-01-02"
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

                date stock_id transaction_type volume fee_rate close original_return_date
        1: 2020-01-02     0050             競價    300      0.5 97.65           2020-07-01
        2: 2020-01-02     0050             競價    300      0.5 97.65           2020-07-01
        3: 2020-01-02     0052             競價     45        4  73.3           2020-07-02
        4: 2020-01-02     0052             競價     45        4  73.3           2020-07-02
        5: 2020-01-02   00633L             競價    150      1.5  51.1           2020-07-02
        6: 2020-01-02   00633L             競價    150      1.5  51.1           2020-07-02
        original_lending_period
        1:                     181
        2:                     181
        3:                     182
        4:                     182
        5:                     182
        6:                     182
        ```

