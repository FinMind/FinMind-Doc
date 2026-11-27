在台股即時資料，我們擁有 4 種資料集，如下:

??? note "使用台股即時資料須先於會員中心填寫姓名、電話、地址"
    依臺灣證券交易所規定，使用台股即時資料（[taiwan_stock_tick_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_stock_tick_snapshot-sponsor)）的用戶，須於 **2027-01-31** 前在[會員中心](https://finmindtrade.com/analysis/#/account/user)填寫姓名、電話、地址（註冊時也可一併填寫），填寫後可隨時檢視或修改。

    未填寫會怎樣：

    - **2027-01-31 前**：仍可正常使用，API 回應會多一個 `profile_notice` 欄位提醒填寫。
    - **2027-01-31 起**：將無法取得台股即時資料，API 回傳 HTTP 403 錯誤，錯誤訊息會附會員中心連結。

    資料用途請見[隱私權政策](https://finmind.github.io/PrivacyPolicy/#realtime-profile)。


- [台股即時資訊 taiwan_stock_tick_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_stock_tick_snapshot-sponsor)
- [期貨、選擇權即時報價總覽 TaiwanFutOptTickInfo](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwanfutopttickinfo)
- [台股期貨即時資訊 taiwan_futures_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_futures_snapshot-sponsor)
- [台股選擇權即時資訊 taiwan_options_snapshot](https://finmind.github.io/tutor/TaiwanMarket/RealTime/#taiwan_options_snapshot-sponsor)


----------------------------------
#### 台股即時資訊 taiwan_stock_tick_snapshot (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
(Sponsor 會員每 10 秒更新一次；Sponsor Pro 會員每秒更新一次)

??? note "Sponsor 與 Sponsor Pro 會員的差異"
    | | Sponsor | Sponsor Pro |
    |---|---|---|
    | 更新頻率 | 每 10 秒一次 | 每秒一次 |
    | 回傳欄位 | 下方 Schema 中未標註「Sponsor Pro」的欄位 | 全部欄位，另含 Schema 中標註「Sponsor Pro」的 24 個欄位：昨收價、漲跌停價、最佳五檔委買委賣價量、內外盤成交量、盤後定價交易成交量、收盤註記，以及 13 個盤中零股欄位（`odd_lot_*`） |
    | 上市櫃盤前試撮（08:30 ~ 09:00） | 無 | 有，說明見下方「上市櫃盤前試撮」 |
    | 上市櫃盤中零股報價（09:00 ~ 13:30，13:40 後含盤後零股） | 無 | 有，說明見下方「上市櫃盤中零股報價」 |

    下方 output 範例為 Sponsor Pro 會員的回傳內容。

??? note "上市櫃盤前試撮（Sponsor Pro）"
    * 08:30 ~ 09:00 尚未成交的上市、上櫃股票，回傳盤前試撮資訊：`close` 為試撮價，`volume`、`total_volume` 為試撮累計量，`date` 的時間為試撮時間，`TickType` 為 0
    * 09:00 開盤後以實際成交為準；尚未有成交的股票，`close` 為昨收價，`volume`、`total_volume` 為 0
    * 興櫃股票沒有盤前試撮

??? note "上市櫃盤中零股報價（Sponsor Pro）"
    * 每列個股另附同一檔股票的盤中零股報價，欄位皆以 `odd_lot_` 開頭，說明見下方 Schema
    * 盤中零股 09:00 ~ 13:30；13:40 後含盤後零股（成交價、時間、最佳一檔委買委賣價為盤後零股，累計成交量為盤中＋盤後合計）
    * `odd_lot_open`、`odd_lot_high`、`odd_lot_low` 為盤中零股的值；收盤後最佳一檔委買委賣量為 0
    * 零股量相關欄位（`odd_lot_total_volume`、`odd_lot_buy_volume`、`odd_lot_sell_volume`）的單位為股；整股的量相關欄位單位為張
    * `odd_lot_is_simulated` 為 True 時，表示零股價量為試撮資訊，不是實際成交
    * 只有上市、上櫃股票提供；興櫃股票的 `odd_lot_*` 欄位為 null

??? note "2027-02-01 起每次請求最多 50 檔"
    依臺灣證券交易所規範，自 2027-02-01 起，台股即時報價 snapshot 每次請求最多 50 檔，且不再支援不帶 data_id 一次取得全部股票，請改為分批帶入 data_id（每次最多 50 檔）。

    2027-01-31 前仍可不帶 `data_id`（或 `data_id=""`）一次取得全部股票。分批範例請見下方「Python-request」分頁。

??? note "須於 2027-01-31 前填寫姓名、電話、地址"
    使用本資料集須於 2027-01-31 前在[會員中心](https://finmindtrade.com/analysis/#/account/user)填寫姓名、電話、地址。期限前未填寫仍可使用，回應會附 `profile_notice` 提醒；2027-01-31 起未填寫者將無法取得台股即時資料，API 回傳 HTTP 403 錯誤，錯誤訊息會附會員中心連結。

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
            # "data_id": ["2330", "2317"], # 一次拿多個（依證交所規範，2027-02-01 起每次最多 50 檔）
            # "data_id": "", # 一次全部（僅 2027-01-31 前可用）
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        # 分批取得多檔（依證交所規範，2027-02-01 起每次最多 50 檔）
        stock_ids = ["2330", "2317", "2454", "2303", "0050"]  # 要查詢的股票清單
        batch_size = 50
        dfs = []
        for i in range(0, len(stock_ids), batch_size):
            resp = requests.get(
                url,
                headers=headers,
                params={"data_id": stock_ids[i : i + batch_size]},
            )
            dfs.append(pd.DataFrame(resp.json()["data"]))
        data = pd.concat(dfs, ignore_index=True)
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
            # data_id=c("2330", "2317"), # 一次拿多個（依證交所規範，2027-02-01 起每次最多 50 檔）
            # data_id="", # 一次全部（僅 2027-01-31 前可用）
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
        |    |   amount |   average_price |   buy_price |   buy_volume |   change_price |   change_rate |   close |   high |   low |   open |   sell_price |   sell_volume |   total_amount |   total_volume |   volume |   volume_ratio |   yesterday_volume | date                       |   stock_id |   TickType |   yesterday_close |   limit_up |   limit_down | buy_prices                | buy_volumes            | sell_prices               | sell_volumes            |   inside_volume |   outside_volume |   after_hours_volume | is_closed   | odd_lot_date        |   odd_lot_open |   odd_lot_high |   odd_lot_low |   odd_lot_close |   odd_lot_change_price |   odd_lot_change_rate |   odd_lot_total_volume |   odd_lot_buy_price |   odd_lot_buy_volume |   odd_lot_sell_price |   odd_lot_sell_volume | odd_lot_is_simulated   |
        |---:|---------:|----------------:|------------:|-------------:|---------------:|--------------:|--------:|-------:|------:|-------:|-------------:|--------------:|---------------:|---------------:|---------:|---------------:|-------------------:|:---------------------------|-----------:|-----------:|------------------:|-----------:|-------------:|:--------------------------|:-----------------------|:--------------------------|:------------------------|----------------:|-----------------:|---------------------:|:------------|:--------------------|---------------:|---------------:|--------------:|----------------:|-----------------------:|----------------------:|-----------------------:|--------------------:|---------------------:|---------------------:|----------------------:|:-----------------------|
        |  0 |   610000 |          611.42 |         609 |          208 |              3 |          0.49 |     610 |    614 |   608 |    614 |          610 |           821 |     5578566000 |           9124 |        1 |           0.49 |              18606 | 2021-12-08 10:31:23.098000 |       2330 |          1 |               607 |        667 |          547 | [609, 608, 607, 606, 605] | [208, 512, 377, 290, 455] | [610, 611, 612, 613, 614] | [821, 603, 418, 352, 509] |            4380 |             4744 |                    0 | False       | 2021-12-08 10:31:20 |            613 |            614 |           608 |             610 |                      3 |                  0.49 |                 152340 |                 609 |                 1520 |                  610 |                  2380 | False                  |
    === "Schema"
        ```
        {
            amount: int32, # 交易金額
            average_price: float64, # 平均成交價
            buy_price: float64, # 買入價
            buy_volume: int64, # 買入量
            change_price: str, # 漲跌
            change_rate: float64, # 漲跌百分比
            close: float64, # 最新成交價
            high: float64, # 最高價
            low: float64, # 最低價
            open: float64, # 開盤價
            sell_price: float64, # 賣出價
            sell_volume: int64, # 賣出量
            total_amount: int32, # 累積交易金額
            total_volume: int64, # 累積成交量
            volume: int64, # 成交量
            volume_ratio: float64, # 昨日與今日成交量比
            yesterday_volume: int64, # 昨日成交量
            date: str, # 成交時間
            stock_id: str, # 股票代碼
            TickType: str # 成交種類 (0: 無法判斷, 1: 外盤成交（買方主動買進，成交在賣方掛價）, 2: 內盤成交（賣方主動賣出，成交在買方掛價）),
            yesterday_close: float64, # （Sponsor Pro）昨收價
            limit_up: float64, # （Sponsor Pro）漲停價（興櫃股票為 null）
            limit_down: float64, # （Sponsor Pro）跌停價（興櫃股票為 null）
            buy_prices: list, # （Sponsor Pro）委買第 1 ~ 5 檔價格（第 1 檔同 buy_price；市價委託價格為 0）
            buy_volumes: list, # （Sponsor Pro）委買第 1 ~ 5 檔數量
            sell_prices: list, # （Sponsor Pro）委賣第 1 ~ 5 檔價格（第 1 檔同 sell_price；市價委託價格為 0）
            sell_volumes: list, # （Sponsor Pro）委賣第 1 ~ 5 檔數量
            inside_volume: int64, # （Sponsor Pro）內盤成交量
            outside_volume: int64, # （Sponsor Pro）外盤成交量
            after_hours_volume: int64, # （Sponsor Pro）盤後定價交易成交量
            is_closed: bool, # （Sponsor Pro）收盤註記（True 表示已收盤）
            odd_lot_date: str, # （Sponsor Pro）零股最近成交時間（13:40 後為盤後零股）
            odd_lot_open: float64, # （Sponsor Pro）零股開盤價（盤中零股）
            odd_lot_high: float64, # （Sponsor Pro）零股最高價（盤中零股）
            odd_lot_low: float64, # （Sponsor Pro）零股最低價（盤中零股）
            odd_lot_close: float64, # （Sponsor Pro）零股成交價（13:40 後為盤後零股）
            odd_lot_change_price: float64, # （Sponsor Pro）零股漲跌
            odd_lot_change_rate: float64, # （Sponsor Pro）零股漲跌幅（%）
            odd_lot_total_volume: int64, # （Sponsor Pro）零股累計成交量（股；13:40 後為盤中＋盤後合計）
            odd_lot_buy_price: float64, # （Sponsor Pro）零股最佳委買價（13:40 後為盤後零股）
            odd_lot_buy_volume: int64, # （Sponsor Pro）零股最佳委買量（股）
            odd_lot_sell_price: float64, # （Sponsor Pro）零股最佳委賣價（13:40 後為盤後零股）
            odd_lot_sell_volume: int64, # （Sponsor Pro）零股最佳委賣量（股）
            odd_lot_is_simulated: bool # （Sponsor Pro）是否為零股試撮（True 表示為試撮，不是實際成交）
        }
        ```

??? note "成交量單位與興櫃股票欄位說明"
    * 整股成交量、委買委賣量相關欄位（`volume`、`total_volume`、`yesterday_volume`、`buy_volume`、`sell_volume`、`buy_volumes`、`sell_volumes`、`inside_volume`、`outside_volume`、`after_hours_volume`）的單位：上市、上櫃股票為張，興櫃股票為股
    * 盤中零股量相關欄位（`odd_lot_total_volume`、`odd_lot_buy_volume`、`odd_lot_sell_volume`）的單位為股
    * 興櫃股票沒有盤中零股，`odd_lot_*` 欄位為 null
    * 興櫃股票沒有漲跌停限制，`limit_up`、`limit_down` 為 null
    * 興櫃股票只提供最佳一檔委買委賣，`buy_prices`、`buy_volumes`、`sell_prices`、`sell_volumes` 僅第 1 檔有值，第 2 ~ 5 檔為 0

!!! info "data_id 指數代號"
    `data_id` 除了支援個股代號之外，也支援 91 個指數代號（3 碼），例如 `001` = 加權指數。指數的回傳欄位與個股不同，請見下方 [台股指數即時資訊](#taiwan_stock_tick_snapshot-index-sponsor)。

----------------------------------
#### 台股指數即時資訊 taiwan_stock_tick_snapshot index (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
與台股即時資訊使用同一個 API，`data_id` 帶指數代號（3 碼）即可取得指數即時資訊，例如 `001` = 加權指數、`101` = 櫃買指數，共 91 個指數，完整對照表請見 [台股指數代號對照表](IndexCodes.md)。

??? note "指數與個股的回傳欄位不同"
    指數只回傳下方 Schema 列出的欄位，沒有個股的委買委賣（`buy_price`、`buy_volume`、`sell_price`、`sell_volume`、`buy_prices`、`buy_volumes`、`sell_prices`、`sell_volumes`）、成交種類（`TickType`），也沒有 `yesterday_close`、`limit_up`、`limit_down`、`inside_volume`、`outside_volume`、`after_hours_volume`、`is_closed` 與盤中零股欄位 `odd_lot_*`；另外多了指數名稱 `name`。Sponsor 與 Sponsor Pro 會員回傳的指數欄位相同。

    `data_id` 空值（一次全部）時，個股與指數會在同一張表回傳，可依 `stock_id` 長度區分（指數為 3 碼）。

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_tick_snapshot"
        parameter = {
            "data_id": "001",
            # "data_id": ["001", "101"], # 一次拿多個
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
            data_id="001",
            # data_id=c("001", "101"), # 一次拿多個
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
        |    |    open |    high |     low |   close |   change_price |   change_rate |   average_price |   volume |   total_volume |      amount |   total_amount |   yesterday_volume |   volume_ratio | date                |   stock_id | name     |
        |---:|--------:|--------:|--------:|--------:|---------------:|--------------:|----------------:|---------:|---------------:|------------:|---------------:|-------------------:|---------------:|:--------------------|-----------:|:---------|
        |  0 | 35899.5 | 37108.2 | 35442.4 | 36811.9 |          778.6 |          2.16 |               0 |   363837 |       15776245 | 38042420910 |  1079165406470 |           16796828 |           0.94 | 2026-11-23 13:33:00 |        001 | 加權指數 |
    === "Schema"
        ```
        {
            open: float64, # 開盤指數
            high: float64, # 最高指數
            low: float64, # 最低指數
            close: float64, # 最新指數
            change_price: float64, # 漲跌點數
            change_rate: float64, # 漲跌百分比
            average_price: float64, # 指數無均價，固定為 0
            volume: int64, # 成交量（張）
            total_volume: int64, # 累積成交量（張）
            amount: int64, # 成交金額（元）
            total_amount: int64, # 累積成交金額（元）
            yesterday_volume: int64, # 昨日成交量（張）
            volume_ratio: float64, # 昨日與今日成交量比
            date: str, # 更新時間
            stock_id: str, # 指數代號（3 碼）
            name: str # 指數名稱
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
            code: str, # 代碼
            callput: str, # 買賣權
            date: str, # 日期
            name: str, # 名稱
            listing_date: str, # 上市日
            expire_price: float64, # 履約價
            update_date: str # 更新日期
        }
        ```

----------------------------------
#### 台股期貨即時資訊 taiwan_futures_snapshot (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
(約 30 秒更新一次)

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
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_futures_snapshot"
        parameter = {
            "data_id": "TXF", # TXF, TMF, CDF
            # "data_id": "", # 一次全部
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
                data_id="TXF" # TXF, TMF, CDF
                # data_id="" # 一次全部
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
            open: float64, # 開盤價
            high: float64, # 最高價
            low: float64, # 最低價
            close: float64, # 最新成交價
            change_price: float64, # 漲跌
            change_rate: float64, # 漲跌百分比
            average_price: float64, # 平均成交價
            volume: int64, # 成交量
            total_volume: int64, # 累積成交量
            amount: str, # 交易金額
            total_amount: str, # 累積交易金額
            yesterday_volume: int64, # 昨日成交量
            buy_price: float64, # 買入價
            buy_volume: int64, # 買入量
            sell_price: float64, # 賣出價
            sell_volume: int64, # 賣出量
            volume_ratio: float64, # 昨日與今日成交量比
            date: str, # 成交時間
            futures_id: str, # 期貨代碼
            TickType: str # 成交種類 (0: 無法判斷, 1: 外盤成交（買方主動買進，成交在賣方掛價）, 2: 內盤成交（賣方主動賣出，成交在買方掛價）)
        }
        ```

----------------------------------
#### 台股選擇權即時資訊 taiwan_options_snapshot (只限 [sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)
(約 30 秒更新一次)

??? note "契約系列代碼（月選、週三到期週選、週五到期週選）"
    臺指選擇權共有三組契約系列，`data_id` 請填入對應的期交所交易系統代碼：

    | `data_id` | 契約 |
    | --- | --- |
    | `TXO` | 月選 |
    | `TX1` `TX2` `TX3` `TX4` `TX5` | 週選，當月第 1 ~ 5 個**星期三**到期 |
    | `TXU` `TXV` `TXX` `TXY` `TXZ` | 週選，當月第 1 ~ 5 個**星期五**到期 |

    部分代碼在特定月份會查無資料，屬正常現象而非資料缺漏，原因有二：一是該契約尚未掛牌（週選於到期前一段期間才掛出），二是該月份不存在對應的週次（例如某月只有 4 個星期五，就不會有第 5 個星期五的契約）。

    另外，若某契約當日尚無成交，回傳的會是該契約**最後一次有成交時**的價量。要判斷是否為當日即時報價，請以回傳的 `date` 欄位為準。

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        api.login_by_token(api_token='token')
        # 目前只支援台指選擇權
        # 月選 TXO；週三到期週選 TX1~TX5；週五到期週選 TXU, TXV, TXX, TXY, TXZ
        df = api.taiwan_options_snapshot(options_id="TXO")
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_options_snapshot"
        parameter = {
            "data_id": "TXO", # TXO(月選), TX1~TX5(週三到期), TXU/TXV/TXX/TXY/TXZ(週五到期)
            # "data_id": "", # 一次全部
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
                data_id="TXO" # TXO(月選), TX1~TX5(週三到期), TXU/TXV/TXX/TXY/TXZ(週五到期)
                # data_id="" # 一次全部
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
            open: float64, # 開盤價
            high: float64, # 最高價
            low: float64, # 最低價
            close: float64, # 最新成交價
            change_price: float64, # 漲跌
            change_rate: float64, # 漲跌百分比
            average_price: float64, # 平均成交價
            volume: int64, # 成交量
            total_volume: int64, # 累積成交量
            amount: str, # 交易金額
            total_amount: str, # 累積交易金額
            yesterday_volume: int64, # 昨日成交量
            buy_price: float64, # 買入價
            buy_volume: int64, # 買入量
            sell_price: float64, # 賣出價
            sell_volume: int64, # 賣出量
            volume_ratio: float64, # 昨日與今日成交量比
            date: str, # 成交時間
            options_id: str, # 選擇權代碼
            TickType: str # 成交種類 (0: 無法判斷, 1: 外盤成交（買方主動買進，成交在賣方掛價）, 2: 內盤成交（賣方主動賣出，成交在買方掛價）)
        }
        ```
