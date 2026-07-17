In the commodities market, we offer 2 datasets, as follows:

- [Gold Price Table GoldPrice](https://finmind.github.io/en/tutor/Materials/#goldprice)

- [Crude Oil Price Table CrudeOilPrices](https://finmind.github.io/en/tutor/Materials/#crudeoilprices)

In addition, the following list summarizes the available crude oil benchmarks. There are currently 2 of them.


| data_id 	| Brent  	| WTI    	|
|---------	|--------	|--------	|
| Crude Oil 	| Brent 	| West Texas Intermediate 	|


#### Gold Price Table GoldPrice

!!! example
     ```python
     import requests
     import pandas as pd

     url = 'https://api.finmindtrade.com/api/v4/data'
     token = "" # Refer to the login page to obtain your API key
     headers = {"Authorization": f"Bearer {token}"}
     parameter = {
          "dataset": "GoldPrice",
          "start_date": "2020-01-01",
          "end_date": "2020-01-02",
     }
     data = requests.get(url, headers=headers, params=parameter)
     data = data.json()
     data = pd.DataFrame(data['data'])
     print(data.head())

     Price                 date
     0  1517.2  2020-01-01 00:00:01
     1  1517.2  2020-01-01 00:03:01
     2  1517.2  2020-01-01 00:08:02
     3  1517.2  2020-01-01 00:13:02
     4  1517.2  2020-01-01 00:18:01
     ```
!!! output
    === "Schema"
        ```
        {
            Price: float32,
            date: str
        }
        ```

#### Crude Oil Price Table CrudeOilPrices

!!! example
     ```python
     import requests
     import pandas as pd

     url = 'https://api.finmindtrade.com/api/v4/data'
     token = "" # Refer to the login page to obtain your API key
     headers = {"Authorization": f"Bearer {token}"}
     parameter = {
          "dataset": "CrudeOilPrices",
          "data_id": "WTI",
          "start_date": "2020-01-01",
          "end_date": "2020-01-08",
     }
     data = requests.get(url, headers=headers, params=parameter)
     data = data.json()
     data = pd.DataFrame(data['data'])
     print(data.head())

          date name  price
     0  2020-01-02  WTI  61.17
     1  2020-01-03  WTI     63
     2  2020-01-06  WTI  63.27
     3  2020-01-07  WTI   62.7
     4  2020-01-08  WTI  59.65
     ```
!!! output
    === "Schema"
        ```
        {
            date: str,
            name: str,
            price: float64
        }
        ```

??? note "Data Update Note"
    This table provides the crude oil **spot price**, not a real-time quote. The latest record is typically delayed by several trading days (about a week) before it updates, and differs from the **real-time crude oil futures quotes** commonly seen in the market. Please refer to the latest `date` in the returned data.
