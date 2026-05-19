In UK stock data, we offer 1 dataset, as follows:

- [UK Stock Price Table UKStockPrice](https://finmind.github.io/en/tutor/UnitedKingdomMarket/Technical/#ukstockprice)

In addition, the following list summarizes the available datasets:

- [UK Stock List UKStockInfo](https://finmind.github.io/en/tutor/UnitedKingdomMarket/Technical/#ukstockinfo)

The usage of each dataset is explained one by one below. For the specific dataset schemas, please refer to [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v3_data_get)

#### UK Stock List UKStockInfo

- This dataset primarily lists the names, codes, and industry categories of all UK listed and OTC stocks.

!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   token = "" # Refer to the login page to obtain your API key
   headers = {"Authorization": f"Bearer {token}"}
   parameter = {
      "dataset": "UKStockInfo"
   }
   data = requests.get(url, headers=headers, params=parameter)
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


#### UK Stock Price Table UKStockPrice

!!! example
   ```python
   import requests
   import pandas as pd

   url = 'https://api.finmindtrade.com/api/v4/data'
   token = "" # Refer to the login page to obtain your API key
   headers = {"Authorization": f"Bearer {token}"}
   parameter = {
      "dataset": "UKStockPrice",
      "data_id": "BP.L",
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

