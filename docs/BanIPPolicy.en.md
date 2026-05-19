# IP Ban Policy

To keep the service stable and protect legitimate users, the FinMind API automatically and temporarily blocks IPs that **generate a large number of error requests in a short period**.

## Trigger conditions

A burst of 4xx requests from one IP (e.g., invalid token, malformed token, bad parameters, quota exceeded) will trigger an automatic block.

Normal users almost never trigger this. Typical triggers come from:

- Crawler scripts hammering with an expired or invalid token
- Code that doesn't handle API errors and keeps retrying with the same broken request
- Malicious attempts to brute-force tokens or abuse the service

## API response while blocked

While blocked, every API request returns:

**Status code**: `403 Forbidden`

**Response body**:
```json
{"msg": "ip banned", "status": 403}
```

!!! example
    === "Python"
        ```python
        import requests
        url = "https://api.finmindtrade.com/api/v4/data"
        resp = requests.get(url, params={"dataset": "TaiwanStockPrice"})
        print(resp.status_code)
        print(resp.json())
        ```

    === "resp.status_code"
        ```
        403
        ```
    === "resp.json()"
        ```python
        {"msg": "ip banned", "status": 403}
        ```

## Block duration

Blocked IPs are **automatically released after 30 minutes**, no manual action required. If invalid requests continue after release, the IP will be blocked again.

## How to avoid being blocked

1. **Token management**

    - On `TokenIllegal` (400) or `TokenLevelTooLow`, the token is invalid or under-permissioned — **stop retrying with that token**
    - Sign in again via [Login](login.md) to obtain a fresh token before retrying

2. **Error handling**

    - 4xx usually means the request itself is wrong (parameters, dates, dataset name, data id, etc.). Fix the parameters before resending — **do not retry forever**
    - 5xx can be retried with exponential backoff, but cap the retry count

3. **Request rate**

    - See [Stress Test](StressTest.md) for the recommended request rate
    - Exceeding your tier's quota returns `402` — upgrade or wait for the next billing cycle. See [API Usage Count](api_usage_count.md)

4. **Use the correct endpoint and parameters**

    - Send requests using the endpoints and parameter formats shown in [Quick Start](quickstart.md)

## Appeal a wrongful block

If you are a legitimate user and believe you were blocked by mistake, email us with the following so we can help unblock quickly:

- Your source IP (look it up at <https://ifconfig.me>)
- The token or registered email you were using
- When and how it happened

📧 Contact: <finmind.tw@gmail.com>
