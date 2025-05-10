# API 使用次數

#### 使用 token，拿取 API 使用次數

```
GET: https://api.web.finmindtrade.com/v2/user_info

```

請求參數:

參數名稱       | 參數型別  | 必填	| 說明
--------------|:-----:|-----:|------------------------
token         | str |  N | token


!!! example
    === "Package"
        ```python
        from FinMind.data import FinMindApi

        api = FinMindApi()
        api.login_by_token(token)
        print(api.api_usage_limit)
        ```
    === "Python"
        ```python
        import requests
        headers = {"Authorization": f"Bearer {token}"}
        url = "https://api.web.finmindtrade.com/v2/user_info"
        payload = {
            "token": token,
        }
        resp = requests.get(url, headers=headers)
        resp.json()["user_count"]  # 使用次數
        resp.json()["api_request_limit"]  # api 使用上限

        ```

#### API 用量超出上限時，對 API 發送 Request 會回傳

!!! danger
    === "Example"
        ```python
        import requests
        import pandas as pd
        from tqdm import tqdm
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # 參考登入，獲取金鑰
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPrice",
            "data_id": "2330",
            "start_date": "2020-04-02",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        print(resp.status_code)
        print(resp.json())
        ```

!!! output
    === "resp.status_code"
        ```python
        402
        ```
    === "resp.json()"
        ```python
        {'msg': 'Requests reach the upper limit. https://finmindtrade.com/', 'status': 402}
        ```
