In the foreign exchange market, we offer 19 currency datasets, as follows:

- [Foreign Currency to TWD Exchange Rate Table TaiwanExchangeRate](https://finmind.github.io/en/tutor/InterestRate/#taiwanexchangerate)

In addition, the following list summarizes the available currencies. There are currently 19 of them.

| data_id 	| AUD  	| CAD    	| CHF      	| CNY    	| EUR  	| GBP  	| HKD  	| IDR    	| JPY  	| KRW  	| MYR    	| NZD  	| PHP      	| SEK    	| SGD      	| THB  	| USD  	| VND    	| ZAR    	|
|---------	|------	|--------	|----------	|--------	|------	|------	|------	|--------	|------	|------	|--------	|------	|----------	|--------	|----------	|------	|------	|--------	|--------	|
| Currency  	| Australia 	| Canada 	| Swiss Franc 	| Chinese Yuan 	| Euro 	| British Pound 	| Hong Kong Dollar 	| Indonesian Rupiah 	| Japanese Yen 	| South Korean Won 	| Malaysian Ringgit 	| New Zealand Dollar 	| Philippine Peso 	| Swedish Krona 	| Singapore Dollar 	| Thai Baht 	| US Dollar 	| Vietnamese Dong 	| South African Rand 	|


#### Foreign Currency to TWD Exchange Rate Table TaiwanExchangeRate

- USD demonstration

!!! example
     ```python
     import requests
     import pandas as pd
     url = "https://api.finmindtrade.com/api/v4/data"
     token = "" # Refer to the login page to obtain your API key
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
            date: str, # date
            currency: str, # currency
            cash_buy: float64, # cash buying rate
            cash_sell: float64, # cash selling rate
            spot_buy: float64, # spot buying rate
            spot_sell: float64 # spot selling rate
        }
        ```
