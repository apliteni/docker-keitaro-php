#!/bin/bash

render() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
  s!%%ALPINE_VERSION%%!$alpine_version!g;
"

sed -E "$sedStr" $1
}

# base images
alpine_version=3.7
versions=(5.6 7.0)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done

alpine_version=3.8
versions=(7.1 7.2 7.3)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done
