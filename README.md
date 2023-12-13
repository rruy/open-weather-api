# README

Projeto para implementação de integração com a OpenWeatherSdk


## Instalação e configurações

#### Para instalação dos pacotes necessários:

```shell
bundle install
```

#### Para instalação e configuração do projeto execute os seguintes comandos:

```shell
bundle exec rake db:drop db:create db:migrate db:seed
```

#### Para executar o rails utilize o comando abaixo:

```shell
bundle exec rails s
```

Após executar os passos acima já é possivel realizar uma requisão de previsão do tempo.

Para criar uma requisição de previsão do tempo


POST: http://localhost:3000/api/weather


Payload:


```shell
{
    "city": { "name": "Porto Alegre"}
}
```

Resultado experado:

```shell
{
    "forecast": "23°C e Sol em Porto Alegre em 12/12. Média para os próximos dias: 26.36°C em 13/12, 27.80°C em 14/12, 28.88°C em 15/12, 26.68°C em 16/12, 29.58°C em 17/12, 28.89°C em 18/12."
}
```

Example:

![Alt text](/forecast_postman.png?raw=true "Request Postman")

