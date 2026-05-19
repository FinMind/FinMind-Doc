# API Usage Count

#### Use your token to check the API usage count

```
GET: https://api.web.finmindtrade.com/v2/user_info

```

Headers:

|Name          | Description  | Format   |
|:------------:|:-------------:|:--------:|
|Authorization | Token, obtained after sign-in | Bearer token |


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
        resp.json()["user_count"]  # current usage
        resp.json()["api_request_limit"]  # quota

        ```

#### When the quota is exceeded, the API returns:

!!! danger
    === "Example"
        ```python
        import requests
        import pandas as pd
        from tqdm import tqdm
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # see Login to obtain your token
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
