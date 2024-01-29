在英國股票資料，我們擁有 1 種資料集，如下:

- [英國股價資料表 UKStockPrice](https://finmind.github.io/tutor/UnitedKingdomMarket/Technical/#ukstockprice)

另外針對資料集整理出的列表如下:

- [英國股票清單列表 UKStockInfo](https://finmind.github.io/tutor/UnitedKingdomMarket/Technical/#ukstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v3_data_get)

#### 英國股票清單列表 UKStockInfo

- 這張資料表主要是列出英國所有上市上櫃的股票名稱，代碼和產業類別

!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   parameter = {
      "dataset": "UKStockInfo"
   }
   data = requests.get(url, params=parameter)
   data = data.json()
   data = pd.DataFrame(data['data'])
   print(data.head())
   ```
!!! output
    === "DataFrame"
         |    | date       | stock_id   | Country   | stock_name      |
         |---:|:-----------|:-----------|:----------|:----------------|
         |  0 | 2019-01-31 | 01IC.L     | USD       | QUEBEC FRN20    |
         |  1 | 2019-01-31 | 01IE.L     | USD       | ROY.BK.SCOTSERB |
         |  2 | 2019-01-31 | 01KG.L     | GBP       | SCOT.AMER.8%DB. |
         |  3 | 2019-01-31 | 01LQ.L     | GBP       | SCOT.PWR.UK6T23 |
         |  4 | 2019-01-31 | 01LT.L     | GBP       | RES.MORT.4CTBRA |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            Country: str,
            stock_name: str
        }
        ```


#### 英國股價資料表 UKStockPrice

!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   parameter = {
      "dataset": "UKStockPrice",
      "data_id": "BP.L",
      "start_date": "2020-06-16",
      "end_date": "2021-06-16",
      "token": token, # 參考登入，獲取金鑰
   }
   data = requests.get(url, params=parameter)
   data = data.json()
   data = pd.DataFrame(data['data'])
   print(data.head())
   ```
!!! output
    === "DataFrame"
         |    | date       | stock_id   |   Adj_Close |   Close |   High |    Low |   Open |   Volume |
         |---:|:-----------|:-----------|------------:|--------:|-------:|-------:|-------:|---------:|
         |  0 | 2020-06-16 | BP.L       |      290.26 |  321.65 | 331.8  | 318.65 | 322.15 | 55470516 |
         |  1 | 2020-06-17 | BP.L       |      285.84 |  316.75 | 328.35 | 315.1  | 322.85 | 38005133 |
         |  2 | 2020-06-18 | BP.L       |      284.13 |  314.85 | 316.7  | 308.9  | 313.9  | 33988764 |
         |  3 | 2020-06-19 | BP.L       |      290.08 |  321.45 | 325.95 | 315.7  | 316.8  | 95409968 |
         |  4 | 2020-06-22 | BP.L       |      284.67 |  315.45 | 318.9  | 311.1  | 318.15 | 58369094 |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            Adj_Close: float32,
            Close: float32,
            High: float32,
            Low: float32,
            Open: float32,
            Volume: int64
        }
        ```

