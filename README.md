# Blockchaintech

## Ancillary functions to `binanceusr`

This code assists with binanceusr functions, such as setting the quantity ahead of a trade.


### Examples: 

```r
library(blockchaintech)

token <- 'BTC'
amount <- 20
side <- 'BUY


quantity <- set_quantity('BTC', 20, 'BUY')
```

Set API Key:
API key must first be established through `binance.US`

```r
library(binanceusr)
key <- 'abc'
secret <- 'xyz'
binance_credentials(key, secret)
```

Send an order to Binance.US:

```r
lastTicker <- binance_ticker_price(symbol)
lastPrice <- lastTicker$price

binance_new_order(symbol, side = side, type = 'LIMIT', price = lastPrice, quantity = quantity, time_in_force = 'GTC', test = T)
```
