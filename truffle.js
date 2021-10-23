const HDWalletProvider = require("@truffle/hdwallet-provider");
// const mnemonic = "wheel also lizard feed arctic guide capable tourist error harvest rotate melt";
const mnemonic = "blood depth promote know cool hammer raw island coconut banner pipe first";

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '5777'
    },
    rinkeby: {
      provider: function(){
         return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/f7c000b300854c26a5af6703d2e0d6dd") 
      },
      network_id: 4,
      gas: 4500000,
      gasPrice: 10000000000,
      skipDryRun: true
    }
  },
  contracts_directory: './contracts/',
  contracts_build_directory: './abis/',
  compilers: {
    solc: {
      version: "^0.6.0",
      // optimizer: {
      //   enabled: true,
      //   runs: 200
      // }
    }
  }
}
