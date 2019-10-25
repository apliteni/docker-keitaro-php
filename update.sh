#!/bin/bash

render() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
  s!%%PHP_VARIANT%%!$variant!g;
  s!%%REDIS_VERSION%%!$redis_version!g;
  s!%%ALPINE_VERSION%%!$alpine_version!g;
"

sed -E "$sedStr" $1
}

variants=(fpm cli)
for variant in ${variants[*]}; do

  redis_version="-2.2.8"
  alpine_version=""
  versions=(5.6)
  for version in ${versions[*]}; do
    mkdir $version-$variant
    render Dockerfile.template > $version-$variant/Dockerfile
  done

  # excluding 7.0

  redis_version=""
  alpine_version=""
  versions=(7.1 7.2 7.3)
  for version in ${versions[*]}; do
    mkdir $version-$variant
    render Dockerfile.template > $version-$variant/Dockerfile
  done
done