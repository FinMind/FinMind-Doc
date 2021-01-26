在美國股票資料，我們擁有 2 種資料集，如下:

- [美國股價 minute 資料表 USStockPriceMinute](https://finmind.github.io/tutor/UnitedStatesMarket/Technical/#minute-usstockpriceminute)
- [美國股價 daily 資料表 USStockPrice](https://finmind.github.io/tutor/UnitedStatesMarket/Technical/#daily-usstockprice)

另外針對資料集整理出的列表如下:

- [美國股票清單列表 USStockInfo](https://finmind.github.io/tutor/UnitedStatesMarket/Technical/#usstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v3_data_get)

#### 美國股票清單列表 USStockInfo

- 這張資料表主要是列出美國所有上市上櫃的股票名稱，代碼和產業類別

```python
import requests
import pandas as pd

url = 'https://api.finmindtrade.com/api/v3/data?dataset=USStockInfo'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

        date              ...                                 stock_name
0  2019-01-11              ...               Dow Jones Industrial Average
1  2019-01-10              ...                                      sp500
2  2019-01-11              ...                           NASDAQ Composite
3  2019-01-01              ...                         PHLX Semiconductor
4        None              ...                      CBOE Volatility Index
```

#### 美國股價 minute 資料表 USStockPriceMinute

!!! example
    ```python
    import requests
    import pandas as pd

    url = 'https://api.finmindtrade.com/api/v3/data?dataset=USStockPriceMinute&stock_id=^DJI&date=2020-02-13'
    data = requests.get(url)
    data = data.json()
    data = pd.DataFrame(data['data'])
    print(data.head())

                    date stock_id    close   ...        low     open  volume
    0  2020-02-13 20:02:00     ^DJI  29491.0   ...    29491.0  29510.4  708882
    1  2020-02-13 20:03:00     ^DJI  29490.5   ...    29477.4  29483.9  766202
    2  2020-02-13 20:04:00     ^DJI  29468.7   ...    29467.3  29490.0  577330
    3  2020-02-13 20:05:00     ^DJI  29474.1   ...    29465.8  29468.0  439754
    4  2020-02-13 20:06:00     ^DJI  29473.3   ...    29473.3  29474.7  412897
    ```

#### 美國股價 daily 資料表 USStockPrice

!!! example
    ```python
    import requests
    import pandas as pd

    url = "https://api.finmindtrade.com/api/v3/data"
    parameter = {
        "dataset": "USStockPrice",
        "stock_id": "AAPL",
        "date": "2020-04-01",
    }

    data = requests.get(url, params=parameter)
    data = data.json()
    data = pd.DataFrame(data['data'])
    print(data.head())
    ```
