在歐洲股票資料，我們擁有 1 種資料集，如下:

- [歐洲股價資料表 EuropeStockPrice](https://finmind.github.io/tutor/EuropeMarket/Technical/#europestockprice)

另外針對資料集整理出的列表如下:

- [歐洲股票清單列表 EuropeStockInfo](https://finmind.github.io/tutor/EuropeMarket/Technical/#europestockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v3_data_get)

#### 歐洲股票清單列表 EuropeStockInfo

- 這張資料表主要是列出歐洲所有上市上櫃的股票名稱，代碼和產業類別

!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   parameter = {
      "dataset": "EuropeStockInfo"
   }
   data = requests.get(url, params=parameter)
   data = data.json()
   data = pd.DataFrame(data['data'])
   print(data.head())
   ```
!!! output
    === "DataFrame"
         |    | date       | stock_id   | Market             | stock_name         |
         |---:|:-----------|:-----------|:-------------------|:-------------------|
         |  0 | 2019-01-14 | 2CRSI.PA   | Euronext Paris     | 2CRSI              |
         |  1 | 2019-01-14 | AAA.AS     | Euronext Amsterdam | AP ALTERNAT ASSETS |
         |  2 | 2019-01-14 | AALB.AS    | Euronext Amsterdam | AALBERTS INDUSTR   |
         |  3 | 2019-01-14 | AB.PA      | Euronext Paris     | AB SCIENCE         |
         |  4 | 2019-01-14 | ABCA.PA    | Euronext Paris     | ABC ARBITRAGE      |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            Market: str,
            stock_name: str
        }
        ```

#### 歐洲股價資料表 EuropeStockPrice

!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   parameter = {
      "dataset": "EuropeStockPrice",
      "data_id": "AALB.AS",
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
         |    | date       | stock_id   |   Adj_Close |   Close |   High |   Low |   Open |   Volume |
         |---:|:-----------|:-----------|------------:|--------:|-------:|------:|-------:|---------:|
         |  0 | 2020-06-16 | AALB.AS    |       26.82 |   28.37 |  29.03 | 27.99 |  28.35 |   603839 |
         |  1 | 2020-06-17 | AALB.AS    |       26.81 |   28.35 |  28.88 | 28.26 |  28.38 |   512502 |
         |  2 | 2020-06-18 | AALB.AS    |       27.15 |   28.71 |  29.05 | 28.01 |  28.34 |   452985 |
         |  3 | 2020-06-19 | AALB.AS    |       26.47 |   28    |  29    | 27.97 |  29    |  1466512 |
         |  4 | 2020-06-22 | AALB.AS    |       26.57 |   28.1  |  28.34 | 27.5  |  28    |   281713 |
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