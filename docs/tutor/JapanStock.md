在日本股票市場，我們擁有 1 種資料集，如下:

- [日本股價資料表 JapanStockPrice](https://finmind.github.io/tutor/JapanStock/#japanstockprice)

另外針對資料集整理出的列表如下:

- [日本股票清單列表 JapanStockInfo](https://finmind.github.io/tutor/JapanStock/#japanstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v2_data_get)

#### 日本股票清單列表 JapanStockInfo

- 這張資料表主要是列出日本所有上市上櫃的股票名稱，代碼和產業類別

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=JapanStockInfo'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

date             ...                              stock_name
0  2019-01-14             ...                       Kyokuyo Co. Ltd. 
1  2019-01-14             ...              Nippon Suisan Kaisha Ltd. 
2  2019-01-14             ...                   Maruha Nichiro Corp. 
3  2019-01-14             ...                           Hohsui Corp. 
4  2019-01-14             ...                  Kaneko Seeds Co. Ltd.
```

#### 日本股價資料表 JapanStockPrice

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=JapanStockPrice&stock_id=7203.T&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

   Adj_Close   Close    High    ...       Volume        date  stock_id
0     6406.0  6406.0  6406.0    ...            0  2019-01-01    7203.T
1     6406.0  6406.0  6406.0    ...            0  2019-01-02    7203.T
2     6406.0  6406.0  6406.0    ...            0  2019-01-03    7203.T
3     6346.0  6346.0  6360.0    ...     10011900  2019-01-04    7203.T
4     6546.0  6546.0  6622.0    ...      7677200  2019-01-07    7203.T
```