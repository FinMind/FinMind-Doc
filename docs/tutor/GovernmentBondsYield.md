在美國國債，我們擁有 12 種美債資料集，如下:




| data_id|	United States 1-Month|	United States 2-Month|	United States 3-Month|	United States 6-Month|	United States 1-Year|	United States 2-Year|	United States 3-Year|	United States 5-Year|	United States 7-Year|	United States 10-Year|	United States 20-Year|	United States 30-Year    	|
|---------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|--------	|
| 債券|	1月期|	2月期|	3月期|	6月期|	1年期|	2年期|	3年期|	5年期|	7年期|	10年期|	20年期|	30年期| 	|


#### 美國國債 GovernmentBondsYield

!!! example
    ```python
    import requests
    import pandas as pd

    url = "https://api.finmindtrade.com/api/v4/data"
    token = "" # 參考登入，獲取金鑰
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
            date: str, # 日期
            name: str, # 類別
            value: float32 # 價格
        }
        ```