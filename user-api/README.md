#simpleUserCrud backEnd

based on [https://api-platform.com](https://api-platform.com)

## Setup
1. Use [Composer](https://getcomposer.org/) to install project:
    `composer install`
1. Copy `user-api/app/config/parameters.yml.dist` to `user-api/app/config/parameters.yml` with current environment config
1. Run `php bin/console doctrine:database:create` to create database
1. Run `php bin/console doctrine:schema:update --force` to generate database schema

## Run server
- Use `php app/console server:run` to start server
