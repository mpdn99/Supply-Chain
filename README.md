1. Generate crypto material
    ../bin/cryptogen generate --config=./crypto-config.yaml --output=./organizations
2. Generate Genesis block
    ../bin/configtxgen -profile SupplyChainGenesis -outputBlock ./channel-artifacts/genesis.block -channelID supplychain
3. Give permission for app
     sudo chmod +x file