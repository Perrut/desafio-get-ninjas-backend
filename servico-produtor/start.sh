# Instala as Gems
bundle check || bundle install

bundle exec rails db:create db:migrate
# Roda nosso servidor
bundle exec puma -C config/puma.rb
