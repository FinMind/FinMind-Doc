在利率市場，我們擁有 1 種資料集，如下:

- [利率資料表 InterestRate](https://finmind.github.io/tutor/TaiwanStock/#利率資料表-InterestRate)

另外針對資料集整理出央行清單，目前有 12 國央行

- [利率資料央行列表 InterestRate](https://finmind.github.io/tutor/TaiwanStock/#利率資料央行列表-InterestRate)

#### 利率資料央行列表 InterestRate

- 這張資料表主要是列出目前利率資料中擁有的央行列表

```python
import requests
import pandas as pd

url = "http://finmindapi.servebeer.com/api/v2/datalist?dataset=InterestRate"
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

     0
0  BCB
1  BOC
2  BOE
3  BOJ
4  CBR
```

#### 利率資料表 InterestRate

- 針對 FED 做示範

```python
import requests
import pandas as pd

url = "http://finmindapi.servebeer.com/api/v2/data?dataset=InterestRate&data_id=FED"
data = requests.get(url)
data = data.json()
data = pd.DataFrame(data['data'])
print(data.head())

  country        date full_country_name  interest_rate
0     FED  1982-09-27   Federal Reserve          10.25
1     FED  1982-10-01   Federal Reserve          10.00
2     FED  1982-10-07   Federal Reserve           9.50
3     FED  1982-11-19   Federal Reserve           9.00
4     FED  1982-12-14   Federal Reserve           8.50
```
