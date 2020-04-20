在英國股票資料，我們擁有 1 種資料集，如下:

- [英國股價資料表 UKStockPrice](https://finmind.github.io/tutor/UnitedKingdomMarket/Technical/#ukstockprice)

另外針對資料集整理出的列表如下:

- [英國股票清單列表 UKStockInfo](https://finmind.github.io/tutor/UnitedKingdomMarket/Technical/#ukstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v2_data_get)

#### 英國股票清單列表 UKStockInfo

- 這張資料表主要是列出英國所有上市上櫃的股票名稱，代碼和產業類別

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=UKStockInfo'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

date stock_id Country   stock_name
0  2019-01-31   17MA.L     AMD  EURO.BK. 22
1  2019-01-31   44CI.L     AMD  EURO.BK. 21
2  2019-01-31   47HF.L     AMD   EURO.BK.21
3  2019-01-31   58MF.L     AMD   EURO.BK.21
4  2019-01-31   59FK.L     AMD  EURO.BK. 20
```

#### 英國股價資料表 UKStockPrice

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=UKStockPrice&stock_id=BP.L&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

   Adj_Close  Close   High    ...       Volume        date  stock_id
0    497.866  507.3  509.6    ...     33397201  2019-01-02      BP.L
1    499.240  508.7  514.4    ...     38347439  2019-01-03      BP.L
2    511.115  520.8  524.5    ...     34897489  2019-01-04      BP.L
3    511.115  520.8  524.4    ...     32659884  2019-01-07      BP.L
4    510.134  519.8  528.2    ...     28449464  2019-01-08      BP.L
```