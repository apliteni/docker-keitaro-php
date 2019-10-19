#!/bin/bash

render() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
"

sed -E "$sedStr" $1
}

versions=(56 70 71 72 73)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done