# IP 封鎖政策

為確保服務穩定、保障合法使用者的體驗，FinMind API 會對 **短時間內產生大量錯誤請求的 IP** 進行自動暫時封鎖。

## 觸發條件

短時間內該 IP 累積大量 4xx 請求（例如：無效 token、Token 格式錯誤、參數錯誤、超額請求等）將觸發自動封鎖。

正常使用者幾乎不會觸發此機制。觸發者多為：

- 爬蟲腳本使用過期或錯誤的 token 持續重送
- 沒有處理 API 錯誤回應，持續以相同錯誤條件重試
- 惡意以大量無效 token 嘗試破解或濫用資源

## 被封鎖時的 API 回應

被封鎖期間，所有對 API 的請求都會收到：

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

## 封鎖時長

被封鎖的 IP 會在 **30 分鐘後自動解除**，不需人工介入。但若解除後仍持續發送大量無效請求，會再次被封鎖。

## 避免被誤觸的建議

1. **Token 管理**

    - 收到 `TokenIllegal`（400）或 `TokenLevelTooLow` 回應時，代表 token 無效或權限不足，請 **停止以該 token 重試**
    - 重新 [登入](login.md) 取得新 token 後再使用

2. **錯誤處理**

    - 4xx 通常是請求本身的問題（參數格式、日期、資料集名稱、資料 id 等），請修正參數後再送，**不要無限 retry**
    - 5xx 可使用 exponential backoff 重試，但請限制重試次數

3. **請求速率**

    - 請參考 [壓力測試](StressTest.md) 了解 API 建議的請求速率
    - 超過您會員等級請求上限時會回 `402`，請升級會員或等待下個計費週期，詳見 [API 使用次數](api_usage_count.md)

4. **使用正確的端點與參數**

    - 請依 [快速開始](quickstart.md) 所示的端點與參數格式發送請求

## 誤封鎖申訴

若您為合法使用者而被誤封鎖，請來信告知以下資訊，我們會儘快協助解除：

- 您的來源 IP 位址（可透過 <https://ifconfig.me> 查詢）
- 使用的 token 或註冊 email
- 發生時間與情境

📧 聯絡信箱：<finmind.tw@gmail.com>
