## Place Order

[Stock place order jupyter link](https://nbviewer.jupyter.org/github/Sinotrade/Sinotrade.github.io/blob/master/tutorial/stock.ipynb)

### [First, you need login.](https://sinotrade.github.io/tutor/contract/#login)

### Get Contract Object.

!!! info "In"
    ```python
    contract = api.Contracts.Stocks.TSE.TSE2890
    ```

### Making Order Object.

#### Buy

!!! info "In"

    ```python
    order = api.Order(
                price=12,
                quantity=3,
                action="Buy",
                price_type="LMT",
                order_type="Common",
                account=api.stock_account,
            )
    ```

#### Sell

!!! info "In"

    ```python
    order = api.Order(
                price=12,
                quantity=3,
                action="Sell",
                price_type="LMT",
                order_type="Common",
                account=api.stock_account,
            )
    ```

#### First Sell

!!! info "In"

    ```python
    order = api.Order(
                price=14,
                quantity=3,
                action="Sell",
                price_type="LMT",
                order_type="Common",
                first_sell="true",
                account=api.stock_account,
            )
    ```

#### Order Object

!!! example "Attributes:"

    ```python
    price (float or int): the price of order
    quantity (int): the quantity of order
    action (str): order action to buy or sell
        {Buy, Sell}
    price_type (str): pricing type of order
        Stock {LMT, Close, LimitUp, LimitDown}
        Futures {LMT, MKT, MKP}
    order_type (str): the type of order
        Stock {Common, BlockTrade, Fixing, Odd} (整股、鉅額、定盤、零股)
        Futures {ROD, IOC, FOK}
    order_cond (str): order condition stock only
        {Cash, Netting, MarginTrading, ShortSelling}
    first_sell {str}: the type of first sell
        {true, false}
    account (obj:Account): which account to place this order
    ca (binary): the ca of this order
    ```

### Place Order

!!! info "In"

    ```python
    trade = api.place_order(contract, order)
    ```

## For Example

### Place Order LMT Common

!!! info "In"

    ```python
    import shioaji as sj

    api = sj.Shioaji()
    accounts = api.login("YOUR_PERSON_ID", "YOUR_PASSWORD", contracts_timeout=10000)
    api.activate_ca(
        ca_path="/c/your/ca/path/Sinopac.pfx",
        ca_passwd="YOUR_CA_PASSWORD",
        person_id="Person of this Ca",
    )

    contract = api.Contracts.Stocks.TSE.TSE2890
    order = api.Order(price=12,
                      quantity=3,
                      action="Buy",
                      price_type="LMT",
                      order_type="Common",
                      account=api.stock_account
                      )
    trade = api.place_order(contract, order)
    trade
    ```

!!! done "Out"

    ```python hl_lines="10 27"
    Trade(
        contract=Stock(
            exchange=<Exchange.TSE: 'TSE'>, 
            code='2890', 
            symbol='TSE2890', 
            name='永豐金', 
            category='17'
        ), 
        order=Order(
            action=<Action.Buy: 'Buy'>, 
            price=12.0, 
            quantity=3, 
            id='a3eab5f6', 
            seqno='610615', 
            ordno='I2502', 
            account=Account(
                account_type=<AccountType.Stock: 'S'>, person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>,
            order_type=<StockOrderType.Common: 'Common'>
        ), 
        status=OrderStatus(
            id='6d03647c', 
            status=<Status.PendingSubmit: 'PendingSubmit'>, 
            status_code='0', 
            order_datetime=datetime.datetime(2020, 3, 4, 9, 24, 56),
            deals=[]
        )
    )
    ```

### Place Order about First Sell

!!! info "In"

    ```python
    import shioaji as sj

    api = sj.Shioaji()
    accounts = api.login("YOUR_PERSON_ID", "YOUR_PASSWORD", contracts_timeout=10000)
    api.activate_ca(
        ca_path="/c/your/ca/path/Sinopac.pfx",
        ca_passwd="YOUR_CA_PASSWORD",
        person_id="Person of this Ca",
    )

    contract = api.Contracts.Stocks.TSE.TSE2890
    order = api.Order(price=14,
                      quantity=3,
                      action="Sell",
                      price_type="LMT",
                      order_type="Common",
                      first_sell="true",
                      account=api.stock_account
                      )
    trade = api.place_order(contract, order)
    trade
    ```

!!! done "Out"

    ```python hl_lines="8 11 25 29"
    Trade(
        contract=Stock(
            exchange=<Exchange.TSE: 'TSE'>, 
            code='2890', 
            symbol='TSE2890', 
            name='永豐金', 
            category='17'
            day_trade='Yes'
        ), 
        order=Order(
            action=<Action.Sell: 'Sell'>, 
            price=14, 
            quantity=3, 
            id='2f07907d', 
            seqno='029480', 
            ordno='I0377', 
            account=Account(
                account_type=<AccountType.Stock: 'S'>, person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>, 
            order_type=<StockOrderType.Common: 'Common'>, 
            first_sell=<StockFirstSell.Yes: 'true'>
        ), 
        status=OrderStatus(
            id='2f07907d', 
            status=<Status.PendingSubmit: 'PendingSubmit'>, 
            status_code='0', 
            order_datetime=datetime.datetime(2020, 3, 9, 8, 46, 55), 
        deals=[]
        )
    )
    ```

!!! example "Status of Trade"
    * `PendingSubmit`: 傳送中
    * `PreSubmitted`: 預約單
    * `Submitted`: 傳送成功
    * `Failed`: 失敗
    * `Cancelled`: 已刪除
    * `Filled`: 完全成交
    * `Filling`: 部分成交


### Cancel Order

!!! info "In"

    ```python
    api.update_status(api.stock_account)
    api.cancel_order(trade)
    api.update_status(api.stock_account)
    trade
    ```

!!! done "Out"

    ```python hl_lines="28 32"
    Trade(
        contract=Stock(
            exchange=<Exchange.TSE: 'TSE'>, 
            code='2890', 
            symbol='TSE2890', 
            name='永豐金', 
            category='17'
        ), 
        order=Order(
            action=<Action.Buy: 'Buy'>, 
            price=12.0, 
            quantity=3, 
            id='a3eab5f6', 
            seqno='610615', 
            ordno='I2502', 
            account=Account(
                account_type=<AccountType.Stock: 'S'>, 
                person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>,
            order_type=<StockOrderType.Common: 'Common'>
        ), 
        status=OrderStatus(
            id='6d03647c', 
            status=<Status.Cancelled: 'Cancelled'>, 
            status_code='00', 
            order_datetime=datetime.datetime(2020, 3, 4, 9, 24, 56),
            modified_price=12.0, 
            cancel_quantity=3, 
            deals=[]
        )
    )
    ```

### Update Order

!!! info "In"
    ```python
    api.update_status(api.stock_account)
    api.update_order(trade=trade, price=12.1, qty=1)
    api.update_status(api.stock_account)
    trade
    ```

!!! done "Out"

    ```python hl_lines="28 30 31"
    Trade(
        contract=Stock(
            exchange=<Exchange.TSE: 'TSE'>, 
            code='2890', 
            symbol='TSE2890', 
            name='永豐金', 
            category='17'
        ), 
        order=Order(
            action=<Action.Buy: 'Buy'>, 
            price=12.0, 
            quantity=3, 
            id='a3eab5f6', 
            seqno='610615', 
            ordno='I2502', 
            account=Account(
                account_type=<AccountType.Stock: 'S'>,
                person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>,
            order_type=<StockOrderType.Common: 'Common'>
        ), 
        status=OrderStatus(
            id='a3eab5f6', 
            status=<Status.Submitted: 'Submitted'>, status_code='00', 
            order_datetime=datetime.datetime(2020, 3, 4, 9, 47, 46),
            modified_price=12.1, 
            cancel_quantity=1, 
            deals=[]
        )
    )
    ```
