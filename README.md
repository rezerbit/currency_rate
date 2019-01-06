# currency_rate

📈The application which fetches, stores and displays currency exchange rate.

[![CI](https://drone.rezerbit.com/api/badges/rezerbit/currency_rate/status.svg "")](https://drone.rezerbit.com/rezerbit/currency_rate)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/cd32e7974e814ba38512bf4942c4f984)](https://www.codacy.com/app/rezerbit/currency_rate?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=rezerbit/currency_rate&amp;utm_campaign=Badge_Grade)
[![Codecov](https://codecov.io/gh/rezerbit/currency_rate/branch/master/graph/badge.svg)](https://codecov.io/gh/rezerbit/currency_rate)

Demo: https://currency_rate.rezerbit.com/

![demo](demo.png)

## Development

```bash
docker compose up
docker exec -ti currency_rate-app bash
```

## Deploy

Build and push images

```
cd docker && ./build_and_push.sh
```

On server:

```
cd docker
vim .env.prod
./deploy.sh
```

# License
MIT
