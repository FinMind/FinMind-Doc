在台股技術面，我們擁有 12 種資料集，如下:

- [台股總覽 TaiwanStockInfo](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockinfo)
- [台股總覽(含權證) TaiwanStockInfoWithWarrant](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockinfowithwarrant)
- [台灣股價資料表 TaiwanStockPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockprice)
- [台灣還原股價資料表 TaiwanStockPriceAdj](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpriceadj-backersponsor)
- [台灣股價歷史逐筆資料表 TaiwanStockPriceTick](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpricetick-backersponsor)
- [台灣個股PER、PBR資料表 TaiwanStockPER](https://finmind.github.io/tutor/TaiwanMarket/Technical/#perpbr-taiwanstockper)
- [每5秒委託成交統計 TaiwanStockStatisticsOfOrderBookAndTrade](https://finmind.github.io/tutor/TaiwanMarket/Technical/#5-taiwanstockstatisticsoforderbookandtrade)
- [台股加權指數 TaiwanVariousIndicators5Seconds](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanvariousindicators5seconds)
- [當日沖銷交易標的及成交量值 TaiwanStockDayTrading](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockdaytrading)
- [加權、櫃買報酬指數 TaiwanStockTotalReturnIndex](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstocktotalreturnindex)
- [台灣個股十年線資料表 TaiwanStock10Year](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstock10year-backersponsor)
- [台股分 K 資料表 TaiwanStockKBar](https://finmind.github.io/tutor/TaiwanMarket/Technical/#k-taiwanstockkbar-sponsor)


----------------------------------
#### 台股總覽 TaiwanStockInfo

- 這張資料表主要是列出台灣所有上市上櫃的股票名稱，代碼和產業類別
- 資料更新時間 **每天 1:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_info()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockInfo",
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
            dataset = "TaiwanStockInfo",
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
    === "DataFrame"
        |    | industry_category   |   stock_id | stock_name   | type   | date       |
        |---:|:--------------------|-----------:|:-------------|:-------|:-----------|
        |  0 | ETF                 |       0050 | 元大台灣50   | twse   | 2021-10-05 |
        |  1 | ETF                 |       0051 | 元大中型100  | twse   | 2021-10-05 |
        |  2 | ETF                 |       0052 | 富邦科技     | twse   | 2021-10-05 |
        |  3 | ETF                 |       0053 | 元大電子     | twse   | 2021-10-05 |
        |  4 | ETF                 |       0054 | 元大台商50   | twse   | 2021-10-05 |
    === "Schema"
        ```
        {
            industry_category: str,
            stock_id: str,
            stock_name: str,
            type: str,
            date: str
        }
        ```


----------------------------------
#### 台股總覽(含權證) TaiwanStockInfoWithWarrant

- 這張資料表主要是列出台灣所有上市上櫃的股票、權證名稱，代碼和產業類別
- 資料量超過 5 萬筆
- 資料更新時間 **每天 1:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_info_with_warrant()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockInfoWithWarrant",
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
            dataset = "TaiwanStockInfoWithWarrant",
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
    === "DataFrame"
        |    | industry_category   |   stock_id | stock_name   | type   | date       |
        |---:|:--------------------|-----------:|:-------------|:-------|:-----------|
        |  0 | ETF                 |       0050 | 元大台灣50   | twse   | 2021-10-05 |
        |  1 | ETF                 |       0051 | 元大中型100  | twse   | 2021-10-05 |
        |  2 | ETF                 |       0052 | 富邦科技     | twse   | 2021-10-05 |
        |  3 | ETF                 |       0053 | 元大電子     | twse   | 2021-10-05 |
        |  4 | ETF                 |       0054 | 元大台商50   | twse   | 2021-10-05 |
    === "Schema"
        ```
        {
            industry_category: str,
            stock_id: str,
            stock_name: str,
            type: str,
            date: str
        }
        ```

----------------------------------
#### 股價日成交資訊 TaiwanStockPrice

- 資料區間：1994-10-01 ~ now
- 資料更新時間 **星期一至五 17:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_daily(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockPrice",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
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
            data_id= "2330",
            start_date= "2020-04-02",
            end_date= "2020-04-08",
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
    === "DataFrame"
        |    | date       |   stock_id |   Trading_Volume |   Trading_money |   open |   max |   min |   close |   spread |   Trading_turnover |
        |---:|:-----------|-----------:|-----------------:|----------------:|-------:|------:|------:|--------:|---------:|-------------------:|
        |  0 | 2020-04-06 |       2330 |         59712754 |     16324198154 |  273   | 275.5 | 270   |   275.5 |      4   |              19971 |
        |  1 | 2020-04-07 |       2330 |         48887346 |     13817936851 |  283.5 | 284   | 280.5 |   283   |      7.5 |              24281 |
        |  2 | 2020-04-08 |       2330 |         38698826 |     11016972354 |  285   | 285.5 | 283   |   285   |      2   |              19126 |
        |  3 | 2020-04-09 |       2330 |         29276430 |      8346209654 |  287.5 | 288   | 282.5 |   283   |     -2   |              15271 |
        |  4 | 2020-04-10 |       2330 |         28206858 |      7894277586 |  280   | 282   | 279   |   279.5 |     -3.5 |              15833 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            Trading_Volume: int64,
            Trading_money: int64,
            open: float64,
            max: float64,
            min: float64,
            close: float64,
            spread: float64,
            Trading_turnover: float32
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
            start_date='2020-04-06',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockPrice",
            "start_date": "2020-04-06",
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
            start_date= "2020-04-06",
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
    === "DataFrame"
        |    | date       |   stock_id |   Trading_Volume |   Trading_money |   open |   max |   min |   close |   spread |   Trading_turnover |
        |---:|:-----------|-----------:|-----------------:|----------------:|-------:|------:|------:|--------:|---------:|-------------------:|
        |  0 | 2020-04-06 |       0050 |         12207626 |       935731083 |  76.95 | 77.1  | 75.75 |   77.05 |     1.15 |               5824 |
        |  1 | 2020-04-06 |       0051 |            33000 |          953030 |  29.05 | 29.05 | 28.74 |   29.05 |     0.38 |                 21 |
        |  2 | 2020-04-06 |       0052 |           178700 |        10660088 |  59.4  | 60.05 | 58.75 |   60    |     1.25 |                 56 |
        |  3 | 2020-04-06 |       0053 |            17000 |          589750 |  34.66 | 35    | 34.48 |   34.84 |     0.18 |                 17 |
        |  4 | 2020-04-06 |       0054 |            10000 |          200040 |  19.87 | 20.03 | 19.87 |   20.03 |     0    |                  4 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            Trading_Volume: int64,
            Trading_money: int64,
            open: float64,
            max: float64,
            min: float64,
            close: float64,
            spread: float64,
            Trading_turnover: int64
        }
        ```


----------------------------------
#### 台灣還原股價資料表 TaiwanStockPriceAdj (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：1994-10-01 ~ now
- 資料更新時間 **星期一至五 17:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_daily_adj(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockPriceAdj",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
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
            dataset="TaiwanStockPriceAdj",
            data_id= "2330",
            start_date= "2020-04-02",
            end_date= "2020-04-08",
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
    === "DataFrame"
        |    | date       |   stock_id |   Trading_Volume |   Trading_money |   open |   max |   min |   close |   spread |   Trading_turnover |
        |---:|:-----------|-----------:|-----------------:|----------------:|-------:|------:|------:|--------:|---------:|-------------------:|
        |  0 | 2020-04-06 |       2330 |         59712754 |     16324198154 |  273   | 275.5 | 270   |   275.5 |      4   |              19971 |
        |  1 | 2020-04-07 |       2330 |         48887346 |     13817936851 |  283.5 | 284   | 280.5 |   283   |      7.5 |              24281 |
        |  2 | 2020-04-08 |       2330 |         38698826 |     11016972354 |  285   | 285.5 | 283   |   285   |      2   |              19126 |
        |  3 | 2020-04-09 |       2330 |         29276430 |      8346209654 |  287.5 | 288   | 282.5 |   283   |     -2   |              15271 |
        |  4 | 2020-04-10 |       2330 |         28206858 |      7894277586 |  280   | 282   | 279   |   279.5 |     -3.5 |              15833 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            Trading_Volume: int64,
            Trading_money: int64,
            open: float64,
            max: float64,
            min: float64,
            close: float64,
            spread: float64,
            Trading_turnover: float32
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockPriceAdj",
            "start_date": "2020-04-06",
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
            dataset="TaiwanStockPriceAdj",
            start_date= "2020-04-06",
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
    === "DataFrame"
        |    | date       |   stock_id |   Trading_Volume |   Trading_money |   open |   max |   min |   close |   spread |   Trading_turnover |
        |---:|:-----------|-----------:|-----------------:|----------------:|-------:|------:|------:|--------:|---------:|-------------------:|
        |  0 | 2020-04-06 |       0050 |         12207626 |       935731083 |  76.95 | 77.1  | 75.75 |   77.05 |     1.15 |               5824 |
        |  1 | 2020-04-06 |       0051 |            33000 |          953030 |  29.05 | 29.05 | 28.74 |   29.05 |     0.38 |                 21 |
        |  2 | 2020-04-06 |       0052 |           178700 |        10660088 |  59.4  | 60.05 | 58.75 |   60    |     1.25 |                 56 |
        |  3 | 2020-04-06 |       0053 |            17000 |          589750 |  34.66 | 35    | 34.48 |   34.84 |     0.18 |                 17 |
        |  4 | 2020-04-06 |       0054 |            10000 |          200040 |  19.87 | 20.03 | 19.87 |   20.03 |     0    |                  4 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            Trading_Volume: int64,
            Trading_money: int64,
            open: float64,
            max: float64,
            min: float64,
            close: float64,
            spread: float64,
            Trading_turnover: float32
        }
        ```


----------------------------------
#### 台灣股價歷史逐筆資料表 TaiwanStockPriceTick (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
(由於資料量過大，單次請求只提供一天資料)

- 資料區間：2019-01-01 ~ now
- 輸入 dataset、stock_id、start_date 參數，會回傳 start_date 當天資料。
- 資料更新時間 **星期一至五 15:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_tick(
            stock_id='2330',
            date='2020-01-02'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd

        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockPriceTick",
            "data_id": "2330",
            "start_date": "2020-01-02",
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
            dataset="TaiwanStockPriceTick",
            data_id= "2330",
            start_date= "2020-01-02",
            token = "" # 參考登入，獲取金鑰
        )
        )
        data = content(response)
        df = do.call('cbind',data$data) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   deal_price |   volume | Time         |   TickType |
        |---:|:-----------|-----------:|-------------:|---------:|:-------------|-----------:|
        |  0 | 2020-01-02 |       2330 |        332.5 |      520 | 09:00:00.000 |          0 |
        |  1 | 2020-01-02 |       2330 |        332.5 |      520 | 09:00:00.646 |          0 |
        |  2 | 2020-01-02 |       2330 |        333   |       45 | 09:00:05.000 |          0 |
        |  3 | 2020-01-02 |       2330 |        333   |       45 | 09:00:05.660 |          0 |
        |  4 | 2020-01-02 |       2330 |        333   |       22 | 09:00:10.000 |          0 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            deal_price: float64,
            volume: int64,
            Time: str,
            TickType: int64
        }
        ```

----------------------------------
#### 個股PER、PBR資料表 TaiwanStockPER

- 資料區間：2005-10-01 ~ now
- 資料更新時間 **星期一至五 18:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_per_pbr(
            stock_id='2330',
            start_date='2020-01-02'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockPER",
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
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanStockPER",
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
    === "DataFrame"
        |    | date       |   stock_id |   dividend_yield |   PER |   PBR |
        |---:|:-----------|-----------:|-----------------:|------:|------:|
        |  0 | 2020-01-02 |       2330 |             2.36 | 26.69 |  5.54 |
        |  1 | 2020-01-03 |       2330 |             2.36 | 26.73 |  5.55 |
        |  2 | 2020-01-06 |       2330 |             2.41 | 26.14 |  5.42 |
        |  3 | 2020-01-07 |       2330 |             2.43 | 25.94 |  5.38 |
        |  4 | 2020-01-08 |       2330 |             2.43 | 25.94 |  5.38 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            dividend_yield: float64,
            PER: float64,
            PBR: float64
        }
        ```

----------------------------------
#### 每5秒委託成交統計 TaiwanStockStatisticsOfOrderBookAndTrade
(由於資料量過大，單次請求只提供一天資料)

- 資料區間：2005-01-01 ~ now

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_book_and_trade(
            date='2021-01-07'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockStatisticsOfOrderBookAndTrade",
            "start_date": "2021-01-07",
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
            dataset="TaiwanStockStatisticsOfOrderBookAndTrade",
            start_date= "2021-01-07",
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
    === "DataFrame"
        |    | Time     |   TotalBuyOrder |   TotalBuyVolume |   TotalSellOrder |   TotalSellVolume |   TotalDealOrder |   TotalDealVolume |   TotalDealMoney | date       |
        |---:|:---------|----------------:|-----------------:|-----------------:|------------------:|-----------------:|------------------:|-----------------:|:-----------|
        |  0 | 09:00:00 |          298618 |          3229222 |           365465 |           1730137 |                0 |                 0 |                0 | 2021-01-07 |
        |  1 | 09:00:05 |          301246 |          3254929 |           367886 |           1751034 |            17535 |             97251 |             4515 | 2021-01-07 |
        |  2 | 09:00:10 |          304171 |          3283698 |           370338 |           1770414 |            31370 |            150557 |             7041 | 2021-01-07 |
        |  3 | 09:00:15 |          307686 |          3325195 |           372828 |           1782960 |            40083 |            177080 |             8088 | 2021-01-07 |
        |  4 | 09:00:20 |          310927 |          3345735 |           375220 |           1792055 |            47250 |            198536 |             9137 | 2021-01-07 |
    === "Schema"
        ```
        {
            Time: str,
            TotalBuyOrder: str,
            TotalBuyVolume: int64,
            TotalSellOrder: int64,
            TotalSellVolume: int64,
            TotalDealOrder: int64,
            TotalDealVolume: int64,
            TotalDealMoney: int64,
            date: str,
        }
        ```

----------------------------------
#### 加權指數 TaiwanVariousIndicators5Seconds
(由於資料量過大，單次請求只提供一天資料)

- 資料區間：2005-01-01 ~ now

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.tse(
            date='2020-07-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanVariousIndicators5Seconds",
            "start_date": "2020-07-01",
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
            dataset="TaiwanVariousIndicators5Seconds",
            start_date="2020-07-01",
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
    === "DataFrame"
        |    | date                |   TAIEX |
        |---:|:--------------------|--------:|
        |  0 | 2020-07-01 09:00:00 | 11621.2 |
        |  1 | 2020-07-01 09:00:05 | 11622.6 |
        |  2 | 2020-07-01 09:00:10 | 11632.4 |
        |  3 | 2020-07-01 09:00:15 | 11643.5 |
        |  4 | 2020-07-01 09:00:20 | 11644.2 |
    === "Schema"
        ```
        {
            date: str,
            TAIEX: float64
        }
        ```
----------------------------------
#### 當日沖銷交易標的及成交量值 TaiwanStockDayTrading

- 資料區間：2014-01-01 ~ now
- 資料更新時間 **星期一至五 21:30**，實際更新時間以 API 資料為主


!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_day_trading(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockDayTrading",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
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
            dataset="TaiwanStockDayTrading",
            data_id= "2330",
            start_date= "2020-04-02",
            end_date= "2020-04-08",
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
    === "DataFrame"
        |    |   stock_id | date       | BuyAfterSale   |   Volume |   BuyAmount |   SellAmount |
        |---:|-----------:|:-----------|:---------------|---------:|------------:|-------------:|
        |  0 |       2330 | 2020-04-06 | Y              |  8122000 |  2215280000 |   2218094500 |
        |  1 |       2330 | 2020-04-07 | Y              |  5128000 |  1450483500 |   1447872000 |
        |  2 |       2330 | 2020-04-08 | Y              |  2467000 |   702411500 |    702367000 |
        |  3 |       2330 | 2020-04-09 | Y              |  2583000 |   736745500 |    734035500 |
        |  4 |       2330 | 2020-04-10 | Y              |  1590000 |   445516000 |    444576000 |
    === "Schema"
        ```
        {
            stock_id: str,
            date: str,
            BuyAfterSale: int64,
            Volume: int64,
            BuyAmount: int64,
            SellAmount: int64
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
        df = api.taiwan_stock_day_trading(
            start_date='2020-04-06',
        )
        ```
    === "Python-request"
        ```python
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockDayTrading",
            "start_date": "2020-04-06",
            "token": "", # 參考登入，獲取金鑰
        }
        res = requests.get(url, params=parameter)
        temp = res.json()
        data = pd.DataFrame(temp["data"])
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
            dataset="TaiwanStockDayTrading",
            start_date= "2020-04-06",
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
    === "DataFrame"
        |    |   stock_id | date       | BuyAfterSale   |   Volume |   BuyAmount |   SellAmount |
        |---:|-----------:|:-----------|:---------------|---------:|------------:|-------------:|
        |  0 |       0050 | 2020-04-06 |                |  1296000 |    99116100 |     99343200 |
        |  1 |       0051 | 2020-04-06 |                |     2000 |       57680 |        57560 |
        |  2 |       0052 | 2020-04-06 |                |     9000 |      536200 |       537700 |
        |  3 |       0053 | 2020-04-06 |                |        0 |           0 |            0 |
        |  4 |       0054 | 2020-04-06 |                |        0 |           0 |            0 |
    === "Schema"
        ```
        {
            stock_id: str,
            date: str,
            BuyAfterSale: int64,
            Volume: int64,
            BuyAmount: int64,
            SellAmount: int64
        }
        ```

----------------------------------
#### 加權、櫃買報酬指數 TaiwanStockTotalReturnIndex

- 資料區間：2003-01-01 ~ now
- 資料更新時間 **星期一至五 16:50**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_total_return_index(
            index_id="TAIEX",
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockTotalReturnIndex",
            "data_id": "TAIEX", # 發行量加權股價報酬指數
            # "data_id": "TPEx", # 櫃買指數與報酬指數
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
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
            dataset="TaiwanStockTotalReturnIndex",
            data_id= "TAIEX", # 發行量加權股價報酬指數
            # data_id= "TPEx", # 櫃買指數與報酬指數
            start_date= "2020-04-02",
            end_date= "2020-04-08",
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
    === "DataFrame"
        |    |   price | stock_id   | date       |
        |---:|--------:|:-----------|:-----------|
        |  0 | 18356.5 | TAIEX      | 2020-04-06 |
        |  1 | 18688.6 | TAIEX      | 2020-04-07 |
        |  2 | 18952.7 | TAIEX      | 2020-04-08 |
        |  3 | 18922.6 | TAIEX      | 2020-04-09 |
        |  4 | 18994   | TAIEX      | 2020-04-10 |
    === "Schema"
        ```
        {
            price: float64,
            stock_id: str,
            date: str
        }
        ```

----------------------------------
#### 台灣個股十年線資料表 TaiwanStock10Year (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：2011-01-24 ~ now
- 透過2500個交易日所計算出的平均價格
- 資料更新時間 **星期一至五 20:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_10year(
            stock_id='2330',
            start_date='2020-04-02',
            end_date='2020-04-12'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStock10Year",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
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
            dataset="TaiwanStock10Year",
            data_id= "2330",
            start_date= "2020-04-02",
            end_date= "2020-04-12",
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
    === "DataFrame"
        |    | date       |   stock_id |    close |
        |---:|:-----------|-----------:|-----------------:|
        |  0 | 2020-04-06 |       2330 | 150.16 |
        |  1 | 2020-04-07 |       2330 | 150.25 |
        |  2 | 2020-04-08 |       2330 | 150.34 |
        |  3 | 2020-04-09 |       2330 | 150.43 |
        |  4 | 2020-04-10 |       2330 | 150.52 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            close: float64
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
        df = api.taiwan_stock_10year(
            start_date='2020-04-06',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStock10Year",
            "start_date": "2020-04-06",
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
            dataset="TaiwanStock10Year",
            start_date= "2020-04-06",
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
    === "DataFrame"
        |    | date       |   stock_id |   close |
        |---:|:-----------|-----------:|--------:|
        |  0 | 2020-04-06 |       0050 |   66.5  |
        |  1 | 2020-04-06 |       0053 |   28.68 |
        |  2 | 2020-04-06 |       0055 |   14.31 |
        |  3 | 2020-04-06 |       0056 |   24.59 |
        |  4 | 2020-04-06 |       0061 |   16.28 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            close: float64,
        }
        ```


----------------------------------
#### 台股分 K 資料表 TaiwanStockKBar (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
(由於資料量過大，單次請求只提供一天資料)

- 資料區間：2019-01-01 ~ now
- 資料更新時間 **星期一至五 15:50**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_bar(
            stock_id='2330',
            date="2023-09-22"
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockKBar",
            "data_id": "2330",
            "start_date": "2023-09-22",
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
            dataset="TaiwanStockKBar",
            data_id= "2330",
            start_date= "2023-09-22",
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
    === "DataFrame"
        |    | date       | minute   |   stock_id |   open |   high |   low |   close |   volume |
        |---:|:-----------|:---------|-----------:|-------:|-------:|------:|--------:|---------:|
        |  0 | 2023-09-22 | 09:00:00 |       2330 |    523 |    524 |   522 |     524 |     3893 |
        |  1 | 2023-09-22 | 09:01:00 |       2330 |    524 |    524 |   523 |     524 |      159 |
        |  2 | 2023-09-22 | 09:02:00 |       2330 |    523 |    524 |   522 |     523 |      548 |
        |  3 | 2023-09-22 | 09:03:00 |       2330 |    522 |    523 |   522 |     522 |      208 |
        |  4 | 2023-09-22 | 09:04:00 |       2330 |    522 |    523 |   522 |     522 |      179 |
    === "Schema"
        ```
        {
            date: str,
            minute: str,
            stock_id: str,
            open: float64,
            high: float64,
            low: float64,
            close: float64,
            volume: float32
        }
        ```