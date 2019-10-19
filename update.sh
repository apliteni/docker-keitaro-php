#!/bin/bash

render() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
"

sed -E "$sedStr" $1
}

# base images
versions=(56 70 71 72 73)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done

# images with composer
versions=(56 70 71)
for version in ${versions[*]}; do
  mkdir ${version}-composer
  render Dockerfile.composer.template > ${version}-composer/Dockerfile
done