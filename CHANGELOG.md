# Changelog

## [0.6.0] • 2024-05

Adopted by Ky as a starting point to make a Git package of their own



## [0.5.0]

* **Breaking change** Fix strict Swift concurrency warnings. This required removing the `async` methods
from `Repository` and making them be extensions on `AsyncThrowingStream` and `FetchProgressStream` instead.

## [0.4.0]

* Add code to serialize Git connection settings
* Allow custom content in `SyncSettingsForm`

## [0.3.0]

* Bumped `static-libgit2` dependency to 0.5.0 to get MacCatalyst to work.

## [0.2.0]

### Added

- `data(for:)` is the new method for looking up data in the repository by object ID.

### Removed

- `lookupBlob()` -- too many variations and doesn't feel "Swifty."

## [0.1.0]

- First tagged version, used in two internal apps (Swift Ledger and Scriptorium)
