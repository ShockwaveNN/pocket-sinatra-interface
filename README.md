# pocket-sinatra-interface

Sinatra-based web interface for pocket api
Based on demo-server from [pocket-ruby](https://github.com/turadg/pocket-ruby)

## How to init

```bash
docker build -t pocket-sinatra-interface .
docker run -d -p 8080:80 --name pocket-sinatra-interface --restart=always pocket-sinatra-interface
```
