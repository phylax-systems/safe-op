# Optimism-Safe

- Exposes the Gnosis safes nonces via the Prometheus endpoint. Read more in the [docs](https://graph.phylax.watch/docs/Guides/Develop/How+to+Develop+a+new+Task).
- Checks if the nonce has changed in relation to the last block

## Usage

- Deploy phylax. Read the [docs](https://graph.phylax.watch/docs/Guides/Operate/Configuration+management+using+GitOps)
- Point phylax to this git repository. Read more about config management via GitOps in the [docs](https://graph.phylax.watch/docs/Guides/Operate/Configuration+management+using+GitOps)

## Development

- To install new libraries, you need to run `forge install --no-git <LIB>` at the root of the repository and then manually copy-paste the library from `./lib/<LIB>` to `./alerts/nonce/lib/<LIB>`. This is due to some bug in **Foundry**. Currently investigating. All libraries need to be comitted to the config, as Phylax simply clones it. It can't handle dependencies because Foundry can't as well.
- To build, run from the root of the config repo `forge build --root alerts/nonce`
- To test, run from the root of the config repo `forge test --root alerts/nonce`