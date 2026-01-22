
在台股可轉換公司債，我們擁有 4 種資料集，如下:

- [可轉債總覽 TaiwanStockConvertibleBondInfo](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondinfo-backersponsor)
- [可轉債日成交資訊 TaiwanStockConvertibleBondDaily](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebonddaily-backersponsor)
- [可轉債三大法人日交易資訊 TaiwanStockConvertibleBondInstitutionalInvestors](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebondinstitutionalinvestors-backersponsor)
- [可轉債每日總覽資訊 TaiwanStockConvertibleBondDailyOverview](https://finmind.github.io/tutor/TaiwanMarket/ConvertibleBond/#taiwanstockconvertiblebonddailyoverview-backersponsor)


#### 可轉債總覽 TaiwanStockConvertibleBondInfo(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_convertible_bond_info()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockConvertibleBondInfo",
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
                dataset="TaiwanStockConvertibleBondInfo"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    |   cb_id | cb_name   | InitialDateOfConversion   | DueDateOfConversion   |   IssuanceAmount |
        |---:|--------:|:----------|:--------------------------|:----------------------|-----------------:|
        |  0 |   12101 | 大成一    | 2007-10-22                | 2012-09-11            |       1000000000 |
        |  1 |   12161 | 統一一    | 2007-11-26                | 2010-10-15            |       5000000000 |
        |  2 |   12171 | 愛之一    | 2011-06-12                | 2014-05-01            |       1100000000 |
        |  3 |   12172 | 愛之二    | 2011-06-13                | 2016-05-02            |        300000000 |
        |  4 |   12173 | 愛之味三  | 2013-04-08                | 2018-02-25            |       1000000000 |
    === "Schema"
        ```
        {
            cb_id: str, # 可轉債代碼
            cb_name: str, # 可轉債名稱
            InitialDateOfConversion: str, # 轉換起日
            DueDateOfConversion: str, # 轉換迄日
            IssuanceAmount: int # 原始發行總額
        }
        ```

---

#### 可轉債日成交資訊 TaiwanStockConvertibleBondDaily(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = data_loader.taiwan_stock_convertible_bond_daily(
            cb_id="15131",
            start_date="2020-04-01",
            end_date="2020-04-10",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockConvertibleBondDaily",
            "data_id":"15131",
            "start_date": "2020-04-01",
            "end_date": "2020-04-10",
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
                dataset="TaiwanStockConvertibleBondDaily",
                data_id="15131",
                start_date= "2020-04-01",
                end_date='2020-04-10'
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    |   cb_id | cb_name   | transaction_type   |   close |   change |   open |   max |   min |   no_of_transactions |   unit |   trading_value |   avg_price |   next_ref_price |   next_max_limit |   next_min_limit | date       |
        |---:|--------:|:----------|:-------------------|--------:|---------:|-------:|------:|------:|---------------------:|-------:|----------------:|------------:|-----------------:|-----------------:|-----------------:|:-----------|
        |  0 |   15131 | 中興電一  | 等價               |   104   |     -0.5 | 103.6  | 104   | 103.5 |                   14 |    116 |        12029500 |      103.7  |            104   |           114.4  |            93.6  | 2020-04-01 |
        |  1 |   15131 | 中興電一  | 等價               |   104.4 |      0.4 | 104    | 104.4 | 103.8 |                    9 |     29 |         3016200 |      104    |            104.4 |           114.8  |            94    | 2020-04-06 |
        |  2 |   15131 | 中興電一  | 等價               |   105.8 |      1.4 | 105.15 | 105.8 | 104.5 |                   21 |    113 |        11877450 |      105.11 |            105.8 |           116.35 |            95.25 | 2020-04-07 |
        |  3 |   15131 | 中興電一  | 等價               |   105.6 |     -0.2 | 105    | 106   | 105   |                   12 |     32 |         3370500 |      105.32 |            105.6 |           116.15 |            95.05 | 2020-04-08 |
        |  4 |   15131 | 中興電一  | 等價               |   104.8 |     -0.8 | 104    | 105   | 104   |                   12 |     40 |         4177800 |      104.44 |            104.8 |           115.25 |            94.35 | 2020-04-09 |
    === "Schema"
        ```
        {
            cb_id: str, # 可轉債代碼
            cb_name: str, # 可轉債名稱
            transaction_type: str, # 交易狀態
            close: float32, # 收盤價
            change: float32, # 漲跌幅
            open: float32, # 開盤價
            max: float32, # 最高價
            min: float32, # 最低價
            no_of_transactions: int64, # 交易筆數
            unit: int64, # 成交量
            trading_value: int64, # 成交金額
            avg_price: float32, # 成交均價
            next_ref_price: float32, # 明日參考價
            next_max_limit: float32, # 明日漲停價
            next_min_limit: float32, # 明日跌停價
            date: str # 日期
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = data_loader.taiwan_stock_convertible_bond_daily(
            start_date="2020-04-06",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockConvertibleBondDaily",
            "start_date": "2020-04-06",
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
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockConvertibleBondDaily",
                start_date= "2020-04-06"
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
        |    |   cb_id | cb_name   | transaction_type   |   close |   change |   open |   max |   min |   no_of_transactions |   unit |   trading_value |   avg_price |   next_ref_price |   next_max_limit |   next_min_limit | date       |
        |---:|--------:|:----------|:-------------------|--------:|---------:|-------:|------:|------:|---------------------:|-------:|----------------:|------------:|-----------------:|-----------------:|-----------------:|:-----------|
        |  0 |   12582 | 其祥二KY  | 等價               |       0 |        0 |      0 |     0 |     0 |                    0 |      0 |               0 |       87.43 |            87.2  |            95.9  |            78.5  | 2020-04-06 |
        |  1 |   13163 | 上曜三    | 等價               |       0 |        0 |      0 |     0 |     0 |                    0 |      0 |               0 |      101.68 |           102    |           112.2  |            91.8  | 2020-04-06 |
        |  2 |   14361 | 華友聯一  | 等價               |     107 |        0 |    107 |   107 |   107 |                    1 |      2 |          214000 |      107    |           107    |           117.7  |            96.3  | 2020-04-06 |
        |  3 |   14423 | 名軒三    | 等價               |       0 |        0 |      0 |     0 |     0 |                    0 |      0 |               0 |      135    |           135    |           148.5  |           121.5  | 2020-04-06 |
        |  4 |   14721 | 三洋紡一  | 等價               |       0 |        0 |      0 |     0 |     0 |                    0 |      0 |               0 |      100.35 |           100.35 |           110.35 |            90.35 | 2020-04-06 |
    === "Schema"
        ```
        {
            cb_id: str, # 可轉債代碼
            cb_name: str, # 可轉債名稱
            transaction_type: str, # 交易狀態
            close: float32, # 收盤價
            change: float32, # 漲跌幅
            open: float32, # 開盤價
            max: float32, # 最高價
            min: float32, # 最低價
            no_of_transactions: int64, # 交易筆數
            unit: int64, # 成交量
            trading_value: int64, # 成交金額
            avg_price: float32, # 成交均價
            next_ref_price: float32, # 明日參考價
            next_max_limit: float32, # 明日漲停價
            next_min_limit: float32, # 明日跌停價
            date: str # 日期
        }
        ```

---

#### 可轉債三大法人日交易資訊 TaiwanStockConvertibleBondInstitutionalInvestors(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = data_loader.taiwan_stock_convertible_bond_institutional_investors(
            cb_id="15131",
            start_date="2020-04-01",
            end_date="2020-04-10",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockConvertibleBondInstitutionalInvestors",
            "data_id":"15131",
            "start_date": "2020-04-01",
            "end_date": "2020-04-10",
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
                dataset="TaiwanStockConvertibleBondInstitutionalInvestors",
                data_id="15131",
                start_date= "2020-04-01",
                end_date='2020-04-10'
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    |   Foreign_Investor_Buy |   Foreign_Investor_Sell |   Foreign_Investor_Overbuy |   Investment_Trust_Buy |   Investment_Trust_Sell |   Investment_Trust_Overbuy |   Dealer_self_Buy |   Dealer_self_Sell |   Dealer_self_Overbuy |   Total_Overbuy |   cb_id | cb_name    | date       |
        |---:|-----------------------:|------------------------:|---------------------------:|-----------------------:|------------------------:|---------------------------:|------------------:|-------------------:|----------------------:|----------------:|--------:|:-----------|:-----------|
        |  0 |                      0 |                       0 |                          0 |                      0 |                       0 |                          0 |                 2 |                  2 |                     0 |               0 |   14361 | 華友聯一   | 2020-04-06 |
        |  1 |                      0 |                       0 |                          0 |                      0 |                       0 |                          0 |                12 |                 28 |                   -16 |             -16 |   15131 | 中興電一   | 2020-04-06 |
        |  2 |                      0 |                       0 |                          0 |                      0 |                       0 |                          0 |                 5 |                  0 |                     5 |               5 |   15981 | 岱宇一     | 2020-04-06 |
        |  3 |                      0 |                      10 |                        -10 |                      0 |                       0 |                          0 |                13 |                  0 |                    13 |               3 |   16262 | 艾美特二KY | 2020-04-06 |
        |  4 |                      0 |                       0 |                          0 |                      0 |                       0 |                          0 |                20 |                 20 |                     0 |               0 |   17333 | 五鼎三     | 2020-04-06 |
    === "Schema"
        ```
        {
            Foreign_Investor_Buy: int64, # 外資買入數量
            Foreign_Investor_Sell: int64, # 外資賣出數量
            Foreign_Investor_Overbuy: int64, # 外資買超數量
            Investment_Trust_Buy: int64, # 投信買入數量
            Investment_Trust_Sell: int64, # 投信賣出數量
            Investment_Trust_Overbuy: int64, # 投信買超數量
            Dealer_self_Buy: int64, # 自營商買入數量
            Dealer_self_Sell: int64, # 自營商賣出數量
            Dealer_self_Overbuy: int64, # 自營商買超數量
            Total_Overbuy: int64, # 總買超數量
            cb_id: str, # 可轉債代碼
            cb_name: str, # 可轉債名稱
            date: str # 日期
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = data_loader.taiwan_stock_convertible_bond_institutional_investors(
            start_date="2020-04-06",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockConvertibleBondInstitutionalInvestors",
            "start_date": "2020-04-06",
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
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockConvertibleBondInstitutionalInvestors",
                start_date= "2020-04-06"
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
        |    |   cb_id | cb_name   | transaction_type   |   close |   change |   open |   max |   min |   no_of_transactions |   unit |   trading_value |   avg_price |   next_ref_price |   next_max_limit |   next_min_limit | date       |
        |---:|--------:|:----------|:-------------------|--------:|---------:|-------:|------:|------:|---------------------:|-------:|----------------:|------------:|-----------------:|-----------------:|-----------------:|:-----------|
        |  0 |   12582 | 其祥二KY  | 等價               |       0 |        0 |      0 |     0 |     0 |                    0 |      0 |               0 |       87.43 |            87.2  |            95.9  |            78.5  | 2020-04-06 |
        |  1 |   13163 | 上曜三    | 等價               |       0 |        0 |      0 |     0 |     0 |                    0 |      0 |               0 |      101.68 |           102    |           112.2  |            91.8  | 2020-04-06 |
        |  2 |   14361 | 華友聯一  | 等價               |     107 |        0 |    107 |   107 |   107 |                    1 |      2 |          214000 |      107    |           107    |           117.7  |            96.3  | 2020-04-06 |
        |  3 |   14423 | 名軒三    | 等價               |       0 |        0 |      0 |     0 |     0 |                    0 |      0 |               0 |      135    |           135    |           148.5  |           121.5  | 2020-04-06 |
        |  4 |   14721 | 三洋紡一  | 等價               |       0 |        0 |      0 |     0 |     0 |                    0 |      0 |               0 |      100.35 |           100.35 |           110.35 |            90.35 | 2020-04-06 |
    === "Schema"
        ```
        {
            Foreign_Investor_Buy: int64, # 外資買入數量
            Foreign_Investor_Sell: int64, # 外資賣出數量
            Foreign_Investor_Overbuy: int64, # 外資買超數量
            Investment_Trust_Buy: int64, # 投信買入數量
            Investment_Trust_Sell: int64, # 投信賣出數量
            Investment_Trust_Overbuy: int64, # 投信買超數量
            Dealer_self_Buy: int64, # 自營商買入數量
            Dealer_self_Sell: int64, # 自營商賣出數量
            Dealer_self_Overbuy: int64, # 自營商買超數量
            Total_Overbuy: int64, # 總買超數量
            cb_id: str, # 可轉債代碼
            cb_name: str, # 可轉債名稱
            date: str # 日期
        }
        ```

---

#### 可轉債每日總覽資訊 TaiwanStockConvertibleBondDailyOverview(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = data_loader.taiwan_stock_convertible_bond_daily_overview(
            cb_id="15131",
            start_date="2020-04-01",
            end_date="2020-04-10",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockConvertibleBondDailyOverview",
            "data_id":"15131",
            "start_date": "2020-04-01",
            "end_date": "2020-04-10",
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
                dataset="TaiwanStockConvertibleBondDailyOverview",
                data_id="15131",
                start_date= "2020-04-01",
                end_date='2020-04-10'
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |    |   cb_id | cb_name   | date       | InitialDateOfConversion   | DueDateOfConversion   | InitialDateOfStopConversion   | DueDateOfStopConversion   |   ConversionPrice | NextEffectiveDateOfConversionPrice   | LatestInitialDateOfPut   | LatestDueDateOfPut   |   LatestPutPrice | InitialDateOfEarlyRedemption   | DueDateOfEarlyRedemption   |   EarlyRedemptionPrice | DateOfDelisted   |   IssuanceAmount |   OutstandingAmount |   ReferencePrice |   PriceOfUnderlyingStock | InitialDateOfSuspension   | DueDateOfSuspension   |   CouponRate |
        |---:|--------:|:----------|:-----------|:--------------------------|:----------------------|:------------------------------|:--------------------------|------------------:|:-------------------------------------|:-------------------------|:---------------------|-----------------:|:-------------------------------|:---------------------------|-----------------------:|:-----------------|-----------------:|--------------------:|-----------------:|-------------------------:|:--------------------------|:----------------------|-------------:|
        |  0 |   15131 | 中興電一  | 2020-04-01 | 2020-04-17                | 2025-01-16            |                               |                           |              27.7 | 2020-01-16                           |                          |                      |                0 |                                |                            |                      0 |                  |          1.5e+09 |             1.5e+09 |            104   |                    22.2  |                           |                       |            0 |
        |  1 |   15131 | 中興電一  | 2020-04-06 | 2020-04-17                | 2025-01-16            |                               |                           |              27.7 | 2020-01-16                           |                          |                      |                0 |                                |                            |                      0 |                  |          1.5e+09 |             1.5e+09 |            104.4 |                    22.25 |                           |                       |            0 |
        |  2 |   15131 | 中興電一  | 2020-04-07 | 2020-04-17                | 2025-01-16            |                               |                           |              27.7 | 2020-01-16                           |                          |                      |                0 |                                |                            |                      0 |                  |          1.5e+09 |             1.5e+09 |            105.8 |                    23.15 |                           |                       |            0 |
        |  3 |   15131 | 中興電一  | 2020-04-08 | 2020-04-17                | 2025-01-16            |                               |                           |              27.7 | 2020-01-16                           |                          |                      |                0 |                                |                            |                      0 |                  |          1.5e+09 |             1.5e+09 |            105.6 |                    23.35 |                           |                       |            0 |
        |  4 |   15131 | 中興電一  | 2020-04-09 | 2020-04-17                | 2025-01-16            |                               |                           |              27.7 | 2020-01-16                           |                          |                      |                0 |                                |                            |                      0 |                  |          1.5e+09 |             1.5e+09 |            104.8 |                    23.25 |                           |                       |            0 |
    === "Schema"
        ```
        {
            cb_id: str, # 可轉債代碼
            cb_name: str, # 可轉債名稱
            date: str, # 日期
            InitialDateOfConversion: str, # 轉換起日
            DueDateOfConversion: str, # 轉換迄日
            InitialDateOfStopConversion: str, # 最近停止轉換起日
            DueDateOfStopConversion: str, # 最近停止轉換迄日
            ConversionPrice: float32, # 轉換價格
            NextEffectiveDateOfConversionPrice: str, # 下次轉換價格生效日期
            LatestInitialDateOfPut: str, # 最近賣回權起日
            LatestDueDateOfPut: str, # 最近賣回權迄日
            LatestPutPrice: float32, # 最近賣回權價格
            InitialDateOfEarlyRedemption: str, # 強制贖回起日
            DueDateOfEarlyRedemption: str, # 強制贖回迄日
            EarlyRedemptionPrice: float32, # 強制贖回價格
            DateOfDelisted: str, # 終止櫃檯買賣日
            IssuanceAmount: float32, # 原始發行總額
            OutstandingAmount: float32, # 上月底發行餘額
            ReferencePrice: float32, # 轉債參考價格
            PriceOfUnderlyingStock: float32, # 轉換標的股票價格
            InitialDateOfSuspension: str, # 停止交易起日
            DueDateOfSuspension: str, # 停止交易迄日
            CouponRate: float32 # 票面利率
        }
        ```

#### 一次拿特定日期，所有資料(只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 使用)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = data_loader.taiwan_stock_convertible_bond_daily_overview(
            start_date="2020-04-06",
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockConvertibleBondDailyOverview",
            "start_date": "2020-04-06",
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
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # 參考登入，獲取金鑰
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockConvertibleBondDailyOverview",
                start_date= "2020-04-06"
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
        |    |   cb_id | cb_name   | date       | InitialDateOfConversion   | DueDateOfConversion   | InitialDateOfStopConversion   | DueDateOfStopConversion   |   ConversionPrice | NextEffectiveDateOfConversionPrice   | LatestInitialDateOfPut   | LatestDueDateOfPut   |   LatestPutPrice | InitialDateOfEarlyRedemption   | DueDateOfEarlyRedemption   |   EarlyRedemptionPrice | DateOfDelisted   |   IssuanceAmount |   OutstandingAmount |   ReferencePrice |   PriceOfUnderlyingStock | InitialDateOfSuspension   | DueDateOfSuspension   |   CouponRate |
        |---:|--------:|:----------|:-----------|:--------------------------|:----------------------|:------------------------------|:--------------------------|------------------:|:-------------------------------------|:-------------------------|:---------------------|-----------------:|:-------------------------------|:---------------------------|-----------------------:|:-----------------|-----------------:|--------------------:|-----------------:|-------------------------:|:--------------------------|:----------------------|-------------:|
        |  0 |   12582 | 其祥二KY  | 2020-04-06 | 2019-01-11                | 2023-09-10            |                               |                           |              30   | 2018-09-10                           |                          |                      |             0    |                                |                            |                      0 |                  |            3e+08 |           2.999e+08 |            87.2  |                     9.34 |                           |                       |            0 |
        |  1 |   13163 | 上曜三    | 2020-04-06 | 2019-02-08                | 2021-11-07            |                               |                           |              14.7 | 2019-08-07                           |                          |                      |             0    |                                |                            |                      0 |                  |            5e+08 |           4.556e+08 |           102    |                     8.34 |                           |                       |            0 |
        |  2 |   14361 | 華友聯一  | 2020-04-06 | 2020-04-18                | 2025-01-17            |                               |                           |              40   | 2020-01-17                           |                          |                      |             0    |                                |                            |                      0 |                  |            3e+08 |           3e+08     |           107    |                    36    |                           |                       |            0 |
        |  3 |   14423 | 名軒三    | 2020-04-06 | 2016-01-02                | 2020-12-01            |                               |                           |              11.5 | 2019-08-17                           | 2018-10-23               | 2018-12-01           |           103.79 |                                |                            |                      0 |                  |            8e+08 |           6.4e+08   |           135    |                    14.9  |                           |                       |            0 |
        |  4 |   14721 | 三洋紡一  | 2020-04-06 | 2019-05-01                | 2022-01-30            |                               |                           |              29.2 | 2019-03-19                           |                          |                      |             0    |                                |                            |                      0 |                  |            3e+08 |           2.889e+08 |           100.35 |                     9.2  |                           |                       |            0 |
    === "Schema"
        ```
        {
            cb_id: str, # 可轉債代碼
            cb_name: str, # 可轉債名稱
            date: str, # 日期
            InitialDateOfConversion: str, # 轉換起日
            DueDateOfConversion: str, # 轉換迄日
            InitialDateOfStopConversion: str, # 最近停止轉換起日
            DueDateOfStopConversion: str, # 最近停止轉換迄日
            ConversionPrice: float32, # 轉換價格
            NextEffectiveDateOfConversionPrice: str, # 下次轉換價格生效日期
            LatestInitialDateOfPut: str, # 最近賣回權起日
            LatestDueDateOfPut: str, # 最近賣回權迄日
            LatestPutPrice: float32, # 最近賣回權價格
            InitialDateOfEarlyRedemption: str, # 強制贖回起日
            DueDateOfEarlyRedemption: str, # 強制贖回迄日
            EarlyRedemptionPrice: float32, # 強制贖回價格
            DateOfDelisted: str, # 終止櫃檯買賣日
            IssuanceAmount: float32, # 原始發行總額
            OutstandingAmount: float32, # 上月底發行餘額
            ReferencePrice: float32, # 轉債參考價格
            PriceOfUnderlyingStock: float32, # 轉換標的股票價格
            InitialDateOfSuspension: str, # 停止交易起日
            DueDateOfSuspension: str, # 停止交易迄日
            CouponRate: float32 # 票面利率
        }
        ```
