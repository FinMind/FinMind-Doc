
在台灣股票新聞面，我們擁有 1 種資料集，如下:

- [相關新聞表 TaiwanStockNews](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanstocknews)


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