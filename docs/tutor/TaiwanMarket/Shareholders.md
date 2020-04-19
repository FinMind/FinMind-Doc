在台灣股票股東及權益資料，我們擁有 2 種資料集，如下:

- [股利政策表 StockDividend](https://finmind.github.io/tutor/TaiwanMarket/Shareholders/#stockdividend)

- [除權除息結果表 StockDividendResult](https://finmind.github.io/tutor/TaiwanMarket/Shareholders/#stockdividendresult)

#### 股利政策表 StockDividend

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=StockDividend&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date stock_id                            type       value
0  2019-06-30     2330                AnnouncementDate  2019-06-06
1  2019-06-30     2330                AnnouncementTime    15:47:30
2  2019-06-30     2330           CacheDividendDealDate  2019-07-18
3  2019-06-30     2330        CacheDividendReleaseDate  2019-06-24
4  2019-06-30     2330  CashIncreaseSubscriptionpRrice            
```

#### 除權除息結果表 StockDividendResult

```python
import requests
import pandas as pd
url = 'http://finmindapi.servebeer.com/api/v2/data?dataset=StockDividendResult&stock_id=2330&date=2020-01-01'

data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date stock_id          type   value
0  2020-03-19     2330   after_price  257.50
1  2020-03-19     2330  before_price  260.00
2  2020-03-19     2330     max_price  283.00
3  2020-03-19     2330     min_price  232.00
4  2020-03-19     2330    open_price  257.50
```