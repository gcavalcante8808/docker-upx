<h1 align="center"><code>docker-upx</code></h1>

<div align="center">
  <a href="https://www.buymeacoffee.com/gcavalcante8808">
    <img src="https://img.shields.io/badge/-buy_me_a%C2%A0coffee-gray?logo=buy-me-a-coffee" alt="buy me a coffee">
  </a>
</div>
<br>

`docker-upx` is a docker ready image for [UPX](https://github.com/upx/upx) with a statically pre-built version that you can call directly:

```bash
docker run -it --rm gcavalcante8808/upx:v4.2.2 --version
```

Or use it on a Dockerfile to copy the upx binary:

```Dockerfile
FROM gcavalcante8808/upx:v4.2.2 as upx

FROM python:3.12-slim
COPY --from=upx /usr/local/bin/upx /usr/local/bin/upx
RUN /usr/local/bin/upx --version
```

### Author

Author: Gabriel Cavalcante (gabriel.cavalcante88 at gmail.com)
