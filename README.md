# toshi-container
Toshi is a full-text search engine in rust. The code repo can be found here: https://github.com/toshi-search/Toshi.

## Environment Variables
|Variable|Value|
|--------|-----|
|PORT    |8080 | 
|DATAPATH|data/|
|WRITERMEMORY|200000000|
|LOGLEVEL|info|
|JSONPARSINGTHREADS|4|
|BULKBUFFERSIZE|10000|
|AUTOCOMMITDURATION|10|
|KIND|log|
|MINMERGESIZE|8|
|MINLAYERSIZE|10_000|
|LEVELLOGSIZE|0.7|

These variables are used to build the default `config.yml` in `/etc/toshi/config.yml`.
If you like to use your own configuration file, just put it in `/etc/toshi/config.yml`. If the startscript finds a config there, it ignores the default values.
`docker run -d -v /path/to/config.yml:/etc/toshi/config.yml buddyspencer:toshi/latest`

## Persistant Storage
`docker run -d -v /mnt/data:/data buddyspencer:toshi/latest`