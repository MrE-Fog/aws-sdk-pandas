#!/usr/bin/env bash
set -ex

pushd ..
rm -rf docs/build docs/source/stubs
make -C docs/ html
doc8 --max-line-length 120 docs/source
