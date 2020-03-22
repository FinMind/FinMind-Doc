## Place Order

[Future and Option place order jupyter link](https://nbviewer.jupyter.org/github/Sinotrade/Sinotrade.github.io/blob/master/tutorial/future_and_option.ipynb)

### [First, you need login.](https://sinotrade.github.io/tutor/contract/#login)

### Get Contract Object.

!!! info "In"

    ```python
    contract = api.Contracts.Futures.TXF.TXF202004
    ```

### Making Order Object.

#### Buy

!!! info "In"

    ```python
    order = api.Order(action="Buy",
                    price=10200,
                    quantity=2,
                    order_type="ROD",
                    price_type="LMT",
                    octype="Auto",
                    account=api.futopt_account)
    ```

#### Order Object

!!! example "Attributes:"

    ```python
    price (float or int): the price of order
    quantity (int): the quantity of order
    action (str): order action to buy or sell
        {Buy, Sell}
    price_type (str): pricing type of order
        {LMT, MKT, MKP}
    order_type (str): the type of order
        {ROD, IOC, FOK}
    octype (str): the type or order to open new position or close position future only
        {Auto, NewPosition, Cover, DayTrade} (自動、新倉、平倉、當沖)
    account (:obj:Account): which account to place this order
    ca (binary): the ca of this order
    ```

### Place order

!!! info "In"
    ```python
    trade = api.place_order(contract, order)
    ```

!!! example "Status of Trade"
    * `PendingSubmit`: 傳送中
    * `PreSubmitted`: 預約單
    * `Submitted`: 傳送成功
    * `Failed`: 失敗
    * `Cancelled`: 已刪除
    * `Filled`: 完全成交
    * `Filling`: 部分成交

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

    contract = api.Contracts.Futures.TXF.TXF202004
    order = api.Order(action="Buy",
                    price=10200,
                    quantity=2,
                    order_type="ROD",
                    price_type="LMT",
                    octype="Auto",
                    account=api.futopt_account)
    trade = api.place_order(contract, order)
    trade
    ```


!!! done "Out"

    ```python hl_lines="28"
    Trade(
        contract=Future(
            code='TXFD0', 
            symbol='TXF202004',
            name='臺股期貨', 
            category='TXF', 
            delivery_month='202004', 
            underlying_kind='I'
        ), 
        order=Order(
            action=<Action.Buy: 'Buy'>, 
            price=10200.0, 
            quantity=2, 
            id='f691f576', 
            seqno='862631', 
            account=Account(
                account_type=<AccountType.Stock: 'F'>, 
                person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>, 
            order_type=<FuturesOrderType.ROD: 'ROD'>
        ), 
        status=OrderStatus(
            id='f691f576', 
            status=<Status.PendingSubmit: 'PendingSubmit'>, 
            status_code='    ', 
            order_datetime=datetime.datetime(2020, 3, 5, 10, 24, 13), 
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
    api.update_status(api.futopt_account)
    api.cancel_order(trade)
    api.update_status(api.futopt_account)
    trade
    ```

!!! done "Out"

    ```python hl_lines="29 33"
    Trade(
        contract=Future(
            code='TXFD0', 
            symbol='TXF202004', 
            name='臺股期貨', 
            category='TXF', 
            delivery_month='202004', 
            underlying_kind='I'
        ), 
        order=Order(
            action=<Action.Buy: 'Buy'>, 
            price=10200.0, 
            quantity=2, 
            id='f691f576', 
            seqno='862631', 
            ordno='ta0FG', 
            account=Account(
                account_type=<AccountType.Stock: 'F'>, 
                person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>, 
            order_type=<FuturesOrderType.ROD: 'ROD'>
        ), 
        status=OrderStatus(
            id='f691f576', 
            status=<Status.Submitted: 'Submitted'>, 
            status_code='0000', 
            order_datetime=datetime.datetime(2020, 3, 5, 10, 24, 15), 
            modified_price=10200.0, 
            cancel_quantity=2, 
            deals=[]
        )
    )
    ```

### Update Order

!!! info "In"

    ```python
    api.update_status(api.futopt_account)
    api.update_order(trade=trade, price=10200, qty=1)
    api.update_status(api.futopt_account)
    trade
    ```

!!! done "Out"

    ```python hl_lines="29 33"
    Trade(
        contract=Future(
            code='TXFD0',
            symbol='TXF202004', 
            name='臺股期貨', 
            category='TXF', 
            delivery_month='202004', 
            underlying_kind='I'
        ), 
        order=Order(
            action=<Action.Buy: 'Buy'>, 
            price=10200.0, 
            quantity=2, 
            id='f691f576', 
            seqno='862631', 
            ordno='ta0FG', 
            account=Account(
                account_type=<AccountType.Stock: 'F'>, 
                person_id='RBCCJCBIGB', 
                broker_id='9A95', 
                account_id='9809975', 
                signed=True
            ), 
            price_type=<StockPriceType.LMT: 'LMT'>, 
            order_type=<FuturesOrderType.ROD: 'ROD'>
        ), 
        status=OrderStatus(
            id='f691f576', 
            status=<Status.Submitted: 'Submitted'>, 
            status_code='0000', 
            order_datetime=datetime.datetime(2020, 3, 5, 10, 24, 15), 
            modified_price=10200.0, 
            cancel_quantity=1,
            deals=[]
        )
    )
    ```
