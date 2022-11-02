1. Generate crypto material
    cryptogen generate --config=./crypto-config.yaml --output=./organizations
2. Generate Genesis block
    configtxgen -profile SupplyChainGenesis -outputBlock ./channel-artifacts/genesis.block -channelID supplychain
3. Generate Channel transaction file
    configtxgen -profile SupplyChainChannel -channelID supplychain -outputCreateChannelTx ./channel-artifacts/channel.tx
4. Generate Anchor peers
    configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/SupplierMSPanchors.tx -asOrg Supplier
    configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/ManufacturerMSPanchors.tx -asOrg Manufacturer
    configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/DistributorMSPanchors.tx -asOrg Distributor
    configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/RetailerMSPanchors.tx -asOrg Retailer
    configtxgen -profile SupplyChainChannel -channelID supplychain -outputAnchorPeersUpdate ./channel-artifacts/CustomerMSPanchors.tx -asOrg Customer
5. Create channel
    docker exec cli peer channel create -o orderer.example.com:7050 -c supplychain -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

Give permission for app
    sudo chmod +x file