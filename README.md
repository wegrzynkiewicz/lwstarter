## Installation

```
env $(cat .env.secrets | xargs) envsubst < .env.example > .env
```
