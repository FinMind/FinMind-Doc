在美國股票市場，我們擁有 1 種資料集，如下:

- [美國股價1分資料表 USStockPriceMinute](https://finmind.github.io/tutor/UnitedStatesStock/#美國股價1分資料表-USStockPriceMinute)

另外針對資料集整理出的列表如下:

- [美國股票清單列表 USStockInfo](https://finmind.github.io/tutor/TaiwanStock/#美國股票清單列表-USStockInfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://finmindapi.servebeer.com/docs#/default/method_api_v2_data_get)

#### 美國股票清單列表 USStockInfo

- 這張資料表主要是列出美國所有上市上櫃的股票名稱，代碼和產業類別

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v2/data?dataset=USStockInfo'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

# FIXME:
  industry_category stock_id stock_name  type
0               ETF     0050     元大台灣50     1
1               ETF     0051    元大中型100     1
2               ETF     0052       富邦科技     1
3               ETF     0053       元大電子     1
4               ETF     0054     元大台商50     1
```

#### 美國股價1分資料表 USStockPriceMinute

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v2/data?dataset=USStockPriceMinute&stock_id=^DJI&date=2019-01-01'
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