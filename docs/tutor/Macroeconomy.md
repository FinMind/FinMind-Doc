在總體經濟方面，我們擁有 2 種資料集，如下:

- [各國貨幣發行量表 CurrencyCirculation](https://finmind.github.io/tutor/Macroeconomy/#currencycirculation)

- [美國政府公債殖利率表 GovernmentBondsYield](https://finmind.github.io/tutor/Macroeconomy/#governmentbondsyield)

另外針對資料集整理出美債清單，目前共有 12 種

| data_id 	| United States 1-Month 	| United States 2-Month 	| United States 3-Month 	| United States 6-Month 	| United States 1-Year 	| United States 2-Year 	| United States 3-Year 	| United States 5-Year 	| United States 7-Year 	| United States 10-Year 	| United States 20-Year 	| United States 30-Year 	|
|---------	|-----------------------	|-----------------------	|-----------------------	|-----------------------	|----------------------	|----------------------	|----------------------	|----------------------	|----------------------	|-----------------------	|-----------------------	|-----------------------	|
| 債券    	| 1月期                	| 2月期                	| 3月期                	| 6月期                	| 1年期               	| 2年期               	| 3年期               	| 5年期               	| 7年期               	| 10年期                	| 20年期                	| 30年期                	|


#### 各國貨幣發行量表 CurrencyCirculation

```python
import requests
import pandas as pd
url = "https://api.finmindtrade.com/api/v3/data"
parameter = {
     "dataset": "CurrencyCirculation",
     "data_id": "US",# or "Taiwan"
     "date": "2020-01-01",
}
data = requests.get(url, params=parameter)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

  country        date     type      value
0      US  2020-01-01  Monthly  1798.984B
1      US  2020-02-01  Monthly  1795.990B
2      US  2020-03-01  Monthly  1826.102B
3      US  2020-04-01  Monthly  1876.878B
```

#### 政府公債殖利率表 GovernmentBondsYield

```python
import requests
import pandas as pd

url = "https://api.finmindtrade.com/api/v3/data"
parameter = {
     "dataset": "GovernmentBondsYield",
     "data_id": "United States 1-Month",
     "date": "2020-01-01",
}
data = requests.get(url, params=parameter)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date                  name  value
0  2020-01-02  United States 3-Year   1.59
1  2020-01-03  United States 3-Year   1.54
2  2020-01-06  United States 3-Year   1.56
3  2020-01-07  United States 3-Year   1.55
4  2020-01-08  United States 3-Year   1.61
```