在總體經濟方面，我們擁有 2 種資料集，如下:

- [各國貨幣發行量表 CurrencyCirculation](https://finmind.github.io/tutor/Macroeconomy/#currencycirculation)

- [政府公債殖利率表 GovernmentBondsYield](https://finmind.github.io/tutor/Macroeconomy/#governmentbondsyield)

針對不同資料集也對應整理出商品代碼清單

- [各國貨幣發行量列表 CurrencyCirculation](https://finmind.github.io/tutor/Macroeconomy/#currencycirculation)

- [政府公債殖利率列表 GovernmentBondsYield](https://finmind.github.io/tutor/Macroeconomy/#governmentbondsyield)

#### 各國貨幣發行量列表 CurrencyCirculation

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v3/datalist?dataset=CurrencyCirculation'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

        0
0  Europe
1  Taiwan
2      US
```

#### 各國貨幣發行量表 CurrencyCirculation

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v3/data?dataset=CurrencyCirculation&date=2020-01-01&data_id=US'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

  country        date     type      value
0      US  2020-01-01  Monthly  1798.984B
1      US  2020-02-01  Monthly  1795.990B
2      US  2020-03-01  Monthly  1826.102B
3      US  2020-04-01  Monthly  1876.878B
```

#### 政府公債殖利率列表 GovernmentBondsYield

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v3/datalist?dataset=GovernmentBondsYield'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

                       0
0  United States 1-Month
1   United States 1-Year
2  United States 10-Year
3  United States 2-Month
4   United States 2-Year
```

#### 政府公債殖利率表 GovernmentBondsYield

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v3/data?dataset=GovernmentBondsYield&date=2020-01-01&data_id=United%20States%203-Year'
data = requests.get(url)
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