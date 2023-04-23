#' Sets quantity of token 
#' @param symbol string
#' @param amount enum in BUSD 
#' @param side string BUY or SELL
#' @return R object
#' @importFrom binanceusr binance_ticker_price
#' @importFrom binanceusr binance_filters
#' @export
#' @examples \dontrun{
#' set_filters('BTC', amount = 20, side = 'BUY')
#' }
set_quantity <- function(token, amount, side) {
  
  symbol <- paste0(token,'BUSD')
  
  lastTicker <- binance_ticker_price(symbol)
  
  lastPrice <- lastTicker$price
  
  quantity <- amount/lastPrice;quantity
  
  filters <- binance_filters(symbol)
  
  #Set price digit constraints
  s <- filters[filterType == 'PRICE_FILTER', minPrice];s
  
  roundPrice <- nchar(strsplit(as.character(s), ".", fixed = T)[[1]][2]);roundPrice
  
  lastPrice <- round(lastPrice, roundPrice);lastPrice
  
  t <- filters[filterType == 'LOT_SIZE', minQty];t
  
  if (t < 1) {
    roundQuantity <- nchar(strsplit(as.character(t), ".", fixed = T)[[1]][[2]]);roundQuantity
    quantity <- round(quantity, roundQuantity);quantity
  } else {
    if (t == 1) {
      quantity <- round(quantity)
    }
  }
  
  paste0(symbol, " will be ordered (check order type) for: $", round(lastPrice*quantity,2), " at the price of $", lastPrice, " base asset.")
  
  return(quantity)
}