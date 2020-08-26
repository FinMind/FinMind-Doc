
在台股衍生性商品資料，我們擁有 7 種資料集，如下:

- [期貨、選擇權即時報價總覽 TaiwanFutOptTickInfo](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfutopttickinfo)
- [期貨、選擇權即時報價 TaiwanFutOptTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfutopttick)
- [期貨、選擇權日成交資訊總覽 TaiwanOptionFutureInfo](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptionfutureinfo)
- [期貨日成交資訊 TaiwanFuturesDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdaily)
- [選擇權日成交資訊 TaiwanOptionDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondaily)
- [期貨交易明細表 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick)
- [選擇權交易明細表 TaiwanOptionTIck](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick)



#### 期貨、選擇權即時報價總覽 TaiwanFutOptTickInfo

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanFutOptTickInfo",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                code callput     date     name listing_date update_date  expire_price
        0  TGO05200N1      賣權  2021/02    黃金選擇權   2020-03-17  2020-05-27       52000.0
        1  TGO05400N1      賣權  2021/02    黃金選擇權   2020-03-03  2020-05-27       54000.0
        2  TGO05600N1      賣權  2021/02    黃金選擇權   2020-02-26  2020-05-27       56000.0
        3  TGO06300N1      賣權  2021/02    黃金選擇權   2020-02-26  2020-05-27       63000.0
        4  CAO00600O1      賣權  2021/03  南亞股票選擇權   2020-04-16  2020-05-27         600.0
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFutOptTickInfo"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)
                code callput    date           name listing_date update_date expire_price
        1: TGO05200N1    賣權 2021/02     黃金選擇權   2020-03-17  2020-05-27        52000
        2: TGO05400N1    賣權 2021/02     黃金選擇權   2020-03-03  2020-05-27        54000
        3: TGO05600N1    賣權 2021/02     黃金選擇權   2020-02-26  2020-05-27        56000
        4: TGO06300N1    賣權 2021/02     黃金選擇權   2020-02-26  2020-05-27        63000
        5: CAO00600O1    賣權 2021/03 南亞股票選擇權   2020-04-16  2020-05-27          600
        6: CAO00700O1    賣權 2021/03 南亞股票選擇權   2020-04-16  2020-05-27          700
        ```

#### 期貨、選擇權即時報價 TaiwanFutOptTick
(由於資料量過大，只提供 date 當天 data)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanFutOptTick",
            "data_id":"TXFE0"
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date             Time      Close Volume futopt_id  TickType
        0  2020/05/16  04:58:01.867000  [10737.0]    [1]     TXFE0         1
        1  2020/05/16  00:57:21.057000  [10714.0]    [1]     TXFE0         2
        2  2020/05/16  00:44:44.173000  [10724.0]    [1]     TXFE0         2
        3  2020/05/16  00:02:05.424000  [10727.0]    [1]     TXFE0         1
        4  2020/05/16  00:04:48.422000  [10729.0]    [1]     TXFE0         2
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFutOptTick",
                            data_id="TXFE0"
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
                date            Time  Close Volume futopt_id TickType
        1: 2020/05/16 04:58:01.867000 <list> <list>     TXFE0        1
        2: 2020/05/16 00:57:21.057000 <list> <list>     TXFE0        2
        3: 2020/05/16 00:44:44.173000 <list> <list>     TXFE0        2
        4: 2020/05/16 00:02:05.424000 <list> <list>     TXFE0        1
        5: 2020/05/16 00:04:48.422000 <list> <list>     TXFE0        2
        6: 2020/05/16 00:00:38.929000 <list> <list>     TXFE0        2
        ```



#### 期貨、選擇權日成交資訊總覽 TaiwanOptionFutureInfo

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanOptionFutureInfo",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        code               type
        0  AAA  TaiwanOptionDaily
        1  AAB  TaiwanOptionDaily
        2  AAO  TaiwanOptionDaily
        3  ABA  TaiwanOptionDaily
        4  ABO  TaiwanOptionDaily
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanOptionFutureInfo"
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        code              type
        1:  AAA TaiwanOptionDaily
        2:  AAB TaiwanOptionDaily
        3:  AAO TaiwanOptionDaily
        4:  ABA TaiwanOptionDaily
        5:  ABO TaiwanOptionDaily
        6:  ACA TaiwanOptionDaily
        ```


#### 期貨日成交資訊 TaiwanFuturesDaily

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanFuturesDaily",
            "data_id":"TX",
            "date": "2020-04-01"
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date future_id  contract_date    open     max     min   close spread spread_per  volume settlement_price open_interest trading_session
        0  2020-04-01        TX         202004  9630.0  9665.0  9551.0  9575.0  -20.0      -0.21   73771              0.0             0    after_market
        1  2020-04-01        TX         202004  9588.0  9650.0  9551.0  9552.0  -43.0      -0.45  116273           9555.0         83725        position
        2  2020-04-01        TX  202004/202005     0.0     0.0     0.0     0.0    0.0        0.0       0              0.0             0    after_market
        3  2020-04-01        TX  202004/202005   -68.0   -68.0   -70.0   -69.0    0.0        0.0     381              0.0             0        position
        4  2020-04-01        TX  202004/202006  -137.0  -137.0  -137.0  -137.0    0.0        0.0      10              0.0             0    after_market
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFuturesDaily",
                            data_id="TX",
                            date= "2020-04-01"
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
                date future_id contract_date   open    max    min  close spread spread_per volume
        1: 2020-04-01        TX        202004 9630.0 9665.0 9551.0 9575.0  -20.0      -0.21  73771
        2: 2020-04-01        TX        202004 9588.0 9650.0 9551.0 9552.0  -43.0      -0.45 116273
        3: 2020-04-01        TX 202004/202005    0.0    0.0    0.0    0.0    0.0        0.0      0
        4: 2020-04-01        TX 202004/202005  -68.0  -68.0  -70.0  -69.0    0.0        0.0    381
        5: 2020-04-01        TX 202004/202006 -137.0 -137.0 -137.0 -137.0    0.0        0.0     10
        6: 2020-04-01        TX 202004/202006 -139.0 -139.0 -139.0 -139.0    0.0        0.0      5
        settlement_price open_interest trading_session
        1:              0.0             0    after_market
        2:           9555.0         83725        position
        3:              0.0             0    after_market
        4:              0.0             0        position
        5:              0.0             0    after_market
        6:              0.0             0        position
        ```


#### 選擇權日成交資訊 TaiwanOptionDaily

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanOptionDaily",
            "data_id":"TXO",
            "date": "2020-04-01"
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date option_id contract_date strike_price call_put open  max  min close volume settlement_price open_interest trading_session
        0  2020-04-01       TXO        202004       7300.0     call  0.0  0.0  0.0   0.0      0              0.0             0    after_market
        1  2020-04-01       TXO        202004       7300.0     call  0.0  0.0  0.0   0.0      0           2270.0            26        position
        2  2020-04-01       TXO        202004       7400.0     call  0.0  0.0  0.0   0.0      0              0.0             0    after_market
        3  2020-04-01       TXO        202004       7400.0     call  0.0  0.0  0.0   0.0      0           2170.0             0        position
        4  2020-04-01       TXO        202004       7500.0     call  0.0  0.0  0.0   0.0      0              0.0             0    after_market
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanOptionDaily",
                            data_id="TXO",
                            date= "2020-04-01"
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
                date option_id contract_date strike_price call_put open max min close volume
        1: 2020-04-01       TXO        202004       7300.0     call  0.0 0.0 0.0   0.0      0
        2: 2020-04-01       TXO        202004       7300.0     call  0.0 0.0 0.0   0.0      0
        3: 2020-04-01       TXO        202004       7400.0     call  0.0 0.0 0.0   0.0      0
        4: 2020-04-01       TXO        202004       7400.0     call  0.0 0.0 0.0   0.0      0
        5: 2020-04-01       TXO        202004       7500.0     call  0.0 0.0 0.0   0.0      0
        6: 2020-04-01       TXO        202004       7500.0     call  0.0 0.0 0.0   0.0      0
        settlement_price open_interest trading_session
        1:              0.0             0    after_market
        2:           2270.0            26        position
        3:              0.0             0    after_market
        4:           2170.0             0        position
        5:              0.0             0    after_market
        6:           2080.0             4        position
        ```



#### 期貨交易明細表 TaiwanFuturesTick

(由於資料量過大，只提供 date 當天 data)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanFuturesTick",
            "stock_id": "MTX",
            "date": "2020-04-01",
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        contract_date                 date futures_id   price volume
        0   202004       2020-04-01 00:00:01        MTX  9641.0      2
        1   202004       2020-04-01 00:00:01        MTX  9641.0      2
        2   202004       2020-04-01 00:00:01        MTX  9641.0      6
        3   202004       2020-04-01 00:00:02        MTX  9640.0      2
        4   202004       2020-04-01 00:00:02        MTX  9640.0      2
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'https://api.finmindtrade.com/api/v3/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFuturesTick",
                            stock_id="MTX",
                            date= "2020-01-02"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

        contract_date                date futures_id   price volume
        1:   202001      2020-01-02 08:45:00        MTX 12045.0    852
        2:   202001      2020-01-02 08:45:00        MTX 12045.0      2
        3:   202001      2020-01-02 08:45:00        MTX 12045.0      2
        4:   202001      2020-01-02 08:45:00        MTX 12045.0      2
        5:   202001      2020-01-02 08:45:00        MTX 12045.0      2
        6:   202001      2020-01-02 08:45:00        MTX 12045.0      2
        ```


#### 選擇權交易明細表 TaiwanOptionTick
(由於資料量過大，只提供 date 當天 data)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v3/data"
        parameter = {
            "dataset": "TaiwanOptionTick",
            "stock_id": "OCO",
            "date": "2019-09-05",
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
                            dataset="TaiwanOptionTick",
                            stock_id="OCO",
                            date= "2019-09-05"
                            )
        )
        data = content(response)
        df = data.table(matrix(unlist(data$data), 
                            nrow=length(unlist(data$data[1]))
        ))
        colnames(df) = names(data$data)
        head(df)

        ```
