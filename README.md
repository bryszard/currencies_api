# Currencies API

Small wrapper API for returning bunch of information about the exchange rates from https://api.exchangeratesapi.io/latest.

API includes 4 endpoints:
- /v1/currencies comma separated list of currencies, sorted in descending order (example: ZAR, EUR, AUD)
- /v1/currencies/show value of currency
- /v1/rates - it returns highest and lowest rate value (example: PLN - 4.2925, CAD - 1.5174)
- /v1/download - it returns json file with list currencies and rates ; use MD5 hash of json string as a filename -> [md5hash].json
