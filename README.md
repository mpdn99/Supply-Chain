1. Generate crypto material
    ../bin/cryptogen generate --config=./crypto-config.yaml --output=./organizations
2. Generate Genesis block
    ../bin/configtxgen -profile SupplyChainGenesis -outputBlock ./channel-artifacts/genesis.block -channelID supplychain
3. Generate Channel
    ../bin/configtxgen -profile SupplyChainChannel -channelID supplychain -outputCreateChannelTx ./channel-artifacts/channel.tx
4. Generate Anchor peer
    ../bin/configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/SupplierMSPanchors.tx -asOrg Supplier
    ../bin/configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/ManufacturerMSPanchors.tx -asOrg Manufacturer
    ../bin/configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/DistributorMSPanchors.tx -asOrg Distributor
    ../bin/configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/RetailerMSPanchors.tx -asOrg Retailer
    ../bin/configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/CustomerMSPanchors.tx -asOrg Customer

Give permission for app
    sudo chmod +x file