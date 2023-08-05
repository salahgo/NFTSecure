const OliveOilQualityAssurance = artifacts.require("OliveOilQualityAssurance");

module.exports = function(deployer) {
  deployer.deploy(OliveOilQualityAssurance);
};