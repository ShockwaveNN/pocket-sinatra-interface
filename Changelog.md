# Change log

## unreleased (master)

### New Features

* Add dependabot config for gems and Dockerfile
* Add docker build stage to CI
* Add `markdownlint` support in CI and fix issues
* Add `ruby-3.0` in Ci
* Use `puma` as default server

### Changes

* Reverse sort articles list, better for pocket order
* Change config file from `app/config.yaml` to `app/config.yml`
* Allow CI failures on `ruby-head`
* Drop rubies older than 2.6 in CI, since them EOLed

### Fixes

* Do not crash if list of links contain unsafe data
* Fix errors in Dockerfile
* Fix Dockerfile warning about usage of `bundle install --without`

## 0.2

* Add warning if not logged-in
* Add changelog
* Correctly show error if uploaded file was not correct JSON
* Fix problem with parsing json with BOM symbol

## 0.1

* initial release
