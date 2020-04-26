
在台灣股票衍生性商品資料，我們擁有 2 種資料集，如下:

- [台灣期貨交易明細表 TaiwanFuturesTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturestick)
- [台灣選擇權交易明細表 TaiwanOptionTIck](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiontick)
- [台股期貨、選擇權即時報價 Info TaiwanFutOptTickInfo](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#info-taiwanfutopttickinfo)
- [台股期貨、選擇權即時報價 TaiwanFutOptTick](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfutopttick)
- [台股期貨 daily 交易資料 TaiwanFuturesDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanfuturesdaily)
- [台股選擇權 daily 交易資料 TaiwanOptionDaily](https://finmind.github.io/tutor/TaiwanMarket/Derivative/#taiwanoptiondaily)
#### 台灣期貨交易明細表 TaiwanFuturesTick
(由於資料量過大，只提供 date 當天 data)

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {"dataset": "TaiwanFuturesTick", "stock_id": "MTX", "date": "2019-09-02"}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())
```

#### 台灣選擇權交易明細表 TaiwanOptionTick
(由於資料量過大，只提供 date 當天 data)

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {"dataset": "TaiwanOptionTick", "stock_id": "OCO", "date": "2019-09-05"}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())
```

#### 台灣期貨即時報價Info TaiwanFutOptTickInfo
(由於資料量過大，只提供 date 當天 data)

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {"dataset": "TaiwanFutOptTickInfo"}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())
```

#### 台灣期貨即時報價 TaiwanFutOptTick
(由於資料量過大，只提供 date 當天 data)

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {"dataset": "TaiwanFutOptTick","data_id":"TXFE0"}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())
```

#### 台灣期貨 TaiwanFuturesDaily
(由於資料量過大，只提供 date 當天 data)

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {"dataset": "TaiwanFuturesDaily", "stock_id": "TX", "date": "2020-04-01", "end_date": "2020-04-10"}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())
```

#### 台灣選擇權 TaiwanOptionDaily
(由於資料量過大，只提供 date 當天 data)

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data"
parameter = {"dataset": "TaiwanOptionDaily", "stock_id": "TXO", "date": "2020-04-01", "end_date": "2020-04-10"}
resp = requests.get(url, params=parameter)
data = resp.json()
data = pd.DataFrame(data["data"])
print(data.head())
```



