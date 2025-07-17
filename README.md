# restrers-fanbook2025
リストラーズ大百科Vol.2原稿予定地

# docker

```
#ビルド
docker compose build
#実行
docker compose run --rm reiew review
# コンテナのシェルに入る(終わると消えるのでDockerfileに書いてbuildをやり直す)
docker compose run --rm reiew /bin/bash
```

# review

- 初期化 `docker compose run --rm review review init -f .`
- 初期化(ウィザード) `docker compose run -p 8080:18000 --rm review review init -f .`
PCのブラウザで http://localhost:8080 で初期設定ウィザードから初期化できる