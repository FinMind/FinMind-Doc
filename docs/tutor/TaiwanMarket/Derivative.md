
在台股衍生性商品資料，我們擁有 10 種資料集，如下:

- [期貨、選擇權即時報價總覽 TaiwanFutOptTickInfo](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfutopttickinfo)
- [期貨、選擇權即時報價 TaiwanFutOptTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfutopttick)
- [期貨、選擇權日成交資訊總覽 TaiwanOptionFutureInfo](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptionfutureinfo)
- [期貨日成交資訊 TaiwanFuturesDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdaily)
- [選擇權日成交資訊 TaiwanOptionDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondaily)
- [期貨交易明細表 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick)
- [選擇權交易明細表 TaiwanOptionTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick)
- [選擇權、期貨三大法人買賣 TaiwanFutOptInstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfutoptinstitutionalinvestors)
- [期貨各卷商每日交易 TaiwanFuturesDealerTradingVolumeDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdealertradingvolumedaily)
- [選擇權各卷商每日交易 TaiwanOptionDealerTradingVolumeDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondealertradingvolumedaily)



#### 期貨、選擇權即時報價總覽 TaiwanFutOptTickInfo

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFutOptTickInfo",
            "token": "", # 參考登入，獲取金鑰
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanFutOptTickInfo",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)
                code callput    date           name listing_date update_date expire_price
        1: TGO05200N1    賣權 2021/02     黃金選擇權   2020-03-17  2020-05-27        52000
        2: TGO05400N1    賣權 2021/02     黃金選擇權   2020-03-03  2020-05-27        54000
        3: TGO05600N1    賣權 2021/02     黃金選擇權   2020-02-26  2020-05-27        56000
        4: TGO06300N1    賣權 2021/02     黃金選擇權   2020-02-26  2020-05-27        63000
        5: CAO00600O1    賣權 2021/03 南亞股票選擇權   2020-04-16  2020-05-27          600
        6: CAO00700O1    賣權 2021/03 南亞股票選擇權   2020-04-16  2020-05-27          700
        ```

#### 期貨、選擇權即時報價 TaiwanFutOptTick (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/
由於資料量過大，只提供 date 當天 data

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFutOptTick",
            "data_id": "TXFA1",# 期貨會過期，商品代碼請先查詢 TaiwanFutOptTickInfo
            "streaming_all_data": True,# 拿取當天所有即時資料
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date             Time      Close Volume futopt_id  TickType
        0  2020/05/16  04:58:01.867000  [10737.0]    [1]     TXFA1         1
        1  2020/05/16  00:57:21.057000  [10714.0]    [1]     TXFA1         2
        2  2020/05/16  00:44:44.173000  [10724.0]    [1]     TXFA1         2
        3  2020/05/16  00:02:05.424000  [10727.0]    [1]     TXFA1         1
        4  2020/05/16  00:04:48.422000  [10729.0]    [1]     TXFA1         2
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFutOptTick",
                            data_id="TXFA1",
                            streaming_all_data= TRUE,# 拿取當天所有即時資料
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
                date            Time  Close Volume futopt_id TickType
        1: 2020/05/16 04:58:01.867000 <list> <list>     TXFA1        1
        2: 2020/05/16 00:57:21.057000 <list> <list>     TXFA1        2
        3: 2020/05/16 00:44:44.173000 <list> <list>     TXFA1        2
        4: 2020/05/16 00:02:05.424000 <list> <list>     TXFA1        1
        5: 2020/05/16 00:04:48.422000 <list> <list>     TXFA1        2
        6: 2020/05/16 00:00:38.929000 <list> <list>     TXFA1        2
        ```



#### 期貨、選擇權日成交資訊總覽 TaiwanOptionFutureInfo

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionFutureInfo",
            "token": "", # 參考登入，獲取金鑰
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

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanOptionFutureInfo",
                            token = "" # 參考登入，獲取金鑰
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
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesDaily",
            "data_id":"TX",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
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

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFuturesDaily",
                            data_id="TX",
                            start_date= "2020-04-01",
                            token = "" # 參考登入，獲取金鑰
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

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesDaily",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date futures_id  contract_date   open    max    min  close  spread  spread_per  volume  settlement_price  open_interest trading_session
        0  2020-04-01        BRF         202005  690.0  704.0  681.0  681.0    -9.0       -1.30      45               0.0              0    after_market
        1  2020-04-01        BRF         202006  818.0  833.0  789.5  791.0   -13.0       -1.62      77               0.0              0    after_market
        2  2020-04-01        BRF         202006  795.0  799.0  774.0  774.0   -30.0       -3.73      63             774.0            435        position
        3  2020-04-01        BRF  202006/202007  100.0  100.0  100.0  100.0     0.0        0.00       1               0.0              0    after_market
        4  2020-04-01        BRF         202007  910.5  910.5  910.5  910.5    43.0        4.96       2               0.0              0    after_market
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFuturesDaily",
                            start_date= "2020-04-01",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)
                date futures_id contract_date  open   max   min close spread spread_per
        1: 2020-04-01        BRF        202005   690   704   681   681     -9       -1.3
        2: 2020-04-01        BRF        202006   818   833 789.5   791    -13      -1.62
        3: 2020-04-01        BRF        202006   795   799   774   774    -30      -3.73
        4: 2020-04-01        BRF 202006/202007   100   100   100   100      0          0
        5: 2020-04-01        BRF        202007 910.5 910.5 910.5 910.5     43       4.96
        6: 2020-04-01        BRF        202007   881   881 874.5 874.5      7       0.81
        volume settlement_price open_interest trading_session
        1:     45                0             0    after_market
        2:     77                0             0    after_market
        3:     63              774           435        position
        4:      1                0             0    after_market
        5:      2                0             0    after_market
        6:      3            874.5             3        position
        ```


#### 選擇權日成交資訊 TaiwanOptionDaily

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionDaily",
            "data_id":"TXO",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
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

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanOptionDaily",
                            data_id="TXO",
                            start_date= "2020-04-01",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
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

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionDaily",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                date option_id contract_date  strike_price call_put  open   max   min  close  volume  settlement_price  open_interest trading_session
        0  2020-04-01       CAO        202004          55.0      put  2.22  2.22  2.22   2.22       5              2.48             15        position
        1  2020-04-01       CCO        202004          12.0     call  1.74  1.74  1.74   1.74       5              1.80              5        position
        2  2020-04-01       CCO        202004          12.0      put  0.04  0.04  0.04   0.04       3              0.01              3        position
        3  2020-04-01       CCO        202004          13.0      put  0.24  0.24  0.24   0.24       1              0.03             10        position
        4  2020-04-01       CCO        202004          14.0      put  0.65  0.65  0.65   0.65       2              0.37              8        position
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanOptionDaily",
                            start_date= "2020-04-01",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)
                date option_id contract_date strike_price call_put open  max  min close
        1: 2020-04-01       CAO        202004           55      put 2.22 2.22 2.22  2.22
        2: 2020-04-01       CCO        202004           12     call 1.74 1.74 1.74  1.74
        3: 2020-04-01       CCO        202004           12      put 0.04 0.04 0.04  0.04
        4: 2020-04-01       CCO        202004           13      put 0.24 0.24 0.24  0.24
        5: 2020-04-01       CCO        202004           14      put 0.65 0.65 0.65  0.65
        6: 2020-04-01       CCO        202004         14.5      put 1.01 1.01 1.01  1.01
        volume settlement_price open_interest trading_session
        1:      5             2.48            15        position
        2:      5              1.8             5        position
        3:      3             0.01             3        position
        4:      1             0.03            10        position
        5:      2             0.37             8        position
        6:      5             0.75            14        position
        ```



#### 期貨交易明細表 TaiwanFuturesTick

由於資料量過大，只提供 date 當天 data

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesTick",
            "data_id": "MTX",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
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
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
        url = url,
        query = list(
            dataset="TaiwanFuturesTick",
            data_id="MTX",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
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

由於資料量過大，只提供 date 當天 data

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionTick",
            "data_id": "OCO",
            "start_date": "2019-09-05",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        
        ExercisePrice PutCall contract_date                 date option_id  price  volume
        0           22.0       C        201909  2019-09-05 09:38:52       OCO   1.85      20
        1           21.5       C        201909  2019-09-05 09:40:16       OCO   2.31      20
        2           22.5       C        201909  2019-09-05 09:40:29       OCO   1.35      20
        3           21.5       C        201909  2019-09-05 09:42:42       OCO   2.29       4
        4           21.5       C        201909  2019-09-05 09:42:59       OCO   2.28       5

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
            dataset="TaiwanOptionTick",
            data_id="OCO",
            start_date= "2019-09-05",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

        ```

#### 選擇權、期貨三大法人買賣 TaiwanFutOptInstitutionalInvestors

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFutOptInstitutionalInvestors",
            "data_id": "TX",# "TXO"
            "start_date": "2020-01-01",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df.head())
        name        date institutional_investors  ...  long_open_interest_balance_amount  short_open_interest_balance_volume  short_open_interest_balance_amount
        0   TX  2020-01-02                      外資  ...                          147609850                               25535                            61794190
        1   TX  2020-01-02                      投信  ...                            4041734                               24668                            59701494
        2   TX  2020-01-02                     自營商  ...                           25378624                                8518                            20572664
        3   TX  2020-01-03                      投信  ...                            3957284                               24655                            59600997
        4   TX  2020-01-03                      外資  ...                          147233626                               26284                            63533909
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
            dataset="TaiwanFutOptInstitutionalInvestors",
            data_id="TX",# "TXO"
            start_date= "2020-01-01",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

        ```


#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFutOptInstitutionalInvestors",
            "start_date": "2020-01-06",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df.head())
        name        date institutional_investors  ...  long_open_interest_balance_amount  short_open_interest_balance_volume  short_open_interest_balance_amount
        0  ETF  2020-01-06                      外資  ...                            3316136                                1124                              489466
        1  ETF  2020-01-06                      投信  ...                            1320779                                4079                             3546254
        2  ETF  2020-01-06                     自營商  ...                             370988                                4489                             1544574
        3  ETO  2020-01-06                     自營商  ...                                381                                  45                                 452
        4  ETO  2020-01-06                      外資  ...                                  0                                   0                                   0
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFutOptInstitutionalInvestors",
                            start_date= "2020-01-06",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)

        ```


#### 期貨各卷商每日交易 TaiwanFuturesDealerTradingVolumeDaily

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesDealerTradingVolumeDaily",
            "data_id": "TX",
            "start_date": "2020-07-01",
            "end_date": "2020-10-02",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df.head())
                date dealer_code dealer_name futures_id  volume  is_after_hour
        0  2020-07-01     B224999  中國信託商業銀行自營         TX    1500          False
        1  2020-07-01     F001000        國泰期貨         TX    1789          False
        2  2020-07-01     F002000        永豐期貨         TX    9664          False
        3  2020-07-01     F002999      永豐期貨自營         TX       0          False
        4  2020-07-01     F004000        凱基期貨         TX   43882          False
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
            dataset="TaiwanFuturesDealerTradingVolumeDaily",
            data_id="TX",
            start_date="2020-07-01",
            end_date="2020-10-02",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

        ```


#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesDealerTradingVolumeDaily",
            "start_date": "2020-07-01",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        df
                    date dealer_code dealer_name futures_id  volume  is_after_hour
        0     2020-07-01     B224999  中國信託商業銀行自營        BRF       0          False
        1     2020-07-01     F001000        國泰期貨        BRF       0          False
        2     2020-07-01     F002000        永豐期貨        BRF       6          False
        3     2020-07-01     F002999      永豐期貨自營        BRF       0          False
        4     2020-07-01     F004000        凱基期貨        BRF       1          False
        ...          ...         ...         ...        ...     ...            ...
        1477  2020-07-01     S888999      國泰證券自營      total    9399          False
        1478  2020-07-01     S890999    法銀巴黎證券自營      total     996          False
        1479  2020-07-01     S920999      凱基證券自營      total     841          False
        1480  2020-07-01     S960999      富邦證券自營      total     663          False
        1481  2020-07-01     S980999      元大證券自營      total   19193          False
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFuturesDealerTradingVolumeDaily",
                            start_date="2020-07-01",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)

        ```



#### 選擇權各卷商每日交易 TaiwanOptionDealerTradingVolumeDaily

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionDealerTradingVolumeDaily",
            "data_id": "TXO",
            "start_date": "2020-07-01",
            "end_date": "2020-10-02",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        df
                    date dealer_code dealer_name option_id  volume  is_after_hour
        0     2020-07-01     B224999  中國信託商業銀行自營       TXO   13390          False
        1     2020-07-01     F001000        國泰期貨       TXO   17478          False
        2     2020-07-01     F002000        永豐期貨       TXO   75395          False
        3     2020-07-01     F002999      永豐期貨自營       TXO      98          False
        4     2020-07-01     F004000        凱基期貨       TXO  159164          False
        ...          ...         ...         ...       ...     ...            ...
        5534  2020-09-30     S920999      凱基證券自營       TXO       0           True
        5535  2020-09-30     S960999      富邦證券自營       TXO       0          False
        5536  2020-09-30     S960999      富邦證券自營       TXO       0           True
        5537  2020-09-30     S980999      元大證券自營       TXO   68807          False
        5538  2020-09-30     S980999      元大證券自營       TXO   25932           True
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
            dataset="TaiwanOptionDealerTradingVolumeDaily",
            data_id="TXO",
            start_date="2020-07-01",
            end_date="2020-10-02",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = data$data %>% 
        do.call('rbind',.) %>% 
        data.table
        head(df)

        ```


#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionDealerTradingVolumeDaily",
            "start_date": "2020-07-01",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        df
                date dealer_code dealer_name option_id  volume  is_after_hour
        0    2020-07-01     B224999  中國信託商業銀行自營       ETC     393          False
        1    2020-07-01     F001000        國泰期貨       ETC       0          False
        2    2020-07-01     F002000        永豐期貨       ETC      42          False
        3    2020-07-01     F002999      永豐期貨自營       ETC       0          False
        4    2020-07-01     F004000        凱基期貨       ETC      15          False
        ..          ...         ...         ...       ...     ...            ...
        454  2020-07-01     S888999      國泰證券自營     total    5718          False
        455  2020-07-01     S890999    法銀巴黎證券自營     total  131727          False
        456  2020-07-01     S920999      凱基證券自營     total      11          False
        457  2020-07-01     S960999      富邦證券自營     total       0          False
        458  2020-07-01     S980999      元大證券自營     total   90416          False
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanOptionDealerTradingVolumeDaily",
                            start_date="2020-07-01",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)

        ```

