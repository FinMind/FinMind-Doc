在台股技術面，我們擁有 6 種資料集，如下:

- [台灣股價資料表 TaiwanStockPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockprice)
- [台灣股價及時資料表 TaiwanStockPriceMinute](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpriceminute)
- [台灣即時最佳五檔 TaiwanStockPriceMinuteBidAsk]((https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpriceminutebidask))
- [台灣個股PER、PBR資料表 TaiwanStockPER](https://finmind.github.io/tutor/TaiwanMarket/Technical/#perpbr-taiwanstockper)
- [每5秒委託成交統計 StatisticsOfOrderBookAndTrade](https://finmind.github.io/tutor/TaiwanMarket/Technical/#StatisticsOfOrderBookAndTrade)
- [台股加權指數 TaiwanVariousIndicators5Seconds](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanVariousIndicators5Seconds)

另外針對資料集整理出的列表如下:

- [台灣股票清單列表 TaiwanStockInfo](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v2_data_get)

#### 台灣股票清單列表 TaiwanStockInfo

- 這張資料表主要是列出台灣所有上市上櫃的股票名稱，代碼和產業類別

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanStockInfo",
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        industry_category stock_id stock_name  type
        0               ETF     0050     元大台灣50  twse
        1               ETF     0051    元大中型100  twse
        2               ETF     0052       富邦科技  twse
        3               ETF     0053       元大電子  twse
        4               ETF     0054     元大台商50  twse
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
            query = list(
                dataset = "TaiwanStockInfo"
            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
            nrow=length(unlist(data$data[1]))
            ))
        colnames(df) = names(data$data)
        head(df)

        industry_category stock_id   stock_name type
        1:               ETF     0050   元大台灣50 twse
        2:               ETF     0051  元大中型100 twse
        3:               ETF     0052     富邦科技 twse
        4:               ETF     0053     元大電子 twse
        5:               ETF     0054   元大台商50 twse
        6:               ETF     0055 元大MSCI金融 twse
        ```

#### 台灣股價資料表 TaiwanStockPrice

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanStockPrice",
            "stock_id": "2330",
            "date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

                date stock_id  Trading_Volume  Trading_money   open    max    min  close  spread  Trading_turnover
        0  2020-04-06     2330        59712754    16324198154  273.0  275.5  270.0  275.5    -1.0             19971
        1  2020-04-07     2330        48887346    13817936851  283.5  284.0  280.5  283.0    -1.0             24281
        2  2020-04-08     2330        38698826    11016972354  285.0  285.5  283.0  285.0    -1.0             19126
        3  2020-04-09     2330        29276430     8346209654  287.5  288.0  282.5  283.0    -1.0             15271
        4  2020-04-10     2330        28206858     7894277586  280.0  282.0  279.0  279.5    -1.0             15833
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanStockPrice",
                            stock_id= "2330",
                            date= "2020-04-02",
                            end_date= "2020-04-08"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

        date stock_id Trading_Volume Trading_money  open   max   min close spread Trading_turnover
        1: 2020-04-06     2330       59712754   16324198154 273.0 275.5 270.0 275.5    4.0            19971
        2: 2020-04-07     2330       48887346   13817936851 283.5 284.0 280.5 283.0    7.5            24281
        3: 2020-04-08     2330       38698826   11016972354 285.0 285.5 283.0 285.0    2.0            19126
        ```



#### 台灣即時股價資料表 TaiwanStockPriceMinute

- 輸入 dataset、stock_id 參數，會回傳當天最近 100 筆即時資料。
- 輸入 dataset、stock_id、date，會回傳 date 當天 data。

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd

        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanStockPriceMinute",
            "stock_id": "2330"
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

                        date stock_id  deal_price  volume
        0  2020-01-02 09:00:00     2330       332.5     520
        1  2020-01-02 09:00:05     2330       333.0      45
        2  2020-01-02 09:00:10     2330       333.0      22
        3  2020-01-02 09:00:15     2330       333.0      15
        4  2020-01-02 09:00:20     2330       333.5       3
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanStockPriceMinute",
                            stock_id= "2330"
                            )
        )
        data = content(response)
        df = do.call('cbind',data$data) %>%
        data.table
        head(df)

                date stock_id deal_price volume               Time
        1: 2020-01-02     2330      332.5    520 09:00:00.000000000
        2: 2020-01-02     2330      333.0     45 09:00:05.000000000
        3: 2020-01-02     2330      333.0     22 09:00:10.000000000
        4: 2020-01-02     2330      333.0     15 09:00:15.000000000
        5: 2020-01-02     2330      333.5      3 09:00:20.000000000
        6: 2020-01-02     2330      333.0     20 09:00:25.000000000
        ```

#### 台灣即時最佳五檔 TaiwanStockPriceMinuteBidAsk

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd

        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanStockPriceMinuteBidAsk",
            "stock_id": "2330",
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()["data"]
        if data['date'] == []:
            data.pop('date', None)
        data = pd.DataFrame(data)
        print(data.head())
        stock_id                             AskPrice                  AskVolume                             BidPrice                    BidVolume             Time
        0     2330  [292.5, 293.0, 293.5, 294.0, 294.5]  [174, 452, 245, 602, 291]  [292.0, 291.5, 291.0, 290.5, 290.0]  [67, 236, 1109, 1505, 7097]  13:24:54.559711
        1     2330  [292.5, 293.0, 293.5, 294.0, 294.5]  [174, 452, 245, 602, 291]  [292.0, 291.5, 291.0, 290.5, 290.0]  [67, 236, 1112, 1505, 7097]  13:24:54.568170
        2     2330  [292.5, 293.0, 293.5, 294.0, 294.5]  [174, 452, 245, 602, 291]  [292.0, 291.5, 291.0, 290.5, 290.0]  [67, 236, 1114, 1505, 7097]  13:24:54.592893
        3     2330  [292.5, 293.0, 293.5, 294.0, 294.5]  [174, 452, 245, 602, 291]  [292.0, 291.5, 291.0, 290.5, 290.0]  [67, 236, 1114, 1506, 7097]  13:24:54.598656
        4     2330  [292.5, 293.0, 293.5, 294.0, 294.5]  [174, 452, 245, 602, 291]  [292.0, 291.5, 291.0, 290.5, 290.0]  [67, 236, 1116, 1506, 7097]  13:24:54.907709
        ```

#### 台灣個股PER、PBR資料表 TaiwanStockPER

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanStockPER",
            "stock_id": "2330",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date stock_id dividend_yield    PER   PBR
        0  2020-04-01     2330            3.5  20.38  4.34
        1  2020-04-06     2330           3.45  20.68  4.41
        2  2020-04-07     2330           3.36  21.25  4.53
        3  2020-04-08     2330           3.33   21.4  4.56
        4  2020-04-09     2330           3.36  21.25  4.53
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanStockPER",
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

                date stock_id dividend_yield   PER  PBR
        1: 2020-01-02     2330           2.36 26.69 5.54
        2: 2020-01-03     2330           2.36 26.73 5.55
        3: 2020-01-06     2330           2.41 26.14 5.42
        4: 2020-01-07     2330           2.43 25.94 5.38
        5: 2020-01-08     2330           2.43 25.94 5.38
        6: 2020-01-09     2330           2.37 26.57 5.51
        ```


#### 每5秒委託成交統計 StatisticsOfOrderBookAndTrade
(由於資料量過大，只提供 date 當天 data)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "StatisticsOfOrderBookAndTrade",
            "date": "2020-04-01",
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
        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="StatisticsOfOrderBookAndTrade",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)
        ```


#### 台股加權指數 TaiwanVariousIndicators5Seconds

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanVariousIndicators5Seconds",
            "date": "2020-07-01",
            "end_date": "2020-07-27",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                        date    TAIEX
        0  2020-07-01 09:00:00  11621.2
        1  2020-07-01 09:00:05  11622.6
        2  2020-07-01 09:00:10  11632.4
        3  2020-07-01 09:00:15  11643.5
        4  2020-07-01 09:00:20  11644.2
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanVariousIndicators5Seconds",
                            date= "2020-07-01",
                            "end_date": "2020-07-27"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)
        ```
