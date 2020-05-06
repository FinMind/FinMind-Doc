
在台股基本面，我們擁有 6 種資料集，如下:

- [綜合損益表 FinancialStatements](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#financialstatements)
- [資產負債表 BalanceSheet](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#balancesheet)
- [現金流量表 TaiwanCashFlowsStatement](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwancashflowsstatement)
- [股利政策表 StockDividend](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#stockdividend)
- [除權除息結果表 StockDividendResult](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#stockdividendresult)
- [月營收表 TaiwanStockMonthRevenue](https://finmind.github.io/tutor/TaiwanMarket/Fundamental/#taiwanstockmonthrevenue)

#### 綜合損益表 FinancialStatements

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=FinancialStatements&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date stock_id             type         value
0  2019-03-31     2330             ASSO  4.334910e+08
1  2019-03-31     2330  CostOfGoodsSold  1.283520e+11
2  2019-03-31     2330              EPS  2.370000e+00
3  2019-03-31     2330             EXDF  3.218080e+09
4  2019-03-31     2330    FinancialCost  8.990650e+08
```

#### 資產負債表 BalanceSheet

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=BalanceSheet&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date     ...             value
0  2019-03-31     ...       27100909000
1  2019-03-31     ...                 1
2  2019-03-31     ...         560941000
3  2019-03-31     ...                 0
4  2019-03-31     ...         309821000
```

#### 現金流量表 TaiwanCashFlowsStatement

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=TaiwanCashFlowsStatement&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date      ...              value
0  2019-03-31      ...         1355336000
1  2019-03-31      ...       577814601000
2  2019-03-31      ...       645670527000
3  2019-03-31      ...        67855926000
4  2019-03-31      ...       152670278000
```

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

#### 月營收表 TaiwanStockMonthRevenue

```python
import requests
import pandas as pd
url = 'http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockMonthRevenue&stock_id=2330&date=2019-04-01'

data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date stock_id      ...      revenue_month  revenue_year
0  2019-04-01     2330      ...                  3          2019
1  2019-05-01     2330      ...                  4          2019
2  2019-06-01     2330      ...                  5          2019
3  2019-07-01     2330      ...                  6          2019
4  2019-08-01     2330      ...                  7          2019
```