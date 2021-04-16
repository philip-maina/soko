MoneyRails.configure do |config|
  config.default_currency = "KES"
  config.locale_backend = nil
  config.rounding_mode = BigDecimal::ROUND_HALF_UP
  config.default_format = {
    format: "%u %n",
    thousands_separator: ","
  }
end