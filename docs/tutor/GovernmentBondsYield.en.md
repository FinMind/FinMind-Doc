For US Treasury bonds, we offer 12 US Treasury bond datasets, as follows:




| data_id|	United States 1-Month|	United States 2-Month|	United States 3-Month|	United States 6-Month|	United States 1-Year|	United States 2-Year|	United States 3-Year|	United States 5-Year|	United States 7-Year|	United States 10-Year|	United States 20-Year|	United States 30-Year    	|
|---------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|
| Bond|	1-Month|	2-Month|	3-Month|	6-Month|	1-Year|	2-Year|	3-Year|	5-Year|	7-Year|	10-Year|	20-Year|	30-Year| 	|


#### US Government Bonds Yield GovernmentBondsYield

!!! example
    ```python
    import requests
    import pandas as pd

    url = "https://api.finmindtrade.com/api/v4/data"
    token = "" # Refer to the login page to obtain your API key
    headers = {"Authorization": f"Bearer {token}"}
    parameter = {
        "dataset": "GovernmentBondsYield",
        "data_id": "United States 1-Month",
        "start_date": "2020-01-01",
    }
    data = requests.get(url, headers=headers, params=parameter)
    data = data.json()
    data = pd.DataFrame(data['data'])
    print(data.head())
              date                   name  value
    0  2020-01-02  United States 1-Month   1.53
    1  2020-01-03  United States 1-Month   1.52
    2  2020-01-06  United States 1-Month   1.54
    3  2020-01-07  United States 1-Month   1.52
    4  2020-01-08  United States 1-Month   1.50
    ```
!!! output
    === "Schema"
        ```
        {
            date: str, # date
            name: str, # category
            value: float32 # price
        }
        ```
