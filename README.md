# Wonderfull Fridge

This repository is part of [Pennylane](https://www.pennylane.tech/) - Technical Test

The goal of this test is to write a small web application displaying possible cooking recipes according to given ingredients.

## Test criteria

- Simple
- UI needed : fonctionnal > pretty
- Extensible
- Robust Design (don't overlook features)

## Setup

- Clone this repository and go in.
- `bundle install` assuming you have a ruby environnement.
- Make sure to declare `ENV['DATABASE_USER']` `ENV['DATABASE_PASSWORD']` locally.
- `rake db:create && rake db:seed`
- `rails s` and `bin/webpack-dev-server` in two different terminal tabs.
- Check your browser on [localhost](http://localhost:3000/)

This project is deployed on [Heroku](https://wonderfull-fridge.herokuapp.com/)
