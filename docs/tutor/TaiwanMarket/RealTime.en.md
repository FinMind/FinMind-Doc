For Taiwan stock real-time data, we have 4 datasets, as listed below:

??? note "Taiwan stock real-time data requires your name, phone number, and address in the Member Center"
    Under Taiwan Stock Exchange regulations, users of Taiwan stock real-time data ([taiwan_stock_tick_snapshot](https://finmind.github.io/en/tutor/TaiwanMarket/RealTime/#taiwan-stock-real-time-information-taiwan_stock_tick_snapshot-only-available-to-sponsor-members)) must fill in their name, phone number, and address in the [Member Center](https://finmindtrade.com/analysis/#/account/user) by **2027-01-31** (you can also fill it in when registering). You can view or update this information at any time afterwards.

    What happens if you have not filled it in:

    - **Before 2027-01-31**: you can still use the data as usual; API responses include an extra `profile_notice` field as a reminder.
    - **From 2027-01-31**: you will no longer be able to get Taiwan stock real-time data; the API returns an HTTP 403 error whose message includes a link to the Member Center.

    For how this information is used, see the [Privacy Policy](https://finmind.github.io/en/PrivacyPolicy/#realtime-profile).


- [Taiwan Stock Real-Time Information taiwan_stock_tick_snapshot](https://finmind.github.io/en/tutor/TaiwanMarket/RealTime/#taiwan-stock-real-time-information-taiwan_stock_tick_snapshot-only-available-to-sponsor-members)
- [Futures and Options Real-Time Quote Overview TaiwanFutOptTickInfo](https://finmind.github.io/en/tutor/TaiwanMarket/RealTime/#futures-and-options-real-time-quote-overview-taiwanfutopttickinfo)
- [Taiwan Futures Real-Time Information taiwan_futures_snapshot](https://finmind.github.io/en/tutor/TaiwanMarket/RealTime/#taiwan-futures-real-time-information-taiwan_futures_snapshot-only-available-to-sponsor-members)
- [Taiwan Options Real-Time Information taiwan_options_snapshot](https://finmind.github.io/en/tutor/TaiwanMarket/RealTime/#taiwan-options-real-time-information-taiwan_options_snapshot-only-available-to-sponsor-members)


----------------------------------
#### Taiwan Stock Real-Time Information taiwan_stock_tick_snapshot (only available to [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(updated approximately every 10 seconds)

??? note "Name, phone number, and address required by 2027-01-31"
    To use this dataset, fill in your name, phone number, and address in the [Member Center](https://finmindtrade.com/analysis/#/account/user) by 2027-01-31. Before then, users who have not filled it in can still use the data, with a `profile_notice` reminder in the response; from 2027-01-31, they will no longer be able to get Taiwan stock real-time data, and the API returns an HTTP 403 error whose message includes a link to the Member Center.

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
        token = "" # See login section to obtain a token
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_tick_snapshot"
        parameter = {
            "data_id": "2330",
            # "data_id": ["2330", "2317"], # fetch multiple at once
            # "data_id": "", # fetch all at once
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
        token = "" # See login section to obtain a token
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_tick_snapshot"
        response = httr::GET(
        url = url,
        query = list(
            data_id="2330",
            # data_id=c("2330", "2317"), # fetch multiple at once
            # data_id="", # fetch all at once
            token = "" # See login section to obtain a token
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
        |    |   amount |   average_price |   buy_price |   buy_volume |   change_price |   change_rate |   close |   high |   low |   open |   sell_price |   sell_volume |   total_amount |   total_volume |   volume |   volume_ratio |   yesterday_volume | date                       |   stock_id |   TickType |   yesterday_close |   limit_up |   limit_down | buy_prices                | buy_volumes            | sell_prices               | sell_volumes            |   inside_volume |   outside_volume |   after_hours_volume | is_closed   |
        |---:|---------:|----------------:|------------:|-------------:|---------------:|--------------:|--------:|-------:|------:|-------:|-------------:|--------------:|---------------:|---------------:|---------:|---------------:|-------------------:|:---------------------------|-----------:|-----------:|------------------:|-----------:|-------------:|:--------------------------|:-----------------------|:--------------------------|:------------------------|----------------:|-----------------:|---------------------:|:------------|
        |  0 |   610000 |          611.42 |         609 |          208 |              3 |          0.49 |     610 |    614 |   608 |    614 |          610 |           821 |     5578566000 |           9124 |        1 |           0.49 |              18606 | 2021-12-08 10:31:23.098000 |       2330 |          1 |               607 |        667 |          547 | [609, 608, 607, 606, 605] | [208, 512, 377, 290, 455] | [610, 611, 612, 613, 614] | [821, 603, 418, 352, 509] |            4380 |             4744 |                    0 | False       |
    === "Schema"
        ```
        {
            amount: int32, # transaction amount
            average_price: float64, # average transaction price
            buy_price: float64, # bid price
            buy_volume: int64, # bid volume
            change_price: str, # price change
            change_rate: float64, # percent change
            close: float64, # latest transaction price
            high: float64, # high
            low: float64, # low
            open: float64, # open
            sell_price: float64, # ask price
            sell_volume: int64, # ask volume
            total_amount: int32, # cumulative transaction amount
            total_volume: int64, # cumulative volume
            volume: int64, # volume
            volume_ratio: float64, # ratio of today's volume to yesterday's
            yesterday_volume: int64, # yesterday's volume
            date: str, # transaction time
            stock_id: str, # stock code
            TickType: str # tick type (0: undetermined, 1: buyer-initiated (trade at ask), 2: seller-initiated (trade at bid)),
            yesterday_close: float64, # previous close
            limit_up: float64, # limit-up price (null for emerging-market stocks)
            limit_down: float64, # limit-down price (null for emerging-market stocks)
            buy_prices: list, # best 5 bid prices (level 1 equals buy_price; 0 for market orders)
            buy_volumes: list, # best 5 bid volumes
            sell_prices: list, # best 5 ask prices (level 1 equals sell_price; 0 for market orders)
            sell_volumes: list, # best 5 ask volumes
            inside_volume: int64, # inside volume (traded at bid)
            outside_volume: int64, # outside volume (traded at ask)
            after_hours_volume: int64, # after-hours fixed-price trading volume
            is_closed: bool # market close flag (True once the stock has closed for the day)
        }
        ```

??? note "Volume units and emerging-market stock fields"
    * Volume fields (`volume`, `total_volume`, `yesterday_volume`, `buy_volume`, `sell_volume`, `buy_volumes`, `sell_volumes`, `inside_volume`, `outside_volume`, `after_hours_volume`) are in lots for TWSE- and TPEx-listed stocks, and in shares for emerging-market stocks
    * Emerging-market stocks have no price limits, so `limit_up` and `limit_down` are null
    * Emerging-market stocks provide only the best bid and ask, so `buy_prices`, `buy_volumes`, `sell_prices` and `sell_volumes` have a value only at level 1; levels 2 ~ 5 are 0

!!! info "data_id index codes"
    Besides stock IDs, `data_id` also supports 91 index codes (3 digits), e.g. `001` = TAIEX. Indices return different fields from stocks; see [Taiwan Stock Index Real-Time Information](#taiwan-stock-index-real-time-information-taiwan_stock_tick_snapshot-index-only-available-to-sponsor-members) below.

----------------------------------
#### Taiwan Stock Index Real-Time Information taiwan_stock_tick_snapshot index (only available to [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
Uses the same API as Taiwan Stock Real-Time Information: pass an index code (3 digits) as `data_id` to get real-time index data, e.g. `001` = TAIEX, `101` = OTC index. 91 indices are supported; see the full mapping in [Taiwan Stock Index Codes](IndexCodes.md).

??? note "Indices and stocks return different fields"
    Indices return only the fields listed in the Schema below. They have no stock bid/ask fields (`buy_price`, `buy_volume`, `sell_price`, `sell_volume`, `buy_prices`, `buy_volumes`, `sell_prices`, `sell_volumes`), no `TickType`, and no `yesterday_close`, `limit_up`, `limit_down`, `inside_volume`, `outside_volume`, `after_hours_volume` or `is_closed`; they additionally return the index name `name`.

    With an empty `data_id` (all codes), stocks and indices are returned in the same table; tell them apart by the length of `stock_id` (3 digits for indices).

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_tick_snapshot(stock_id="001")
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        token = "" # See login section to obtain a token
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_tick_snapshot"
        parameter = {
            "data_id": "001",
            # "data_id": ["001", "101"], # multiple codes at once
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
        token = "" # See login section to obtain a token
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_tick_snapshot"
        response = httr::GET(
        url = url,
        query = list(
            data_id="001",
            # data_id=c("001", "101"), # multiple codes at once
            token = "" # See login section to obtain a token
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
        |    |    open |    high |     low |   close |   change_price |   change_rate |   average_price |   volume |   total_volume |      amount |   total_amount |   yesterday_volume |   volume_ratio | date                |   stock_id | name     |
        |---:|--------:|--------:|--------:|--------:|---------------:|--------------:|----------------:|---------:|---------------:|------------:|---------------:|-------------------:|---------------:|:--------------------|-----------:|:---------|
        |  0 | 35899.5 | 37108.2 | 35442.4 | 36811.9 |          778.6 |          2.16 |               0 |   363837 |       15776245 | 38042420910 |  1079165406470 |           16796828 |           0.94 | 2026-11-23 13:33:00 |        001 | 加權指數 |
    === "Schema"
        ```
        {
            open: float64, # opening index level
            high: float64, # highest index level
            low: float64, # lowest index level
            close: float64, # latest index level
            change_price: float64, # change in points
            change_rate: float64, # change in percent
            average_price: float64, # not applicable to indices, always 0
            volume: int64, # volume (lots)
            total_volume: int64, # accumulated volume (lots)
            amount: int64, # trading value (TWD)
            total_amount: int64, # accumulated trading value (TWD)
            yesterday_volume: int64, # previous day's volume (lots)
            volume_ratio: float64, # ratio of today's to yesterday's volume
            date: str, # update time
            stock_id: str, # index code (3 digits)
            name: str # index name
        }
        ```

----------------------------------
#### Futures and Options Real-Time Quote Overview TaiwanFutOptTickInfo
Currently supports real-time quotes for TAIEX futures and TAIEX options.

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
        token = "" # See login section to obtain a token
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
        token = "" # See login section to obtain a token
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
            code: str, # code
            callput: str, # call/put
            date: str, # date
            name: str, # name
            listing_date: str, # listing date
            expire_price: float64, # strike price
            update_date: str # update date
        }
        ```

----------------------------------
#### Taiwan Futures Real-Time Information taiwan_futures_snapshot (only available to [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(updated approximately every 30 seconds)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_futures_snapshot(futures_id="TXF")
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        token = "" # See login section to obtain a token
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_futures_snapshot"
        parameter = {
            "data_id": "TXF", # TXF, TMF, CDF
            # "data_id": "", # fetch all at once
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
        token = "" # See login section to obtain a token
        response = httr::GET(
            url = url,
            query = list(
                data_id="TXF" # TXF, TMF, CDF
                # data_id="" # fetch all at once
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
            open: float64, # open
            high: float64, # high
            low: float64, # low
            close: float64, # latest transaction price
            change_price: float64, # price change
            change_rate: float64, # percent change
            average_price: float64, # average transaction price
            volume: int64, # volume
            total_volume: int64, # cumulative volume
            amount: str, # transaction amount
            total_amount: str, # cumulative transaction amount
            yesterday_volume: int64, # yesterday's volume
            buy_price: float64, # bid price
            buy_volume: int64, # bid volume
            sell_price: float64, # ask price
            sell_volume: int64, # ask volume
            volume_ratio: float64, # ratio of today's volume to yesterday's
            date: str, # transaction time
            futures_id: str, # futures code
            TickType: str # tick type (0: undetermined, 1: buyer-initiated (trade at ask), 2: seller-initiated (trade at bid))
        }
        ```

----------------------------------
#### Taiwan Options Real-Time Information taiwan_options_snapshot (only available to [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)
(updated approximately every 30 seconds)

??? note "Contract series codes (monthly, Wednesday-expiry weekly, Friday-expiry weekly)"
    TAIEX options come in three contract series. Pass the corresponding TAIFEX trading-system code as `data_id`:

    | `data_id` | Contract |
    | --- | --- |
    | `TXO` | Monthly |
    | `TX1` `TX2` `TX3` `TX4` `TX5` | Weekly, expiring on the 1st ~ 5th **Wednesday** of the month |
    | `TXU` `TXV` `TXX` `TXY` `TXZ` | Weekly, expiring on the 1st ~ 5th **Friday** of the month |

    Some codes return no data in a given month. This is expected behaviour, not missing data, for two reasons: the contract may not be listed yet (weekly contracts are listed only a limited period before expiry), or that week does not exist in that month (e.g. a month with only 4 Fridays has no 5th-Friday contract).

    Also note that if a contract has not traded yet on the current day, the response carries the price and volume from the **last session in which it did trade**. Use the returned `date` field to tell whether a row is a same-day quote.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        api.login_by_token(api_token='token')
        # Currently only TAIEX options are supported
        # Monthly TXO; Wednesday-expiry weekly TX1~TX5; Friday-expiry weekly TXU, TXV, TXX, TXY, TXZ
        df = api.taiwan_options_snapshot(options_id="TXO")
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        token = "" # See login section to obtain a token
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_options_snapshot"
        parameter = {
            "data_id": "TXO", # TXO(monthly), TX1~TX5(Wed-expiry), TXU/TXV/TXX/TXY/TXZ(Fri-expiry)
            # "data_id": "", # fetch all at once
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
        token = "" # See login section to obtain a token
        url = "https://api.finmindtrade.com/api/v4/taiwan_options_snapshot"
        response = httr::GET(
            url = url,
            query = list(
                data_id="TXO" # TXO(monthly), TX1~TX5(Wed-expiry), TXU/TXV/TXX/TXY/TXZ(Fri-expiry)
                # data_id="" # fetch all at once
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
            open: float64, # open
            high: float64, # high
            low: float64, # low
            close: float64, # latest transaction price
            change_price: float64, # price change
            change_rate: float64, # percent change
            average_price: float64, # average transaction price
            volume: int64, # volume
            total_volume: int64, # cumulative volume
            amount: str, # transaction amount
            total_amount: str, # cumulative transaction amount
            yesterday_volume: int64, # yesterday's volume
            buy_price: float64, # bid price
            buy_volume: int64, # bid volume
            sell_price: float64, # ask price
            sell_volume: int64, # ask volume
            volume_ratio: float64, # ratio of today's volume to yesterday's
            date: str, # transaction time
            options_id: str, # options code
            TickType: str # tick type (0: undetermined, 1: buyer-initiated (trade at ask), 2: seller-initiated (trade at bid))
        }
        ```
