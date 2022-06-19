在美國股票資料，我們擁有 2 種資料集，如下:

- [美國股價 minute 資料表 USStockPriceMinute](https://finmind.github.io/tutor/UnitedStatesMarket/Technical/#minute-usstockpriceminute)
- [美國股價 daily 資料表 USStockPrice](https://finmind.github.io/tutor/UnitedStatesMarket/Technical/#daily-usstockprice)

另外針對資料集整理出的列表如下:

- [美國股票清單列表 USStockInfo](https://finmind.github.io/tutor/UnitedStatesMarket/Technical/#usstockinfo)

根據上述資料表逐一說明怎麼使用，另外具體資料表 schemas 請參考 [finmindapi](http://api.finmindtrade.com/docs#/default/method_api_v3_data_get)

#### 美國股票清單列表 USStockInfo

- 這張資料表主要是列出美國所有上市上櫃的股票名稱，代碼和產業類別

!!! example
    ```python
    import requests
    import pandas as pd

    url = 'https://api.finmindtrade.com/api/v4/data'
    parameter = {
        "dataset": "USStockInfo"
    }
    data = requests.get(url, params=parameter)
    data = data.json()
    data = pd.DataFrame(data['data'])
    print(data.head())
    ```

!!! output
    |    | date       | stock_id   | Country       |   IPOYear |   MarketCap | Subsector                                     | stock_name                    |
    |---:|:-----------|:-----------|:--------------|----------:|------------:|:----------------------------------------------|:------------------------------|
    |  0 | 2019-01-10 | A          | United States |      1999 | 21610000000 | Biotechnology:LaboratoryAnalyticalInstruments | Agilent Technologies, Inc.    |
    |  1 | 2019-01-10 | AA         | n/a           |      2016 |  5270000000 | Aluminum                                      | Alcoa Corporation             |
    |  2 | 2019-01-10 | AABA       | United States |         0 | 36780000000 | EDPServices                                   | Altaba Inc.                   |
    |  3 | 2019-01-10 | AAC        | United States |      2014 |    55360000 | MedicalSpecialities                           | AAC Holdings, Inc.            |
    |  4 | 2019-01-10 | AAL        | United States |         0 | 14930000000 | AirFreight/DeliveryServices                   | American Airlines Group, Inc. |


#### 美國股價 minute 資料表 USStockPriceMinute

!!! example
    ```python
    import requests
    import pandas as pd

    url = 'https://api.finmindtrade.com/api/v4/data'
    parameter = {
        "dataset": "USStockPriceMinute",
        "data_id": "^DJI",
        "start_date": "2022-06-16",
        "token": token, # 參考登入，獲取金鑰
    }
    data = requests.get(url, params=parameter)
    data = data.json()
    data = pd.DataFrame(data['data'])
    print(data.head())
    ```
!!! output
    |    | date                | stock_id   |   close |    high |     low |    open |   volume |
    |---:|:--------------------|:-----------|--------:|--------:|--------:|--------:|---------:|
    |  0 | 2022-06-16 13:31:00 | ^DJI       | 30082.5 | 30094.9 | 30076.6 | 30091.4 |  1686944 |
    |  1 | 2022-06-16 13:32:00 | ^DJI       | 30075.6 | 30087.9 | 30069.2 | 30081.7 |  1939377 |
    |  2 | 2022-06-16 13:33:00 | ^DJI       | 30039.5 | 30085.8 | 30036.4 | 30078.1 |  1589351 |
    |  3 | 2022-06-16 13:34:00 | ^DJI       | 30001.6 | 30036.5 | 29995.9 | 30036.5 |  2127155 |
    |  4 | 2022-06-16 13:35:00 | ^DJI       | 29996.7 | 30008   | 29984.3 | 30002.2 |  1917277 |
    

#### 美國股價 daily 資料表 USStockPrice

!!! example
    ```python
    import requests
    import pandas as pd

    url = 'https://api.finmindtrade.com/api/v4/data'
    parameter = {
        "dataset": "USStockPrice",
        "data_id": "^DJI",
        "start_date": "2020-06-16",
        "end_date": "2021-06-16",
        "token": token, # 參考登入，獲取金鑰
    }
    data = requests.get(url, params=parameter)
    data = data.json()
    data = pd.DataFrame(data['data'])
    print(data.head())
    ```
!!! output
    |    | date       | stock_id   |   Adj_Close |   Close |    High |     Low |    Open |    Volume |
    |---:|:-----------|:-----------|------------:|--------:|--------:|--------:|--------:|----------:|
    |  0 | 2020-06-16 | ^DJI       |     26290   | 26290   | 26611   | 25811.7 | 26326.7 | 489500000 |
    |  1 | 2020-06-17 | ^DJI       |     26119.6 | 26119.6 | 26400.1 | 26068.4 | 26330.5 | 328830000 |
    |  2 | 2020-06-18 | ^DJI       |     26080.1 | 26080.1 | 26154.2 | 25848.5 | 26016.5 | 328390000 |
    |  3 | 2020-06-19 | ^DJI       |     25871.5 | 25871.5 | 26451.4 | 25759.7 | 26213.1 | 669390000 |
    |  4 | 2020-06-22 | ^DJI       |     26025   | 26025   | 26059.8 | 25667.7 | 25865.1 | 351780000 |
    