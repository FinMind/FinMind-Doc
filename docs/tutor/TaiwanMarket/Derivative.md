
在台股衍生性商品資料，我們擁有 11 種資料集，如下:

- [期貨、選擇權日成交資訊總覽 TaiwanOptionFutureInfo](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfutoptdailyinfo)
- [期貨日成交資訊 TaiwanFuturesDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdaily)
- [選擇權日成交資訊 TaiwanOptionDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondaily)
- [期貨交易明細表 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)
- [選擇權交易明細表 TaiwanOptionTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick-backersponsor)
- [期貨三大法人買賣 TaiwanFuturesInstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesinstitutionalinvestors)
- [選擇權三大法人買賣 TaiwanOptionInstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptioninstitutionalinvestors)
- [期貨夜盤三大法人買賣 TaiwanFuturesInstitutionalInvestorsAfterHours](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesinstitutionalinvestorsafterhours)
- [選擇權夜盤三大法人買賣 TaiwanOptionInstitutionalInvestorsAfterHours](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptioninstitutionalinvestorsafterhours)
- [期貨各卷商每日交易 TaiwanFuturesDealerTradingVolumeDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdealertradingvolumedaily)
- [選擇權各卷商每日交易 TaiwanOptionDealerTradingVolumeDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondealertradingvolumedaily)
- [期貨大額交易人未沖銷部位 TaiwanFuturesOpenInterestLargeTraders](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesopeninterestlargetraders)
- [選擇權大額交易人未沖銷部位 TaiwanOptionOpenInterestLargeTraders](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptionopeninterestlargetraders)

----------------------------------
#### 期貨、選擇權日成交資訊總覽 TaiwanFutOptDailyInfo

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_futopt_daily_info()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFutOptDailyInfo",
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
                            dataset="TaiwanFutOptDailyInfo",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    | code   | type              | name             |
        |---:|:-------|:------------------|:-----------------|
        |  0 | AAA    | TaiwanOptionDaily | 南亞1000股選擇權 |
        |  1 | AAO    | TaiwanOptionDaily | 南亞選擇權       |
        |  2 | ABA    | TaiwanOptionDaily | 中鋼1000股選擇權 |
        |  3 | ABO    | TaiwanOptionDaily | 中鋼選擇權       |
        |  4 | ACA    | TaiwanOptionDaily | 聯電選擇權       |
    === "Schema"
        ```
        {
            code: str,
            type: str,
            name: str
        }
        ```

----------------------------------
#### 期貨日成交資訊 TaiwanFuturesDaily

- 資料區間：1998-07-01 ~ now
- 資料更新時間 **星期一至五 16:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_futures_daily(
            futures_id='TX',
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesDaily",
            "data_id":"TX",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
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
                            dataset="TaiwanFuturesDaily",
                            data_id="TX",
                            start_date= "2020-04-01",
                            end_date= "2020-04-12",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | date       | futures_id   |   contract_date |   open |   max |   min |   close |   spread |   spread_per |   volume |   settlement_price |   open_interest | trading_session   |
        |---:|:-----------|:-------------|----------------:|-------:|------:|------:|--------:|---------:|-------------:|---------:|-------------------:|----------------:|:------------------|
        |  0 | 2020-04-01 | TX           |          202004 |   9588 |  9650 |  9551 |    9552 |      -43 |        -0.45 |   116273 |               9555 |           83725 | position          |
        |  1 | 2020-04-01 | TX           |          202004 |   9630 |  9665 |  9551 |    9575 |      -20 |        -0.21 |    73771 |                  0 |               0 | after_market      |
        |  2 | 2020-04-01 | TX           |          202005 |   9523 |  9580 |  9484 |    9486 |      -43 |        -0.45 |     1266 |               9486 |            6435 | position          |
        |  3 | 2020-04-01 | TX           |          202005 |   9565 |  9595 |  9486 |    9526 |       -3 |        -0.03 |      452 |                  0 |               0 | after_market      |
        |  4 | 2020-04-01 | TX           |          202006 |   9452 |  9508 |  9415 |    9419 |      -36 |        -0.38 |      106 |               9419 |            5547 | position          |
    === "Schema"
        ```
        {
            date: str,
            futures_id: str,
            contract_date: str,
            open: float32,
            max: float32,
            min: float32,
            close: float32,
            spread: float32,
            spread_per: float32,
            volume: float64,
            settlement_price: float32,
            open_interest: float64,
            trading_session: str
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
        df = api.taiwan_futures_daily(
            start_date='2020-04-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesDaily",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
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
                            dataset="TaiwanFuturesDaily",
                            start_date= "2020-04-01",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | date       | futures_id   |   contract_date |   open |   max |   min |   close |   spread |   spread_per |   volume |   settlement_price |   open_interest | trading_session   |
        |---:|:-----------|:-------------|----------------:|-------:|------:|------:|--------:|---------:|-------------:|---------:|-------------------:|----------------:|:------------------|
        |  0 | 2020-04-01 | BRF          |          202005 |      0 |     0 |   0   |     0   |        0 |         0    |        0 |              681   |             381 | position          |
        |  1 | 2020-04-01 | BRF          |          202005 |    690 |   704 | 681   |   681   |       -9 |        -1.3  |       45 |                0   |               0 | after_market      |
        |  2 | 2020-04-01 | BRF          |          202006 |    795 |   799 | 774   |   774   |      -30 |        -3.73 |       63 |              774   |             435 | position          |
        |  3 | 2020-04-01 | BRF          |          202006 |    818 |   833 | 789.5 |   791   |      -13 |        -1.62 |       77 |                0   |               0 | after_market      |
        |  4 | 2020-04-01 | BRF          |          202007 |    881 |   881 | 874.5 |   874.5 |        7 |         0.81 |        3 |              874.5 |               3 | position          |
    === "Schema"
        ```
        {
            date: str,
            futures_id: str,
            contract_date: str,
            open: float32,
            max: float32,
            min: float32,
            close: float32,
            spread: float32,
            spread_per: float32,
            volume: float64,
            settlement_price: float32,
            open_interest: float64,
            trading_session: str
        }
        ```

----------------------------------
#### 選擇權日成交資訊 TaiwanOptionDaily

- 資料區間：2001-12-01 ~ now
- 資料更新時間 **星期一至五 16:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_option_daily(
            option_id='TXO',
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionDaily",
            "data_id":"TXO",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
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
                            dataset="TaiwanOptionDaily",
                            data_id="TXO",
                            start_date= "2020-04-01",
                            end_date= "2020-04-12",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table

        ```
!!! output
    === "DataFrame"
        |    | date       | futures_id   |   contract_date |   open |   max |   min |   close |   spread |   spread_per |   volume |   settlement_price |   open_interest | trading_session   |
        |---:|:-----------|:-------------|----------------:|-------:|------:|------:|--------:|---------:|-------------:|---------:|-------------------:|----------------:|:------------------|
        |  0 | 2020-04-01 | BRF          |          202005 |      0 |     0 |   0   |     0   |        0 |         0    |        0 |              681   |             381 | position          |
        |  1 | 2020-04-01 | BRF          |          202005 |    690 |   704 | 681   |   681   |       -9 |        -1.3  |       45 |                0   |               0 | after_market      |
        |  2 | 2020-04-01 | BRF          |          202006 |    795 |   799 | 774   |   774   |      -30 |        -3.73 |       63 |              774   |             435 | position          |
        |  3 | 2020-04-01 | BRF          |          202006 |    818 |   833 | 789.5 |   791   |      -13 |        -1.62 |       77 |                0   |               0 | after_market      |
        |  4 | 2020-04-01 | BRF          |          202007 |    881 |   881 | 874.5 |   874.5 |        7 |         0.81 |        3 |              874.5 |               3 | position          |
    === "Schema"
        ```
        {
            date: str,
            futures_id: str,
            contract_date: str,
            open: float32,
            max: float32,
            min: float32,
            close: float32,
            spread: float32,
            spread_per: float32,
            volume: float64,
            settlement_price: float32,
            open_interest: float64,
            trading_session: str
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
        df = api.taiwan_option_daily(
            start_date='2020-04-01'
        )
        ```
    === "Python-request"
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

        ```

!!! output
    === "DataFrame"
        |    | date       | option_id   |   contract_date |   strike_price | call_put   |   open |   max |   min |   close |   volume |   settlement_price |   open_interest | trading_session   |
        |---:|:-----------|:------------|----------------:|---------------:|:-----------|-------:|------:|------:|--------:|---------:|-------------------:|----------------:|:------------------|
        |  0 | 2020-04-01 | CAO         |          202004 |             55 | put        |   2.22 |  2.22 |  2.22 |    2.22 |        5 |               2.48 |              15 | position          |
        |  1 | 2020-04-01 | CAO         |          202004 |             40 | call       |   0    |  0    |  0    |    0    |        0 |              13.7  |               0 | position          |
        |  2 | 2020-04-01 | CAO         |          202004 |             40 | put        |   0    |  0    |  0    |    0    |        0 |               0.01 |               0 | position          |
        |  3 | 2020-04-01 | CAO         |          202004 |             41 | call       |   0    |  0    |  0    |    0    |        0 |              12.7  |               0 | position          |
        |  4 | 2020-04-01 | CAO         |          202004 |             41 | put        |   0    |  0    |  0    |    0    |        0 |               0.01 |               0 | position          |
    === "Schema"
        ```
        {
            date: str,
            option_id: str,
            contract_date: str,
            strike_price: float32,
            call_put: str,
            open: float32,
            max: float32,
            min: float32,
            close: float32,
            volume: float64,
            settlement_price: float32,
            open_interest: float64,
            trading_session: str
        }
        ```

----------------------------------
#### 期貨交易明細表 TaiwanFuturesTick (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 由於資料量過大，單次請求只提供一天資料
- 資料區間：2011-01-03 ~ now
- 資料更新時間 **星期一至五 6:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_futures_tick(
            futures_id='MTX',
            date='2020-04-01'
        )
        ```
    === "Python-request"
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

        ```
!!! output
    === "DataFrame"
        |    |   contract_date | date                | futures_id   |   price |   volume |
        |---:|----------------:|:--------------------|:-------------|--------:|---------:|
        |  0 |          202004 | 2020-04-01 00:00:01 | MTX          |    9641 |        2 |
        |  1 |          202004 | 2020-04-01 00:00:01 | MTX          |    9641 |        2 |
        |  2 |          202004 | 2020-04-01 00:00:01 | MTX          |    9641 |        6 |
        |  3 |          202004 | 2020-04-01 00:00:02 | MTX          |    9640 |        2 |
        |  4 |          202004 | 2020-04-01 00:00:02 | MTX          |    9640 |        2 |
    === "Schema"
        ```
        {
            ExercisePrice: float32,
            PutCall: str,
            contract_date: str,
            date: str,
            futures_id: str,
            price: float32,
            volume: int32
        }
        ```

----------------------------------
#### 選擇權交易明細表 TaiwanOptionTick (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 由於資料量過大，單次請求只提供一天資料
- 資料區間：2011-01-03 ~ now ( 2019-01-16~2019-06-30 缺少部分資料，不完整 )
- 資料更新時間 **星期一至五 6:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_option_tick(
            option_id='OCO',
            date='2020-04-01'
        )
        ```
    === "Python-request"
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
!!! output
    === "DataFrame"
        |    |   ExercisePrice | PutCall   |   contract_date | date                | option_id   |   price |   volume |
        |---:|----------------:|:----------|----------------:|:--------------------|:------------|--------:|---------:|
        |  0 |            20.5 | P         |          202004 | 2020-04-01 10:26:58 | OCO         |    0.29 |        1 |
        |  1 |            20.5 | P         |          202004 | 2020-04-01 10:26:58 | OCO         |    0.29 |        1 |
        |  2 |            21   | P         |          202004 | 2020-04-01 10:26:58 | OCO         |    0.44 |        2 |
        |  3 |            21   | P         |          202004 | 2020-04-01 10:26:58 | OCO         |    0.44 |        2 |
        |  4 |            21   | P         |          202004 | 2020-04-01 10:26:58 | OCO         |    0.44 |        4 |
    === "Schema"
        ```
        {
            ExercisePrice: float32,
            PutCall: str,
            contract_date: str,
            date: str,
            option_id: str,
            price: float32,
            volume: int32
        }
        ```

----------------------------------
#### 期貨三大法人買賣 TaiwanFuturesInstitutionalInvestors

- 資料區間：2018-06-01 ~ now
- 資料更新時間 **星期一至五 18:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_futures_institutional_investors(
            data_id='TX',
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesInstitutionalInvestors",
            "data_id": "TX",# "TXO"
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df.head())

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
            dataset="TaiwanFuturesInstitutionalInvestors",
            data_id="TX",
            start_date= "2020-04-01",
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
        |    | name   | date       | institutional_investors   |   long_deal_volume |   long_deal_amount |   short_deal_volume |   short_deal_amount |   long_open_interest_balance_volume |   long_open_interest_balance_amount |   short_open_interest_balance_volume |   short_open_interest_balance_amount |
        |---:|:-------|:-----------|:--------------------------|-------------------:|-------------------:|--------------------:|--------------------:|------------------------------------:|------------------------------------:|-------------------------------------:|-------------------------------------:|
        |  0 | TX     | 2020-04-01 | 自營商                    |              15050 |           28875620 |               15325 |            29415959 |                               19022 |                            36062632 |                                15962 |                             30209225 |
        |  1 | TX     | 2020-04-01 | 外資                      |              79042 |          151832089 |               75938 |           145876617 |                               65435 |                           124990394 |                                14318 |                             27292956 |
        |  2 | TX     | 2020-04-01 | 投信                      |                 30 |              57341 |                1313 |             2510881 |                                3770 |                             7204470 |                                37345 |                             71365191 |
        |  3 | TX     | 2020-04-06 | 自營商                    |              15412 |           29817592 |               14569 |            28153648 |                               19528 |                            38087211 |                                15628 |                             30423409 |
        |  4 | TX     | 2020-04-06 | 投信                      |               1135 |            2226831 |                  53 |              102477 |                                3800 |                             7465480 |                                36293 |                             71299930 |
    === "Schema"
        ```
        {
            name: str,
            date: str,
            institutional_investors: str,
            long_deal_volume: int32,
            long_deal_amount: int32,
            short_deal_volume: int32,
            short_deal_amount: int32,
            long_open_interest_balance_volume: int32,
            long_open_interest_balance_amount: int32,
            short_open_interest_balance_volume: int32,
            short_open_interest_balance_amount: int32
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
        df = api.taiwan_futopt_institutional_investors(
            start_date='2020-04-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesInstitutionalInvestors",
            "start_date": "2019-04-03",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFuturesInstitutionalInvestors",
                            start_date= "2019-04-03",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    | name   | date       | institutional_investors   |   long_deal_volume |   long_deal_amount |   short_deal_volume |   short_deal_amount |   long_open_interest_balance_volume |   long_open_interest_balance_amount |   short_open_interest_balance_volume |   short_open_interest_balance_amount |
        |---:|:-------|:-----------|:--------------------------|-------------------:|-------------------:|--------------------:|--------------------:|------------------------------------:|------------------------------------:|-------------------------------------:|-------------------------------------:|
        |  0 | ETF    | 2020-04-01 | 外資                      |                782 |             492994 |                 840 |              541759 |                                4462 |                             3167434 |                                 2552 |                               846756 |
        |  1 | ETF    | 2020-04-01 | 投信                      |                  0 |                  0 |                   0 |                   0 |                                2702 |                             1071881 |                                 4079 |                              2791150 |
        |  2 | ETF    | 2020-04-01 | 自營商                    |                405 |             151407 |                 431 |              161203 |                                4493 |                             2209637 |                                 4931 |                              2386376 |
        |  3 | ETO    | 2020-04-01 | 投信                      |                  0 |                  0 |                   0 |                   0 |                                   0 |                                   0 |                                    0 |                                    0 |
        |  4 | ETO    | 2020-04-01 | 外資                      |                  0 |                  0 |                   0 |                   0 |                                   0 |                                   0 |                                    0 |                                    0 |
    === "Schema"
        ```
        {
            name: str,
            date: str,
            institutional_investors: str,
            long_deal_volume: int32,
            long_deal_amount: int32,
            short_deal_volume: int32,
            short_deal_amount: int32,
            long_open_interest_balance_volume: int32,
            long_open_interest_balance_amount: int32,
            short_open_interest_balance_volume: int32,
            short_open_interest_balance_amount: int32
        }
        ```

----------------------------------
#### 選擇權三大法人買賣 TaiwanOptionInstitutionalInvestors

- 資料區間：2018-06-01 ~ now
- 資料更新時間 **星期一至五 16:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_option_institutional_investors(
            data_id='TXO',
            start_date='2020-04-01',
            end_date='2020-04-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionInstitutionalInvestors",
            "data_id": "TXO",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

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
            dataset="TaiwanOptionInstitutionalInvestors",
            data_id="TX",# "TXO"
            start_date= "2020-04-01",
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
        |    | name   | date       | call_put   |  institutional_investors   |   long_deal_volume |   long_deal_amount |   short_deal_volume |   short_deal_amount |   long_open_interest_balance_volume |   long_open_interest_balance_amount |   short_open_interest_balance_volume |   short_open_interest_balance_amount |
        |---:|:-------|:-----------|:-----------|:--------------------------|-------------------:|-------------------:|--------------------:|--------------------:|------------------------------------:|------------------------------------:|-------------------------------------:|-------------------------------------:|
        |  0 | TXO    | 2020-04-01 | 買權  | 自營商                    |             139973 |             370181 |              163094 |              356201 |                               58152 |                              504601 |                                81614 |                               517097 |
        |  1 | TXO    | 2020-04-01 | 買權  | 投信                      |                  0 |                  0 |                   0 |                   0 |                                   0 |                                   0 |                                    0 |                                    0 |
        |  2 | TXO    | 2020-04-01 | 買權  | 外資                      |              69409 |             214529 |               61586 |              224112 |                               75953 |                              630438 |                                55645 |                               586723 |
        |  3 | TXO    | 2020-04-06 | 買權  | 自營商                    |             124528 |             453602 |              132575 |              475720 |                               67677 |                              646018 |                                99186 |                               671818 |
        |  4 | TXO    | 2020-04-06 | 賣權  | 投信                      |                  0 |                  0 |                   0 |                   0 |                                   0 |                                   0 |                                    0 |                                    0 |
    === "Schema"
        ```
        {
            name: str,
            date: str,
            institutional_investors: str,
            long_deal_volume: int32,
            long_deal_amount: int32,
            short_deal_volume: int32,
            short_deal_amount: int32,
            long_open_interest_balance_volume: int32,
            long_open_interest_balance_amount: int32,
            short_open_interest_balance_volume: int32,
            short_open_interest_balance_amount: int32
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
        df = api.taiwan_futopt_institutional_investors(
            data_id='TXO',
            start_date='2020-04-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionInstitutionalInvestors",
            "start_date": "2019-04-03",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanOptionInstitutionalInvestors",
                            start_date= "2019-04-03",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    | name   | date       | institutional_investors   |   long_deal_volume |   long_deal_amount |   short_deal_volume |   short_deal_amount |   long_open_interest_balance_volume |   long_open_interest_balance_amount |   short_open_interest_balance_volume |   short_open_interest_balance_amount |
        |---:|:-------|:-----------|:--------------------------|-------------------:|-------------------:|--------------------:|--------------------:|------------------------------------:|------------------------------------:|-------------------------------------:|-------------------------------------:|
        |  0 | TXO    | 2020-04-01 | 自營商                    |             139973 |             370181 |              163094 |              356201 |                               58152 |                              504601 |                                81614 |                               517097 |
        |  1 | TXO    | 2020-04-01 | 投信                      |                  0 |                  0 |                   0 |                   0 |                                   0 |                                   0 |                                    0 |                                    0 |
        |  2 | TXO    | 2020-04-01 | 外資                      |              69409 |             214529 |               61586 |              224112 |                               75953 |                              630438 |                                55645 |                               586723 |
        |  3 | TXO    | 2020-04-06 | 自營商                    |             124528 |             453602 |              132575 |              475720 |                               67677 |                              646018 |                                99186 |                               671818 |
        |  4 | TXO    | 2020-04-06 | 投信                      |                  0 |                  0 |                   0 |                   0 |                                   0 |                                   0 |                                    0 |                                    0 |
    === "Schema"
        ```
        {
            name: str,
            date: str,
            institutional_investors: str,
            long_deal_volume: int32,
            long_deal_amount: int32,
            short_deal_volume: int32,
            short_deal_amount: int32,
            long_open_interest_balance_volume: int32,
            long_open_interest_balance_amount: int32,
            short_open_interest_balance_volume: int32,
            short_open_interest_balance_amount: int32
        }
        ```

----------------------------------

#### 期貨夜盤三大法人買賣 TaiwanFuturesInstitutionalInvestorsAfterHours

- 資料區間：2021-10-12 ~ now
- 資料更新時間 **星期一至六 05:00**，實際更新時間以 API 資料為主

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesInstitutionalInvestorsAfterHours",
            "data_id": "TX",
            "start_date": "2021-10-12",
            "end_date": "2024-04-12",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df.head())

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
            dataset="TaiwanFuturesInstitutionalInvestorsAfterHours",
            data_id="TX",
            start_date= "2021-10-12",
            end_date= "2024-04-12",
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
        |    | futures_id   | date       | institutional_investors   |   long_deal_volume |   long_deal_amount |   short_deal_volume |   short_deal_amount |
        |---:|:-------------|:-----------|:--------------------------|-------------------:|-------------------:|--------------------:|--------------------:|
        |  0 | TX           | 2021-10-12 | 自營商                    |               1690 |            5615098 |                1516 |             5034732 |
        |  1 | TX           | 2021-10-12 | 投信                      |                  0 |                  0 |                   0 |                   0 |
        |  2 | TX           | 2021-10-12 | 外資                      |              16315 |           54215114 |               14737 |            48973486 |
        |  3 | TX           | 2021-10-13 | 自營商                    |               2307 |            7608759 |                2252 |             7427497 |
        |  4 | TX           | 2021-10-13 | 投信                      |                  0 |                  0 |                   0 |                   0 |
    === "Schema"
        ```
        {
            name: str,
            date: str,
            institutional_investors: str,
            long_deal_volume: int32,
            long_deal_amount: int32,
            short_deal_volume: int32,
            short_deal_amount: int32,
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesInstitutionalInvestorsAfterHours",
            "start_date": "2021-10-12",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanFuturesInstitutionalInvestorsAfterHours",
                            start_date= "2021-10-12",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    | futures_id   | date       | institutional_investors   |   long_deal_volume |   long_deal_amount |   short_deal_volume |   short_deal_amount |
        |---:|:-------------|:-----------|:--------------------------|-------------------:|-------------------:|--------------------:|--------------------:|
        |  0 | F1F          | 2021-10-12 | 自營商                    |                 39 |              13769 |                  41 |               14477 |
        |  1 | F1F          | 2021-10-12 | 投信                      |                  0 |                  0 |                   0 |                   0 |
        |  2 | F1F          | 2021-10-12 | 外資                      |                 83 |              29320 |                  35 |               12349 |
        |  3 | MTX          | 2021-10-12 | 自營商                    |               2454 |            2037796 |                2761 |             2292564 |
        |  4 | MTX          | 2021-10-12 | 投信                      |                  0 |                  0 |                   0 |                   0 |
    === "Schema"
        ```
        {
            name: str,
            date: str,
            institutional_investors: str,
            long_deal_volume: int32,
            long_deal_amount: int32,
            short_deal_volume: int32,
            short_deal_amount: int32,
        }
        ```

----------------------------------
#### 選擇權夜盤三大法人買賣 TaiwanOptionInstitutionalInvestorsAfterHours

- 資料區間：2021-10-12 ~ now
- 資料更新時間 **星期一至六 05:00**，實際更新時間以 API 資料為主

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionInstitutionalInvestorsAfterHours",
            "data_id": "TXO",
            "start_date": "2021-10-12",
            "end_date": "2024-04-12",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

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
            dataset="TaiwanOptionInstitutionalInvestorsAfterHours",
            data_id="TXO",
            start_date= "2021-10-12",
            end_date= "2024-04-12",
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
        |    | option_id   | date       | call_put   | institutional_investors   |   long_deal_volume |   long_deal_amount |   short_deal_volume |   short_deal_amount |
        |---:|:------------|:-----------|:-----------|:--------------------------|-------------------:|-------------------:|--------------------:|--------------------:|
        |  0 | TXO         | 2021-10-12 | CALL       | 自營商                    |              14018 |              45608 |               14478 |               48062 |
        |  1 | TXO         | 2021-10-12 | CALL       | 投信                      |                  0 |                  0 |                   0 |                   0 |
        |  2 | TXO         | 2021-10-12 | CALL       | 外資                      |              16060 |              78585 |               14961 |               68018 |
        |  3 | TXO         | 2021-10-12 | PUT        | 自營商                    |              12802 |              50821 |               15570 |               66005 |
        |  4 | TXO         | 2021-10-12 | PUT        | 投信                      |                  0 |                  0 |                   0 |                   0 |
    === "Schema"
        ```
        {
            name: str,
            date: str,
            institutional_investors: str,
            long_deal_volume: int32,
            long_deal_amount: int32,
            short_deal_volume: int32,
            short_deal_amount: int32,
            long_open_interest_balance_volume: int32,
            long_open_interest_balance_amount: int32,
            short_open_interest_balance_volume: int32,
            short_open_interest_balance_amount: int32
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionInstitutionalInvestorsAfterHours",
            "start_date": "2021-10-12",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanOptionInstitutionalInvestorsAfterHours",
                            start_date= "2021-10-12",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    | option_id   | date       | call_put   | institutional_investors   |   long_deal_volume |   long_deal_amount |   short_deal_volume |   short_deal_amount |
        |---:|:------------|:-----------|:-----------|:--------------------------|-------------------:|-------------------:|--------------------:|--------------------:|
        |  0 | TXO         | 2021-10-12 | CALL       | 自營商                    |              14018 |              45608 |               14478 |               48062 |
        |  1 | TXO         | 2021-10-12 | CALL       | 投信                      |                  0 |                  0 |                   0 |                   0 |
        |  2 | TXO         | 2021-10-12 | CALL       | 外資                      |              16060 |              78585 |               14961 |               68018 |
        |  3 | TXO         | 2021-10-12 | PUT        | 自營商                    |              12802 |              50821 |               15570 |               66005 |
        |  4 | TXO         | 2021-10-12 | PUT        | 投信                      |                  0 |                  0 |                   0 |                   0 |
    === "Schema"
        ```
        {
            name: str,
            date: str,
            institutional_investors: str,
            long_deal_volume: int32,
            long_deal_amount: int32,
            short_deal_volume: int32,
            short_deal_amount: int32,
        }
        ```

----------------------------------
#### 期貨各卷商每日交易 TaiwanFuturesDealerTradingVolumeDaily

- 資料區間：2021-04-01 ~ now
- 資料更新時間 **星期一至五 19:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_futures_dealer_trading_volume_daily(
            futures_id='TX',
            start_date='2020-07-01'
            end_date='2020-07-12',
        )
        ```
    === "Python-request"
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

!!! output
    === "DataFrame"
        |    | date       | dealer_code   | dealer_name          | futures_id   |   volume | is_after_hour   |
        |---:|:-----------|:--------------|:---------------------|:-------------|---------:|:----------------|
        |  0 | 2020-07-01 | B224999       | 中國信託商業銀行自營 | TX           |     1500 | False           |
        |  1 | 2020-07-01 | F001000       | 國泰期貨             | TX           |     1789 | False           |
        |  2 | 2020-07-01 | F002000       | 永豐期貨             | TX           |     9664 | False           |
        |  3 | 2020-07-01 | F002999       | 永豐期貨自營         | TX           |        0 | False           |
        |  4 | 2020-07-01 | F004000       | 凱基期貨             | TX           |    43882 | False           |
    === "Schema"
        ```
        {
            date: str,
            dealer_code: str,
            dealer_name: str,
            futures_id: str,
            volume: int32,
            is_after_hour: int32
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
        df = api.taiwan_futures_dealer_trading_volume_daily(
            start_date='2021-07-01'
        )
        ```
    === "Python-request"
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
!!! output
    === "DataFrame"
        |    | date       | dealer_code   | dealer_name   | futures_id   |   volume | is_after_hour   |
        |---:|:-----------|:--------------|:--------------|:-------------|---------:|:----------------|
        |  0 | 2021-07-01 | F021000       | 元大期貨      | BRF          |        0 | True            |
        |  1 | 2021-07-01 | F004000       | 凱基期貨      | BRF          |        0 | True            |
        |  2 | 2021-07-01 | F020000       | 群益期貨      | BRF          |        0 | True            |
        |  3 | 2021-07-01 | F002000       | 永豐期貨      | BRF          |        0 | True            |
        |  4 | 2021-07-01 | F008000       | 統一期貨      | BRF          |        1 | True            |
    === "Schema"
        ```
        {
            date: str,
            dealer_code: str,
            dealer_name: str,
            futures_id: str,
            volume: int32,
            is_after_hour: int32
        }
        ```

----------------------------------
#### 選擇權各卷商每日交易 TaiwanOptionDealerTradingVolumeDaily

- 資料區間：2021-04-01 ~ now
- 資料更新時間 **星期一至五 18:00**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_option_dealer_trading_volume_daily(
            option_id='TXO',
            start_date='2020-07-01',
            end_date='2020-07-12',
        )
        ```
    === "Pytho-request"
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
!!! output
    === "DataFrame"
        |    | date       | dealer_code   | dealer_name          | option_id   |   volume | is_after_hour   |
        |---:|:-----------|:--------------|:---------------------|:------------|---------:|:----------------|
        |  0 | 2020-07-01 | B224999       | 中國信託商業銀行自營 | TXO         |    13390 | False           |
        |  1 | 2020-07-01 | F001000       | 國泰期貨             | TXO         |    17478 | False           |
        |  2 | 2020-07-01 | F002000       | 永豐期貨             | TXO         |    75395 | False           |
        |  3 | 2020-07-01 | F002999       | 永豐期貨自營         | TXO         |       98 | False           |
        |  4 | 2020-07-01 | F004000       | 凱基期貨             | TXO         |   159164 | False           |
    === "Schema"
        ```
        {
            date: str,
            dealer_code: str,
            dealer_name: str,
            option_id: str,
            volume: int32,
            is_after_hour: int32
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
        df = api.taiwan_option_dealer_trading_volume_daily(
            start_date='2021-07-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionDealerTradingVolumeDaily",
            "start_date": "2021-07-01",
            "token": "", # 參考登入，獲取金鑰
        }
        resp = requests.get(url, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        df

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
                            start_date="2021-07-01",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       | dealer_code   | dealer_name      | option_id   |   volume | is_after_hour   |
        |---:|:-----------|:--------------|:-----------------|:------------|---------:|:----------------|
        |  0 | 2021-07-01 | F021000       | 元大期貨         | ETC         |        1 | False           |
        |  1 | 2021-07-01 | F034999       | 澳帝華期貨自營   | ETC         |       42 | False           |
        |  2 | 2021-07-01 | F004000       | 凱基期貨         | ETC         |        0 | False           |
        |  3 | 2021-07-01 | S890999       | 法銀巴黎證券自營 | ETC         |       83 | False           |
        |  4 | 2021-07-01 | F002000       | 永豐期貨         | ETC         |        0 | False           |
    === "Schema"
        ```
        {
            date: str,
            dealer_code: str,
            dealer_name: str,
            option_id: str,
            volume: int32,
            is_after_hour: int32
        }
        ```

#### 期貨大額交易人未沖銷部位 TaiwanFuturesOpenInterestLargeTraders

- 資料區間：1998-07-01 ~ now
- 資料更新時間 **星期一至五 16:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_futures_open_interest_large_traders(
            futures_id='TJF',
            start_date='2024-09-01',
            end_date='2024-09-02',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesOpenInterestLargeTraders",
            "data_id":"TJF",
            "start_date": "2024-09-01",
            "end_date": "2024-09-02",
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
                            dataset="TaiwanFuturesOpenInterestLargeTraders",
                            data_id="TJF",
                            start_date= "2024-09-01",
                            end_date= "2024-09-02",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | name       | contract_type   |   buy_top5_trader_open_interest |   buy_top5_trader_open_interest_per |   buy_top10_trader_open_interest |   buy_top10_trader_open_interest_per |   sell_top5_trader_open_interest |   sell_top5_trader_open_interest_per |   sell_top10_trader_open_interest |   sell_top10_trader_open_interest_per |   market_open_interest |   buy_top5_specific_open_interest | buy_top5_specific_open_interest_per   |    buy_top10_specific_open_interest | buy_top10_specific_open_interest_per   |   sell_top5_specific_open_interest | sell_top5_specific_open_interest_per   |   sell_top10_specific_open_interest | sell_top10_specific_open_interest_per   |   date | futures_id   |
        |---:|:-----------|:-------------|----------------:|-------:|------:|------:|--------:|---------:|-------------:|---------:|-------------------:|----------------:|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|
        |  0 | 東證期貨 | 202409  | 93 |   74.4 |  113 |  90.4 |    102 |     81.6 |  118 |   94.4 |  125 |  16 | 12.8     | 16 | 12.8 | 14 | 11.2 | 14 | 11.2 | 2024-09-02 | TJF |
        |  1 |  東證期貨 | 202409  | 133 |   62.7 |  170 |  80.2 |  172 |     81.1 |  194 |   91.5 |  212 |  16 | 7.5     | 16 | 7.5 | 42 | 19.8 | 42 | 19.5 | 2024-09-02 | TJF |
    === "Schema"
        ```
        {
            name: str,
            contract_type: str,
            buy_top5_trader_open_interest: int32,
            buy_top5_trader_open_interest_per: float32,
            buy_top10_trader_open_interest: int32,
            buy_top10_trader_open_interest_per: float32,
            sell_top5_trader_open_interest: int32,
            sell_top5_trader_open_interest_per: float32,
            sell_top10_trader_open_interest: int32,
            sell_top10_trader_open_interest_per: float32,
            market_open_interest: int32,
            buy_top5_specific_open_interest: int32,
            buy_top5_specific_open_interest_per: float32,
            buy_top10_specific_open_interest: int32,
            buy_top10_specific_open_interest_per: float32,
            sell_top5_specific_open_interest: int32,
            sell_top5_specific_open_interest_per: float32,
            sell_top10_specific_open_interest: int32,
            sell_top10_specific_open_interest_per: float32,
            date: str,
            futures_id: str
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
        df = api.taiwan_futures_open_interest_large_traders(
            start_date='2024-09-02'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanFuturesOpenInterestLargeTraders",
            "start_date": "2024-09-02",
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
                            dataset="TaiwanFuturesOpenInterestLargeTraders",
                            start_date= "2024-09-02",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | name       | contract_type   |   buy_top5_trader_open_interest |   buy_top5_trader_open_interest_per |   buy_top10_trader_open_interest |   buy_top10_trader_open_interest_per |   sell_top5_trader_open_interest |   sell_top5_trader_open_interest_per |   sell_top10_trader_open_interest |   sell_top10_trader_open_interest_per |   market_open_interest |   buy_top5_specific_open_interest | buy_top5_specific_open_interest_per   |    buy_top10_specific_open_interest | buy_top10_specific_open_interest_per   |   sell_top5_specific_open_interest | sell_top5_specific_open_interest_per   |   sell_top10_specific_open_interest | sell_top10_specific_open_interest_per   |   date | futures_id   |
        |---:|:-----------|:-------------|----------------:|-------:|------:|------:|--------:|---------:|-------------:|---------:|-------------------:|----------------:|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|
        |  0 |  布蘭特原油期貨  | 202411  | 40  | 100 |  40 | 100 | 40 | 100 |  40 | 100 | 40 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | BRF |
        |  1 |  布蘭特原油期貨  | all  | 155  | 96.9 |  160 | 100 | 160 | 100 |  160 | 100 | 160 |  0 | 0  | 0 | 0 | 120 | 75 | 120 | 75 | 2024-09-02 | BRF |
        |  2 |  臺灣生技期貨  | 202409  | 15  | 78.9 |  19 | 100 | 19 | 100 |  19 | 100 | 19 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | BTF |
        |  3 |  臺灣生技期貨  | all  | 16  | 80 |  20 | 100 | 20 | 100 |  20 | 100 | 20 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | BTF |
        |  4 |  南亞期貨  | 202409  | 231  | 30.3 |  332 | 43.6 | 512 | 67.2 |  655 | 86 | 762 |  127 | 16.7  | 127 | 16.7 | 438 | 57.5 | 532 | 69.8 | 2024-09-02 | CA |
    === "Schema"
        ```
        {
            name: str,
            contract_type: str,
            buy_top5_trader_open_interest: int32,
            buy_top5_trader_open_interest_per: float32,
            buy_top10_trader_open_interest: int32,
            buy_top10_trader_open_interest_per: float32,
            sell_top5_trader_open_interest: int32,
            sell_top5_trader_open_interest_per: float32,
            sell_top10_trader_open_interest: int32,
            sell_top10_trader_open_interest_per: float32,
            market_open_interest: int32,
            buy_top5_specific_open_interest: int32,
            buy_top5_specific_open_interest_per: float32,
            buy_top10_specific_open_interest: int32,
            buy_top10_specific_open_interest_per: float32,
            sell_top5_specific_open_interest: int32,
            sell_top5_specific_open_interest_per: float32,
            sell_top10_specific_open_interest: int32,
            sell_top10_specific_open_interest_per: float32,
            date: str,
            futures_id: str
        }
        ```

----------------------------------

#### 選擇權大額交易人未沖銷部位 TaiwanOptionOpenInterestLargeTraders

- 資料區間：1998-07-01 ~ now
- 資料更新時間 **星期一至五 16:30**，實際更新時間以 API 資料為主

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_option_open_interest_large_traders(
            futures_id='CA',
            start_date='2024-09-01',
            end_date='2024-09-02',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionOpenInterestLargeTraders",
            "data_id":"CA",
            "start_date": "2024-09-01",
            "end_date": "2024-09-02",
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
                            dataset="TaiwanOptionOpenInterestLargeTraders",
                            data_id="CA",
                            start_date= "2024-09-01",
                            end_date= "2024-09-02",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | contract_type   |   buy_top5_trader_open_interest |   buy_top5_trader_open_interest_per |   buy_top10_trader_open_interest |   buy_top10_trader_open_interest_per |   sell_top5_trader_open_interest |   sell_top5_trader_open_interest_per |   sell_top10_trader_open_interest |   sell_top10_trader_open_interest_per |   market_open_interest |   buy_top5_specific_open_interest | buy_top5_specific_open_interest_per   |    buy_top10_specific_open_interest | buy_top10_specific_open_interest_per   |   sell_top5_specific_open_interest | sell_top5_specific_open_interest_per   |   sell_top10_specific_open_interest | sell_top10_specific_open_interest_per   |   date | put_call | name   | option_id |
        |---:|:-----------|:-------------|----------------:|-------:|------:|------:|--------:|---------:|-------------:|---------:|-------------------:|----------------:|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|
        |  0 | 202409  | 0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | call  | 南亞 | CA |
        |  1 | all  | 0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | call  | 南亞 | CA |
        |  2 | 202409  |  0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | put  | 南亞 | CA |
        |  3 | all  | 0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | put  | 南亞 | CA |
    === "Schema"
        ```
        {
            contract_type: str,
            buy_top5_trader_open_interest: int32,
            buy_top5_trader_open_interest_per: float32,
            buy_top10_trader_open_interest: int32,
            buy_top10_trader_open_interest_per: float32,
            sell_top5_trader_open_interest: int32,
            sell_top5_trader_open_interest_per: float32,
            sell_top10_trader_open_interest: int32,
            sell_top10_trader_open_interest_per: float32,
            market_open_interest: int32,
            buy_top5_specific_open_interest: int32,
            buy_top5_specific_open_interest_per: float32,
            buy_top10_specific_open_interest: int32,
            buy_top10_specific_open_interest_per: float32,
            sell_top5_specific_open_interest: int32,
            sell_top5_specific_open_interest_per: float32,
            sell_top10_specific_open_interest: int32,
            sell_top10_specific_open_interest_per: float32,
            date: str,
            put_call: str,
            name: str,
            option_id: str
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
        df = api.taiwan_option_open_interest_large_traders(
            start_date='2024-09-02'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanOptionOpenInterestLargeTraders",
            "start_date": "2024-09-02",
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
                            dataset="TaiwanOptionOpenInterestLargeTraders",
                            start_date= "2024-09-02",
                            token = "" # 參考登入，獲取金鑰
                            )
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | contract_type   |   buy_top5_trader_open_interest |   buy_top5_trader_open_interest_per |   buy_top10_trader_open_interest |   buy_top10_trader_open_interest_per |   sell_top5_trader_open_interest |   sell_top5_trader_open_interest_per |   sell_top10_trader_open_interest |   sell_top10_trader_open_interest_per |   market_open_interest |   buy_top5_specific_open_interest | buy_top5_specific_open_interest_per   |    buy_top10_specific_open_interest | buy_top10_specific_open_interest_per   |   sell_top5_specific_open_interest | sell_top5_specific_open_interest_per   |   sell_top10_specific_open_interest | sell_top10_specific_open_interest_per   |   date | put_call | name   | option_id |
        |---:|:-----------|:-------------|----------------:|-------:|------:|------:|--------:|---------:|-------------:|---------:|-------------------:|----------------:|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|:------------------|
        |  0 | 202409  | 0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | call  | 南亞 | CA |
        |  1 | all  | 0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | call  | 南亞 | CA |
        |  2 | 202409  |  0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | put  | 南亞 | CA |
        |  3 | all  | 0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | put  | 南亞 | CA |
        |  4 | 202409  | 0  | 0 |  0 | 0 | 0 | 0 |  0 | 0 | 0 |  0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 2024-09-02 | call  | 中鋼 | CB |
    === "Schema"
        ```
        {
            contract_type: str,
            buy_top5_trader_open_interest: int32,
            buy_top5_trader_open_interest_per: float32,
            buy_top10_trader_open_interest: int32,
            buy_top10_trader_open_interest_per: float32,
            sell_top5_trader_open_interest: int32,
            sell_top5_trader_open_interest_per: float32,
            sell_top10_trader_open_interest: int32,
            sell_top10_trader_open_interest_per: float32,
            market_open_interest: int32,
            buy_top5_specific_open_interest: int32,
            buy_top5_specific_open_interest_per: float32,
            buy_top10_specific_open_interest: int32,
            buy_top10_specific_open_interest_per: float32,
            sell_top5_specific_open_interest: int32,
            sell_top5_specific_open_interest_per: float32,
            sell_top10_specific_open_interest: int32,
            sell_top10_specific_open_interest_per: float32,
            date: str,
            put_call: str,
            name: str,
            option_id: str
        }
        ```

----------------------------------