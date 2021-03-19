# Instala as Gems
bundle check || bundle install
 
bundle exec rake rabbitmq:setup
bundle exec sneakers work OrderWorker --require app/workers/order_worker.rb
