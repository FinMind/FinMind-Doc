在台灣股票財務報表資料，我們擁有 2 種資料集，如下:

- [資產損益表 FinancialStatements](https://finmind.github.io/tutor/TaiwanMarket/FinancialStatements/#financialstatements)

- [資產負債表 BalanceSheet](https://finmind.github.io/tutor/TaiwanMarket/FinancialStatements/#balancesheet)

#### 資產損益表 FinancialStatements

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