在日本股票資料，我們擁有 1 種資料集，如下:

- [日本股價資料表 JapanStockPrice](https://finmind.github.io/tutor/JapanMarket/Technical/#japanstockprice)

另外針對資料集整理出的列表如下:

- [日本股票清單列表 JapanStockInfo](https://finmind.github.io/tutor/JapanMarket/Technical/#japanstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v3_data_get)

#### 日本股票清單列表 JapanStockInfo

- 這張資料表主要是列出日本所有上市上櫃的股票名稱，代碼和產業類別

!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   parameter = {
      "dataset": "JapanStockInfo"
   }
   data = requests.get(url, params=parameter)
   data = data.json()
   data = pd.DataFrame(data['data'])
   print(data.head())
   ```
!!! output
    === "DataFrame"
         |    | date       | stock_id   | Exchange   | Sector        | stock_name                |
         |---:|:-----------|:-----------|:-----------|:--------------|:--------------------------|
         |  0 | 2019-01-14 | 1301.T     | XTKS       | Food Products | Kyokuyo Co. Ltd.          |
         |  1 | 2019-01-14 | 1332.T     | XTKS       | Fishing       | Nippon Suisan Kaisha Ltd. |
         |  2 | 2019-01-14 | 1333.T     | XTKS       | Food Products | Maruha Nichiro Corp.      |
         |  3 | 2019-01-14 | 1352.T     | XTKS       | Food Retail   | Hohsui Corp.              |
         |  4 | 2019-01-14 | 1376.T     | XTKS       | Farming       | Kaneko Seeds Co. Ltd.     |
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            Exchange: str,
            Sector: str,
            stock_name: str
        }
        ```

#### 日本股價資料表 JapanStockPrice


!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   parameter = {
      "dataset": "JapanStockPrice",
      "data_id": "7203.T",
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
         |  0 | 2020-06-16 | 7203.T     |     1347.98 |  1404.2 | 1411.4 | 1368.6 | 1376   | 36452000 |
         |  1 | 2020-06-17 | 7203.T     |     1333.2  |  1388.8 | 1401   | 1381   | 1400   | 23684000 |
         |  2 | 2020-06-18 | 7203.T     |     1322.26 |  1377.4 | 1388   | 1368.6 | 1376   | 17525500 |
         |  3 | 2020-06-19 | 7203.T     |     1315.35 |  1370.2 | 1382.4 | 1365   | 1381.6 | 29101500 |
         |  4 | 2020-06-22 | 7203.T     |     1309.01 |  1363.6 | 1374   | 1356   | 1359.8 | 14133000 |
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