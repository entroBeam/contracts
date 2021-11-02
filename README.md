# EntroBeam
### Generate Secure Entropy sources
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