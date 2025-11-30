#!/usr/bin/env bash
# exit on error
set -o errexit

echo "===> Installing Ruby dependencies..."
bundle install

echo "===> Installing Node dependencies..."
npm install

echo "===> Precompiling assets..."
bundle exec rake assets:precompile
bundle exec rake assets:clean

echo "===> Running database migrations..."
bundle exec rake db:migrate

echo "===> Seeding database..."
bundle exec rake db:seed || echo "Warning: Seed failed, but continuing..."

echo "===> Build completed successfully!"
