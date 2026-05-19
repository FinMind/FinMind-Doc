In the interest rate market, we offer datasets from 12 central banks, as follows:

- [Interest Rate Table InterestRate](https://finmind.github.io/en/tutor/InterestRate/#interestrate)

| data_id 	| BOE        	| RBA          	| FED          	| PBOC         	| BOC      	| ECB          	| RBNZ           	| RBI          	| CBR            	| BCB              	| BOJ      	| SNB          	|
|---------	|------------	|--------------	|--------------	|--------------	|----------	|--------------	|----------------	|--------------	|----------------	|------------------	|----------	|--------------	|
| Country 	| Bank of England 	| Reserve Bank of Australia 	| Federal Reserve 	| People's Bank of China 	| Bank of China 	| European Central Bank 	| Reserve Bank of New Zealand 	| Reserve Bank of India 	| Central Bank of Russia 	| Central Bank of Brazil 	| Bank of Japan 	| Swiss National Bank 	|

#### Interest Rate Table InterestRate

- FED demonstration

!!! example
  ```python
  import requests
  import pandas as pd
  url = "https://api.finmindtrade.com/api/v4/data"
  token = "" # Refer to the login page to obtain your API key
  headers = {"Authorization": f"Bearer {token}"}
  parameter = {
      "dataset": "InterestRate",
      "data_id": "FED",
      "start_date": "1982-01-01",
  }
  data = requests.get(url, headers=headers, params=parameter)
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
!!! output
    === "Schema"
        ```
        {
            country: str, # country
            date: str, # date
            full_country_name: str, # full country name
            interest_rate: float32 # interest rate
        }
        ```
