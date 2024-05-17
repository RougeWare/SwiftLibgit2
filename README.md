# SwiftLibgit2

A modern, Swifty approach to interacting with Git



## Credit

This is based on [AsyncSwiftGit](https://github.com/bdewey/AsyncSwiftGit) by [Brian Dewey](https://bdewey.com).

When We went looking for a Git library to use in Swift, We were appalled to find only three:

- [Git](https://github.com/SwiftDocOrg/Git) by [Mattt](https://github.com/mattt) / [SwiftDoc.org](https://swiftdoc.org) – While a good example of how to do this, it's incomplete and has been archived/discouraged since 2021. 
- [static-libgit2](https://github.com/bdewey/static-libgit2), also by Brian Dewey, written to power AsyncSwiftGit. It's just a way to expose the raw libgit2 C library to Swift.
- **AsyncSwiftGit**, which is genuinely a good Swift package for using Git

There's just a few things about AsyncSwiftGit which We would have done differently, so this is Us doing those differently!
