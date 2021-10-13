const Diploma = artifacts.require('Diploma')
module.exports = function(_deployer) {
  _deployer.deploy(Diploma);
};
