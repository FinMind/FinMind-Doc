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

        url = "https://api.web.finmindtrade.com/v2/user_info"
        payload = {
            "token": token,
        }
        resp = requests.get(url, params=payload)
        resp.json()["user_count"]  # 使用次數
        resp.json()["api_request_limit"]  # api 使用上限

        ```

#### API 用量超出上限時

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
        print(api.api_usage)
        ```
    === "Python"
        ```python
        import requests
        
        url = "https://api.web.finmindtrade.com/v2/user_info"
        payload = {
            "token": token,
        }
        resp = requests.get(url, params=payload)
        resp.json()["user_count"]  # 使用次數
        resp.json()["api_request_limit"]  # api 使用上限

        ```
