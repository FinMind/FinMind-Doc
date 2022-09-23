# API 使用次數

#### 使用 token，拿取 API 使用次數

```
POST: https://api.web.finmindtrade.com/v2/user_info

```

請求參數:

參數名稱       | 參數型別  | 必填	| 說明
--------------|:-----:|-----:|------------------------
token         | str |  N | token


!!! request-example
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
