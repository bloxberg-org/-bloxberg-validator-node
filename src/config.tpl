[parity]
chain = "/build/openethereum/validator-data/bloxberg.json"
base_path = "/build/openethereum/worker"

[network]
port = 30303
reserved_peers = "/build/openethereum/validator-data/bootnodes.txt"
nat = "__NAT_IP__"
discovery = true

[rpc]
port = 8545
apis = ["web3", "eth", "net", "personal", "parity", "parity_set", "traces", "rpc", "parity_accounts"]
interface = "local"

[websockets]
disable = false
port = 8546
interface = "local"
origins = ["none"]

[account]
password = ["/build/openethereum/validator-data/validator.pwd"]

[mining]
#CHANGE ENGINE SIGNER TO VALIDATOR ADDRESS
engine_signer = "__ENGINE_SIGNER__"
reseal_on_txs = "none"
force_sealing = true
min_gas_price = 1000000
gas_floor_target = "10000000"

[footprint]
tracing = "off"
pruning = "auto"
pruning_history = 128
cache_size_db = 256
cache_size = 512

[misc]
log_file = "/build/openethereum/log/bloxberg.log"
