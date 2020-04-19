在台灣股票市場，我們擁有 16 種資料集，如下:

- [台灣股價資料表 TaiwanStockPrice](https://finmind.github.io/tutor/TaiwanStock/#taiwanstockinfo)

- [資產損益表 FinancialStatements](https://finmind.github.io/tutor/TaiwanStock/#financialstatements)

- [資產負債表 BalanceSheet](https://finmind.github.io/tutor/TaiwanStock/#balancesheet)

- [股利政策表 StockDividend](https://finmind.github.io/tutor/TaiwanStock/#stockdividend)

- [除權除息結果表 StockDividendResult](https://finmind.github.io/tutor/TaiwanStock/#stockdividendresult)

- [融資融劵表 TaiwanStockMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanStock/#taiwanstockmarginpurchaseshortsale)

- [台灣市場整體融資融劵表 TotalMarginPurchaseShortSale](https://finmind.github.io/tutor/TaiwanStock/#totalmarginpurchaseshortSale)

- [法人買賣表 InstitutionalInvestorsBuySell](https://finmind.github.io/tutor/TaiwanStock/#institutionalinvestorsbuysell)

- [股東結構表 Shareholding](https://finmind.github.io/tutor/TaiwanStock/#shareholding)

- [股東持股分級表 TaiwanStockHoldingSharesPer](https://finmind.github.io/tutor/TaiwanStock/#taiwanstockholdingsharesper)

- [現金流量表 TaiwanCashFlowsStatement](https://finmind.github.io/tutor/TaiwanStock/#taiwancashflowsstatement)

- [台灣股價及時資料表 TaiwanStockPriceMinute](https://finmind.github.io/tutor/TaiwanStock/#taiwanstockpriceminute)

- [台灣股價及時最佳五檔買賣價量資料表 TaiwanStockPriceMinuteBidAsk](https://finmind.github.io/tutor/TaiwanStock/#taiwanstockpriceminutebidask)

- [台灣期貨交易表 TaiwanFutures](https://finmind.github.io/tutor/TaiwanStock/#taiwanfutures)

- [台灣選擇權交易表 TaiwanOption](https://finmind.github.io/tutor/TaiwanStock/#taiwanoption)

- [相關新聞表 TaiwanStockNews](https://finmind.github.io/tutor/TaiwanStock/#taiwanstocknews)

另外針對資料集整理出的列表如下:

- [台灣股票清單列表 TaiwanStockInfo](https://finmind.github.io/tutor/TaiwanStock/#taiwanstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v2_data_get)

#### 台灣股票清單列表 TaiwanStockInfo

- 這張資料表主要是列出台灣所有上市上櫃的股票名稱，代碼和產業類別

```python
import requests
import pandas as pd

url = "http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockInfo"
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

  industry_category stock_id stock_name  type
0               ETF     0050     元大台灣50     1
1               ETF     0051    元大中型100     1
2               ETF     0052       富邦科技     1
3               ETF     0053       元大電子     1
4               ETF     0054     元大台商50     1
```

#### 台灣股價資料表 TaiwanStockPrice

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockPrice&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

         date stock_id        ...         spread  Trading_turnover
0  2019-01-02     2330        ...           -6.0             12329
1  2019-01-03     2330        ...           -4.0             14549
2  2019-01-04     2330        ...           -7.5             28786
3  2019-01-07     2330        ...            5.0             11224
4  2019-01-08     2330        ...           -2.0              9377
```

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

#### 台灣股價及時資料表 TaiwanStockPriceMinute

- 只輸入 dataset 參數會回傳當天即時交易資料
- 輸入 dataset 和 date 會回傳date之後一直到最近一個交易日的所有交易資料

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockPriceMinute&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

                         date stock_id  deal_price  volume
0  2019-05-28 13:21:03.000000     2330       231.0      16
1  2019-05-28 13:21:08.000000     2330       231.0      72
2  2019-05-28 13:21:13.000000     2330       231.0      64
3  2019-05-28 13:21:18.000000     2330       231.0       1
4  2019-05-28 13:21:23.000000     2330       231.5       1
```

#### 台灣股價及時最佳五檔買賣價量資料表 TaiwanStockPriceMinuteBidAsk

- 開發中

#### 台灣期貨交易表 TaiwanFutures

- 開發中

#### 台灣選擇權交易表 TaiwanOption

- 開發中

#### 相關新聞表 TaiwanStockNews

```python
import requests
import pandas as pd

url = 'http://api.finmindtrade.com/api/v2/data?dataset=TaiwanStockNews&stock_id=2330&date=2019-01-01'
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

                  date                       ...                                                                   title
0  2019-07-02 07:00:00                       ...                                    張忠謀的「告別作」落腳南科台積電的祕密武器...｜天下雜誌 - 天下雜誌
1  2019-07-20 07:00:00                       ...                                   台積電告別何麗梅時代！新任財務長黃仁昭揭密 - 科技新報 TechNews
2  2019-09-22 07:00:00                       ...                                       台積電產能滿載所致？AMD宣布3950X延至11月推出 - 鉅亨網
3  2019-09-24 07:00:00                       ...                                    5 奈米進度超前，台積電連續上修產能規畫 - 科技新報 TechNews
4  2019-09-24 07:00:00                       ...                         力旺記憶體IP傳捷報連10年獲選台積電最佳夥伴| Anue鉅亨- 台股新聞 - 鉅亨網財經新聞
```
