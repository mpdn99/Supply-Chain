﻿docker exec -e OSN_TLS_CA_ROOT_CERT=../config/organizations/ordererOrganizations/orderer.example.com/ordering-service-nodes/osn1.orderer.example.com/tls/cacerts/tls-ca-cert.pem -e ADMIN_TLS_SIGN_CERT=../config/admin-client/client-tls-cert.pem -e ADMIN_TLS_PRIVATE_KEY=../config/admin-client/client-tls-key.pem cli osnadmin channel join --channelID supplychain --config-block ../channel-artifacts/genesis.block -o localhost:7053 --ca-file "$ORDERER_CA" --client-cert "$ORDERER_ADMIN_TLS_SIGN_CERT" --client-key "$ORDERER_ADMIN_TLS_PRIVATE_KEY"