在台灣股票資料，我們擁有 3 種資料集，如下:

- [台灣股價資料表 TaiwanStockPrice](https://finmind.github.io/tutor/TaiwanMarket/TaiwanStock/#taiwanstockinfo)

- [台灣股價及時資料表 TaiwanStockPriceMinute](https://finmind.github.io/tutor/TaiwanMarket/TaiwanStock/#taiwanstockpriceminute)

- [台灣股價及時最佳五檔買賣價量資料表 TaiwanStockPriceMinuteBidAsk](https://finmind.github.io/tutor/TaiwanMarket/TaiwanStock/#taiwanstockpriceminutedidask)

另外針對資料集整理出的列表如下:

- [台灣股票清單列表 TaiwanStockInfo](https://finmind.github.io/tutor/TaiwanMarket/TaiwanStock/#taiwanstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v2_data_get)

#### 台灣股票清單列表 TaiwanStockInfo

- 這張資料表主要是列出台灣所有上市上櫃的股票名稱，代碼和產業類別

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockInfo"
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

  industry_category stock_id stock_name  type
0               ETF     0050     元大台灣50     1
1               ETF     0051    元大中型100     1
2               ETF     0052       富邦科技     1
3               ETF     0053       元大電子     1
4               ETF     0054     元大台商50     1
```

#### 台灣股價資料表 TaiwanStockPrice

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockPrice&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date stock_id        ...         spread  Trading_turnover
0  2019-01-02     2330        ...           -6.0             12329
1  2019-01-03     2330        ...           -4.0             14549
2  2019-01-04     2330        ...           -7.5             28786
3  2019-01-07     2330        ...            5.0             11224
4  2019-01-08     2330        ...           -2.0              9377
```

#### 台灣股價及時資料表 TaiwanStockPriceMinute

- 只輸入 dataset 參數會回傳當天即時交易資料
- 輸入 dataset 和 date 會回傳date之後一直到最近一個交易日的所有交易資料

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockPriceMinute&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

                         date stock_id  deal_price  volume
0  2019-05-28 13:21:03.000000     2330       231.0      16
1  2019-05-28 13:21:08.000000     2330       231.0      72
2  2019-05-28 13:21:13.000000     2330       231.0      64
3  2019-05-28 13:21:18.000000     2330       231.0       1
4  2019-05-28 13:21:23.000000     2330       231.5       1
```

#### 台灣股價及時最佳五檔買賣價量資料表 TaiwanStockPriceMinuteBidAsk

- 開發中

