在匯率市場，我們擁有 1 種資料集，如下:

- [外幣對台幣資料表 TaiwanExchangeRate](https://finmind.github.io/tutor/InterestRate/#taiwanexchangerate)

另外針對資料集整理出外幣兌換清單，目前共有 19 種幣別

- [外幣對台幣列表 TaiwanExchangeRate](https://finmind.github.io/tutor/InterestRate/#taiwanexchangerate)

#### 外幣對台幣列表 TaiwanExchangeRate

- 這張資料表主要是列出目前外幣兌換台幣的幣別清單

```python
import requests
import pandas as pd

url = "http://finmindapi.servebeer.com/api/v2/datalist?dataset=TaiwanExchangeRate"
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

     0
0  AUD
1  CAD
2  CHF
3  CNY
4  EUR
```

#### 外幣對台幣資料表 TaiwanExchangeRate

- 針對 USD 做示範

```python
import requests
import pandas as pd

url = "http://finmindapi.servebeer.com/api/v2/data?dataset=TaiwanExchangeRate&data_id=USD"
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date currency  cash_buy  cash_sell  spot_buy  spot_sell
0  2006-01-02      USD    32.470     33.005   -99.000    -99.000
1  2006-01-03      USD    32.295     32.830    32.595     32.695
2  2006-01-04      USD    31.985     32.520    32.285     32.385
3  2006-01-05      USD    31.670     32.205    31.970     32.070
4  2006-01-06      USD    31.830     32.372    32.130     32.230
```
