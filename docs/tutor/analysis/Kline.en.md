#### [kbar_plotting.ipynb](https://colab.research.google.com/drive/1u1cJGFNCLOeBIR0PdeKlsqgKBJSvJg_y?usp=sharing)

![gif](https://finmind.github.io/images/kbar_plotting.gif)

!!! info "Plot K-Line"
     ```python
     # Get stock prices
     from FinMind.data import DataLoader

     dl = DataLoader()
     # Download Taiwan stock price data
     stock_data = dl.taiwan_stock_daily(
     stock_id='2609', start_date='2018-01-01', end_date='2021-06-26'
     )
     # Download data of the three major institutional investors
     stock_data = dl.feature.add_kline_institutional_investors(
     stock_data
     ) 
     # Download margin purchase / short sale data
     stock_data = dl.feature.add_kline_margin_purchase_short_sale(
     stock_data
     )

     # Plot the K-line chart
     from FinMind import plotting

     plotting.kline(stock_data)
     ```
