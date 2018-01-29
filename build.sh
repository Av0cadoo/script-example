#!/usr/bin/env bash
export COPYFILE_DISABLE=true

rm -rf dist;
rm dist.tar.gz;
mkdir dist;

echo "copying files to dist/ ...";

echo "Latest git commit: " `git log -1 --format="%cd %H"`
echo "build time: " `date '+%Y-%m-%d %H:%M:%S'` "| commit: " `git log -1 --format="%cd %H"` >> git.info
mv git.info dist/;

cp artisan dist/;
cp composer.json dist/;
cp composer.lock dist/;
cp server.php dist/;

cp -r app dist/;
cp -r config dist/;
cp -r database dist/;
cp -r helpers dist/;
cp -r resources dist/;
cp -r routes dist/;
cp -r vendor dist/;

mkdir -p dist/public/media/checkin;
cp -r public/folder/public/;
cp -r public/images dist/public/;
cp -r public/js dist/public/;
cp -r public/logo dist/public/;
cp -r public/supplier dist/public/;
cp public/.htaccess dist/public/;
cp public/chat.js dist/public/;
cp public/favicon.ico dist/public/;
cp public/index.php dist/public/;
cp public/mix-manifest.json dist/public/;
cp public/robots.txt dist/public/;
cp public/templates.js dist/public/;

mkdir -p dist/bootstrap/cache
cp bootstrap/app.php dist/bootstrap/app.php

mkdir dist/storage
mkdir dist/storage/app
mkdir dist/storage/framework
mkdir dist/storage/framework/cache
mkdir dist/storage/framework/sessions
mkdir dist/storage/framework/views
mkdir dist/storage/logs

cd dist && find . -name '.DS_Store' -type f -delete && cd ..
cd dist && composer dumpautoload && cd ..

tar -zcvf dist.tar.gz dist

echo "success";

export COPYFILE_DISABLE=false
