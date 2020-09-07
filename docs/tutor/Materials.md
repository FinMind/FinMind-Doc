在原物料市場，我們擁有 2 種資料集，如下:

- [黃金價格表 GoldPrice](https://finmind.github.io/tutor/Materials/#goldprice)

- [原油資料表 CrudeOilPrices](https://finmind.github.io/tutor/Materials/#crudeoilprices)

另外針對資料集整理出原油清單，目前共有 2 種


| data_id 	| Brent  	| WTI    	|
|---------	|--------	|--------	|
| 原油    	| 布蘭特 	| 西德州 	|


#### 黃金價格表 GoldPrice

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v3/data'
parameter = {
     "dataset": "GoldPrice",
     "date": "2020-01-01",
}
data = requests.get(url, params=parameter)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

Price                 date
0  1517.2  2020-01-01 00:00:01
1  1517.2  2020-01-01 00:03:01
2  1517.2  2020-01-01 00:08:02
3  1517.2  2020-01-01 00:13:02
4  1517.2  2020-01-01 00:18:01
```

#### 原油資料表 CrudeOilPrices

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v3/data'
parameter = {
     "dataset": "CrudeOilPrices",
     "data_id": "WTI",
     "date": "2020-01-01",
}
data = requests.get(url, params=parameter)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date name  price
0  2020-01-02  WTI  61.17
1  2020-01-03  WTI     63
2  2020-01-06  WTI  63.27
3  2020-01-07  WTI   62.7
4  2020-01-08  WTI  59.65
```
