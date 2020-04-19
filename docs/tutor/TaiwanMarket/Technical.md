在台灣股票資料，我們擁有 4 種資料集，如下:

- [台灣股價資料表 TaiwanStockPrice](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockinfo)

- [台灣股價及時資料表 TaiwanStockPriceMinute](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockpriceminute)

- 台灣即時最佳五檔 TaiwanStockPriceMinuteBidAsk (dev)

- [台灣個股PER、PBR資料表 TaiwanStockPER](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockper)

另外針對資料集整理出的列表如下:

- [台灣股票清單列表 TaiwanStockInfo](https://finmind.github.io/tutor/TaiwanMarket/Technical/#taiwanstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v2_data_get)

#### 台灣股票清單列表 TaiwanStockInfo

- 這張資料表主要是列出台灣所有上市上櫃的股票名稱，代碼和產業類別

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {
    "dataset": "TaiwanStockInfo",
}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())

  industry_category stock_id stock_name  type
0               ETF     0050     元大台灣50  twse
1               ETF     0051    元大中型100  twse
2               ETF     0052       富邦科技  twse
3               ETF     0053       元大電子  twse
4               ETF     0054     元大台商50  twse
```

#### 台灣股價資料表 TaiwanStockPrice

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {
    "dataset": "TaiwanStockPrice",
    "stock_id": "2330",
    "date": "2020-04-02",
}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())

         date stock_id  Trading_Volume  Trading_money   open    max    min  close  spread  Trading_turnover
0  2020-04-06     2330        59712754    16324198154  273.0  275.5  270.0  275.5    -1.0             19971
1  2020-04-07     2330        48887346    13817936851  283.5  284.0  280.5  283.0    -1.0             24281
2  2020-04-08     2330        38698826    11016972354  285.0  285.5  283.0  285.0    -1.0             19126
3  2020-04-09     2330        29276430     8346209654  287.5  288.0  282.5  283.0    -1.0             15271
4  2020-04-10     2330        28206858     7894277586  280.0  282.0  279.0  279.5    -1.0             15833
```

#### 台灣即時股價資料表 TaiwanStockPriceMinute

- 輸入 dataset、stock_id 參數，會回傳當天最近 100 筆即時資料。
- 輸入 dataset、stock_id、date，會回傳 date 當天 data。

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {
    "dataset": "TaiwanStockPriceMinute",
    "stock_id": "2330",
    "date": "2020-01-02",
}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())

                  date stock_id  deal_price  volume
0  2020-01-02 09:00:00     2330       332.5     520
1  2020-01-02 09:00:05     2330       333.0      45
2  2020-01-02 09:00:10     2330       333.0      22
3  2020-01-02 09:00:15     2330       333.0      15
4  2020-01-02 09:00:20     2330       333.5       3
```

#### 台灣即時最佳五檔 TaiwanStockPriceMinuteBidAsk

- 開發中

#### 台灣個股PER、PBR資料表 TaiwanStockPER

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {
    "dataset": "TaiwanStockPER",
    "stock_id": "2330",
    "date": "2020-04-01",
}

data = requests.get(url, params=parameter)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())
```