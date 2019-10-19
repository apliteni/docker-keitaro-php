#!/bin/bash

render() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
"

sed -E "$sedStr" $1
}

# base images
versions=(5.6 7.0 7.1 7.2 7.3)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done
