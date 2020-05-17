
在台灣股票新聞面，我們擁有 1 種資料集，如下:

- [相關新聞表 TaiwanStockNews](https://finmind.github.io/tutor/TaiwanMarket/Others/#taiwanstocknews)


#### 相關新聞表 TaiwanStockNews

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "http://api.finmindtrade.com/api/v2/data"
        parameter = {
            "dataset": "TaiwanStockNews",
            "data_id":"2330",
            "date": "2020-04-01",
            "end_date": "2020-04-03"
        }
        data = requests.get(url, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())
                        date stock_id                                        description                                               link         source                                              title
        0  2020-04-01 00:00:00     2330  &lt;a href="https://tw.news.yahoo.com/%E9%9B%B...  https://tw.news.yahoo.com/%E9%9B%BB%E5%AD%90%E...      Yahoo奇摩新聞  電子時報：台積電3奈米照走，三星衝擊大，蘋果下修5奈米訂單，NVIDIA補位 - Yahoo...
        1  2020-04-01 00:57:33     2330  &lt;a href="https://udn.com/news/story/6850/44...            https://udn.com/news/story/6850/4458587      udn 聯合新聞網                             世芯中國伺服器需求增 - udn 聯合新聞網
        2  2020-04-01 00:58:42     2330  &lt;a href="https://finance.technews.tw/2020/0...  https://finance.technews.tw/2020/04/01/tsmc-wa...  科技新報 TechNews             台積電發展工業廢水再生技術，南科工程明年啟動 - 科技新報 TechNews
        3  2020-04-01 00:59:38     2330  &lt;a href="https://tw.news.yahoo.com/%E5%8F%B...  https://tw.news.yahoo.com/%E5%8F%B0%E7%A9%8D%E...      Yahoo奇摩股市     台積電ADR31日下跌0.03美元跌幅0.06%折台股289.17元 - Yahoo奇摩股市
        4  2020-04-01 02:40:00     2330  &lt;a href="https://fnc.ebc.net.tw/FncNews/Con...      https://fnc.ebc.net.tw/FncNews/Content/117374         東森財經新聞         外資:半導體庫存面臨修正台積電營收成長、目標價遭雙降｜東森財經新聞 - 東森財經新聞
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)

        url = 'http://api.finmindtrade.com/api/v2/data'
        response = httr::GET(url = url,
                            query = list(
                            dataset="TaiwanStockNews",
                            data_id="2330",
                            date= "2020-04-01",
                            end_date='2020-04-03'
                            )
        )
        data = response %>% content
        df = do.call('cbind',data$data) %>%data.table
        head(df)

                        date stock_id
        1: 2020-04-01 00:00:00     2330
        2: 2020-04-01 00:57:33     2330
        3: 2020-04-01 00:58:42     2330
        4: 2020-04-01 00:59:38     2330
        5: 2020-04-01 02:40:00     2330
        6: 2020-04-01 03:07:57     2330
        description
        1: &lt;a href="https://tw.news.yahoo.com/%E9%9B%BB%E5%AD%90%E6%99%82%E5%A0%B1-%E5%8F%B0%E7%A9%8D%E9%9B%BB3%E5%A5%88%E7%B1%B3%E7%85%A7%E8%B5%B0-%E4%B8%89%E6%98%9F%E8%A1%9D%E6%93%8A%E5%A4%A7-%E8%98%8B%E6%9E%9C%E4%B8%8B%E4%BF%AE5%E5%A5%88%E7%B1%B3%E8%A8%82%E5%96%AE-nvidia%E8%A3%9C%E4%BD%8D-000054154.html" target="_blank"&gt;電子時報：台積電3奈米照走，三星衝擊大，蘋果下修5奈米訂單，NVIDIA補位&lt;/a&gt;&amp;nbsp;&amp;nbsp;&lt;font color="#6f6f6f"&gt;Yahoo奇摩新聞&lt;/font&gt;
        2:                                                                                                                                                                                                                                                                                                        &lt;a href="https://udn.com/news/story/6850/4458587" target="_blank"&gt;世芯中國伺服器需求增&lt;/a&gt;&amp;nbsp;&amp;nbsp;&lt;font color="#6f6f6f"&gt;udn 聯合新聞網&lt;/font&gt;
        3:                                                                                                                                                                                                                                                          &lt;a href="https://finance.technews.tw/2020/04/01/tsmc-water-recycle/" target="_blank"&gt;台積電發展工業廢水再生技術，南科工程明年啟動&lt;/a&gt;&amp;nbsp;&amp;nbsp;&lt;font color="#6f6f6f"&gt;科技新報 TechNews&lt;/font&gt;
        4:                                                                                                                         &lt;a href="https://tw.news.yahoo.com/%E5%8F%B0%E7%A9%8D%E9%9B%BBadr31%E6%97%A5%E4%B8%8B%E8%B7%8C0-03%E7%BE%8E%E5%85%83%E8%B7%8C%E5%B9%850-06-%E6%8A%98%E5%8F%B0%E8%82%A1289-17%E5%85%83-004919773.html" target="_blank"&gt;台積電ADR31日下跌0.03美元跌幅0.06%折台股289.17元&lt;/a&gt;&amp;nbsp;&amp;nbsp;&lt;font color="#6f6f6f"&gt;Yahoo奇摩股市&lt;/font&gt;
        5:                                                                                                                                                                                                                                                       &lt;a href="https://fnc.ebc.net.tw/FncNews/Content/117374" target="_blank"&gt;外資:半導體庫存面臨修正台積電營收成長、目標價遭雙降｜東森財經新聞&lt;/a&gt;&amp;nbsp;&amp;nbsp;&lt;font color="#6f6f6f"&gt;東森財經新聞&lt;/font&gt;
        6:                                                                                                                                                                                                                                                                                   &lt;a href="https://udn.com/news/story/7253/4460355" target="_blank"&gt;半導體恐面臨庫存修正 外資調降台積電目標價&lt;/a&gt;&amp;nbsp;&amp;nbsp;&lt;font color="#6f6f6f"&gt;udn 聯合新聞網&lt;/font&gt;
                                                                                                      link
        1: https://tw.news.yahoo.com/%E9%9B%BB%E5%AD%90%E6%99%82%E5%A0%B1-%E5%8F%B0%E7%A9%8D%E9%9B%BB3%E5%A5%88%E7%B1%B3%E7%85%A7%E8%B5%B0-%E4%B8%89%E6%98%9F%E8%A1%9D%E6%93%8A%E5%A4%A7-%E8%98%8B%E6%9E%9C%E4%B8%8B%E4%BF%AE5%E5%A5%88%E7%B1%B3%E8%A8%82%E5%96%AE-nvidia%E8%A3%9C%E4%BD%8D-000054154.html
        2:                                                                                                                                                                                                                                                         https://udn.com/news/story/6850/4458587
        3:                                                                                                                                                                                                                                      https://finance.technews.tw/2020/04/01/tsmc-water-recycle/
        4:                                                                                                     https://tw.news.yahoo.com/%E5%8F%B0%E7%A9%8D%E9%9B%BBadr31%E6%97%A5%E4%B8%8B%E8%B7%8C0-03%E7%BE%8E%E5%85%83%E8%B7%8C%E5%B9%850-06-%E6%8A%98%E5%8F%B0%E8%82%A1289-17%E5%85%83-004919773.html
        5:                                                                                                                                                                                                                                                   https://fnc.ebc.net.tw/FncNews/Content/117374
        6:                                                                                                                                                                                                                                                         https://udn.com/news/story/7253/4460355
        source
        1:     Yahoo奇摩新聞
        2:    udn 聯合新聞網
        3: 科技新報 TechNews
        4:     Yahoo奇摩股市
        5:      東森財經新聞
        6:    udn 聯合新聞網
        title
        1: 電子時報：台積電3奈米照走，三星衝擊大，蘋果下修5奈米訂單，NVIDIA補位 - Yahoo奇摩新聞
        2:                                                世芯中國伺服器需求增 - udn 聯合新聞網
        3:                     台積電發展工業廢水再生技術，南科工程明年啟動 - 科技新報 TechNews
        4:                     台積電ADR31日下跌0.03美元跌幅0.06%折台股289.17元 - Yahoo奇摩股市
        5:     外資:半導體庫存面臨修正台積電營收成長、目標價遭雙降｜東森財經新聞 - 東森財經新聞
        6:                           半導體恐面臨庫存修正 外資調降台積電目標價 - udn 聯合新聞網
        ```
