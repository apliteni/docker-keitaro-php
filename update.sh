#!/bin/bash

render() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
  s!%%REDIS_VERSION%%!$redis_version!g;
"

sed -E "$sedStr" $1
}

# base images
redis_version="-2.2.8"
versions=(5.6 7.0)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done

redis_version=""
versions=(7.1 7.2 7.3)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done
