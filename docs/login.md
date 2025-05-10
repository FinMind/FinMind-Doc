# 登入

#### 登入獲取 token，api v4 改用 token 取代 user_id、password，每次發 request 只需要帶 token 即可。

```
POST: https://api.finmindtrade.com/api/v4/login

```

請求參數:

參數名稱       | 參數型別  | 必填	| 說明
--------------|:-----:|-----:|------------------------
user_id       | str |  N | 使用者 id ，申辦帳號可以使用更多用量喔，快來[申請](https://finmindtrade.com/analysis/#/account/register)吧!
password      | str |  N | 使用者密碼，申辦帳號可以使用更多用量喔，快來[申請](https://finmindtrade.com/analysis/#/account/register)吧!

```
response: token
```

!!! package-example
    === "Login by token"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        api.login_by_token(api_token='token')
        ```
    === "Login by password"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        api.login(user_id='user_id',password='password')
        ```

!!! request-example
    === "Python"
        ```python
        import requests
        url = "https://api.finmindtrade.com/api/v4/login"
        payload = {
            "user_id": "user_id",
            "password": "password",
        }
        data = requests.post(url, data=payload)
        data = data.json()
        print(data)

        {'msg': 'success', 'status': 200, 'token': '7777777777777777777777777'}
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        url = 'https://api.finmindtrade.com/api/v4/login'
        response = httr::POST(
            url = url,
            body = list(
                user_id="user_id",
                password= "password"
            )
        )
        data = content(response)
        print(data)

        $msg
        [1] "success"

        $status
        [1] 200

        $token
        [1] "777777777777777777777777"
        ```
