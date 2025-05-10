在匯率市場，我們擁有 19 種幣別資料集，如下: 

- [外幣對台幣資料表 TaiwanExchangeRate](https://finmind.github.io/tutor/InterestRate/#taiwanexchangerate)

另外針對資料集整理出外幣兌換清單，目前共有 19 種幣別

| data_id 	| AUD  	| CAD    	| CHF      	| CNY    	| EUR  	| GBP  	| HKD  	| IDR    	| JPY  	| KRW  	| MYR    	| NZD  	| PHP      	| SEK    	| SGD      	| THB  	| USD  	| VND    	| ZAR    	|
|---------	|------	|--------	|----------	|--------	|------	|------	|------	|--------	|------	|------	|--------	|------	|----------	|--------	|----------	|------	|------	|--------	|--------	|
| 幣別    	| 澳洲 	| 加拿大 	| 瑞士法郎 	| 人民幣 	| 歐元 	| 英鎊 	| 港幣 	| 印尼幣 	| 日圓 	| 韓元 	| 馬來幣 	| 紐元 	| 菲國比索 	| 瑞典幣 	| 新加坡幣 	| 泰幣 	| 美金 	| 越南盾 	| 南非幣 	|


#### 外幣對台幣資料表 TaiwanExchangeRate

- 針對 USD 做示範

!!! example
     ```python
     import requests
     import pandas as pd
     url = "https://api.finmindtrade.com/api/v4/data"
     token = "" # 參考登入，獲取金鑰
     headers = {"Authorization": f"Bearer {token}"}
     parameter = {
          "dataset": "TaiwanExchangeRate",
          "data_id": "USD",
          "start_date": "2006-01-01",
     }
     data = requests.get(url, headers=headers, params=parameter)
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
!!! output
    === "Schema"
        ```
        {
            date: str,
            currency: str,
            cash_buy: float64,
            cash_sell: float64,
            spot_buy: float64,
            spot_sell: float64
        }
        ```