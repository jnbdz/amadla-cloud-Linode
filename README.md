<img src="./assets/linode-logo.svg" alt="Linode logo" style="width: 450px;" align="right">

# Linode
- https://www.linode.com/

## :key: Get The API Token
1. Go to the [API Tokens](https://cloud.linode.com/profile/tokens) page or: 
    - Click on your username on the right.
    - Click on *API Tokens* or you can.
2. Under the *API Tokens* tab click *Create a Personal Access Token*.
3. Give it a label.
4. Choose how long the token should exist.
5. The list of *Access* settings: 
    - **Account** - Read Only
    - **Databases** - None
    - **Domains** - Read/Write
    - **Events** - Read/Write
    - **Firewalls** - Read/Write
    - **Kubernetes** - None
    - **Images** - Read/Write
    - **IPs** - Read/Write
    - **Linodes** - Read/Write
    - **Longview** - Read/Write
    - **NodeBalancers** - None
    - **Object Storage** - Read/Write
    - **StackScripts** - None
    - **Volumes** - Read/Write
6. Click on *Create Token*
7. You should see a popup with the personal access token.
8. Copy the token or download it.
9. [Added the token to Vault](../../docs/adding-secrets-to-vault.md).

## :copyright: Credits
[./assets/linode-logo.svg](./assets/linode-logo.svg) - Copyright https://www.linode.com/