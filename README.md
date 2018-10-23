# About
Doggy Walkie ethereum smart contract

[![CI Status)](https://img.shields.io/travis/Doggy/Walkie.svg)](https://travis-ci.org/DoggyWalkie/eth-contract)

# Install
You should have [node.js](https://nodejs.org/en/) installed. After
that use `npm` to install packages mentioned in `package.json`.
```bash
npm install
```
This pulls in dependencies of our `DoggyWalkie` smart-contract,
`truffle` development tool, and stores them in local `node_modules`
directory, which is a standard way to install stuff for JavaScript
development.

# Testing
```bash
npx truffle test
```

`npm` can install binaries if they come with a package. `npx` is used
to find and execute such binaries. `npm` also provides `npm run`
command, but this one executes commands by names listed in
`package.json` `scripts` section.

Running tests with configured `npm` scripts command.
```bash
npm run test
```

There is also as special shortcut that does the same thing for the
`test` section.
```bash
npm test
```

# Compile
```bash
npm run compile
```

Compiled asset will be available on 'build' folder.
