<img src="./assets/linode-logo.svg" alt="Linode logo" style="width: 450px;" align="right">

# :cloud: Linode
- https://www.linode.com/

## :running: Quickstart
Four easy steps for a quickstart: 

1. [Get the API key](#key-get-the-api-token)
2. Set **LINODE_API_TOKEN** as a key with the secret in Vault or in the `.env` file or `export`
3. Run the command: `amadla server-image build Linode Base` (`Base` is the name of the sevrer module, you can use anything else)
4. To see the image created go to: https://cloud.linode.com/images

## :key: Get The API Token
1. Go to the [API Tokens](https://cloud.linode.com/profile/tokens) page or: 
    - Click on your username on the right.
    - Click on *API Tokens* or you can.
2. Under the *API Tokens* tab click *Create a Personal Access Token*.
3. Give it a label.
4. Choose how long the token should exist.
5. The list of [*Access* settings](./assets/linode-access-selection.png): 
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

## :round_pushpin: Environment Variables
- **LINODE_API_TOKEN** (required) - The variable name is different from one cloud to another. It is important for Packer and Terraform to be able to send requests to the cloud service provider to generate the server images and the infratructure. This value can be set in your environment variable with: 
    - `.env` file
    - `export` command
    - Vault - Make sure it is in the right path
- **SERVER_IMAGE_NAME** (optional) - The server image name with the date time in the name. The default name is the name of the server module being used plus the date time. Note: the date time is seperate.
- **SERVER_IMAGE_DESCR** (optional) - The description of the server image. By default: *{server module name} server image generated by amadla-cli.*
- **SOURCE_BASED_IMAGE** (optional) - Every cloud service provider have their own based server images with which you can create your own server image. For Linode you can use this command to find all the based server images: `curl -s https://api.linode.com/v4/images | jq | grep rocky` (make sure you have `curl` and `jq` installed) you can also use your browser or even [Postman](https://www.postman.com/) to get the server image list. You can use whatever image you want but make sure the server module your are using is compitable with that image. Since by default Amadla supports [Rocky OS](https://rockylinux.org/) (similar to [RedHat](https://www.redhat.com/en)) you might run into issues if you use any other Linux distributions. Amadla is very flexible so you can easily copy one of the server modules and modify them to support another distribution but we recommend staying with Rocky OS or RedHat. The default image: `linode/rocky9`.
- **SOURCE_REGION** (optional) - Many cloud services have server farms in different places around the country or/and around the world. So more often than not you need to specify a region. The default region: `us-east`.
- **ANSIBLE_PLAYBOOK_PATH** (optional) - This is pass by `amadla-cli`. It is by default the absolute path to the Ansible playbook of the server module that you chose. You can always change to another path that points to a Ansible playbook.

## :lock_with_ink_pen: Set API Key

For Linode the environment variable name is: **LINODE_API_TOKEN**

- Vault setup: 
    - When adding the API key make the key name of the secret is the same as the environment variable name: **LINODE_API_TOKEN**
    - Also make sure you use the right path and that you are using [*key/value* as the storage engine](https://developer.hashicorp.com/vault/docs/secrets/kv/kv-v2)
- Environment variable: 
    - You can also `export` the value in the same terminal session where you are executing `amadla-cli` or in the `.env` file

## :copyright: Credits
[./assets/linode-logo.svg](./assets/linode-logo.svg) - Copyright https://www.linode.com/