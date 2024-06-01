web: bundle exec puma -C config/puma.rb
release: bash -c 'rm db/development.sqlite3 && touch db/development.sqlite3 && bundle exec rails db:migrate && bundle exec rails db:seed'