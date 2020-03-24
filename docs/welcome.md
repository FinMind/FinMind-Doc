# Welcome to FinMind

FinMind is about Financial Data, Visualize and Mining.

### Introduce

Stocks are financial products that most people are familiar with. The stock price will be affected by many factors, including central bank interest rates, exchange rates, raw material prices, and international oil prices.

Similarly, other financial products will interact with each other. If we conduct a holistic financial analysis, we can not only look at a single piece of data, but also extract valuable information from it.

The following will introduce our products.

### Financial Data
More than ten kinds financial data. Every day update.
Financial Visualize
At least five kinds Visualize tools on every data. (In development)
Financial Mining
Holistic financial analysis. (In development)

### Getting started

```python
from FinMind.Data import Load
import datetime

date = '2018-12-13'
print('load TaiwanStockInfo')
TaiwanStockInfo = Load.FinData(dataset = 'TaiwanStockInfo')
print( TaiwanStockInfo[:5] )

load TaiwanStockInfo
stock_id stock_name kinds
0     1201         味全  食品工業
1     1203         味王  食品工業
2     1210         大成  食品工業
3     1213         大飲  食品工業
4     1215         卜蜂  食品工業

print('load TaiwanStockPrice {} '.format(TaiwanStockInfo.loc[2,'stock_id']))
TaiwanStockPrice = Load.FinData(
        dataset = 'TaiwanStockPrice',
        select = TaiwanStockInfo.loc[2,'stock_id'],
        #select = ['1210'],
        date = date)
print( TaiwanStockPrice[:5] )

load TaiwanStockPrice 1210 
Open   High    Low  Close  Adj_Close   Volume        date stock_id
0  32.5  33.20  32.30  33.00      33.00  1668333  2018-12-13     1210
1  33.3  35.05  33.25  33.95      33.95  3916120  2018-12-14     1210
2  34.5  35.50  34.35  34.35      34.35  4543063  2018-12-17     1210
3  34.4  34.85  32.80  32.80      32.80  3726316  2018-12-18     1210
4  33.0  33.40  32.30  32.75      32.75  1887001  2018-12-19     1210
```

The parameter `table` is what dataset been load.<br>
The function `FinData` is load taiwan stock prices by selecting TaiwanStockInfo.loc[2,'stock_id'] and `date` >= '2018-12-13', or you can load some stock id like `1210`.

```python
print('load GovernmentBonds list')
GovernmentBonds_list = Load.FinDataList(dataset = 'GovernmentBonds')
print( GovernmentBonds_list[:5] )

print('load GovernmentBonds {}'.format(GovernmentBonds_list[3]))
GovernmentBonds = Load.FinData(
        dataset = 'GovernmentBonds',
        select = GovernmentBonds_list[3],
        date = date)
print( GovernmentBonds[:5] )
```

```python

load GovernmentBonds list
['Canada 1-Month', 'Canada 1-Year', 'Canada 10-Year', 'Canada 2-Month', 'Canada 2-Year']
load GovernmentBonds Canada 2-Month
        date  Price   Open   High   Low  ChangePercent      bound_type
0  2018-12-13  1.630  1.625  1.630  1.62         0.0000  Canada 2-Month
1  2018-12-14  1.630  1.625  1.630  1.62         0.0000  Canada 2-Month
2  2018-12-17  1.625  1.630  1.635  1.62        -0.0031  Canada 2-Month
3  2018-12-18  1.625  1.630  1.630  1.62         0.0000  Canada 2-Month
4  2018-12-19  1.625  1.620  1.625  1.62         0.0000  Canada 2-Month
```


The function FinDataList is load GovernmentBonds_list.
The function FinData is load GovernmentBonds by selecting Canada 2-Month and date >= '2018-12-13'.

more can follow deom.py in my github.