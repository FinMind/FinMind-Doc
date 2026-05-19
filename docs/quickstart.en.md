# Quick start with FinMind Finance data API

This guide walks you through how to use the FinMind data API.

* :warning: Rate limit

    Request limit: 600/hour with token, 300/hour without token.<br>
    After registering at [FinMind](https://finmindtrade.com/analysis/#/account/register) and verifying your email, attaching the `token` parameter raises your limit to 600/hour.<br>
    Get the token by signing in on the [official site](https://finmindtrade.com/analysis/#/account/login).

## FinMind data API has four main endpoints

- Login API

    Get a token; pass it on subsequent calls to raise your rate limit.

    ```
    https://api.finmindtrade.com/api/v4/login
    ```

- Data API

    Fetch a dataset. For example, query Taiwan stock prices via `TaiwanStockPrice`.

    ```
    https://api.finmindtrade.com/api/v4/data
    ```

- Datalist API

    Each dataset takes parameters such as `data_id`. Use this endpoint to discover the available values — for example, list every currency available for `TaiwanExchangeRate`.

    ```
    https://api.finmindtrade.com/api/v4/datalist
    ```

- Translation API

    Some columns are only labeled in English with cryptic names. This endpoint returns the Chinese name. For example, `AccountsPayable` in the balance sheet maps to **應付帳款 (accounts payable)**.

    ```
    https://api.finmindtrade.com/api/v4/translation
    ```

## API description

#### login

```
POST: https://api.finmindtrade.com/api/v4/login

```

Request parameters:

Name          | Type  | Required | Description
--------------|:-----:|---------:|------------------------
user_id       | str   |  N | User ID — [register](https://finmindtrade.com/analysis/#/account/register) for higher quota.
password      | str   |  N | User password — [register](https://finmindtrade.com/analysis/#/account/register) for higher quota.

```
response: token
```


#### Data API

```
GET: https://api.finmindtrade.com/api/v4/data

```

Request parameters:

Name          | Type  | Required | Description
--------------|:-----:|---------:|------------------------
dataset       | str   |  Y | Dataset name
data_id       | str   |  N | Data identifier (e.g., stock id)
start_date    | str   |  N | Start date. With `end_date`, returns the range; alone, returns from `start_date` to latest. At least one of `start_date` / `end_date` is required.
end_date      | str   |  N | End date. With `start_date`, returns the range; alone, returns up to `end_date`. At least one of `start_date` / `end_date` is required.
token         | str   |  N | User token — see [Login](https://finmind.github.io/en/login/) to obtain one.

#### Datalist API

```
GET: https://api.finmindtrade.com/api/v4/datalist?
```

Request parameters:

Name          | Type  | Required | Description
--------------|:-----:|---------:|------------------------
dataset       | str   |  Y | Dataset name
user_id       | str   |  N | User ID — [register](https://finmindtrade.com/analysis/#/account/register) for higher quota.
password      | str   |  N | User password — [register](https://finmindtrade.com/analysis/#/account/register) for higher quota.

#### Translation API

```
GET: https://api.finmindtrade.com/api/v4/translation?
```

Request parameters:

Name          | Type  | Required | Description
--------------|:-----:|---------:|------------------------
dataset       | str   |  Y | Dataset name
user_id       | str   |  N | User ID — [register](https://finmindtrade.com/analysis/#/account/register) for higher quota.
password      | str   |  N | User password — [register](https://finmindtrade.com/analysis/#/account/register) for higher quota.


