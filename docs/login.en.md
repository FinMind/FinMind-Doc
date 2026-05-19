# Login

#### Sign in on the [official site](https://finmindtrade.com/analysis/#/account/user). Your API token is shown on the user info page — attach it to subsequent FinMind calls.


!!! package-example
    === "Login by token"
        ```python hl_lines="4"
        from FinMind.data import DataLoader

        api = DataLoader()
        api.login_by_token(api_token='token')
        ```

!!! request-example
    === "Python"
        ```python hl_lines="2 3"
        import requests
        token = "" # see Login above to obtain your token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockPrice",
            "data_id": "2330",
            "start_date": "2020-04-01",
            "end_date": "2020-04-12",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        resp = data.json()

        ```
    === "R"
        ```R hl_lines="4 13"
        library(httr)
        library(data.table)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # see Login above to obtain your token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockPrice",
                data_id= "2330",
                start_date= "2020-01-02",
                end_date= "2020-04-12",
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)

        ```
