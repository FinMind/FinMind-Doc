# Taiwan Stock Index Codes

In addition to regular stock IDs (4 digits), `taiwan_stock_tick_snapshot` also supports 91 index codes (3 digits) covering the broad market, sector indices, themed indices and leverage / inverse indices.

For example, `data_id="001"` is the TAIEX (weighted index), and `data_id="101"` is the OTC weighted index.

The tables below list all codes, grouped by purpose. Names are kept in the original Chinese as published by TWSE / TPEx (the official Taiwanese exchanges).

---

## A. Broad Market / Weighted Indices

| data_id | Name |
|:---:|---|
| 001 | 加權指數 (TAIEX) |
| 002 | 不含金融指數 (TAIEX ex-Financials) |
| 003 | 不含電子指數 (TAIEX ex-Electronics) |
| 034 | 未含金電股發行量加權股價指數 (TAIEX ex-Financials & Electronics) |
| 101 | 櫃檯買賣發行量加權股價指數 (OTC weighted index) |

---

## B. Sector Indices — TWSE 28-Sector Breakdown

| data_id | Name | data_id | Name |
|:---:|---|:---:|---|
| 015 | 水泥工業 | 028 | 建材營造 |
| 016 | 食品工業 | 029 | 航運業 |
| 017 | 塑膠工業 | 030 | 觀光事業 |
| 018 | 紡織纖維 | 031 | 金融保險 |
| 019 | 電機機械 | 032 | 貿易百貨 |
| 020 | 電器電纜 | 033 | 其他 |
| 021 | 化學生技醫療 | 035 | 油電燃氣業 |
| 022 | 玻璃陶瓷 | 036 | 半導體業 |
| 023 | 造紙工業 | 037 | 電腦及週邊設備業 |
| 024 | 鋼鐵工業 | 038 | 光電業 |
| 025 | 橡膠工業 | 039 | 通信網路業 |
| 026 | 汽車工業 | 040 | 電子零組件業 |
| 027 | 電子工業 | 041 | 電子通路業 |
|  |  | 042 | 資訊服務業 |
|  |  | 043 | 其他電子業 |

---

## C. Sector Indices — Aggregated Categories

| data_id | Name |
|:---:|---|
| 004 | 化學工業 |
| 005 | 生技醫療業 |
| 006 | 水泥窯製 |
| 007 | 食品類股 |
| 008 | 塑膠化工 |
| 009 | 紡織纖維 |
| 010 | 機電類 |
| 011 | 造紙類 |
| 012 | 建材營造類指數 |
| 014 | 金融保險類指數 |

---

## D. Themed / Smart Beta / ESG Indices

| data_id | Name |
|:---:|---|
| 046 | 低碳高息40指數 |
| 047 | 成長高股息指數 |
| 048 | 工業4.0指數 |
| 049 | 半導體收益指數 |
| 050 | 臺灣上市上櫃多因子優選成長30指數 |
| 051 | 臺灣上市上櫃IC設計報酬指數 |
| 052 | 台灣上市上櫃永續價值指數 |
| 053 | 臺灣上市上櫃企業社會責任中小型指數 |
| 056 | 智慧投資多因子30報酬指數 |
| 057 | 智慧投資多因子30指數 |
| 060 | 智慧中立指數 |
| 061 | 勞工權益指數 |
| 062 | 電子菁英30報酬指數 |
| 064 | 臺灣上市500大報酬指數 |
| 066 | 中小型300報酬指數 |
| 067 | 中小型300指數 |
| 068 | 特選大蘋果報酬指數 |
| 069 | 存股雙十等權重報酬指數 |
| 070 | 漲升股利150報酬指數 |
| 071 | 臺灣中小型公司治理指數 |
| 072 | 臺灣IPO指數 |
| 073 | 價值投資指數 |
| 074 | 臺灣永續指數 |
| 076 | 特選高息低波指數 |
| 077 | 臺灣生技指數 |
| 079 | 中小型A級動能50指數 |
| 082 | 低波動股利精選30指數 |
| 083 | 電子菁英30指數 |
| 084 | 工業菁英30指數 |
| 085 | 藍籌30指數 |
| 087 | 漲升股利150指數 |
| 088 | 小型股300指數 |
| 089 | 臺灣公司治理100指數 |
| 092 | 臺灣高薪100指數 |
| 093 | 寶島股價指數 |
| 094 | 臺灣就業99指數 |
| 095 | 臺灣中型100指數 |
| 096 | 臺灣資訊科技指數 |
| 097 | 臺灣發達指數 |
| 098 | 台灣高股息指數 |
| 099 | 台灣50指數 |

---

## E. Leverage / Inverse / Derivative Indices

| data_id | Name |
|:---:|---|
| 054 | 特選大蘋果報酬反向一倍指數 |
| 055 | 特選大蘋果報酬正向兩倍指數 |
| 058 | 加權指數掩護性臺指買權價外5％報酬指數 |
| 059 | 台股期貨指數 |
| 090 | 電子類反向指數 |
| 091 | 電子類兩倍槓桿指數 |

---

## Example

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_tick_snapshot(stock_id="001")  # TAIEX
        # Fetch multiple at once (stocks and indices can be mixed)
        df = api.taiwan_stock_tick_snapshot(stock_id=["001", "101", "2330"])
        # Fetch all snapshots in one call
        df = api.taiwan_stock_tick_snapshot()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        token = ""  # See login section to obtain a token
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.finmindtrade.com/api/v4/taiwan_stock_tick_snapshot"
        parameter = {
            "data_id": "001",  # TAIEX
            # "data_id": ["001", "101"],  # TAIEX + OTC weighted, fetch multiple at once
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = pd.DataFrame(resp.json()["data"])
        print(data)
        ```
