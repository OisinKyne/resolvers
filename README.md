# Resolvers

[![Build Status](https://travis-ci.org/ensdomains/resolvers.svg?branch=master)](https://travis-ci.org/ensdomains/resolvers) [![License](https://img.shields.io/badge/License-BSD--2--Clause-blue.svg)](LICENSE)

A collection of resolvers for ENS domains

## Built With

- [Truffle](https://github.com/trufflesuite/truffle) - Ethereum development environment

## Authors

- **Dean Eigenmann** - [decanus](https://github.com/decanus)

See also the list of [contributors](https://github.com/ensdomains/resolvers/contributors) who participated in this project.

## Cheatsheet

If you are having trouble with getting this repo to compile, you can flatten all of the .sol files into one by using `truffle-flattener` as such:

```
npx truffle-flattener ./contracts/PublicResolver.sol > ./contracts/FlattenedPublicResolver.sol
```

## License

This project is licensed under the BSD 2-clause "Simplified" License - see the [LICENSE](LICENSE) file for details
