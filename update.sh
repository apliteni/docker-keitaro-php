#!/bin/bash

render() {
sedStr="
  s!%%PHP_VEERSION%%!$version!g;
"

sed -r "$sedStr" $1
}

versions=(5.6 7.0 7.1 7.2 7.3)
for version in ${versions[*]}; do
  mkdir $version
  render Dockerfile.template > $version/Dockerfile
done