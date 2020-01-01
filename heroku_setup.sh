#!/bin/bash
heroku create
heroku config:push
git push heroku master
heroku run rake db:migrate
# heroku logs --tail
# heroku run rails console
