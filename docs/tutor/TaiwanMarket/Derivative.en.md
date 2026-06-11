
In Taiwan stock derivatives data, we have 17 datasets, as follows:

- [Futures and Options Daily Trading Information Overview TaiwanFutOptDailyInfo](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfutoptdailyinfo)
- [Futures Daily Trading Information TaiwanFuturesDaily](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesdaily)
- [Options Daily Trading Information TaiwanOptionDaily](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptiondaily)
- [Futures Trading Detail Table TaiwanFuturesTick](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturestick-backersponsor)
- [Futures Spread Tick Table TaiwanFuturesSpreadTick](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesspreadtick-sponsor)
- [Options Trading Detail Table TaiwanOptionTick](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptiontick-backersponsor)
- [Futures Top Three Institutional Investors Trading TaiwanFuturesInstitutionalInvestors](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesinstitutionalinvestors)
- [Options Top Three Institutional Investors Trading TaiwanOptionInstitutionalInvestors](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptioninstitutionalinvestors)
- [Futures After-Hours Top Three Institutional Investors Trading TaiwanFuturesInstitutionalInvestorsAfterHours](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesinstitutionalinvestorsafterhours-backersponsor)
- [Options After-Hours Top Three Institutional Investors Trading TaiwanOptionInstitutionalInvestorsAfterHours](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptioninstitutionalinvestorsafterhours-backersponsor)
- [Futures Daily Trading Volume by Dealer TaiwanFuturesDealerTradingVolumeDaily](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesdealertradingvolumedaily)
- [Options Daily Trading Volume by Dealer TaiwanOptionDealerTradingVolumeDaily](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptiondealertradingvolumedaily)
- [Futures Open Interest of Large Traders TaiwanFuturesOpenInterestLargeTraders](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesopeninterestlargetraders-backersponsor)
- [Options Open Interest of Large Traders TaiwanOptionOpenInterestLargeTraders](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptionopeninterestlargetraders-backersponsor)
- [Futures Final Settlement Price TaiwanFuturesFinalSettlementPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanfuturesfinalsettlementprice-backersponsor)
- [Options Final Settlement Price TaiwanOptionFinalSettlementPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Derivative/#taiwanoptionfinalsettlementprice-backersponsor)

----------------------------------
#### Futures and Options Daily Trading Information Overview TaiwanFutOptDailyInfo

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futopt_daily_info()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFutOptDailyInfo",
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

        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFutOptDailyInfo"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            code: str, # product code
            type: str, # type
            name: str # product name
        }
        ```

----------------------------------
#### Futures Daily Trading Information TaiwanFuturesDaily

- Data range: 1998-07-01 ~ now
- Data update time: **Monday to Friday 16:30**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
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
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesDaily",
            "data_id":"TX",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesDaily",
                data_id="TX",
                start_date= "2020-04-01",
                end_date= "2020-04-12"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_futures_daily(
            futures_id_list=['TXF', 'MXF', 'EXF'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            date: str, # date
            futures_id: str, # futures code
            contract_date: str, # contract month
            open: float32, # open price
            max: float32, # max price
            min: float32, # min price
            close: float32, # close price
            spread: float32, # price change
            spread_per: float32, # price change percentage
            volume: float64, # trading volume
            settlement_price: float32, # settlement price
            open_interest: float64, # open interest
            trading_session: str # trading session
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futures_daily(
            start_date='2020-04-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesDaily",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesDaily",
                start_date= "2020-04-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            date: str, # date
            futures_id: str, # futures code
            contract_date: str, # contract month
            open: float32, # open price
            max: float32, # max price
            min: float32, # min price
            close: float32, # close price
            spread: float32, # price change
            spread_per: float32, # price change percentage
            volume: float64, # trading volume
            settlement_price: float32, # settlement price
            open_interest: float64, # open interest
            trading_session: str # trading session
        }
        ```

----------------------------------
#### Options Daily Trading Information TaiwanOptionDaily

- Data range: 2001-12-01 ~ now
- Data update time: **Monday to Friday 16:30**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_option_daily(
            option_id='TXO',
            start_date='2020-04-01',
            end_date='2020-04-02',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionDaily",
            "data_id":"TXO",
            "start_date": "2020-04-01",
            "end_date": "2020-04-02",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionDaily",
                data_id="TXO",
                start_date= "2020-04-01",
                end_date= "2020-04-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('rbind',data$data) %>%data.table

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_option_daily(
            option_id_list=['TXO', 'TEO'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```

!!! output
    === "DataFrame"
        |    | date       | option_id   |   contract_date |   strike_price | call_put   |   open |   max |   min |   close |   volume |   settlement_price |   open_interest | trading_session   |
        |---:|:-----------|:------------|----------------:|---------------:|:-----------|-------:|------:|------:|--------:|---------:|-------------------:|----------------:|:------------------|
        |  0 | 2020-04-01 | TXO         |          202004W1 |             8300 | put        |   0.1 |  0.2 |  0.1 |    0.1 |      325 |               0 |            6253 | position          |
        |  1 | 2020-04-01 | TXO         |          202004W1 |             8300 | put       |   0.2    |  0.2    |  0.1    |    0.2    |   382 |              0  |               0 | after_market          |
        |  2 | 2020-04-01 | TXO         |          202004W1 |             8400 | put        |   0.1    |  0.1    |  0.1    |    0.1    |   152 |               0 |            1710 | position          |
        |  3 | 2020-04-01 | TXO         |          202004W1 |             8400 | put       |   0.3    |  0.3    |  0.1    |    0.1    |       96 |              0  |               0 | after_market          |
        |  4 | 2020-04-01 | TXO         |          202004W1 |             8500 | put        |   0.1    |  0.1    |  0.1    |    0.1    |       94 |               0 |               3464 | position          |
    === "Schema"
        ```
        {
            date: str, # date
            option_id: str, # option code
            contract_date: str, # contract month
            strike_price:float32, # strike price
            call_put: str, # call/put
            open: float32, # open price
            max: float32, # max price
            min: float32, # min price
            close: float32, # close price
            volume: float64, # trading volume
            settlement_price: float32, # settlement price
            open_interest: float64, # open interest
            trading_session: str # trading session
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_option_daily(
            start_date='2020-04-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionDaily",
            "start_date": "2020-04-01",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionDaily",
                start_date= "2020-04-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            date: str, # date
            option_id: str, # option code
            contract_date: str, # contract month
            strike_price: float32, # strike price
            call_put: str, # call/put
            open: float32, # open price
            max: float32, # max price
            min: float32, # min price
            close: float32, # close price
            volume: float64, # trading volume
            settlement_price: float32, # settlement price
            open_interest: float64, # open interest
            trading_session: str # trading session
        }
        ```

----------------------------------
#### Futures Trading Detail Table TaiwanFuturesTick (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Due to the large data volume, each request only provides one day's data.
- Data range: 2011-01-03 ~ now
- Data update time: **Monday to Friday 6:00**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
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
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesTick",
            "data_id": "MTX",
            "start_date": "2020-04-01",
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
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesTick",
                data_id="MTX",
                start_date= "2020-01-02",
                token = "" # Refer to login to obtain the token
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
            PutCall: str, # call/put
            contract_date: str, # contract month
            date: str, # date
            futures_id: str, # futures code
            price: float32, # deal price
            volume: int32 # volume
        }
        ```

#### Fetch all data for a specific date at once (available only to [sponsorpro](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one day's data.)

- Data range: Available from the day this feature launched, one trading day at a time (no historical backfill).
- Providing the dataset and date parameters returns all market data for that day.
- Downloads the whole-day parquet via a signed URL — no need to query contract by contract.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futures_tick(
            date='2026-01-02',
            use_object=True,
        )
        ```
    === "Python-request"
        ```python
        import io
        import requests
        import pandas as pd

        url = "https://api.finmindtrade.com/api/v4/storage_objects"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesTick",
            "date": '2026-01-02',
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = pd.read_parquet(io.BytesIO(resp.content))
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        library(arrow)

        url = 'https://api.finmindtrade.com/api/v4/storage_objects'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesTick",
                date= "2026-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        con = content(response, "raw")
        data <- read_parquet(con)
        close(con)
        head(data)
        ```

!!! output
    === "DataFrame"
        |    |   contract_date | date                | futures_id   |   price |   volume |
        |---:|----------------:|:--------------------|:-------------|--------:|---------:|
        |  0 |          202601 | 2026-01-02 00:00:01 | MTX          |   23100 |        2 |
        |  1 |          202601 | 2026-01-02 00:00:01 | MTX          |   23100 |        2 |
        |  2 |          202601 | 2026-01-02 00:00:01 | MTX          |   23100 |        6 |
        |  3 |          202601 | 2026-01-02 00:00:02 | MTX          |   23098 |        2 |
        |  4 |          202601 | 2026-01-02 00:00:02 | MTX          |   23098 |        2 |
    === "Schema"
        ```
        {
            date: str, # date
            futures_id: str, # futures code
            contract_date: str, # contract month
            price: float32, # deal price
            volume: int32 # volume
        }
        ```

----------------------------------
#### Futures Spread Tick Table TaiwanFuturesSpreadTick (available only to [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Due to the large amount of data, only one day of data is provided per request
- Data range: 2026-04-27 ~ now (accumulated daily since launch)
- Data update time **Monday to Friday, intraday and after market close**, actual update time is based on the API data

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futures_spread_tick(
            futures_id='CAF',
            date='2026-06-09'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # login to get the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesSpreadTick",
            "data_id": "CAF",
            "start_date": "2026-06-09",
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
        token = "" # login to get the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesSpreadTick",
                data_id="CAF",
                start_date= "2026-06-09",
                token = "" # login to get the token
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
        |    | contract_date   | date       | time     | futures_id   |   price |   volume |   near_price |   far_price |   spread_to_spread |
        |---:|:----------------|:-----------|:---------|:-------------|--------:|---------:|-------------:|------------:|-------------------:|
        |  0 | 202606/202607   | 2026-06-09 | 08:45:03 | CAF          |    0.5  |        4 |       100.5  |     101     |                  0 |
        |  1 | 202606/202607   | 2026-06-09 | 08:45:05 | CAF          |    0.5  |        4 |       101    |     101.5   |                  0 |
        |  2 | 202606/202607   | 2026-06-09 | 08:50:38 | CAF          |    0.6  |        4 |       100    |     100.6   |                  1 |
        |  3 | 202606/202607   | 2026-06-09 | 08:50:38 | CAF          |    0.61 |        4 |       100    |     100.61  |                  1 |
    === "Schema"
        ```
        {
            date: str, # date
            time: str, # time
            futures_id: str, # futures code
            contract_date: str, # contract months (near/far)
            price: float32, # spread deal price
            volume: int32, # volume
            near_price: float32, # near month price
            far_price: float32, # far month price
            spread_to_spread: int32 # spread-to-spread deal flag (1 yes, 0 no)
        }
        ```

----------------------------------
#### Options Trading Detail Table TaiwanOptionTick (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Due to the large data volume, each request only provides one day's data.
- Data range: 2011-01-03 ~ now (data is incomplete between 2019-01-16 and 2019-06-30).
- Data update time: **Monday to Friday 6:00**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
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
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionTick",
            "data_id": "OCO",
            "start_date": "2019-09-05",
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
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionTick",
                data_id="OCO",
                start_date= "2019-09-05",
                token = "" # Refer to login to obtain the token
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        date = '2025-12-08'
        start = datetime.datetime.now()
        df = api.taiwan_option_tick(
            option_id_list=['TXO', 'TEO'],
            date=date,
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            PutCall: str, # call/put
            contract_date: str, # contract month
            date: str, # date
            option_id: str, # option code
            price: float32, # deal price
            volume: int32 # volume
        }
        ```

#### Fetch all data for a specific date at once (available only to [sponsorpro](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(Due to the large data volume, each request only provides one day's data.)

- Data range: Available from the day this feature launched, one trading day at a time (no historical backfill).
- Providing the dataset and date parameters returns all market data for that day.
- Downloads the whole-day parquet via a signed URL — no need to query contract by contract.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_option_tick(
            date='2026-01-02',
            use_object=True,
        )
        ```
    === "Python-request"
        ```python
        import io
        import requests
        import pandas as pd

        url = "https://api.finmindtrade.com/api/v4/storage_objects"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionTick",
            "date": '2026-01-02',
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = pd.read_parquet(io.BytesIO(resp.content))
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        library(arrow)

        url = 'https://api.finmindtrade.com/api/v4/storage_objects'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionTick",
                date= "2026-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        con = content(response, "raw")
        data <- read_parquet(con)
        close(con)
        head(data)
        ```

!!! output
    === "DataFrame"
        |    |   ExercisePrice | PutCall   |   contract_date | date                | option_id   |   price |   volume |
        |---:|----------------:|:----------|----------------:|:--------------------|:------------|--------:|---------:|
        |  0 |           22000 | C         |          202601 | 2026-01-02 10:00:01 | TXO         |    0.50 |        1 |
        |  1 |           22000 | C         |          202601 | 2026-01-02 10:00:02 | TXO         |    0.50 |        1 |
        |  2 |           22000 | P         |          202601 | 2026-01-02 10:00:03 | TXO         |    0.80 |        2 |
        |  3 |           22000 | P         |          202601 | 2026-01-02 10:00:04 | TXO         |    0.80 |        2 |
        |  4 |           22500 | C         |          202601 | 2026-01-02 10:00:05 | TXO         |    1.20 |        4 |
    === "Schema"
        ```
        {
            date: str, # date
            option_id: str, # option code
            ExercisePrice: float32, # exercise price
            contract_date: str, # contract month
            PutCall: str, # call/put
            price: float32, # deal price
            volume: int32 # volume
        }
        ```

----------------------------------
#### Futures Top Three Institutional Investors Trading TaiwanFuturesInstitutionalInvestors

- Data range: 2018-06-05 ~ now
- Data update time: **Monday to Friday 18:00**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
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
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesInstitutionalInvestors",
            "data_id": "TX",# "TXO"
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
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
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesInstitutionalInvestors",
                data_id="TX",
                start_date= "2020-04-01",
                end_date= "2020-04-12",
                token = "" # Refer to login to obtain the token
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_futures_institutional_investors(
            futures_id_list=['TXF', 'MXF', 'EXF'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            name: str, # product name
            date: str, # date
            institutional_investors: str, # investor type
            long_deal_volume: int32, # long-side trading volume (lots)
            long_deal_amount: int32, # long-side contract amount
            short_deal_volume: int32, # short-side trading volume (lots)
            short_deal_amount: int32, # short-side contract amount
            long_open_interest_balance_volume: int32, # long-side open interest (lots)
            long_open_interest_balance_amount: int32, # long-side open interest contract amount
            short_open_interest_balance_volume: int32, # short-side open interest (lots)
            short_open_interest_balance_amount: int32 # short-side open interest contract amount
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futopt_institutional_investors(
            start_date='2020-04-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesInstitutionalInvestors",
            "start_date": "2019-04-03",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesInstitutionalInvestors",
                start_date= "2019-04-03"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            name: str, # product name
            date: str, # date
            institutional_investors: str, # investor type
            long_deal_volume: int32, # long-side trading volume (lots)
            long_deal_amount: int32, # long-side contract amount
            short_deal_volume: int32, # short-side trading volume (lots)
            short_deal_amount: int32, # short-side contract amount
            long_open_interest_balance_volume: int32, # long-side open interest (lots)
            long_open_interest_balance_amount: int32, # long-side open interest contract amount
            short_open_interest_balance_volume: int32, # short-side open interest (lots)
            short_open_interest_balance_amount: int32 # short-side open interest contract amount
        }
        ```

----------------------------------
#### Options Top Three Institutional Investors Trading TaiwanOptionInstitutionalInvestors

- Data range: 2018-06-05 ~ now
- Data update time: **Monday to Friday 16:00**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
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
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionInstitutionalInvestors",
            "data_id": "TXO",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
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
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionInstitutionalInvestors",
                data_id="TX",# "TXO"
                start_date= "2020-04-01",
                end_date= "2020-04-12",
                token = "" # Refer to login to obtain the token
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_option_institutional_investors(
            option_id_list=['TXO', 'TEO'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            name: str, # product name
            date: str, # date
            call_put: str, # call/put
            institutional_investors: str, # investor type
            long_deal_volume: int32, # long-side trading volume (lots)
            long_deal_amount: int32, # long-side contract amount
            short_deal_volume: int32, # short-side trading volume (lots)
            short_deal_amount: int32, # short-side contract amount
            long_open_interest_balance_volume: int32, # long-side open interest (lots)
            long_open_interest_balance_amount: int32, # long-side open interest contract amount
            short_open_interest_balance_volume: int32, # short-side open interest (lots)
            short_open_interest_balance_amount: int32 # short-side open interest contract amount
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
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
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionInstitutionalInvestors",
            "start_date": "2019-04-03",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionInstitutionalInvestors",
                start_date= "2019-04-03"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            name: str, # product name
            date: str, # date
            call_put: str, # call/put
            institutional_investors: str, # investor type
            long_deal_volume: int32, # long-side trading volume (lots)
            long_deal_amount: int32, # long-side contract amount
            short_deal_volume: int32, # short-side trading volume (lots)
            short_deal_amount: int32, # short-side contract amount
            long_open_interest_balance_volume: int32, # long-side open interest (lots)
            long_open_interest_balance_amount: int32, # long-side open interest contract amount
            short_open_interest_balance_volume: int32, # short-side open interest (lots)
            short_open_interest_balance_amount: int32 # short-side open interest contract amount
        }
        ```

----------------------------------

#### Futures After-Hours Top Three Institutional Investors Trading TaiwanFuturesInstitutionalInvestorsAfterHours (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2021-10-12 ~ now
- Data update time: **Monday to Saturday 05:00**. The actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesInstitutionalInvestorsAfterHours",
            "data_id": "TX",
            "start_date": "2021-10-12",
            "end_date": "2024-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
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
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesInstitutionalInvestorsAfterHours",
                data_id="TX",
                start_date= "2021-10-12",
                end_date= "2024-04-12"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_futures_institutional_investors_after_hours(
            futures_id_list=['TXF', 'MXF', 'EXF'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            name: str, # product name
            date: str, # date
            institutional_investors: str, # investor type
            long_deal_volume: int32, # long-side trading volume (lots)
            long_deal_amount: int32, # long-side contract amount
            short_deal_volume: int32, # short-side trading volume (lots)
            short_deal_amount: int32 # short-side contract amount
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesInstitutionalInvestorsAfterHours",
            "start_date": "2021-10-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesInstitutionalInvestorsAfterHours",
                start_date= "2021-10-12"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            name: str, # product name
            date: str, # date
            institutional_investors: str, # investor type
            long_deal_volume: int32, # long-side trading volume (lots)
            long_deal_amount: int32, # long-side contract amount
            short_deal_volume: int32, # short-side trading volume (lots)
            short_deal_amount: int32 # short-side contract amount
        }
        ```

----------------------------------
#### Options After-Hours Top Three Institutional Investors Trading TaiwanOptionInstitutionalInvestorsAfterHours (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2021-10-12 ~ now
- Data update time: **Monday to Saturday 05:00**. The actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionInstitutionalInvestorsAfterHours",
            "data_id": "TXO",
            "start_date": "2021-10-12",
            "end_date": "2024-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
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
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionInstitutionalInvestorsAfterHours",
                data_id="TXO",
                start_date= "2021-10-12",
                end_date= "2024-04-12"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_option_institutional_investors_after_hours(
            option_id_list=['TXO', 'TEO'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            name: str, # product name
            date: str, # date
            call_put: str, # call/put
            institutional_investors: str, # investor type
            long_deal_volume: int32, # long-side trading volume (lots)
            long_deal_amount: int32, # long-side contract amount
            short_deal_volume: int32, # short-side trading volume (lots)
            short_deal_amount: int32, # short-side contract amount
            long_open_interest_balance_volume: int32, # long-side open interest (lots)
            long_open_interest_balance_amount: int32, # long-side open interest contract amount
            short_open_interest_balance_volume: int32, # short-side open interest (lots)
            short_open_interest_balance_amount: int32 # short-side open interest contract amount
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionInstitutionalInvestorsAfterHours",
            "start_date": "2021-10-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        print(df)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionInstitutionalInvestorsAfterHours",
                start_date= "2021-10-12"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            name: str, # product name
            date: str, # date
            call_put: str, # call/put
            institutional_investors: str, # investor type
            long_deal_volume: int32, # long-side trading volume (lots)
            long_deal_amount: int32, # long-side contract amount
            short_deal_volume: int32, # short-side trading volume (lots)
            short_deal_amount: int32 # short-side contract amount
        }
        ```

----------------------------------
#### Futures Daily Trading Volume by Dealer TaiwanFuturesDealerTradingVolumeDaily

- Data range: 2021-04-01 ~ now
- Data update time: **Monday to Friday 19:00**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futures_dealer_trading_volume_daily(
            futures_id='TX',
            start_date='2020-07-01',
            end_date='2020-07-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesDealerTradingVolumeDaily",
            "data_id": "TX",
            "start_date": "2020-07-01",
            "end_date": "2020-10-02",
        }
        resp = requests.get(url, headers=headers, params=parameter)
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
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesDealerTradingVolumeDaily",
                data_id="TX",
                start_date="2020-07-01",
                end_date="2020-10-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_futures_dealer_trading_volume_daily(
            futures_id_list=['TXF', 'MXF', 'EXF'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            date: str, # date
            dealer_code: str, # dealer code
            dealer_name: str, # dealer name
            futures_id: str, # futures code
            volume: int32, # trading volume
            is_after_hour: int32 # after-hours trading
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futures_dealer_trading_volume_daily(
            start_date='2021-07-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesDealerTradingVolumeDaily",
            "start_date": "2020-07-01",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        df

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesDealerTradingVolumeDaily",
                start_date="2020-07-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            date: str, # date
            dealer_code: str, # dealer code
            dealer_name: str, # dealer name
            futures_id: str, # futures code
            volume: int32, # trading volume
            is_after_hour: int32 # after-hours trading
        }
        ```

----------------------------------
#### Options Daily Trading Volume by Dealer TaiwanOptionDealerTradingVolumeDaily

- Data range: 2021-04-01 ~ now
- Data update time: **Monday to Friday 18:00**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_option_dealer_trading_volume_daily(
            option_id='TXO',
            start_date='2020-07-01',
            end_date='2020-07-12',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionDealerTradingVolumeDaily",
            "data_id": "TXO",
            "start_date": "2020-07-01",
            "end_date": "2020-10-02",
        }
        resp = requests.get(url, headers=headers, params=parameter)
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
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionDealerTradingVolumeDaily",
                data_id="TXO",
                start_date="2020-07-01",
                end_date="2020-10-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_option_dealer_trading_volume_daily(
            option_id_list=['TXO', 'TEO'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            date: str, # date
            dealer_code: str, # dealer code
            dealer_name: str, # dealer name
            option_id: str, # option code
            volume: int32, # trading volume
            is_after_hour: int32 # after-hours trading
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_option_dealer_trading_volume_daily(
            start_date='2021-07-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionDealerTradingVolumeDaily",
            "start_date": "2021-07-01",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        df = pd.DataFrame(data["data"])
        df

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionDealerTradingVolumeDaily",
                start_date="2021-07-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            date: str, # date
            dealer_code: str, # dealer code
            dealer_name: str, # dealer name
            option_id: str, # option code
            volume: int32, # trading volume
            is_after_hour: int32 # after-hours trading
        }
        ```

#### Futures Open Interest of Large Traders TaiwanFuturesOpenInterestLargeTraders (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 1998-07-01 ~ now
- Data update time: **Monday to Friday 16:30**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
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
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesOpenInterestLargeTraders",
            "data_id":"TJF",
            "start_date": "2024-09-01",
            "end_date": "2024-09-02",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesOpenInterestLargeTraders",
                data_id="TJF",
                start_date= "2024-09-01",
                end_date= "2024-09-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_futures_open_interest_large_traders(
            futures_id_list=['TXF', 'MXF', 'EXF'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            name: str, # product name
            contract_type: str, # contract month
            buy_top5_trader_open_interest: int32, # total open interest of top 5 buy-side traders
            buy_top5_trader_open_interest_per: float32, # percentage of top 5 buy-side traders
            buy_top10_trader_open_interest: int32, # total open interest of top 10 buy-side traders
            buy_top10_trader_open_interest_per: float32, # percentage of top 10 buy-side traders
            sell_top5_trader_open_interest: int32, # total open interest of top 5 sell-side traders
            sell_top5_trader_open_interest_per: float32, # percentage of top 5 sell-side traders
            sell_top10_trader_open_interest: int32, # total open interest of top 10 sell-side traders
            sell_top10_trader_open_interest_per: float32, # percentage of top 10 sell-side traders
            market_open_interest: int32, # total market open interest
            buy_top5_specific_open_interest: int32, # total open interest of top 5 buy-side specific institutions
            buy_top5_specific_open_interest_per: float32, # percentage of top 5 buy-side specific institutions
            buy_top10_specific_open_interest: int32, # total open interest of top 10 buy-side specific institutions
            buy_top10_specific_open_interest_per: float32, # percentage of top 10 buy-side specific institutions
            sell_top5_specific_open_interest: int32, # total open interest of top 5 sell-side specific institutions
            sell_top5_specific_open_interest_per: float32, # percentage of top 5 sell-side specific institutions
            sell_top10_specific_open_interest: int32, # total open interest of top 10 sell-side specific institutions
            sell_top10_specific_open_interest_per: float32, # percentage of top 10 sell-side specific institutions
            date: str, # date
            futures_id: str # futures code
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futures_open_interest_large_traders(
            start_date='2024-09-02'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesOpenInterestLargeTraders",
            "start_date": "2024-09-02",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesOpenInterestLargeTraders",
                start_date= "2024-09-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            name: str, # product name
            contract_type: str, # contract month
            buy_top5_trader_open_interest: int32, # total open interest of top 5 buy-side traders
            buy_top5_trader_open_interest_per: float32, # percentage of top 5 buy-side traders
            buy_top10_trader_open_interest: int32, # total open interest of top 10 buy-side traders
            buy_top10_trader_open_interest_per: float32, # percentage of top 10 buy-side traders
            sell_top5_trader_open_interest: int32, # total open interest of top 5 sell-side traders
            sell_top5_trader_open_interest_per: float32, # percentage of top 5 sell-side traders
            sell_top10_trader_open_interest: int32, # total open interest of top 10 sell-side traders
            sell_top10_trader_open_interest_per: float32, # percentage of top 10 sell-side traders
            market_open_interest: int32, # total market open interest
            buy_top5_specific_open_interest: int32, # total open interest of top 5 buy-side specific institutions
            buy_top5_specific_open_interest_per: float32, # percentage of top 5 buy-side specific institutions
            buy_top10_specific_open_interest: int32, # total open interest of top 10 buy-side specific institutions
            buy_top10_specific_open_interest_per: float32, # percentage of top 10 buy-side specific institutions
            sell_top5_specific_open_interest: int32, # total open interest of top 5 sell-side specific institutions
            sell_top5_specific_open_interest_per: float32, # percentage of top 5 sell-side specific institutions
            sell_top10_specific_open_interest: int32, # total open interest of top 10 sell-side specific institutions
            sell_top10_specific_open_interest_per: float32, # percentage of top 10 sell-side specific institutions
            date: str, # date
            futures_id: str # futures code
        }
        ```

----------------------------------

#### Options Open Interest of Large Traders TaiwanOptionOpenInterestLargeTraders (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 1998-07-01 ~ now
- Data update time: **Monday to Friday 16:30**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
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
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionOpenInterestLargeTraders",
            "data_id":"CA",
            "start_date": "2024-09-01",
            "end_date": "2024-09-02",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionOpenInterestLargeTraders",
                data_id="CA",
                start_date= "2024-09-01",
                end_date= "2024-09-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_option_open_interest_large_traders(
            option_id_list=['TXO', 'TEO'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
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
            contract_type: str, # contract month
            buy_top5_trader_open_interest: int32, # total open interest of top 5 buy-side traders
            buy_top5_trader_open_interest_per: float32, # percentage of top 5 buy-side traders
            buy_top10_trader_open_interest: int32, # total open interest of top 10 buy-side traders
            buy_top10_trader_open_interest_per: float32, # percentage of top 10 buy-side traders
            sell_top5_trader_open_interest: int32, # total open interest of top 5 sell-side traders
            sell_top5_trader_open_interest_per: float32, # percentage of top 5 sell-side traders
            sell_top10_trader_open_interest: int32, # total open interest of top 10 sell-side traders
            sell_top10_trader_open_interest_per: float32, # percentage of top 10 sell-side traders
            market_open_interest: int32, # total market open interest
            buy_top5_specific_open_interest: int32, # total open interest of top 5 buy-side specific institutions
            buy_top5_specific_open_interest_per: float32, # percentage of top 5 buy-side specific institutions
            buy_top10_specific_open_interest: int32, # total open interest of top 10 buy-side specific institutions
            buy_top10_specific_open_interest_per: float32, # percentage of top 10 buy-side specific institutions
            sell_top5_specific_open_interest: int32, # total open interest of top 5 sell-side specific institutions
            sell_top5_specific_open_interest_per: float32, # percentage of top 5 sell-side specific institutions
            sell_top10_specific_open_interest: int32, # total open interest of top 10 sell-side specific institutions
            sell_top10_specific_open_interest_per: float32, # percentage of top 10 sell-side specific institutions
            date: str, # date
            put_call: str, # call/put
            name: str, # product name
            option_id: str # option code
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_option_open_interest_large_traders(
            start_date='2024-09-02'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionOpenInterestLargeTraders",
            "start_date": "2024-09-02",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionOpenInterestLargeTraders",
                start_date= "2024-09-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
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
            contract_type: str, # contract month
            buy_top5_trader_open_interest: int32, # total open interest of top 5 buy-side traders
            buy_top5_trader_open_interest_per: float32, # percentage of top 5 buy-side traders
            buy_top10_trader_open_interest: int32, # total open interest of top 10 buy-side traders
            buy_top10_trader_open_interest_per: float32, # percentage of top 10 buy-side traders
            sell_top5_trader_open_interest: int32, # total open interest of top 5 sell-side traders
            sell_top5_trader_open_interest_per: float32, # percentage of top 5 sell-side traders
            sell_top10_trader_open_interest: int32, # total open interest of top 10 sell-side traders
            sell_top10_trader_open_interest_per: float32, # percentage of top 10 sell-side traders
            market_open_interest: int32, # total market open interest
            buy_top5_specific_open_interest: int32, # total open interest of top 5 buy-side specific institutions
            buy_top5_specific_open_interest_per: float32, # percentage of top 5 buy-side specific institutions
            buy_top10_specific_open_interest: int32, # total open interest of top 10 buy-side specific institutions
            buy_top10_specific_open_interest_per: float32, # percentage of top 10 buy-side specific institutions
            sell_top5_specific_open_interest: int32, # total open interest of top 5 sell-side specific institutions
            sell_top5_specific_open_interest_per: float32, # percentage of top 5 sell-side specific institutions
            sell_top10_specific_open_interest: int32, # total open interest of top 10 sell-side specific institutions
            sell_top10_specific_open_interest_per: float32, # percentage of top 10 sell-side specific institutions
            date: str, # date
            put_call: str, # call/put
            name: str, # product name
            option_id: str # option code
        }
        ```

----------------------------------
#### Futures Spread Trading Quote Table TaiwanFuturesSpreadTrading (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2007-10-08 ~ now
- Data update time: **Monday to Friday every 3 hours**. The actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesSpreadTrading",
            "data_id": "TX",
            "start_date": "2024-01-01",
            "end_date": "2024-12-31",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesSpreadTrading",
                data_id="TX",
                start_date= "2024-01-01",
                end_date= "2024-12-31"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_futures_spread_trading(
            futures_id_list=['TXF', 'MXF', 'EXF'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```

!!! output
    === "DataFrame"
        |    | date       | futures_id | contract_date   | open  | max   | min   | close | best_bid | best_ask | historical_max | historical_min | spread_to_spread_volume | spread_to_single_volume | trading_session |
        |---:|:-----------|:-----------|:----------------|:------|:------|:------|:------|:---------|:---------|:---------------|:---------------|:------------------------|:------------------------|:----------------|
        |  0 | 2024-01-02 | TX         | 202401/202402   | -85.0 | -72.0 | -98.0 | -78.0 | -80.0    | -77.0    | 565.0          | -418.0         | 1234.0                  | 567.0                   | position        |
        |  1 | 2024-01-02 | TX         | 202401/202403   | -90.0 | -80.0 | -105.0| -85.0 | -88.0    | -82.0    | 600.0          | -450.0         | 234.0                   | 123.0                   | position        |
    === "Schema"
        ```
        {
            date: str, # date
            futures_id: str, # futures code
            contract_date: str, # contract month
            open: float64, # open price
            max: float64, # max price
            min: float64, # min price
            close: float64, # close price
            best_bid: float64, # best bid price
            best_ask: float64, # best ask price
            historical_max: float64, # historical max price
            historical_min: float64, # historical min price
            spread_to_spread_volume: float64, # spread-to-spread trading volume
            spread_to_single_volume: float64, # spread-to-single trading volume
            trading_session: str # trading session
        }
        ```

----------------------------------
#### Futures Final Settlement Price TaiwanFuturesFinalSettlementPrice (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 1998-01-01 ~ now
- Data update time: **Monday to Friday every 3 hours**. The actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFuturesFinalSettlementPrice",
            "data_id": "TX",
            "start_date": "2024-01-01",
            "end_date": "2024-12-31",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFuturesFinalSettlementPrice",
                data_id="TX",
                start_date= "2024-01-01",
                end_date= "2024-12-31"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_futures_final_settlement_price(
            futures_id_list=['TXF', 'MXF', 'EXF'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```

!!! output
    === "DataFrame"
        |    | date       | contract_month | futures_type | futures_id | futures_name | settlement_price | underlying_code | notional_value |
        |---:|:-----------|:---------------|:-------------|:-----------|:-------------|:-----------------|:----------------|:---------------|
        |  0 | 2024-01-17 | 202401         | index        | TX         | 臺股期貨     | 17881.0          |                 | 0.0            |
        |  1 | 2024-02-21 | 202402         | index        | TX         | 臺股期貨     | 18658.0          |                 | 0.0            |
        |  2 | 2024-03-20 | 202403         | index        | TX         | 臺股期貨     | 20199.0          |                 | 0.0            |
    === "Schema"
        ```
        {
            date: str, # expiration date
            contract_month: str, # contract month
            futures_type: str, # futures type (index/stock/commodity)
            futures_id: str, # futures code
            futures_name: str, # futures name
            settlement_price: float64, # final settlement price
            underlying_code: str, # underlying security code
            notional_value: float64 # notional contract value
        }
        ```

----------------------------------

#### Options Final Settlement Price TaiwanOptionFinalSettlementPrice (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2001-01-01 ~ now
- Data update time: **Monday to Friday every 3 hours**. The actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanOptionFinalSettlementPrice",
            "data_id": "TXO",
            "start_date": "2024-01-01",
            "end_date": "2024-12-31",
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
        token = "" # Refer to login to obtain the token
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanOptionFinalSettlementPrice",
                data_id="TXO",
                start_date= "2024-01-01",
                end_date= "2024-12-31"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_option_final_settlement_price(
            option_id_list=['TXO', 'TEO'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```

!!! output
    === "DataFrame"
        |    | date       | contract_month | option_type | option_id | option_name      | settlement_price | underlying_code | notional_value |
        |---:|:-----------|:---------------|:------------|:----------|:-----------------|:-----------------|:----------------|:---------------|
        |  0 | 2024-01-17 | 202401         | index       | TXO       | 臺指選擇權       | 17881.0          |                 | 0.0            |
        |  1 | 2024-02-21 | 202402         | index       | TXO       | 臺指選擇權       | 18658.0          |                 | 0.0            |
        |  2 | 2024-03-20 | 202403         | index       | TXO       | 臺指選擇權       | 20199.0          |                 | 0.0            |
    === "Schema"
        ```
        {
            date: str, # expiration date
            contract_month: str, # contract month
            option_type: str, # option type (index/stock)
            option_id: str, # option code
            option_name: str, # option name
            settlement_price: float64, # final settlement price
            underlying_code: str, # underlying security code
            notional_value: float64 # notional contract value
        }
        ```

----------------------------------
