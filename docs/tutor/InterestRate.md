在利率市場，我們擁有 12 國央行資料集，如下:

- [利率資料表 InterestRate](https://finmind.github.io/tutor/InterestRate/#interestrate)

| data_id 	| BOE        	| RBA          	| FED          	| PBOC         	| BOC      	| ECB          	| RBNZ           	| RBI          	| CBR            	| BCB              	| BOJ      	| SNB          	|
|---------	|------------	|--------------	|--------------	|--------------	|----------	|--------------	|----------------	|--------------	|----------------	|------------------	|----------	|--------------	|
| 國家    	| 英格蘭銀行 	| 澳洲儲備銀行 	| 聯邦準備銀行 	| 中國人民銀行 	| 中國銀行 	| 歐洲中央銀行 	| 紐西蘭儲備銀行 	| 印度儲備銀行 	| 俄羅斯中央銀行 	| 馬來西亞商業銀行 	| 日本銀行 	| 瑞士國家銀行 	|

#### 利率資料表 InterestRate

- 針對 FED 做示範

```python
import requests
import pandas as pd
url = "https://api.finmindtrade.com/api/v3/data"
parameter = {
     "dataset": "InterestRate",
     "data_id": "FED",
     "date": "1982-01-01",
}
data = requests.get(url, params=parameter)
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
