
在台灣股票衍生性商品資料，我們擁有 2 種資料集，如下:

- [台灣期貨交易明細表 TaiwanFutures](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfutures)
- [台灣選擇權交易明細表 TaiwanOption](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoption)
- 台股期貨、選擇權即時報價 (dev)
- 台股期貨 daily 交易資料 (dev)
- 台股選擇權 daily 交易資料 (dev)
#### 台灣期貨交易明細表 TaiwanFutures
(由於資料量過大，只提供 date 當天 data)

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {"dataset": "TaiwanFutures", "stock_id": "MTX", "date": "2019-09-02"}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())
```

#### 台灣選擇權交易明細表 TaiwanOption
(由於資料量過大，只提供 date 當天 data)

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {"dataset": "TaiwanOption", "stock_id": "OCO", "date": "2019-09-05"}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())
```