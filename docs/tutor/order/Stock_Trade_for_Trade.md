## Place Order

[Stock TFT place order jupyter link](https://nbviewer.jupyter.org/github/Sinotrade/Sinotrade.github.io/blob/master/tutorial/stock_tft.ipynb)

### [First, you need login.](https://sinotrade.github.io/tutor/contract/#login)


### Set tft

!!! info "In"

    ```python
    api.tft = True
    ```

### Get Contract Object.

!!! info "In"

    ```python
    contract = api.Contracts.Stocks.TSE.TSE2890
    ```

### Making Order Object.

#### Buy

!!! info "In"

    ```python
    order = api.Order(price=12, 
                      quantity=1, 
                      action="Buy", 
                      price_type="LMT", 
                      order_type="ROD", 
                      order_lot="Common", 
                      account=api.stock_account
                      )
    ```

#### Sell

!!! info "In"

    ```python
    order = api.Order(price=12, 
                      quantity=1, 
                      action="Sell", 
                      price_type="LMT", 
                      order_type="ROD", 
                      order_lot="Common", 
                      account=api.stock_account
                      )
    ```

#### First Sell

!!! info "In"

    ```python
    order = api.Order(price=12, 
                      quantity=1, 
                      action="Sell",
                      price_type="LMT",
                      order_type="ROD",
                      order_lot="Common",
                      first_sell="true",
                      account=api.stock_account
                      )
    ```

#### Order Object

!!! example "Attributes"
    ```python
    price (float or int): the price of order
    quantity (int): the quantity of order
    action (str): order action to buy or sell
        {Buy, Sell}
    price_type (str): pricing type of order
        {LMT, MKT, MKP}
    order_type (str): the type of order
        {ROD, IOC, FOK}
    order_cond (str): order condition stock only
        {Cash, Netting, MarginTrading, ShortSelling} (現股、餘額交割、融資、融券)
    order_lot (str): the type of order
        {Common, Fixing, Odd} (整股、定盤、零股)
    first_sell {str}: the type of first sell
        {true, false}
    account (:obj:Account): which account to place this order
    ca (binary): the ca of this order
    ```

### Place Order

!!! info "In"

    ```python
    trade = api.place_order(contract, order)
    ```

## For Example

### Place Order ROD LMT

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
    api.tft = True

    contract = api.Contracts.Stocks.TSE.TSE2890
    order = api.Order(price=12,
                      quantity=10,
                      action="Buy",
                      price_type="LMT",
                      order_type="ROD",
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
            quantity=10, 
            id='004d9bed', 
            seqno='427793', 
            ordno='WA345', 
            account=Account(
                account_type=<AccountType.Stock: 'S'>, person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>, 
            order_type=<FuturesOrderType.ROD: 'ROD'>
        ), 
        status=OrderStatus(
            id='004d9bed', 
            status=<Status.PendingSubmit: 'PendingSubmit'>, 
            status_code='0', 
            order_datetime=datetime.datetime(2020, 3, 3, 15, 16, 40), 
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
                      quantity=1,
                      action="Sell",
                      price_type="LMT",
                      order_type="ROD",
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
            category='17', 
            day_trade='Yes'
        ), 
        order=Order(
            action=<Action.Sell: 'Sell'>, 
            price=14, 
            quantity=1, 
            id='2bc5ae85', 
            seqno='620137', 
            ordno='00000', 
            account=Account(
                account_type=<AccountType.Stock: 'S'>, person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>, 
            order_type=<FuturesOrderType.ROD: 'ROD'>, 
            first_sell=<StockFirstSell.Yes: 'true'>
        ), 
        status=OrderStatus(
            id='2bc5ae85', 
            status=<Status.PendingSubmit: 'PendingSubmit'>, 
            status_code='0', 
            order_datetime=datetime.datetime(2020, 3, 9, 8, 59, 42), 
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

    ```python hl_lines="27 30"
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
            quantity=10, 
            id='f3d8afdb', 
            seqno='427797', 
            ordno='WA347', 
            account=Account(
                account_type=<AccountType.Stock: 'S'>, person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>, 
            order_type=<FuturesOrderType.ROD: 'ROD'>
        ), 
        status=OrderStatus(
            id='f3d8afdb', 
            status=<Status.Cancelled: 'Cancelled'>, 
            status_code='00', 
            order_datetime=datetime.datetime(2020, 3, 3, 15, 17, 49), 
            cancel_quantity=10, 
            deals=[]
        )
    )
    ```

### Update Order

!!! info "In"

    ```python
    api.update_status(api.stock_account)
    api.update_order(trade=trade, price=12, qty=2)
    api.update_status(api.stock_account)
    trade
    ```

!!! done "Out"

    ```python hl_lines="27 30"
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
            quantity=10, 
            id='d5bfb75c', 
            seqno='427795', 
            ordno='WA346', 
            account=Account(
                account_type=<AccountType.Stock: 'S'>, person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>, 
            order_type=<FuturesOrderType.ROD: 'ROD'>
        ), 
        status=OrderStatus(
            id='d5bfb75c', 
            status=<Status.Submitted: 'Submitted'>, 
            status_code='00', 
            order_datetime=datetime.datetime(2020, 3, 3, 15, 17, 17), 
            cancel_quantity=2, 
            deals=[]
        )
    )
    ```