const ZodiacTest = artifacts.require('./web-app/src/contracts/ZodiacTest.sol')

module.exports = function (deployer) {
  deployer.deploy(ZodiacTest)
}
