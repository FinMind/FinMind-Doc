# Quick start with FinMind Finance data API

希望透過如下說明，可以快速了解 FinMind data api 使用方式

* :warning: note 流量限制

    限制 request 上限 : 600/hour。Limit amount of request, 300/hour.<br>
    至 [FinMind](https://finmindtrade.com/register.html) 註冊並驗證信箱後，API 的 Request 加上 `token` 參數可以提高使用上限到 600/hr。<br>
    token 獲取方法，可在[官網](https://finmindtrade.com/analysis/#/account/login)登入後獲取。

## FinMind data api 主要有四種類型 API

- 登入 API

    登入獲得 token，並在拿取資料時，帶 token，可增加使用限制
    
    ```
    https://api.finmindtrade.com/api/v4/login
    ```

- 獲取資料 API

    根據你想使用的資料集來獲取資料，例如想要查詢台灣股票市場個股的價格，就可以透過 TaiwanStockPrice 資料集來查詢
    
    ```
    https://api.finmindtrade.com/api/v4/data
    ```

- 查詢資料參數清單 API

    每個資料集都會有一些參數需要作選擇，如果不知道參數數值有哪些可以做選擇，
    可以使用這個 API 來幫助你了解，例如你不知道匯率資料有哪些幣別，
    只要資料集選擇 TaiwanExchangeRate 就可以透過這 API 來查詢目前跟台幣兌換的幣別

    ```
    https://api.finmindtrade.com/api/v4/datalist
    ```

- 查詢欄位名稱中英對照 API

    有些資料集欄位名稱可能只有英文而且名稱相對複雜難懂，可以透過這 API 來查詢其中文名稱，
    例如資產負債表中 **AccountsPayable**，透過這 API 得知中文叫 **應付帳款** ，藉此來幫助你了解資料 

    ```
    https://api.finmindtrade.com/api/v4/translation
    ```

## API 描述

#### login

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


#### 獲取資料 API

```
GET: https://api.finmindtrade.com/api/v4/data

```

請求參數:

參數名稱       | 參數型別  | 必填	| 說明
--------------|:-----:|-----:|------------------------
dataset       | str |  Y | 資料集名稱
data_id       | str |  N | 資料代碼
start_date    | str |  N | 起始時間，如果跟 end_date 一起使用，會輸出 start_date 到 end_date 時間的資料，反之會輸出到最新的資料，start_date 和 end_date 至少則一使用
end_date      | str |  N | 結束時間，如果跟 start_date  一起使用，會輸出 start_date 到 end_date 時間的資料，反之會輸出到 end_date 的資料，start_date 和 end_date 至少則一使用
token         | str |  N | 使用者 token，請先[登入](https://finmind.github.io/login/)拿到 token

#### 查詢資料參數清單 API

```
GET: https://api.finmindtrade.com/api/v4/datalist?
```

請求參數:

參數名稱       | 參數型別  | 必填	| 說明
--------------|:-----:|-----:|------------------------
dataset       | str |  Y | 資料集名稱
user_id       | str |  N | 使用者 id ，申辦帳號可以使用更多用量喔，快來[申請](https://finmindtrade.com/analysis/#/account/register)吧!
password      | str |  N | 使用者密碼，申辦帳號可以使用更多用量喔，快來[申請](https://finmindtrade.com/analysis/#/account/register)吧!

#### 查詢欄位名稱中英對照 API

```
GET: https://api.finmindtrade.com/api/v4/translation?
```

請求參數:

參數名稱       | 參數型別  | 必填	| 說明
--------------|:-----:|-----:|------------------------
dataset       | str |  Y | 資料集名稱
user_id       | str |  N | 使用者 id ，申辦帳號可以使用更多用量喔，快來[申請](https://finmindtrade.com/analysis/#/account/register)吧!
password      | str |  N | 使用者密碼，申辦帳號可以使用更多用量喔，快來[申請](https://finmindtrade.com/analysis/#/account/register)吧!


