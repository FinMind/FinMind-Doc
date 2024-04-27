
在台灣股票新聞面，我們擁有 1 種資料集，如下:

- [相關新聞表 TaiwanStockNews](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanstocknews)


#### 相關新聞表 TaiwanStockNews

(由於資料量過大，單次請求只提供一天資料)

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        parameter = {
            "dataset": "TaiwanStockNews",
            "data_id":"2330",
            "start_date": "2020-04-01",
            "token": "", # 參考登入，獲取金鑰
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'https://api.finmindtrade.com/api/v4/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanStockNews",
                            data_id="2330",
                            start_date= "2020-04-01",
                            token = "" # 參考登入，獲取金鑰
                            )
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