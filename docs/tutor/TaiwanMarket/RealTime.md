在台股即時資料，我們擁有 4 種資料集，如下:


- [台股即時資訊 taiwan_stock_tick_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_stock_tick_snapshot-sponsor)
- [期貨、選擇權即時報價總覽 TaiwanFutOptTickInfo](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwanfutopttickinfo)
- [台股期貨即時資訊 taiwan_futures_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_futures_snapshot-sponsor)
- [台股選擇權即時資訊 taiwan_options_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_options_snapshot-sponsor)


----------------------------------
#### 台股即時資訊 taiwan_stock_tick_snapshot (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
(約 10 秒更新一次)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_tick_snapshot(stock_id="2330")
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_tick_snapshot"
        parameter = {
            "data_id": "2330",
            # "data_id": ["2330", "2317"], # 一次拿多個
            # "data_id": "", # 一次全部
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # 參考登入，獲取金鑰
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_tick_snapshot"
        response = httr::GET(
        url = url,
        query = list(
            data_id="2330",
            # data_id=c("2330", "2317"), # 一次拿多個
            # data_id="", # 一次全部
            token = "" # 參考登入，獲取金鑰
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
        |    |   amount |   average_price |   buy_price |   buy_volume |   change_price |   change_rate |   close |   high |   low |   open |   sell_price |   sell_volume |   total_amount |   total_volume |   volume |   volume_ratio |   yesterday_volume | date                       |   stock_id |   TickType |
        |---:|---------:|----------------:|------------:|-------------:|---------------:|--------------:|--------:|-------:|------:|-------:|-------------:|--------------:|---------------:|---------------:|---------:|---------------:|-------------------:|:---------------------------|-----------:|-----------:|
        |  0 |   610000 |          611.42 |         609 |          208 |              3 |          0.49 |     610 |    614 |   608 |    614 |          610 |           821 |     5578566000 |           9124 |        1 |           0.49 |              18606 | 2021-12-08 10:31:23.098000 |       2330 |          1 |
    === "Schema"
        ```
        {
            amount: int32,
            average_price: float64,
            buy_price: float64,
            buy_volume: int64,
            change_price: str,
            change_rate: float64,
            close: float64,
            high: float64,
            low: float64,
            open: float64,
            sell_price: float64,
            sell_volume: int64,
            total_amount: int32,
            total_volume: int64,
            volume: int64,
            volume_ratio: float64,
            yesterday_volume: int64,
            date: str,
            stock_id: str,
            TickType: str # 0: 無法判斷, 1: 賣盤成交, 2: 買盤成交
        }
        ```

----------------------------------
#### 期貨、選擇權即時報價總覽 TaiwanFutOptTickInfo
目前支援，台指期、台指選擇權，即時報價

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futopt_tick_info()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanFutOptTickInfo",
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
        token = "" # 參考登入，獲取金鑰
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanFutOptTickInfo"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    | code       | callput   | date    | name           | listing_date   |   expire_price | update_date   |
        |---:|:-----------|:----------|:--------|:---------------|:---------------|---------------:|:--------------|
        |  0 | CAO00675R3 | 賣權      | 2023/06 | 南亞股票選擇權 | 2023-04-20     |           67.5 | 2023-06-05    |
        |  1 | CAO00850R3 | 賣權      | 2023/06 | 南亞股票選擇權 | 2023-01-31     |           85   | 2023-06-05    |
        |  2 | CBO00360R3 | 賣權      | 2023/06 | 中鋼股票選擇權 | 2023-01-31     |           36   | 2023-06-05    |
        |  3 | CCO00430R3 | 賣權      | 2023/06 | 聯電股票選擇權 | 2023-04-20     |           43   | 2023-06-05    |
        |  4 | CCO00440R3 | 賣權      | 2023/06 | 聯電股票選擇權 | 2023-01-31     |           44   | 2023-06-05    |
    === "Schema"
        ```
        {
            code: str,
            callput: str,
            date: str,
            name: str,
            listing_date: str,
            expire_price: float64,
            update_date: str
        }
        ```

----------------------------------
#### 台股期貨即時資訊 taiwan_futures_snapshot (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
(目前支援台指期、約 30 秒更新一次)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = data_loader.taiwan_futures_snapshot(futures_id="TXF")
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_futures_snapshot"
        parameter = {
            "data_id": "TXF", # 目前只支援台指期
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
        url = "https://api.finmindtrade.com/api/v4/taiwan_futures_snapshot"
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                data_id="TXF" # 目前只支援台指期
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
        |    |   open |   high |   low |   close |   change_price |   change_rate |   average_price |   volume |   total_volume |   amount |   total_amount |   yesterday_volume |   buy_price |   buy_volume |   sell_price |   sell_volume |   volume_ratio | date                    | futures_id   |   TickType |
        |---:|-------:|-------:|------:|--------:|---------------:|--------------:|----------------:|---------:|---------------:|---------:|---------------:|-------------------:|------------:|-------------:|-------------:|--------------:|---------------:|:------------------------|:-------------|-----------:|
        |  0 |  16720 |  16800 | 16714 |   16762 |             51 |          0.31 |         16757.2 |        1 |          52822 |    16762 |      885151394 |              46576 |       16760 |           61 |        16765 |             8 |        1.13 | 2023-06-03 04:59:59.243 | TXFR1        |          2 |
        |  1 |  16720 |  16800 | 16714 |   16762 |             51 |          0.31 |         16757.2 |        1 |          52822 |    16762 |      885151394 |              46576 |       16760 |           61 |        16765 |             8 |        1.13 | 2023-06-03 04:59:59.243 | TXFF3        |          2 |
        |  2 |  16290 |  16291 | 16290 |   16291 |             68 |          0.42 |         16290.5 |        1 |              2 |    16291 |          32581 |                  3 |       16266 |            2 |        16500 |             2 |        0.67 | 2023-06-02 23:01:10.244 | TXFC4        |          1 |
        |  3 |  16409 |  16468 | 16400 |   16449 |             64 |          0.39 |         16431.9 |        1 |            110 |    16449 |        1807505 |                 90 |       16424 |            1 |        16450 |             1 |        1.22 | 2023-06-03 03:00:34.248 | TXFH3        |          1 |
        |  4 |  16300 |  16373 | 16300 |   16335 |             56 |          0.34 |         16340.8 |        1 |             10 |    16335 |         163408 |                  8 |       16315 |            1 |        16355 |             1 |        1.25 | 2023-06-03 03:36:00.561 | TXFL3        |          1 |
    === "Schema"
        ```
        {
            open: float64,
            high: float64,
            low: float64,
            close: float64,
            change_price: float64,
            change_rate: float64,
            average_price: float64,
            volume: int64,
            total_volume" int64,
            amount: str,
            total_amount: str,
            yesterday_volume: int64,
            buy_price: float64,
            buy_volume: int64,
            sell_price: float64,
            sell_volume: int64,
            volume_ratio: float64,
            date: str,
            options_id: str,
            TickType: str # 0: 無法判斷, 1: 賣盤成交, 2: 買盤成交
        }
        ```

----------------------------------
#### 台股選擇權即時資訊 taiwan_options_snapshot (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
(目前支援台指選擇權、約 30 秒更新一次)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = data_loader.taiwan_options_snapshot(options_id="TXO")
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_options_snapshot"
        parameter = {
            "data_id": "TXO", # 目前只支援台指選擇權
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
        token = "" # 參考登入，獲取金鑰
        url = "https://api.finmindtrade.com/api/v4/taiwan_options_snapshot"
        response = httr::GET(
            url = url,
            query = list(
                data_id="TXO" # 目前只支援台指期
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
        |    |   open |   high |   low |   close |   change_price |   change_rate |   average_price |   volume |   total_volume |   amount |   total_amount |   yesterday_volume |   buy_price |   buy_volume |   sell_price |   sell_volume |   volume_ratio | date                    | options_id   |   TickType |
        |---:|-------:|-------:|------:|--------:|---------------:|--------------:|----------------:|---------:|---------------:|---------:|---------------:|-------------------:|------------:|-------------:|-------------:|--------------:|---------------:|:------------------------|:-------------|-----------:|
        |  0 |     46 |     46 |  45.5 |    46   |          -12   |        -20.69 |           45.75 |       17 |             40 |      782 |           1830 |                  2 |         0.6 |            5 |            0 |             0 |        20    | 2023-06-02 13:07:35.299 | TXO14300T3   |          1 |
        |  1 |     60 |     65 |  46.5 |    46.5 |          -17.5 |        -27.34 |           58.76 |        1 |            939 |       46 |          55172 |                936 |        48.5 |            2 |           65 |             3 |        1    | 2023-06-03 02:07:52.807 | TXO15400S3   |          2 |
        |  2 |    905 |    910 | 875   |   875   |          -45   |         -4.89 |          891.25 |        1 |              4 |      875 |           3565 |                  2 |         1.1 |            6 |            0 |             0 |        2    | 2023-06-02 20:06:14.720 | TXO17000U3   |          2 |
        |  3 |    695 |    695 | 695   |   695   |           25   |          3.73 |          695    |        1 |              1 |      695 |            695 |                 13 |         6.3 |            1 |         1030 |             2 |        0.08 | 2023-06-02 15:29:16.150 | TXO16400L3   |          1 |
        |  4 |      0 |      0 |   0   |     0   |            0   |          0    |            0    |        0 |              0 |        0 |              0 |                  0 |         1.1 |            3 |            0 |             0 |        0    | 2023-06-04 08:30:00.000 | TXO15000H3   |          0 |
    === "Schema"
        ```
        {
            open: float64,
            high: float64,
            low: float64,
            close: float64,
            change_price: float64,
            change_rate: float64,
            average_price: float64,
            volume: int64,
            total_volume" int64,
            amount: str,
            total_amount: str,
            yesterday_volume: int64,
            buy_price: float64,
            buy_volume: int64,
            sell_price: float64,
            sell_volume: int64,
            volume_ratio: float64,
            date: str,
            options_id: str,
            TickType: str # 0: 無法判斷, 1: 賣盤成交, 2: 買盤成交
        }
        ```
