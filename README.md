# EntroBeam
### Generate Secure Entropy sources

### What Is EntroBeam (EIX)?
EntroBeam is a blockchain project that generates an indispensable Entropy in computer science. 

EntroBeam is the native utility token and currently has the following features:
* [Entropy Registry](https://www.entrobeam.org/features/entropy-registry): A database stores entropy 256bits hex-string seeds sent by users and the secure Entropy generated by the contract.
* [Entropy Chain](https://www.entrobeam.org/features/entropy-chain): is another set belonging to the entropy registry set. It is a set used to determine which Entropy to deliver to a user entropy that has not yet been assigned a secure entropy (reveal or settle seed).
* [Shuffle Entropy](https://www.entrobeam.org/features/shuffle-entropy): By applying various algorithms, the gas fees (10^-18) in the entropy chain and the user's 256-bit seed are mixed to generate the secure Entropy with the avalanche effect applied.
* [Entropy Mining](https://www.entrobeam.org/features/entropy-mining): The act of users paying gas fees and creating entropy registry TXs has a similar aspect to mining, which generates hash power by paying electricity and equipment costs. The more transactions flow into the contract, the more reliable the secure Entropy.

### What Is Entropy?
* [Citing NIST 800-90A](https://csrc.nist.gov/publications/detail/sp/800-90a/rev-1/final), "The entropy source produces random bitstrings to be used by an RBG." (Random Bits Generator, RNG: Random Number Generator).
* [Citing NIST 800-90B](https://csrc.nist.gov/publications/detail/sp/800-90b/final), "The three main components of a cryptographic RBG are a source of random bits (an entropy source), an algorithm for accumulating and providing random bits to the consuming applications, and a way to combine the first two components appropriately for cryptographic applications."

Entropy is used as the source of the RGB, which is the cornerstone of Digital Signature, Public-key Encryption, and Key-establishment—moreover applies to sampling and modeling of probability distributions, what essential for data analysis and machine learning.

### How can I get EIX tokens?
* Only [Entropy Mining](https://www.entrobeam.org/how-to-guides/getting-started) will supply EIX tokens. Anyone, including owners, cannot create/supply EIX by any other method.
* Annual supply decreases by 0.1% per year from 30,000,000 EIX. Calculations are based on Unix TimeStamp(Epoch) and are approximate. So, with or without users seed Txs, EIX will reduce the token supply, and without users, EIX may not be able to fill the annual supply.
* The annual supply is calculated as the supply per transaction. Therefore, if there is only one TX user in one block, one person receives all the rewards in the block. If there is more than one user, the rewards are divided and distributed.
* The rewards per block can be checked by calling rewardsPerBlock in the EntroBeam Contract. [rewardsPerBlock (Decimals:18, wei unit)](https://bscscan.com/readContract?m=normal&a=0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1&v=0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1&t=false#readCollapse17)

### What is Entropy used for?
* RBG: Random bit generators(RBG, Random number generators (RNGs)) are essential for various computer processes, such as cryptography, simulations, machine learning, gaming, programming, gambling, scientific studies, statistical sampling, and the list goes on.
* Probability Distribution: A probability distribution is the mathematical function of a random phenomenon in terms of its sample space and the probabilities of occurrence of various possible outcomes. Most processes occurring in the world around us can be described by probability distributions analyzed. It’s inextricably linked to the data science model.

### How can I use it?
* When you [send 256-bits hex string seed](https://www.entrobeam.org/how-to-guides/getting-started) (SHA256 format, including 0x), if a user transaction occurs after the [Formation Number](https://bscscan.com/readContract?m=normal&a=0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1&v=0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1&t=false#readCollapse5) ([Code comment](https://github.com/entroBeam/contracts/blob/aea64f17758a3e980dc10e3aaa97867bfd4e1e81/EntroBeam/EntroBeam_main_v1.0.0.sol#L9)), Secure Entropy is assigned.
* Most of the EntroBeam Contract functions and variables are declared public except for the potential for security vulnerabilities to arise. You can freely inherit to query and utilize the entropy registry. Refer to globally available [variables and functions](https://www.entrobeam.org/how-to-guides/globally-available-variables-and-functions) and [Source Code](https://github.com/entroBeam/contracts/blob/main/EntroBeam/EntroBeam_main_v1.0.0.sol) with detailed annotation.
* Even if users do not generate a transaction, the user can obtain secure entropy by regulating a transaction that will occur in the future as a contract and then querying the Entropy Registry.

**Please, Refer to [EntroBeam Website](https://www.entrobeam.org/)**

## Inheritance contract and the library
| BSC Source Code | Source Code |
| ------ | ------ |
| ***EntroBeam_main.sol*** | |
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F1#L24 | https://github.com/entroBeam/contracts/blob/main/EntroBeam/EntroBeam_main_v1.0.0.sol |
| import "ERC20Upgradeable.sol"; | import "@openzeppelin/contracts-upgradeable@4.3.0/token/ERC20/ERC20Upgradeable.sol"; |
| import "Initializable.sol"; | import "@openzeppelin/contracts-upgradeable@4.3.0/proxy/utils/Initializable.sol"; |
| import "OwnableUpgradeable.sol"; | import "@openzeppelin/contracts-upgradeable@4.3.0/access/OwnableUpgradeable.sol"; |
| import "UUPSUpgradeable.sol"; | import "@openzeppelin/contracts-upgradeable@4.3.0/proxy/utils/UUPSUpgradeable.sol"; |
| import "PRBMathSD59x18.sol"; | import "https://raw.githubusercontent.com/LeonWesker/prb-math/main/contracts/PRBMathSD59x18.sol"; |
| import "PRBMathSD59x18Typed.sol"; | import "https://raw.githubusercontent.com/LeonWesker/prb-math/main/contracts/PRBMathSD59x18Typed.sol"; |
| import "PRBMathUD60x18.sol";| import "https://raw.githubusercontent.com/LeonWesker/prb-math/main/contracts/PRBMathUD60x18.sol"; |
| import "PRBMathUD60x18Typed.sol"; |import "https://raw.githubusercontent.com/LeonWesker/prb-math/main/contracts/PRBMathUD60x18Typed.sol"; |
| ***AddressUpgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F2#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/utils/AddressUpgradeable.sol |
| ***ContextUpgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F3#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/utils/ContextUpgradeable.sol |
| ***ERC1967UpgradeUpgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F4#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol |
| ***ERC20Upgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F5#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol |
| ***IBeaconUpgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F6#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/proxy/beacon/IBeaconUpgradeable.sol |
| ***IERC20MetadataUpgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F7#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/token/ERC20/extensions/IERC20MetadataUpgradeable.sol |
| ***IERC20Upgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F8#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/token/ERC20/IERC20Upgradeable.sol |
| ***Initializable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F9#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/proxy/utils/Initializable.sol |
| ***OwnableUpgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F10#L1 | https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F10#L1 |
| ***PRBMath.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F11#L1 | 
| ***PRBMathSD59x18.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F12#L1 | https://github.com/hifi-finance/prb-math/blob/v2.3.0/contracts/PRBMathSD59x18.sol |
| ***PRBMathSD59x18Typed.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F13#L1 | https://github.com/hifi-finance/prb-math/blob/v2.3.0/contracts/PRBMathSD59x18Typed.sol |
| ***PRBMathUD60x18.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F14#L1 | https://github.com/hifi-finance/prb-math/blob/v2.3.0/contracts/PRBMathUD60x18.sol |
| ***PRBMathUD60x18Typed.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F15#L1 | https://github.com/hifi-finance/prb-math/blob/v2.3.0/contracts/PRBMathUD60x18Typed.sol |
| ***StorageSlotUpgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F16#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/utils/StorageSlotUpgradeable.sol |
| ***UUPSUpgradeable.sol*** ||
| https://bscscan.com/address/0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1#code#F17#L1 | https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/release-v4.3/contracts/proxy/utils/UUPSUpgradeable.sol |

## License

MIT