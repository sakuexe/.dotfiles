#!/usr/bin/env bash

# Finds the website's sitemap and requests all the pages
# on it. Useful for finding dead links and health checking.

WEBSITE_URL=$1

if [ -z "$WEBSITE_URL" ]; then
  echo "Usage: sitemapper.sh <website_url>"
  exit 1
fi

# Get the robots.txt file
ROBOTS=$(curl -s -X GET "$WEBSITE_URL/robots.txt")
# And extract the sitemap URL
SITEMAP_URL=$(echo "$ROBOTS" | grep -oP 'Sitemap:\s*\K\S+')

SITEMAP=$(curl -s -X GET "$SITEMAP_URL")

echo "$SITEMAP" | grep -oP '(?<=<loc>).*?(?=</loc>)' | while read -r url; do
  curl -s -o /dev/null -w "[%{http_code}] (%{time_total}s) $url\n" "$url"
done
