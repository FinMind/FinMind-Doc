
在台灣股票新聞面，我們擁有 3 種資料集，如下:

- [相關新聞表 TaiwanStockNews](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanstocknews)
- [台灣每月景氣對策信號表 TaiwanBusinessIndicator](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanbusinessindicator-backersponsor)
- [個體公司所屬產業鏈 TaiwanStockIndustryChain](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanstockindustrychain-backersponsor)


#### 相關新聞表 TaiwanStockNews

(由於資料量過大，單次請求只提供一天資料)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockNews",
            "data_id":"2330",
            "start_date": "2020-04-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # 參考登入，獲取金鑰
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockNews",
                data_id="2330",
                start_date= "2020-04-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        | date | stock_id             | description     | link         | source                | title |
        |-----:|:---------------------|----------------:|:-------------:|:--------------------:|:------|
        | 0    | 2020-04-01 00:00:00  |   2330          | &lt;a href="https://tw.news.yahoo.com/%E9%9B%B...  | https://tw.news.yahoo.com/%E9%9B%BB%E5%AD%90%E...    | Yahoo奇摩新聞  | 電子時報：台積電3奈米照走，三星衝擊大，蘋果下修5奈米訂單，NVIDIA補位 - Yahoo...
        | 1    | 2020-04-01 00:57:33  |   2330          | &lt;a href="https://udn.com/news/story/6850/44...  | https://udn.com/news/story/6850/4458587              | udn 聯合新聞網                             | 世芯中國伺服器需求增 - udn 聯合新聞網
        | 2    | 2020-04-01 00:58:42  |   2330          | &lt;a href="https://finance.technews.tw/2020/0...  | https://finance.technews.tw/2020/04/01/tsmc-wa...    | 科技新報 TechNews             | 台積電發展工業廢水再生技術，南科工程明年啟動 - 科技新報 TechNews
        | 3    | 2020-04-01 00:59:38  |   2330          | &lt;a href="https://tw.news.yahoo.com/%E5%8F%B...  | https://tw.news.yahoo.com/%E5%8F%B0%E7%A9%8D%E...    | Yahoo奇摩股市     | 台積電ADR31日下跌0.03美元跌幅0.06%折台股289.17元 - Yahoo奇摩股市
        | 4    | 2020-04-01 02:40:00  |   2330          | &lt;a href="https://fnc.ebc.net.tw/FncNews/Con...  | https://fnc.ebc.net.tw/FncNews/Content/117374        | 東森財經新聞        | 外資:半導體庫存面臨修正台積電營收成長、目標價遭雙降｜東森財經新聞 - 東森財經新聞
    === "Schema"
        ```
        {
            date: str,
            stock_id: str,
            description: str,
            link: str,
            source: str,
            title: str
        }
        ```

#### 台灣每月景氣對策信號表 TaiwanBusinessIndicator (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)

- 資料區間：1982-01-01 ~ now

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanBusinessIndicator",
            "start_date": "2024-04-01",
            "end_date": "2025-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # 參考登入，獲取金鑰
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanBusinessIndicator",
                start_date= "2020-04-01",
                end_date= "2025-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |      |    date     |   leading  | leading_notrend   | coincident  | coincident_notrend  | lagging |  lagging_notrend |  monitoring |  monitoring_color |
        |-----:|:------------|-----------:|:-----------------:|:-----------:|:--------------------|:--------|:-----------------|:------------|:------------------|
        | 0    | 2024-01-01  |    92.32   |      99.85        |      90.8   |          98.21      |  91.82  |         99.31    |      27     |         G         |
        | 1    | 2024-02-01  |    92.71   |      100.35       |      91.45  |          98.99      |  91.68  |         99.25    |      29     |         G         |
        | 2    | 2024-03-01  |    93.19   |      100.95       |      92.28  |          99.97      |  91.6   |         99.23    |      31     |         G         |
        | 3    | 2024-04-01  |    93.75   |      101.63       |      93.23  |          101.07     |  91.52  |         99.22    |      35     |         YR        |
        | 4    | 2024-05-01  |    94.29   |      102.28       |      94.21  |          102.19     |  91.41  |         99.16    |      36     |         YR        |
    === "Schema"
        ```
        {
            date: str,
            leading: float32,
            leading_notrend: float32,
            coincident: float32,
            coincident_notrend: float32,
            lagging: float32,
            lagging_notrend: float32,
            monitoring: float32,
            monitoring_color: str
        }
        ```

#### 個體公司所屬產業鏈 TaiwanStockIndustryChain (只限 [backer、sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) 會員使用)


!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # api.login(user_id='user_id',password='password')
        df = api.taiwan_stock_industry_chain()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockIndustryChain",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        token = "" # 參考登入，獲取金鑰
        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockIndustryChain"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)
        ```
!!! output
    === "DataFrame"
        |      | stock_id  |   industry  |      sub_industry        |    date    |
        |-----:|:----------|-----------:|:-------------------------:|:------------:|
        | 0    |    1218   |    食品     | 冷凍、罐頭、脫水、醃漬食品 |   2025-03-30  |
        | 1    |    1218   |    食品     |          加工食品        |   2025-03-30  |
        | 2    |    1219   |    食品     |          加工食品        |   2025-03-30  |
        | 3    |    1219   |    雲端運算 |          系統整合        |   2025-03-30 |
        | 4    |    1236   |    食品     |          乳製品          |   2025-03-30 |
    === "Schema"
        ```
        {
            stock_id: str,
            industry: str,
            sub_industry: str,
            date: str
        }
        ```