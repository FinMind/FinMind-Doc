在歐洲股票市場，我們擁有 1 種資料集，如下:

- [歐洲股價資料表 EuropeStockPrice](https://finmind.github.io/tutor/EuropeStock/#歐洲股價資料表-EuropeStockPrice)

另外針對資料集整理出的列表如下:

- [歐洲股票清單列表 EuropeStockInfo](https://finmind.github.io/tutor/EuropeStock/#歐洲股票清單列表-EuropeStockInfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://finmindapi.servebeer.com/docs#/default/method_api_v2_data_get)

#### 歐洲股票清單列表 EuropeStockInfo

- 這張資料表主要是列出歐洲所有上市上櫃的股票名稱，代碼和產業類別

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v2/data?dataset=EuropeStockInfo'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date         ...                  stock_name
0  2019-01-14         ...                       2CRSI
1  2019-01-14         ...          AP ALTERNAT ASSETS
2  2019-01-14         ...            AALBERTS INDUSTR
3  2019-01-14         ...                  AB SCIENCE
4  2019-01-14         ...               ABC ARBITRAGE
```

#### 歐洲股價資料表 EuropeStockPrice

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v2/data?dataset=EuropeStockPrice&stock_id=AALB.AS&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

Adj_Close  Close   High    Low   Open  Volume        date stock_id
0      28.39  28.39  28.80  28.09  28.80  328812  2019-01-02  AALB.AS
1      27.52  27.52  28.13  27.52  28.04  271337  2019-01-03  AALB.AS
2      28.81  28.81  28.90  27.70  27.72  311458  2019-01-04  AALB.AS
3      28.82  28.82  29.16  28.46  29.10  319543  2019-01-07  AALB.AS
4      29.25  29.25  29.62  28.89  28.89  355597  2019-01-08  AALB.A
```