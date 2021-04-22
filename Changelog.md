# Change log

## unreleased (master)

### New Features

* Add dependabot config for gems and Dockerfile

### Changes

* Reverse sort articles list, better for pocket order
* Change config file from `app/config.yaml` to `app/config.yml`
* Allow CI failures on `ruby-head`
* Drop rubies older than 2.5 in CI, since them EOLed

### Fixes

* Do not crash if list of links contain unsafe data

## 0.2
* Add warning if not logged-in
* Add changelog
* Correctly show error if uploaded file was not correct JSON
* Fix problem with parsing json with BOM symbol

## 0.1
* initial release
