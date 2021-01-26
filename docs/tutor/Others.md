

#### CnnFearGreedIndex 恐懼與貪婪指數

!!! example
    ```python
    import requests
    import pandas as pd

    url = "https://api.finmindtrade.com/api/v4/data"
    form_data = {
        "dataset": "CnnFearGreedIndex",
        "start_date": "2021-01-01",
        "end_date": "2021-01-10",
    }
    res = requests.get(url, params=form_data)
    temp = res.json()
    data = pd.DataFrame(temp["data"])
    data

            date  fear_greed fear_greed_emotion
    0  2021-01-04          53            neutral
    1  2021-01-05          52            neutral
    2  2021-01-06          59              greed
    3  2021-01-07          66              greed
    ```
