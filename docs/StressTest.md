
## 使用 ApacheBench 壓測，結果如下

### 針對最常用的 ` 台股 tick 即時資料 ` 做查詢

* ### 測試環境一、colab

    模擬 10 個使用者發送 1000 個 request，平均一秒可承受 10 次 request 查詢，
    一小時約 36,000 次 request。
    平均一次回應約 72 ms。

    測試細節如下

    ```
    Concurrency Level:      10
    Time taken for tests:   72.275 seconds
    Complete requests:      1000
    Failed requests:        0
    Total transferred:      10179000 bytes
    HTML transferred:       10019000 bytes
    Requests per second:    13.84 [#/sec] (mean)
    Time per request:       722.748 [ms] (mean)
    Time per request:       72.275 [ms] (mean, across all concurrent requests)
    Transfer rate:          137.54 [Kbytes/sec] received
    ```


* ### 測試環境二、linode 雲端(日本)

    模擬 10 個使用者發送 1000 個 request，平均一秒可承受 50 次 request 查詢，
    一小時約 180,000 次 request。
    平均一次回應約 17 ms。

    測試細節如下

    ```
    Concurrency Level:      10
    Time taken for tests:   17.095 seconds
    Complete requests:      1000
    Failed requests:        0
    Total transferred:      10179000 bytes
    HTML transferred:       10019000 bytes
    Requests per second:    58.50 [#/sec] (mean)
    Time per request:       170.947 [ms] (mean)
    Time per request:       17.095 [ms] (mean, across all concurrent requests)
    Transfer rate:          581.49 [Kbytes/sec] received
    ```

如需使用即時資料做交易的使用者，建議使用 gcp、aws、linode 等雲端環境，本地機器會受限於網速問題，無法達到最佳使用體驗。

