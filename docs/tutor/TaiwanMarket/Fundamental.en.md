
In Taiwan stock fundamental data, we have 13 datasets, as follows:

- [Income Statement TaiwanStockFinancialStatements](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#income-statement-taiwanstockfinancialstatements)
- [Balance Sheet TaiwanStockBalanceSheet](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#balance-sheet-taiwanstockbalancesheet)
- [Cash Flows Statement TaiwanStockCashFlowsStatement](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#cash-flows-statement-taiwanstockcashflowsstatement)
- [Dividend Policy Table TaiwanStockDividend](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#dividend-policy-table-taiwanstockdividend)
- [Ex-Dividend/Ex-Right Result Table TaiwanStockDividendResult](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#ex-dividendex-right-result-table-taiwanstockdividendresult)
- [Monthly Revenue Table TaiwanStockMonthRevenue](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#monthly-revenue-table-taiwanstockmonthrevenue)
- [Capital Reduction Resumption Reference Price TaiwanStockCapitalReductionReferencePrice](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#capital-reduction-resumption-reference-price-taiwanstockcapitalreductionreferenceprice)
- [Taiwan Stock Market Value Table TaiwanStockMarketValue](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwan-stock-market-value-table-taiwanstockmarketvalue-available-only-to-backer-sponsor-members)
- [Taiwan Stock Delisting Table TaiwanStockDelisting](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwan-stock-delisting-table-taiwanstockdelisting)
- [Taiwan Stock Market Value Weight Table TaiwanStockMarketValueWeight](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwan-stock-market-value-weight-table-taiwanstockmarketvalueweight-available-only-to-backer-sponsor-members)
- [Taiwan Stock Post-Split Reference Price TaiwanStockSplitPrice](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwan-stock-post-split-reference-price-taiwanstocksplitprice)
- [Taiwan Stock Par Value Change Resumption Reference Price TaiwanStockParValueChange](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwan-stock-par-value-change-resumption-reference-price-taiwanstockparvaluechange)
- [Taiwan Stock Financial Report and Annual Report PDF TaiwanStockFinancialReportFile](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#taiwan-stock-financial-report-and-annual-report-pdf-taiwanstockfinancialreportfile-available-only-to-sponsorpro-members)

----------------------------------
#### Income Statement TaiwanStockFinancialStatements

- Data range: 1990-03-01 ~ now
- Coverage: listed (TWSE), OTC (TPEx) and emerging market companies, distinguished by `stock_id` (use `TaiwanStockInfo` to look up market type)

??? note "Amount unit, currency and how single-quarter values are derived"
    - **Currency**: all companies are reported in **New Taiwan Dollars (TWD)**, including foreign (KY) companies. No other currency is used.
    - **Unit**: `value` is in **TWD (dollars)**. The financial statements report amounts in thousand TWD; this table multiplies them by 1000. `EPS` is in TWD per share and is not converted.
    - **Single-quarter values**: `date` is the quarter-end date, and every amount item is a **single-quarter** figure. Financial statements report year-to-date cumulative amounts; this table subtracts consecutive quarters within the same fiscal year: Q1 = Q1 YTD, Q2 = H1 YTD − Q1 YTD, Q3 = 9-month YTD − H1 YTD, Q4 = full year − 9-month YTD, so the four quarters sum to the full-year figure. For example, 2330's 2024 quarterly `Revenue` is 592.6 / 673.5 / 759.7 / 868.5 billion TWD, matching the sum of the three months of `TaiwanStockMonthRevenue` in each quarter.
    - **Companies that only file semi-annual and annual reports** (some emerging-market and public companies): such a year has only two rows, 06-30 and 12-31. The 06-30 row is the first-half total and the 12-31 row is the second-half total (full year − first half). Check whether the year has 03-31 / 09-30 rows to tell.
    - **Financial companies**: banks, financial holding companies, securities firms and insurers use different income statement items. For example, a financial holding company's `Revenue` maps to "net revenue" (淨收益). Use the `origin_name` column to see the original item name of each row.

??? note "EPS is a single-quarter figure and is retroactively restated after a stock dividend / split — summing quarters will not match the cumulative EPS"
    The `EPS` (basic earnings per share) in this table is a **single-quarter** figure, and each quarter stores the value **as originally reported in that quarter's financial statements**.

    Under IAS 33, share-count changes with no consideration received — stock dividends (bonus issues) and stock splits — require the weighted average number of shares to be **retroactively restated for every period presented**. So once a bonus issue happens, that quarter's report restates the EPS of all earlier quarters downward, but this table does not rewrite the values already published. The result: **within the same fiscal year, the share base behind each quarter's EPS is inconsistent, so summing them will not match the cumulative EPS in the financial statements**.

    Example — 3081 (Landmark Optoelectronics), FY2026. The company went ex-rights on 2026-07-15 with a stock dividend of NT$1 (100 shares per 1,000 shares held, i.e. a 10% bonus issue). This table reports `EPS` of **3.44** for 2026 Q1 (as originally reported, pre-bonus share count) and **4.62** for 2026 Q2 (already on the restated share count), which sum to 8.06 — but the reported first-half cumulative EPS is **7.75**. The gap arises because Q1's 3.44 was restated in the Q2 report to `3.44 ÷ 1.1 = 3.13`, and `3.13 + 4.62 = 7.75`.

    **Recommended approach**: to aggregate across quarters, do not sum `EPS`. Sum `IncomeAfterTaxes` (net income for the period) instead and divide by a single weighted average share count. For the example above: `(317,515,000 + 468,487,000) TWD ÷ approx. 101,420,000 shares = 7.75`.

    To detect whether a bonus issue occurred within your query range, check the `StockEarningsDistribution` (stock dividend) field in `TaiwanStockDividend`; in the example above its value is 1.0.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_financial_statement(
            stock_id="2330",
            start_date='2019-01-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockFinancialStatements",
            "data_id": "2330",
            "start_date": "2019-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockFinancialStatements",
                data_id="2330",
                start_date= "2019-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_financial_statement(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id | type                               |       value | origin_name                  |
        |---:|:-----------|-----------:|:-----------------------------------|------------:|:-----------------------------|
        |  0 | 2019-03-31 |       2330 | CostOfGoodsSold                    | 1.28352e+11 | 營業成本                     |
        |  1 | 2019-03-31 |       2330 | EPS                                | 2.37        | 基本每股盈餘（元）           |
        |  2 | 2019-03-31 |       2330 | EquityAttributableToOwnersOfParent | 6.60098e+10 | 綜合損益總額歸屬於母公司業主 |
        |  3 | 2019-03-31 |       2330 | GrossProfit                        | 9.03576e+10 | 營業毛利（毛損）淨額         |
        |  4 | 2019-03-31 |       2330 | IncomeAfterTaxes                   | 6.13873e+10 | 本期淨利（淨損）             |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            type: str, # category
            value: float64, # value
            origin_name: str # original name
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_financial_statement(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockFinancialStatements",
            "start_date": "2019-03-31",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data)

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockFinancialStatements",
                start_date= "2019-03-31"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | type                               |       value | origin_name                  |
        |---:|:-----------|-----------:|:-----------------------------------|------------:|:-----------------------------|
        |  0 | 2019-03-31 |     000116 | EPS                                | 0.24        | 基本每股盈餘（元）           |
        |  1 | 2019-03-31 |     000116 | EquityAttributableToOwnersOfParent | 4.65569e+08 | 綜合損益總額歸屬於母公司業主 |
        |  2 | 2019-03-31 |     000116 | Expense                            | 8.95498e+08 | 支出及費用                   |
        |  3 | 2019-03-31 |     000116 | Income                             | 1.07791e+09 | 收益                         |
        |  4 | 2019-03-31 |     000116 | IncomeAfterTaxes                   | 2.74322e+08 | 本期淨利（淨損）             |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            type: str, # category
            value: float64, # value
            origin_name: str # original name
        }
        ```

----------------------------------
#### Balance Sheet TaiwanStockBalanceSheet

- Data range: 2011-12-01 ~ now
- Coverage: listed (TWSE), OTC (TPEx) and emerging market companies, distinguished by `stock_id` (use `TaiwanStockInfo` to look up market type)

??? note "Amount unit, currency and the `_per` items"
    - **Currency / unit**: all companies are reported in **New Taiwan Dollars (TWD)**, including foreign (KY) companies. `value` is in **TWD (dollars)** — the statements report thousand TWD, and this table multiplies by 1000.
    - **Point-in-time values**: the balance sheet shows balances as of each quarter-end date, so there is no single-quarter vs. cumulative distinction.
    - **`type` values ending in `_per`** (e.g. `TotalAssets_per`): the item as a percentage of total assets, in %, not an amount. `TotalAssets_per` is 100.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_balance_sheet(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockBalanceSheet",
            "data_id": "2330",
            "start_date": "2019-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockBalanceSheet",
                data_id="2330",
                start_date= "2019-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_balance_sheet(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | type                                       |       value | origin_name          |
        |---:|:-----------|-----------:|:-------------------------------------------|------------:|:---------------------|
        |  0 | 2019-03-31 |       2330 | AccountsPayable                            | 2.71009e+10 | 應付帳款             |
        |  1 | 2019-03-31 |       2330 | AccountsPayable_per                        | 1.24        | 應付帳款             |
        |  2 | 2019-03-31 |       2330 | AccountsPayableToRelatedParties            | 5.60941e+08 | 應付帳款－關係人     |
        |  3 | 2019-03-31 |       2330 | AccountsPayableToRelatedParties_per        | 0.03        | 應付帳款－關係人     |
        |  4 | 2019-03-31 |       2330 | AccountsReceivableDuefromRelatedPartiesNet | 3.09821e+08 | 應收帳款－關係人淨額 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            type: str, # category
            value: float64, # value
            origin_name: str # original name
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_balance_sheet(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockBalanceSheet",
            "start_date": "2019-03-31",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockBalanceSheet",
                start_date= "2019-03-31"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | type                                           |       value | origin_name          |
        |---:|:-----------|-----------:|:-----------------------------------------------|------------:|:---------------------|
        |  0 | 2019-03-31 |       1101 | AccountsPayable                                | 7.84411e+09 | 應付帳款             |
        |  1 | 2019-03-31 |       1101 | AccountsPayable_per                            | 2.15        | 應付帳款             |
        |  2 | 2019-03-31 |       1101 | AccountsReceivableDuefromRelatedPartiesNet     | 2.64638e+08 | 應收帳款－關係人淨額 |
        |  3 | 2019-03-31 |       1101 | AccountsReceivableDuefromRelatedPartiesNet_per | 0.07        | 應收帳款－關係人淨額 |
        |  4 | 2019-03-31 |       1101 | AccountsReceivableNet                          | 8.3396e+09  | 應收帳款淨額         |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            type: str, # category
            value: float64, # value
            origin_name: str # original name
        }
        ```

----------------------------------
#### Cash Flows Statement TaiwanStockCashFlowsStatement

- Data range: 2008-06-01 ~ now
- Coverage: listed (TWSE), OTC (TPEx) and emerging market companies, distinguished by `stock_id` (use `TaiwanStockInfo` to look up market type)

??? note "Amount unit, currency and year-to-date cumulative values"
    - **Currency / unit**: all companies are reported in **New Taiwan Dollars (TWD)**, including foreign (KY) companies. `value` is in **TWD (dollars)** — the statements report thousand TWD, and this table multiplies by 1000.
    - **Year-to-date cumulative**: unlike the income statement, this table is **not** converted to single quarters. Each quarter stores the **year-to-date cumulative amount** as reported, so the 12-31 row is the full-year figure. For example, 2330's 2024 `CashFlowsFromOperatingActivities` is 436.3 / 814.0 / 1,206.0 / 1,826.2 billion TWD. To get single-quarter values, subtract the previous quarter within the same fiscal year (Q1 needs no subtraction).

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_cash_flows_statement(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockCashFlowsStatement",
            "data_id": "2330",
            "start_date": "2019-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockCashFlowsStatement",
                data_id="2330",
                start_date= "2019-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_cash_flows_statement(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id | type                              |        value | origin_name                      |
        |---:|:-----------|-----------:|:----------------------------------|-------------:|:---------------------------------|
        |  0 | 2019-03-31 |       2330 | HedgingFinancialLiabilities       | -2.27383e+08 | 除列避險之金融負債               |
        |  1 | 2019-03-31 |       2330 | CashFlowsFromOperatingActivities  |  1.5267e+11  | 營業活動之淨現金流入（流出）     |
        |  2 | 2019-03-31 |       2330 | CashProvidedByInvestingActivities | -6.41885e+10 | 投資活動之淨現金流入(流出)       |
        |  3 | 2019-03-31 |       2330 | CashBalancesIncrease              |  6.78559e+10 | 本期現金及約當現金增加（減少）數 |
        |  4 | 2019-03-31 |       2330 | NetIncomeBeforeTax                |  6.81817e+10 | 本期稅前淨利（淨損）             |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            type: str, # category
            value: float64, # value
            origin_name: str # original name
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_cash_flows_statement(
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockCashFlowsStatement",
            "start_date": "2019-03-31",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockCashFlowsStatement",
                start_date= "2019-03-31"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | type                              |        value | origin_name                |
        |---:|:-----------|-----------:|:----------------------------------|-------------:|:---------------------------|
        |  0 | 2019-03-31 |       1101 | DecreaseInShortTermLoans          |  7.59053e+09 | 短期借款減少               |
        |  1 | 2019-03-31 |       1101 | ReceivableIncrease                | -1.15069e+08 | 應收帳款(增加)減少         |
        |  2 | 2019-03-31 |       1101 | PropertyAndPlantAndEquipment      | -1.48367e+09 | 取得不動產、廠房及設備     |
        |  3 | 2019-03-31 |       1101 | NetIncomeBeforeTax                |  5.6035e+09  | 本期稅前淨利（淨損）       |
        |  4 | 2019-03-31 |       1101 | CashProvidedByInvestingActivities | -4.31058e+09 | 投資活動之淨現金流入(流出) |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            type: str, # category
            value: float64, # value
            origin_name: str # original name
        }
        ```

----------------------------------
#### Dividend Policy Table TaiwanStockDividend

- Data range: 2005-05-01 ~ now

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_dividend(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDividend",
            "data_id": "2330",
            "start_date": "2019-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockStockDividend",
                data_id="2330",
                start_date= "2019-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_dividend(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id | year       |   StockEarningsDistribution |   StockStatutorySurplus | StockExDividendTradingDate   |   TotalEmployeeStockDividend |   TotalEmployeeStockDividendAmount |   RatioOfEmployeeStockDividendOfTotal |   RatioOfEmployeeStockDividend |   CashEarningsDistribution |   CashStatutorySurplus | CashExDividendTradingDate   | CashDividendPaymentDate   |   TotalEmployeeCashDividend |   TotalNumberOfCashCapitalIncrease |   CashIncreaseSubscriptionRate |   CashIncreaseSubscriptionpRrice |   RemunerationOfDirectorsAndSupervisors |   ParticipateDistributionOfTotalShares | AnnouncementDate   | AnnouncementTime   |
        |---:|:-----------|-----------:|:-----------|----------------------------:|------------------------:|:-----------------------------|-----------------------------:|-----------------------------------:|--------------------------------------:|-------------------------------:|---------------------------:|-----------------------:|:----------------------------|:--------------------------|----------------------------:|-----------------------------------:|-------------------------------:|---------------------------------:|----------------------------------------:|---------------------------------------:|:-------------------|:-------------------|
        |  0 | 2019-06-30 |       2330 | 107年      |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        8   |                      0 | 2019-06-24                  | 2019-07-18                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-06-06         | 15:47:30           |
        |  1 | 2019-09-25 |       2330 | 108年第1季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2   |                      0 | 2019-09-19                  | 2019-10-17                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-07-09         | 18:33:02           |
        |  2 | 2019-12-25 |       2330 | 108年第2季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2019-12-19                  | 2020-01-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-08-14         | 15:27:02           |
        |  3 | 2020-03-25 |       2330 | 108年第3季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2020-03-19                  | 2020-04-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2019-11-14         | 17:01:07           |
        |  4 | 2020-06-24 |       2330 | 108年第4季 |                           0 |                       0 |                              |                            0 |                                  0 |                                     0 |                              0 |                        2.5 |                      0 | 2020-06-18                  | 2020-07-16                |                           0 |                                  0 |                              0 |                                0 |                                       0 |                            2.59304e+10 | 2020-02-14         | 15:10:50           |
    === "Schema"
        ```
        {
            date: str, # rights distribution record date
            stock_id: str, # stock code
            year: str, # dividend fiscal year
            StockEarningsDistribution: float64, # stock dividend: capitalization of earnings
            StockStatutorySurplus: float64, # stock dividend: capitalization of statutory and capital surplus
            StockExDividendTradingDate: str, # ex-rights trading date
            TotalEmployeeStockDividend: float64, # employee stock dividend
            TotalEmployeeStockDividendAmount: float64, # employee stock dividend amount
            RatioOfEmployeeStockDividendOfTotal: float64, # ratio of employee stock dividend to total earnings dividend
            RatioOfEmployeeStockDividend: float64, # employee stock dividend ratio
            CashEarningsDistribution: float64, # cash dividend: capitalization of earnings
            CashStatutorySurplus: float64, # cash dividend: capitalization of statutory and capital surplus
            CashExDividendTradingDate: str, # ex-dividend trading date
            CashDividendPaymentDate: str, # cash dividend payment date
            TotalEmployeeCashDividend: float64, # total employee cash bonus
            TotalNumberOfCashCapitalIncrease: float64, # total shares of cash capital increase
            CashIncreaseSubscriptionRate: float64, # cash capital increase subscription ratio
            CashIncreaseSubscriptionpRrice: float64, # cash capital increase subscription price
            RemunerationOfDirectorsAndSupervisors: float64, # directors and supervisors remuneration
            ParticipateDistributionOfTotalShares: float64, # total shares participating in distribution
            AnnouncementDate: str, # announcement date
            AnnouncementTime: str # announcement time
        }
        ```



#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_dividend(
            start_date='2025-10-06',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDividend",
            "start_date": "2025-10-06",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockStockDividend",
                start_date= "2025-10-06"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | year   |   StockEarningsDistribution |   StockStatutorySurplus | StockExDividendTradingDate   |   TotalEmployeeStockDividend |   TotalEmployeeStockDividendAmount |   RatioOfEmployeeStockDividendOfTotal |   RatioOfEmployeeStockDividend |   CashEarningsDistribution |   CashStatutorySurplus | CashExDividendTradingDate   | CashDividendPaymentDate   |   TotalEmployeeCashDividend |   TotalNumberOfCashCapitalIncrease |   CashIncreaseSubscriptionRate |   CashIncreaseSubscriptionpRrice |   RemunerationOfDirectorsAndSupervisors |   ParticipateDistributionOfTotalShares | AnnouncementDate   | AnnouncementTime   |
        |---:|:-----------|-----------:|:-------|----------------------------:|------------------------:|:-----------------------------|-----------------------------:|-----------------------------------:|--------------------------------------:|-------------------------------:|---------------------------:|-----------------------:|:----------------------------|:--------------------------|----------------------------:|-----------------------------------:|-------------------------------:|---------------------------------:|----------------------------------------:|---------------------------------------:|:-------------------|:-------------------|
        |  0 | 2025-10-06 |       2540 | 113年  |                           3 |                0.999999 | 2025-09-30                   |                            0 |                                  0 |                                     0 |                              0 |                        0.4 |                    0.6 | 2025-09-30                  | 2025-10-31                |                           0 |                              0     |                           0    |                              0   |                                       0 |                            6.7491e+08  | 2025-09-12         | 17:35:32           |
        |  1 | 2025-10-06 |       3312 | 不適用 |                           0 |                0        | 2025-09-30                   |                            0 |                                  0 |                                     0 |                              0 |                        0   |                    0   |                             |                           |                           0 |                              2e+07 |                           9.84 |                             39.8 |                                       0 |                            1.62627e+08 | 2025-09-22         | 16:52:52           |
    === "Schema"
        ```
        {
            date: str, # rights distribution record date
            stock_id: str, # stock code
            year: str, # dividend fiscal year
            StockEarningsDistribution: float64, # stock dividend: capitalization of earnings
            StockStatutorySurplus: float64, # stock dividend: capitalization of statutory and capital surplus
            StockExDividendTradingDate: str, # ex-rights trading date
            TotalEmployeeStockDividend: float64, # employee stock dividend
            TotalEmployeeStockDividendAmount: float64, # employee stock dividend amount
            RatioOfEmployeeStockDividendOfTotal: float64, # ratio of employee stock dividend to total earnings dividend
            RatioOfEmployeeStockDividend: float64, # employee stock dividend ratio
            CashEarningsDistribution: float64, # cash dividend: capitalization of earnings
            CashStatutorySurplus: float64, # cash dividend: capitalization of statutory and capital surplus
            CashExDividendTradingDate: str, # ex-dividend trading date
            CashDividendPaymentDate: str, # cash dividend payment date
            TotalEmployeeCashDividend: float64, # total employee cash bonus
            TotalNumberOfCashCapitalIncrease: float64, # total shares of cash capital increase
            CashIncreaseSubscriptionRate: float64, # cash capital increase subscription ratio
            CashIncreaseSubscriptionpRrice: float64, # cash capital increase subscription price
            RemunerationOfDirectorsAndSupervisors: float64, # directors and supervisors remuneration
            ParticipateDistributionOfTotalShares: float64, # total shares participating in distribution
            AnnouncementDate: str, # announcement date
            AnnouncementTime: str # announcement time
        }
        ```

----------------------------------
#### Ex-Dividend/Ex-Right Result Table TaiwanStockDividendResult

- Data range: 2003-05-01 ~ now

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_dividend_result(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDividendResult",
            "data_id": "2330",
            "start_date": "2019-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDividendResult",
                data_id="2330",
                start_date= "2019-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_dividend_result(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id |   before_price |   after_price |   stock_and_cache_dividend | stock_or_cache_dividend   |   max_price |   min_price |   open_price |   reference_price |
        |---:|:-----------|-----------:|---------------:|--------------:|---------------------------:|:--------------------------|------------:|------------:|-------------:|------------------:|
        |  0 | 2019-06-24 |       2330 |          248.5 |         240.5 |                        8   | 息                        |       264.5 |       216.5 |        240.5 |             240.5 |
        |  1 | 2019-09-19 |       2330 |          267   |         265   |                        2   | 息                        |       291.5 |       238.5 |        265   |             265   |
        |  2 | 2019-12-19 |       2330 |          344.5 |         342   |                        2.5 | 息                        |       376   |       308   |        342   |             342   |
        |  3 | 2020-03-19 |       2330 |          260   |         257.5 |                        2.5 | 息                        |       283   |       232   |        257.5 |             257.5 |
        |  4 | 2020-06-18 |       2330 |          315   |         312.5 |                        2.5 | 息                        |       343.5 |       281.5 |        312.5 |             312.5 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            before_price: float32, # closing price before ex-dividend/ex-right
            after_price: float32, # closing price after ex-dividend/ex-right
            stock_and_cache_dividend: float32, # dividend value
            stock_or_cache_dividend: float32, # right/dividend
            max_price: float32, # limit-up price
            min_price: float32, # limit-down price
            open_price: float32, # open price
            reference_price: float32 # reference price after dividend deduction
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_dividend_result(
            start_date='2019-06-24',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDividendResult",
            "start_date": "2019-06-24",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDividendResult",
                start_date= "2019-06-24"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
!!! output
    === "DataFrame"
        |    | date       | stock_id   |   before_price |   after_price |   stock_and_cache_dividend | stock_or_cache_dividend   |   max_price |   min_price |   open_price |   reference_price |
        |---:|:-----------|:-----------|---------------:|--------------:|---------------------------:|:--------------------------|------------:|------------:|-------------:|------------------:|
        |  0 | 2019-06-24 | 00697B     |          42.48 |         42.21 |                       0.27 | 除息                      |     9999.95 |        0.01 |        42.21 |             42.21 |
        |  1 | 2019-06-24 | 00751B     |          46.05 |         45.46 |                       0.59 | 除息                      |     9999.95 |        0.01 |        45.46 |             45.46 |
        |  2 | 2019-06-24 | 1707       |         220    |        213.5  |                       6.5  | 息                        |      234.5  |      192.5  |       213.5  |            213.5  |
        |  3 | 2019-06-24 | 1711       |          17    |         16.5  |                       0.5  | 息                        |       18.15 |       14.85 |        16.5  |             16.5  |
        |  4 | 2019-06-24 | 1906       |          13.55 |         13.05 |                       0.5  | 息                        |       14.35 |       11.75 |        13.05 |             13.05 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            before_price: float32, # closing price before ex-dividend/ex-right
            after_price: float32, # closing price after ex-dividend/ex-right
            stock_and_cache_dividend: float32, # dividend value
            stock_or_cache_dividend: float32, # right/dividend
            max_price: float32, # limit-up price
            min_price: float32, # limit-down price
            open_price: float32, # open price
            reference_price: float32 # reference price after dividend deduction
        }
        ```

----------------------------------
#### Monthly Revenue Table TaiwanStockMonthRevenue

- Data range: 2002-02-01 ~ now
- Coverage: listed (TWSE), OTC (TPEx) and emerging market companies, distinguished by `stock_id` (use `TaiwanStockInfo` to look up market type)

??? note "`create_time` only exists from 2026-04-21 onwards, and reflects when the row entered the FinMind database"
    `create_time` is the date (YYYY-MM-DD) on which the monthly revenue row **entered the FinMind database**. It has only been recorded since **2026-04-21**; rows older than that carry **no** `create_time` and the field is an empty string.

    It is therefore **not the official announcement time** filed by the company on the Market Observation Post System - it only tells you when FinMind observed the row. That said, FinMind collects monthly revenue several times a day, so in practice the gap to the announcement time should be negligible, and the field can still be used as an approximation of "roughly when this revenue figure was published".

    Note also that rows written on 2026-04-21 (the day the column went live) all carry `create_time` = 2026-04-21, which is the initial backfilled value of the column rather than the day those figures were announced.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_month_revenue(
            stock_id="2330",
            start_date='2019-03-31',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMonthRevenue",
            "data_id": "2330",
            "start_date": "2019-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMonthRevenue",
                data_id="2330",
                start_date= "2019-01-02"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_month_revenue(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id | country   |     revenue |   revenue_month |   revenue_year | create_time |
        |---:|:-----------|-----------:|:----------|------------:|----------------:|---------------:|:------------|
        |  0 | 2019-04-01 |       2330 | Taiwan    | 79721587000 |               3 |           2019 |             |
        |  1 | 2019-05-01 |       2330 | Taiwan    | 74693615000 |               4 |           2019 |             |
        |  2 | 2019-06-01 |       2330 | Taiwan    | 80436931000 |               5 |           2019 |             |
        |  3 | 2019-07-01 |       2330 | Taiwan    | 85867929000 |               6 |           2019 |             |
        |  4 | 2019-08-01 |       2330 | Taiwan    | 84757724000 |               7 |           2019 |             |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            country: str, # country
            revenue: int64, # revenue
            revenue_month: int64, # revenue month
            revenue_year: int64, # revenue year
            create_time: str # creation time (YYYY-MM-DD); recorded only since 2026-04-21, empty string for older historical rows
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_month_revenue(
            start_date='2019-04-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMonthRevenue",
            "start_date": "2019-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMonthRevenue",
                start_date= "2019-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | country   |     revenue |   revenue_month |   revenue_year | create_time |
        |---:|:-----------|-----------:|:----------|------------:|----------------:|---------------:|:------------|
        |  0 | 2019-05-01 |       1101 | Taiwan    | 10596314000 |               4 |           2019 |             |
        |  1 | 2019-05-01 |       1102 | Taiwan    |  8434811000 |               4 |           2019 |             |
        |  2 | 2019-05-01 |       1103 | Taiwan    |   160751000 |               4 |           2019 |             |
        |  3 | 2019-05-01 |       1104 | Taiwan    |   418992000 |               4 |           2019 |             |
        |  4 | 2019-05-01 |       1108 | Taiwan    |   323834000 |               4 |           2019 |             |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            country: str, # country
            revenue: int64, # revenue
            revenue_month: int64, # revenue month
            revenue_year: int64, # revenue year
            create_time: str # creation time (YYYY-MM-DD); recorded only since 2026-04-21, empty string for older historical rows
        }
        ```
----------------------------------
#### Capital Reduction Resumption Reference Price TaiwanStockCapitalReductionReferencePrice

- Data range: 2011-01-01 ~ now

??? note "data_id (stock id) is not required"
    Omitting `data_id` and providing only the date range returns the capital reduction resumption reference prices of **all** stocks within that range. This whole-market query without `data_id` is available to [backer/sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members; free members should query a single stock with `data_id`.

!!! example
    === "Python"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockCapitalReductionReferencePrice",
            "data_id": "2327",
            "start_date": "2010-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

                date stock_id  ClosingPriceonTheLastTradingDay  PostReductionReferencePrice  LimitUp  LimitDown  OpeningReferencePrice  ExrightReferencePrice ReasonforCapitalReduction
        0  2013-09-18     2327                            10.20                        10.28    10.95       9.57                   10.3                   -1.0               Cash refund
        1  2014-10-09     2327                            22.05                        49.82    53.30      46.35                   49.8                   -1.0               Cash refund
        2  2016-08-15     2327                            54.80                        65.96    72.50      59.40                   66.0                   -1.0               Cash refund
        3  2017-08-18     2327                           120.50                       168.13   184.50     151.50                  168.0                   -1.0               Cash refund
        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockCapitalReductionReferencePrice",
                data_id="2327",
                start_date= "2010-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

                date stock_id  ClosingPriceonTheLastTradingDay  PostReductionReferencePrice  LimitUp  LimitDown  OpeningReferencePrice  ExrightReferencePrice ReasonforCapitalReduction
        1  2013-09-18     2327                            10.20                        10.28    10.95       9.57                   10.3                   -1.0               Cash refund
        2  2014-10-09     2327                            22.05                        49.82    53.30      46.35                   49.8                   -1.0               Cash refund
        3  2016-08-15     2327                            54.80                        65.96    72.50      59.40                   66.0                   -1.0               Cash refund
        4  2017-08-18     2327                           120.50                       168.13   184.50     151.50                  168.0                   -1.0               Cash refund
        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_capital_reduction_reference_price(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```



----------------------------------
#### Taiwan Stock Market Value Table TaiwanStockMarketValue (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2004-01-01 ~ now
- Data update time: **Monday to Friday 23:30**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_market_value(
            stock_id='2330',
            start_date='2023-01-01',
            end_date='2024-01-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarketValue",
            "data_id": "2330",
            "start_date": "2023-01-01",
            "end_date": "2024-01-01",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
            response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarketValue",
                data_id= "2330",
                start_date= "2023-01-01",
                end_date= "2024-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |   market_value |
        |---:|:-----------|-----------:|-----------------:|
        |  0 | 2023-01-03 |       2330 |         1.174646e+13 |
        |  1 | 2023-01-04 |       2330 |         1.165571e+13 |
        |  2 | 2023-01-05 |       2330 |         1.188908e+13 |
        |  3 | 2023-01-06 |       2330 |         1.188908e+13 |
        |  4 | 2023-01-09 |       2330 |         1.247251e+13 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            market_value: int64 # market value
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_daily(
            start_date='2023-01-03',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarketValue",
            "start_date": "2023-01-03",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarketValue",
                start_date= "2023-01-03"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id |     market_value |
        |---:|:-----------|-----------:|-----------------:|
        |  0 | 2023-01-03 |       0050 |     2.561094e+11 |
        |  1 | 2023-01-03 |       0051 |     7.967000e+08 |
        |  2 | 2023-01-03 |       0052 |     5.644650e+09 |
        |  3 | 2023-01-03 |       0053 |     2.611218e+08 |
        |  4 | 2023-01-03 |       0055 |     1.625804e+09 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            market_value: int64 # market value
        }
        ```


----------------------------------
#### Taiwan Stock Delisting Table TaiwanStockDelisting

- Data range: 2001-01-01 ~ now
- Data update time: **Monday to Friday 23:30**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_delisting()
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockDelisting",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockDelisting"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```
    === "Package-Async"
        ```python
        from FinMind.data import DataLoader
        from loguru import logger
        import datetime

        api = DataLoader()
        api.login_by_token(api_token='token')

        start = datetime.datetime.now()
        df = api.taiwan_stock_delisting(
            stock_id_list=['2330', '2317', '2454', '3008'],
            start_date='2024-01-01',
            end_date='2024-12-31',
            use_async=True,
        )
        cost = datetime.datetime.now() - start
        logger.info(cost)
        ```


!!! output
    === "DataFrame"
        |    | date       |   stock_id |   stock_name |
        |---:|:-----------|-----------:|-------------:|
        |  0 | 2005-10-04 |       1204 |          津津 |
        |  1 | 2001-11-01 |       1230 |      聯成食品 |
        |  2 | 2005-10-04 |       1306 |      合發興業 |
        |  3 | 2006-06-26 |       1408 |      中興紡織 |
        |  4 | 2002-11-08 |       1431 |      新燕實業 |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            stock_name: str # stock name
        }
        ```


----------------------------------
#### Taiwan Stock Market Value Weight Table TaiwanStockMarketValueWeight (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Data range: 2024-10-30 ~ now
- Data update time: **23:45 on the 1st, 2nd, 3rd, 28th, 29th, 30th, and 31st of each month**. The actual update time is based on the API data.

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_market_value_weight(
            stock_id='2330',
            start_date='2024-01-01',
            end_date='2025-01-01'
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarketValueWeight",
            "data_id": "2330",
            "start_date": "2024-01-01",
            "end_date": "2025-01-01",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarketValueWeight",
                data_id= "2330",
                start_date= "2024-01-01",
                end_date= "2025-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | rank |  stock_id  |  stock_name |  weight_per  |    date     |   type  |
        |---:|:-----|-----------:|------------:|-------------:|------------:|--------:|
        |  0 |   1  |    2330    |   台積電     |    36.8397   | 2024-10-30  |   twse  |
    === "Schema"
        ```
        {
            rank: int64, # rank
            stock_id: str, # stock code
            stock_name: str, # stock name
            weight_per: float32, # weight percentage
            date: str, # date
            type: str # listed (twse) / OTC (tpex)
        }
        ```

#### Fetch all data for a specific date at once (available only to [backer, sponsor](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_market_value_weight(
            start_date='2024-10-30',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockMarketValueWeight",
            "start_date": "2024-10-30",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockMarketValueWeight",
                start_date= "2024-10-30"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | rank  |  stock_id  |  stock_name |  weight_per  |    date     |   type  |
        |---:|:------|-----------:|------------:|-------------:|------------:|--------:|
        |  0 |   43  |    1101    |   台泥       |    0.3327    | 2024-10-30  |   twse  |
        |  0 |   63  |    1102    |   亞泥       |    0.2282    | 2024-10-30  |   twse  |
        |  0 |   394 |    1103    |   嘉泥       |    0.0192    | 2024-10-30  |   twse  |
        |  0 |   305 |    1104    |   環泥       |    0.0286    | 2024-10-30  |   twse  |
        |  0 |   651 |    1108    |   幸福       |    0.0082    | 2024-10-30  |   twse  |
    === "Schema"
        ```
        {
            rank: int64, # rank
            stock_id: str, # stock code
            stock_name: str, # stock name
            weight_per: float32, # weight percentage
            date: str, # date
            type: str # listed (twse) / OTC (tpex)
        }
        ```


----------------------------------
#### Taiwan Stock Post-Split Reference Price TaiwanStockSplitPrice

- Provides Taiwan stock post-split reference prices.
- Data update time: Monday to Friday 18:00. The actual update time is based on the API data.

!!! example
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockSplitPrice",
        }
        resp = requests.get(url, headers=headers, params=parameter)
        data = resp.json()
        data = pd.DataFrame(data["data"])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockSplitPrice"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       | stock_id   | type   |   before_price |   after_price |   max_price |   min_price |   open_price |
        |---:|:-----------|:-----------|:-------|---------------:|--------------:|------------:|------------:|-------------:|
        |  0 | 2024-12-11 | 00632R     | 反分割 |           3.28 |         22.96 |       25.25 |       20.67 |        22.96 |
        |  1 | 2025-02-19 | 00676R     | 反分割 |           2.04 |         12.23 |       13.45 |       11.01 |        12.23 |
        |  2 | 2025-06-11 | 00663L     | 分割   |         170.15 |         24.3  |       29.16 |       19.44 |        24.3  |
        |  3 | 2025-06-18 | 0050       | 分割   |         188.65 |         47.16 |       51.85 |       42.45 |        47.16 |
    === "Schema"
        ```
        {
            date: str, # split date
            stock_id: str, # stock code
            type: str, # split type
            before_price: float, # pre-split price
            after_price: float, # post-split price
            max_price: float, # post-split max price
            min_price: float, # post-split min price
            open_price: float # post-split open price
        }
        ```

----------------------------------
#### Taiwan Stock Par Value Change Resumption Reference Price TaiwanStockParValueChange

- Data range: 2020-01-01 ~ now

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        df = api.taiwan_stock_par_value_change(
            start_date='2020-01-01',
        )
        ```
    === "Python-request"
        ```python
        import requests
        import pandas as pd
        url = "https://api.finmindtrade.com/api/v4/data"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockParValueChange",
            "start_date": "2020-01-01",
        }
        data = requests.get(url, headers=headers, params=parameter)
        data = data.json()
        data = pd.DataFrame(data['data'])
        print(data.head())

        ```
    === "R"
        ```R
        library(httr)
        library(data.table)
        library(dplyr)
        url = 'https://api.finmindtrade.com/api/v4/data'
        token = "" # Refer to login to obtain the token
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockParValueChange",
                start_date= "2020-01-01"
            ),
            add_headers(Authorization = paste("Bearer", token))
        )
        data = content(response)
        df = data$data %>%
        do.call('rbind',.) %>%
        data.table
        head(df)

        ```

!!! output
    === "DataFrame"
        |    | date       |   stock_id | stock_name   | before_close | after_ref_close | after_ref_max | after_ref_min | after_ref_open |
        |---:|:-----------|-----------:|-------------:|-------------:|----------------:|-------------:|----------------:|-------------:|
        |  0 | 2020-08-17 |       8070 | 長華         |      190       |      19        |      20.9     |      17.1      |      19      |
        |  1 | 2021-10-18 |       6531 | 愛普         |      750       |     375        |     412.5     |     337.5      |     375      |
        |  2 | 2022-07-13 |       6415 | 矽力-K       |     2485       |     621.25     |     683       |     560        |     621      |
        |  3 | 2024-11-11 |       8476 | 台境         |       58.8     |      29.4      |      32.3     |      26.5      |      29.4    |
        |  4 | 2025-06-30 |       4763 | 材料-KY      |      885       |      88.5      |      97.3     |      79.7      |      88.5    |
    === "Schema"
        ```
        {
            date: str, # date
            stock_id: str, # stock code
            stock_name: str, # stock name
            before_close: float64, # closing price before suspension
            after_ref_close: float64, # resumption reference price
            after_ref_max: float64, # limit-up price
            after_ref_min: float64, # limit-down price
            after_ref_open: float64 # opening auction reference price
        }
        ```

----------------------------------
#### Taiwan Stock Financial Report and Annual Report PDF TaiwanStockFinancialReportFile (available only to [sponsorpro](https://finmindtrade.com/analysis/#/Sponsor/sponsor) members)

- Provides the full PDF files of financial reports and annual shareholders' meeting reports of TWSE-listed, TPEx-listed and emerging-market companies.
- Data range: financial reports 2013-03-31 ~ now (from 2013 Q1, one per quarter); annual reports 2013-12-31 ~ now (from fiscal year 2013, one per year)
- Download one file per request via `/api/v4/storage_objects` with `data_id` (stock id), `year` (calendar year), `quarter` (1 to 4) and `report_category`; all four are required. Whole-market downloads are not supported.
- `quarter=1` to `3` is the financial report for that quarter; `quarter=4` has the annual financial report (`financial_report`) and the annual shareholders' meeting report (`annual_report`).

??? note "Download parameters and response"
    | Parameter | Description |
    |---|---|
    | `dataset` | `TaiwanStockFinancialReportFile` |
    | `data_id` | Stock id, required |
    | `year` | Calendar year, required |
    | `quarter` | Quarter 1 to 4, required |
    | `report_category` | `financial_report` (financial report) or `annual_report` (annual shareholders' meeting report), required; `annual_report` is only available for `quarter=4` |

    - The response is a redirect; follow it to download the file itself.
    - Downloaded file name format: `TaiwanStockFinancialReportFile_{data_id}_{date}_{report_category}.pdf` (`date` is the period end date, e.g. `2025-12-31`).
    - Returns 404 when there is no matching file for that period.
    - Returns 400 when parameters are missing or invalid (e.g. `quarter` not 1 to 4, `report_category` not one of the two values above, or `annual_report` with a `quarter` other than 4).

??? note "Provides PDF files, not financial statement figures"
    This dataset provides the report PDF files. For financial statement figures such as income, balance sheet and cash flow items, please use [Income Statement TaiwanStockFinancialStatements](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#income-statement-taiwanstockfinancialstatements), [Balance Sheet TaiwanStockBalanceSheet](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#balance-sheet-taiwanstockbalancesheet) and [Cash Flows Statement TaiwanStockCashFlowsStatement](https://finmind.github.io/en/tutor/TaiwanMarket/Fundamental/#cash-flows-statement-taiwanstockcashflowsstatement).

??? note "Coverage"
    - Financial reports (`financial_report`): one Chinese report per period, primarily the consolidated financial report; when no consolidated financial report is available, the individual, restated, or parent-company-only financial report is included, in that order. English versions are not included.
    - Files are mostly PDF; for a small number of 2013 financial reports, the source only provides a Word file, so the downloaded file is a .doc file.
    - Annual reports (`annual_report`) are the Chinese annual shareholders' meeting reports.
    - The text layer of some annual report PDFs may be garbled or incomplete (as in the source files); OCR may be needed if you need to extract text.

??? note "Usage scope: rights in the files belong to the issuing company"
    - The files come from the Market Observation Post System (MOPS). Copyright and other rights belong to the issuing company, its certifying accountants, or other rights holders; FinMind only provides a means of access and grants no rights in the files themselves.
    - The Sponsor Pro commercial license does not cover the files themselves: do not redistribute or resell them, or build a mirror download service.
    - Files are provided as published by the source, without modifying their content; when the source provides an archive or split volumes, they are only extracted and merged into a single PDF in file-name order.
    - If you use their content in services offered to others (e.g., AI retrieval or summarization), auditors' reports and notes to the financial statements may be protected by copyright — please assess legal compliance yourself.
    - See [Disclaimer & Data Licensing](https://finmind.github.io/en/Disclaimer/).

!!! example
    === "Package"
        ```python
        from FinMind.data import DataLoader

        api = DataLoader()
        # api.login_by_token(api_token='token')
        # Downloads one file and returns its content (bytes); raises an exception when there is no file for the period
        content = api.taiwan_stock_financial_report_file_download(
            stock_id="2330",
            year=2025,
            quarter=4,
            report_category="annual_report",
        )
        with open("TaiwanStockFinancialReportFile_2330_2025-12-31_annual_report.pdf", "wb") as f:
            f.write(content)
        ```
    === "Python-request"
        ```python
        import requests

        url = "https://api.finmindtrade.com/api/v4/storage_objects"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        parameter = {
            "dataset": "TaiwanStockFinancialReportFile",
            "data_id": "2330",
            "year": 2025,
            "quarter": 4,
            "report_category": "annual_report",
        }
        # requests follows redirects by default and gets the file itself
        resp = requests.get(url, headers=headers, params=parameter)
        resp.raise_for_status()  # 404 when there is no file for the period
        # A small number of 2013 financial reports are Word files (.doc); others are PDF
        ext = "doc" if resp.headers.get("Content-Type") == "application/msword" else "pdf"
        with open(f"TaiwanStockFinancialReportFile_2330_2025-12-31_annual_report.{ext}", "wb") as f:
            f.write(resp.content)

        ```
    === "R"
        ```R
        library(httr)

        url = 'https://api.finmindtrade.com/api/v4/storage_objects'
        token = "" # Refer to login to obtain the token
        # httr follows redirects by default; write_disk writes the file to disk
        response = httr::GET(
            url = url,
            query = list(
                dataset="TaiwanStockFinancialReportFile",
                data_id= "2330",
                year= 2025,
                quarter= 4,
                report_category= "annual_report"
            ),
            add_headers(Authorization = paste("Bearer", token)),
            write_disk("TaiwanStockFinancialReportFile_2330_2025-12-31_annual_report.pdf", overwrite = TRUE)
        )
        stop_for_status(response) # 404 when there is no file for the period

        ```
    === "Multiple periods"
        ```python
        import requests

        url = "https://api.finmindtrade.com/api/v4/storage_objects"
        token = "" # Refer to login to obtain the token
        headers = {"Authorization": f"Bearer {token}"}
        quarter_end = {1: "03-31", 2: "06-30", 3: "09-30", 4: "12-31"}

        # Download 2330's quarterly financial reports and annual reports for 2024-2025
        for year in [2024, 2025]:
            for quarter in [1, 2, 3, 4]:
                categories = ["financial_report"]
                if quarter == 4:
                    categories.append("annual_report")  # annual reports are Q4 only
                for report_category in categories:
                    parameter = {
                        "dataset": "TaiwanStockFinancialReportFile",
                        "data_id": "2330",
                        "year": year,
                        "quarter": quarter,
                        "report_category": report_category,
                    }
                    resp = requests.get(url, headers=headers, params=parameter)
                    if resp.status_code == 404:
                        print(year, quarter, report_category, "no file for this period")
                        continue
                    resp.raise_for_status()
                    ext = "doc" if resp.headers.get("Content-Type") == "application/msword" else "pdf"
                    file_name = (
                        f"TaiwanStockFinancialReportFile_2330_"
                        f"{year}-{quarter_end[quarter]}_{report_category}.{ext}"
                    )
                    with open(file_name, "wb") as f:
                        f.write(resp.content)
                    print(file_name, len(resp.content))

        ```
