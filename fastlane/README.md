fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios code_format
```
fastlane ios code_format
```
Lint and format code
### ios code_lint
```
fastlane ios code_lint
```
Lint code
### ios sort_files
```
fastlane ios sort_files
```
Sort Xcode project files
### ios create_new_profiles
```
fastlane ios create_new_profiles
```
Create all new provisioning profiles managed by fastlane match
### ios download_profiles
```
fastlane ios download_profiles
```
Download certificates and profiles
### ios add_device
```
fastlane ios add_device
```
Add a new device to provisioning profile
### ios build_dev_app
```
fastlane ios build_dev_app
```
Build development app
### ios tests
```
fastlane ios tests
```
Run unit tests
### ios archive_internal
```
fastlane ios archive_internal
```
Creates an archive of the Internal app for testing
### ios archive_appstore
```
fastlane ios archive_appstore
```
Creates an archive of the Production app with Appstore distribution

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
