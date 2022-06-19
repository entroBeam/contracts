'''
IMPORTANT SECURITY NOTE:
The private key input uses the getpass_asterisk module.
getpass_asterisk module has been modified to add getpass_asterisk, which can
echo asterisks in place of password. Echoing of masked password leaks
the length of the password.
Use this utility only in a scenario where passwords are always of fixed length.
This utility was created to receive secret tokens as input which are always of
same size. Echoing the asterisks helped improve user experience.
Use at your own risk. Only use for taking constant length secret inputs.
For feedback, contact: Muhammad Akbar (akbarATsecursive.com)
'''

from web3 import Web3
from web3.middleware import geth_poa_middleware
import os
import secrets
from web3.auto import w3
from eth_account.messages import encode_defunct
from getpass_asterisk.getpass_asterisk import getpass_asterisk
from EntroBEAM_ABI import abi

print ('+--------------------------------------------+')
print ('|      EntroBeam - Entropy Miner (Beta)      |')
print ('+--------------------------------------------+')

# User Account set
WEB3provider = input('Please enter your Web3.HTTPProvider : ')

while True:
    try:
        public_key = Web3.toChecksumAddress(input('Please enter your Address : '))
        break
    except KeyboardInterrupt:
        exit()
    except:
        print('Incorrect address format. Try again.')
        continue
private_key = getpass_asterisk('Please enter the above address secret key : ')

web3 = Web3(Web3.HTTPProvider(WEB3provider))
web3.middleware_onion.inject(geth_poa_middleware, layer=0)
EIX_main_contract_address = Web3.toChecksumAddress('0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1')
contract_instance = web3.eth.contract(address = EIX_main_contract_address , abi = abi)

# Generate signature
msg= "message"
message = encode_defunct(text=msg)
signed_message = w3.eth.account.sign_message(message, private_key=private_key)

# Verify signature
if public_key == w3.eth.account.recover_message(message, signature=signed_message.signature):
    print('Your account has been verified.')
else:
    print('Account verification failed.')
    exit()

print("Web3 version :", web3.api)
print("Client version :", web3.clientVersion)
print("Chain Id :", web3.eth.chain_id)

EIXcheck1 = contract_instance.functions.Assigned_EntropyChain_length().call()
EIXcheck2 = contract_instance.functions.Assigned_EntropyChain_length().call()
token_symbol = contract_instance.functions.symbol().call()
print(token_symbol, "Assigned_EntropyChain_length :", EIXcheck1)
print(token_symbol, "FormationNumber :", EIXcheck2)

i = 1
while True:
    # Get the nonce.  Prevents one from sending the transaction twice
    nonce = web3.eth.getTransactionCount(public_key)
    account_balance = web3.fromWei(web3.eth.getBalance(public_key, 'latest'), 'ether')
    print('Account Tx nonce :', nonce)
    print('Mining sequence :', i)
    print('Account Balnce :', account_balance)

    try:
        # Generates a 256-bits hexadecimal random string.
        seed = secrets.token_hex(32)
        print('256-bit hexadecimal : 0x' + seed)

        # Build a transaction
        sendEntropySeed = contract_instance.functions.EntropyByUsers('0x' + seed).buildTransaction(
            {
                "gasPrice": web3.eth.gas_price,
                'from' : public_key,
                'nonce' : nonce
            }
        )

        # sign transaction
        signed_tx_entropy = web3.eth.account.sign_transaction(sendEntropySeed, private_key)

        # send transaction
        tx_hash_entropy = web3.eth.sendRawTransaction(signed_tx_entropy.rawTransaction)
    
        # get tx hash
        print('Transaction Hash :', web3.toHex(tx_hash_entropy))

        # Waits for the transaction specified by transaction_hash to be included in a block, then returns its transaction receipt.
        print('Waiting for block confirmation.....')
        print(web3.eth.wait_for_transaction_receipt(tx_hash_entropy))
        print('Entropy mining Tx generation complete!\n')

        i += 1
    except KeyboardInterrupt:
        exit()
    except:
        print('Tx generation failed. Move on to the next block. and make sure you have enough gas in your account.\n')