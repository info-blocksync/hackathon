
module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  // contracts_build_directory: "./build/contracts",
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*", // Match any network id
      gas: 4700000
    },
    rinkeby: {
      host: "127.0.0.1", // Connect to geth on the specified
      port: 8545,
      from: "", // default address to use for any transaction Truffle makes during migrations
      network_id: 15,
      gas: 6000000 // Gas limit used for deploys
    }
  }
};
