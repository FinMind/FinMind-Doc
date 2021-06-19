
### [線上連結](https://colab.research.google.com/drive/1Unn7pSbp4RxQQRWaBJaC3oACdUFML4Xu?usp=sharing)

```
pip install FinMind
```


!!! info "初始化，設定回測股票代碼、時間區間"

     ```python
     import numpy as np
     import pandas as pd
     from FinMind import strategies
     from FinMind.data import DataLoader
     from FinMind.strategies.base import Strategy
     from ta.momentum import StochasticOscillator


     data_loader = DataLoader()
     # data_loader.login(user_id, password) # 可選
     obj = strategies.BackTest(
          stock_id="0056",
          start_date="2018-01-01",
          end_date="2019-01-01",
          trader_fund=500000.0,
          fee=0.001425,
          data_loader=data_loader,
     )
     obj.stock_price

     ```

!!! done "將會用以下 data 計算回測"

     ```python
               date stock_id  Trading_Volume  Trading_money   open    max    min  close  spread  Trading_turnover  CashEarningsDistribution  StockEarningsDistribution
     0    2018-01-02     0056         1868451       46856990  25.00  25.14  25.00  25.13    0.13             733.0                       0.0                        0.0
     1    2018-01-03     0056         3846820       97179269  25.15  25.31  25.15  25.31    0.18            1202.0                       0.0                        0.0
     2    2018-01-04     0056         2736229       69496928  25.31  25.45  25.31  25.41    0.10             957.0                       0.0                        0.0
     3    2018-01-05     0056         2383585       60620826  25.41  25.48  25.39  25.44    0.03             782.0                       0.0                        0.0
     4    2018-01-08     0056         3048596       77817525  25.45  25.57  25.45  25.57    0.13            1236.0                       0.0                        0.0
     ..          ...      ...             ...            ...    ...    ...    ...    ...     ...               ...                       ...                        ...
     242  2018-12-24     0056         1501284       36271556  24.20  24.21  24.09  24.18    0.01             773.0                       0.0                        0.0
     243  2018-12-25     0056        13908880      332473777  24.01  24.06  23.84  23.97   -0.21            6359.0                       0.0                        0.0
     244  2018-12-26     0056        12600245      300239138  24.09  24.09  23.67  23.72   -0.25            6413.0                       0.0                        0.0
     245  2018-12-27     0056         2986526       71566004  24.00  24.02  23.90  23.91    0.19            1651.0                       0.0                        0.0
     246  2018-12-28     0056         2657586       63571334  23.93  23.96  23.89  23.94    0.03            1075.0                       0.0                        0.0
     ```


!!! info "設計策略"

     ```python
     class Kd(Strategy):
          """
          summary:
               日KD 80 20
               日K線 <= 20 進場
               日K線 >= 80 出場
          """
          kdays = 9
          kd_upper = 80
          kd_lower = 20
          def create_trade_sign(self, stock_price: pd.DataFrame) -> pd.DataFrame:
               stock_price = stock_price.sort_values("date")
               kd = StochasticOscillator(
                    high=stock_price["max"],
                    low=stock_price["min"],
                    close=stock_price["close"],
                    n=self.kdays,
               )
               rsv_ = kd.stoch().fillna(50)
               _k = np.zeros(stock_price.shape[0])
               _d = np.zeros(stock_price.shape[0])
               for i, r in enumerate(rsv_):
                    if i == 0:
                         _k[i] = 50
                         _d[i] = 50
                    else:
                         _k[i] = _k[i - 1] * 2 / 3 + r / 3
                         _d[i] = _d[i - 1] * 2 / 3 + _k[i] / 3
               stock_price["K"] = _k
               stock_price["D"] = _d
               stock_price.index = range(len(stock_price))
               stock_price["signal"] = 0
               stock_price.loc[stock_price["K"] <= self.kd_lower, "signal"] = 1
               stock_price.loc[stock_price["K"] >= self.kd_upper, "signal"] = -1
               return stock_price
     ```


!!! info "回測模擬交易"

     ```python
     obj.add_strategy(Kd)
     obj.simulate()
     obj.final_stats
     ```

!!! done "output"

     ```python
     MeanProfit          2366.450976
     MaxLoss            -1425.510000
     FinalProfit         6196.970000
     MeanProfitPer          0.470000
     FinalProfitPer         1.240000
     MaxLossPer            -0.290000
     AnnualReturnPer        1.250000
     AnnualSharpRatio       0.860000
     dtype: float64
     ```

!!! info "交易明細"

     ```python
     obj.trade_detail
     ```

!!! done "output"

     ```python
     stock_id        date  EverytimeProfit  RealizedProfit  UnrealizedProfit  board_lot  hold_cost  hold_volume  signal    tax       fee  trade_price   trader_fund
     0       0056  2018-01-03             0.00            0.00              0.00       1000   0.000000            0       0  0.001  0.001425        25.15  500000.00000
     1       0056  2018-01-04             0.00            0.00              0.00       1000   0.000000            0       0  0.001  0.001425        25.31  500000.00000
     2       0056  2018-01-05             0.00            0.00              0.00       1000   0.000000            0       0  0.001  0.001425        25.41  500000.00000
     3       0056  2018-01-08             0.00            0.00              0.00       1000   0.000000            0       0  0.001  0.001425        25.45  500000.00000
     4       0056  2018-01-09             0.00            0.00              0.00       1000   0.000000            0       0  0.001  0.001425        25.55  500000.00000
     ..       ...         ...              ...             ...               ...        ...        ...          ...     ...    ...       ...          ...           ...
     241     0056  2018-12-24          7274.35         5677.56           1596.79       1000  23.742118         4000       0  0.001  0.001425        24.20  410709.09425
     242     0056  2018-12-25          6516.19         5677.56            838.63       1000  23.742118         4000       0  0.001  0.001425        24.01  410709.09425
     243     0056  2018-12-26          6835.42         5677.56           1157.86       1000  23.742118         4000       0  0.001  0.001425        24.09  410709.09425
     244     0056  2018-12-27          6476.29         5677.56            798.73       1000  23.742118         4000       0  0.001  0.001425        24.00  410709.09425
     245     0056  2018-12-28          6196.97         5677.56            519.41       1000  23.742118         4000       0  0.001  0.001425        23.93  410709.09425
     ```


!!! info "視覺化"

     ```python
     obj.plot()
     ```

![backtesting](https://finmind.github.io/images/backtesting.png)

