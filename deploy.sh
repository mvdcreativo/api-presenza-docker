docker-compose up -d

# Change to the docker directory
#cd docker_directory || true

# Turn on maintenance mode
docker-compose run --rm artisan down || true

# Pull the latest changes from the project repository
if test -d src; then
        cd src || exit
            git pull origin master
        cd .. || exit
else
        git clone https://github.com/mvdcreativo/presenza_api_v1.git src
fi
# Install/update composer dependecies
docker-compose run --rm composer install --ignore-platform-reqs --no-interaction --prefer-dist --optimize-autoloader --no-dev

# # Run database migrations
# docker-compose run --rm artisan migrate --seed --no-interaction 


# # Clear caches
# docker-compose run --rm artisan cache:clear

# # Clear expired password reset tokens
# docker-compose run --rm artisan auth:clear-resets

# # Clear and cache routes, config, event and views
# docker-compose run --rm artisan route:cache
# docker-compose run --rm artisan config:cache
# docker-compose run --rm artisan event:cache
# docker-compose run --rm artisan view:cache


# # Restart queue worker daemons after their current job
# docker-compose run --rm artisan queue:restart

# # Passport
# docker-compose run --rm artisan passport:install


# # Install node modules
# #docker-compose run --rm npm ci

# # Build assets using Laravel Mix
# #docker-compose run --rm npm run production

# # Turn off maintenance mode
# docker-compose run --rm artisan up

echo 'Deploy finished.'