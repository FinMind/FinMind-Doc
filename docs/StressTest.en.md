
## Load test results using ApacheBench

### Querying the most-used `Taiwan stock real-time tick` endpoint

* ### Test environment 1: Colab

    Simulating 10 users sending 1,000 requests, the service handled ~10 requests/second on average,
    or roughly 36,000 requests/hour.
    Average response time: ~72 ms.

    Detailed results:

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


* ### Test environment 2: Linode (Japan)

    Simulating 10 users sending 1,000 requests, the service handled ~50 requests/second on average,
    or roughly 180,000 requests/hour.
    Average response time: ~17 ms.

    Detailed results:

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

