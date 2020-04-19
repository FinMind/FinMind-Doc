在台灣股票籌碼面資料，我們擁有 5 種資料集，如下:

- [融資融劵表 TaiwanStockMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockmarginpurchaseshortsale)

- [台灣市場整體融資融劵表 TotalMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanMarket/Chip/#totalmarginpurchaseshortSale)

- [法人買賣表 InstitutionalInvestorsBuySell](https://finmind.github.io/tutor/TaiwanMarket/Chip/#institutionalinvestorsbuysell)

- [股東結構表 Shareholding](https://finmind.github.io/tutor/TaiwanMarket/Chip/#shareholding)

- [股東持股分級表 TaiwanStockHoldingSharesPer](https://finmind.github.io/tutor/TaiwanMarket/Chip/#taiwanstockholdingsharesper)

#### 融資融劵表 TaiwanStockMarginPurchaseShortSale

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockMarginPurchaseShortSale&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date            ...            ShortSaleYesterdayBalance
0  2019-01-02            ...                                 3179
1  2019-01-03            ...                                 2782
2  2019-01-04            ...                                 2475
3  2019-01-07            ...                                 2164
4  2019-01-08            ...                                 2154
```

#### 台灣市場整體融資融劵表 TotalMarginPurchaseShortSale

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v2/data?dataset=TotalMarginPurchaseShortSale&date=2020-04-01'

data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

   TodayBalance  YesBalance     buy        date            name    sell
0       5463820     5471770  236127  2020-04-01  MarginPurchase  233091
1       5496478     5463820  327741  2020-04-06  MarginPurchase  291292
2       5506839     5496478  389543  2020-04-07  MarginPurchase  370022
3       5533088     5506838  381063  2020-04-08  MarginPurchase  349361
4       5561841     5533088  349129  2020-04-09  MarginPurchase  313083
```

#### 法人買賣表 InstitutionalInvestorsBuySell

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=InstitutionalInvestorsBuySell&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date stock_id       buy                 name      sell
0  2019-01-02     2330    183000       Dealer_Hedging    344000
1  2019-01-02     2330    742000          Dealer_self   1375000
2  2019-01-02     2330         0  Foreign_Dealer_Self         0
3  2019-01-02     2330  13633825     Foreign_Investor  22365017
4  2019-01-02     2330    175000     Investment_Trust    166000
```

#### 股東結構表 Shareholding

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=Shareholding&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date stock_id       buy                 name      sell
0  2019-01-02     2330    183000       Dealer_Hedging    344000
1  2019-01-02     2330    742000          Dealer_self   1375000
2  2019-01-02     2330         0  Foreign_Dealer_Self         0
3  2019-01-02     2330  13633825     Foreign_Investor  22365017
4  2019-01-02     2330    175000     Investment_Trust    166000
```

#### 股東持股分級表 TaiwanStockHoldingSharesPer

```python
import requests
import pandas as pd

url = 'http://finmindapi.servebeer.com/api/v2/data?dataset=TaiwanStockHoldingSharesPer&stock_id=2330&date=2020-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())


         date stock_id HoldingSharesLevel  people  percent       unit
0  2020-01-03     2330              1-999  152189     0.12   31620477
1  2020-01-03     2330        1,000-5,000  162537     1.23  319338776
2  2020-01-03     2330      10,001-15,000    9197     0.43  112485162
3  2020-01-03     2330    100,001-200,000    1597     0.85  221839181
4  2020-01-03     2330      15,001-20,000    4388     0.29   77359293
```