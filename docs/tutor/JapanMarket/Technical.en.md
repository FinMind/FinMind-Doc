In Japanese stock data, we offer 1 dataset, as follows:

- [Japan Stock Price Table JapanStockPrice](https://finmind.github.io/en/tutor/JapanMarket/Technical/#japanstockprice)

In addition, the following list summarizes the available datasets:

- [Japan Stock List JapanStockInfo](https://finmind.github.io/en/tutor/JapanMarket/Technical/#japanstockinfo)

The usage of each dataset is explained one by one below. For the specific dataset schemas, please refer to [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v3_data_get)

#### Japan Stock List JapanStockInfo

- This dataset primarily lists the names, codes, and industry categories of all Japanese listed and OTC stocks.

!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   token = "" # Refer to the login page to obtain your API key
   headers = {"Authorization": f"Bearer {token}"}
   parameter = {
      "dataset": "JapanStockInfo"
   }
   data = requests.get(url, headers=headers, params=parameter)
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

#### Japan Stock Price Table JapanStockPrice


!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   token = "" # Refer to the login page to obtain your API key
   headers = {"Authorization": f"Bearer {token}"}
   parameter = {
      "dataset": "JapanStockPrice",
      "data_id": "7203.T",
      "start_date": "2020-06-16",
      "end_date": "2021-06-16",
   }
   data = requests.get(url, headers=headers, params=parameter)
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
