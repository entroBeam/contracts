//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "https://github.com/entroBeam/contracts/blob/main/EntroBeam/EntroBeam_main_v1.0.0.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/// @title Inherit EntroBeam(EIX) ver 1.0.0 https://github.com/entroBeam
/// @author Leon Wesker, entrobeam@gmail.com, leon@entrobeam.org
///
/// @notice This contract is an example of a contract to inherit from EntroBeam.
/// However, 'transfer and call' rather than 'inheritance' are correct. Just defined it as
/// 'inheritance' because the expression 'inheritance' is commonly easier to understand for devs.
///
/// @dev EntroBeam's Secure Entropy can be widely used not only in RBG (Random Bits Generator,
/// RNG: Random Number Generator) but also in cyber security, data science, probability distribution
/// sampling, metaverse, and gameFi, etc. This example implements only the most straightforward functions.
/// However, depending on the application method, the scope of creating interest is almost limitless.
/// If you have need assistance with implementing EntroBeam in your application, please get in touch with
/// author Leon. However, considering the priority of responses, contact EIX at your organization's domain
/// email (such as xyz @ your organization domain.com).

// This contract represents the most straightforward and most intuitive way to utilize EntroBeam.
// You can skip(No need to deploy) this contract and use the next 'CallEntroBeam' contract.

// This contract extends further from 'CallEntroBeam_essential_function' to provide more useful functionality.
contract CallEntroBeam {
    address public inheritOwner;

    constructor() {
        inheritOwner = payable(msg.sender);
    }

    modifier inherit_onlyOwner() {
        require(msg.sender == inheritOwner, "Only inherit owner function");
        _;
    }

    function Z_danger_contractSelfDestruct(uint _verificationCode) external inherit_onlyOwner {
        require(_verificationCode == 101101, "verification Code failed");
        selfdestruct(payable(inheritOwner));
    }

    /// @notice Withdraw all EIX of this contract
    /// @param _token , 0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1
    function withdrawToken(IERC20 _token) external inherit_onlyOwner {
        _token.transfer(msg.sender, _token.balanceOf(payable(address(this))));
    }

    function withdrawCoin(address payable _recipient, uint256 _amount)
        external
        inherit_onlyOwner
    {
        _recipient.transfer(_amount);
    }

    /// @notice Address of the EntroBeam main contract. Explicitly convert the type.
    address payable EIXcontract_address =
        payable(address(0xDF7F1af35e682c4eFAd40e97C9E370137DD471a1));

    /// @notice You can check how many EIX Entropy requests your application has.
    /// It further helps identification by assigning a unique number to each request.
    /// @dev Keep that in mind. Not an EIX-related number. It only works for your application.
    uint256 public DB_byNumber_identifier;

    /// @notice This is a DB that can check where the entropy seed(arbitrary 256bit hex string Entropy including 0x)
    /// transferd by the user is stored in the EIX contract. You can search by the user's entropy seed, and
    /// you can also access EIX's struct_EntropyRegister_ID with this value.
    struct ID_DB_bySeed {
        // Check whether the seed is applied. However, if false, ID_numberInEIX always returns 0, so this line can be deleted.
        bool ID_locate;
        // It matches the 'Array_EntropyChain' number in EIX. Therefore, you can access 'Array_EntropyChain' using this value.
        uint256 ID_numberInEIX;
    }

    /// @notice This is not necessary in this contract example. You can search by 'DB_byNumber_identifier'.
    /// This DB will be very useful if you scan all the results from number one.
    struct ID_DB_byNumber {
        bytes32 ID_seed; // entropy seed(arbitrary 256bit hex string Entropy including 0x) transferred by the user
        // It matches the 'Array_EntropyChain' number in EIX. Therefore, you can access 'Array_EntropyChain' using this value.
        uint256 ID_numberInEIX;
    }

    mapping(bytes32 => ID_DB_bySeed) public registerID_DBseedInternal;
    mapping(uint256 => ID_DB_byNumber) public registerID_DBnumberInternal;

    /// @notice Assign EIX's 'numberLatestUsersEntropy' value to users.
    /// For details, refer to the 'numberLatestUsersEntropy' comment in the Github EIX contract.
    /// @dev It is stored in ID_numberInEIX.
    function storeCurrent_numberLatestUsersEntropy()
        internal
        view
        returns (uint256)
    {
        return EntroBeam(EIXcontract_address).numberLatestUsersEntropy();
    }

    /// @notice Transfer the seed to the 'EntropyByUsers' function in the EIX contract.
    /// @param _usersEntropy_seed , _usersHexData 256bits hexadecimal string specified by the user. duplicate values are reverted.
    function submitEntropySeed(bytes32 _usersEntropy_seed) public {
        EntroBeam(EIXcontract_address).EntropyByUsers(_usersEntropy_seed);

        registerID_DBseedInternal[_usersEntropy_seed]
            .ID_numberInEIX = storeCurrent_numberLatestUsersEntropy();
        registerID_DBseedInternal[_usersEntropy_seed].ID_locate = true;

        DB_byNumber_identifier++;
        registerID_DBnumberInternal[DB_byNumber_identifier]
            .ID_seed = _usersEntropy_seed;
        registerID_DBnumberInternal[DB_byNumber_identifier]
            .ID_numberInEIX = storeCurrent_numberLatestUsersEntropy();

        addNoiseEntropy();
    }

    /// @notice This allows users to send Entropy seed with one click without having to input 256bit seed.
    ///
    /// @dev Recommend that you use keccack256's hashing source by adding or changing it as you prefer.
    function oneClick_submitEntropy() public {
        // The secure entropy is reborn anyway, no matter what '_preSeed' is, so it doesn't detract from the purpose of secure.
        // But, theoretically, this secure entropy is likely to be biased. However, even if it is biased, it is unpredictable.
        bytes32 _preSeed = keccak256(
            abi.encode(msg.data, block.number, msg.sender, block.difficulty)
        );

        submitEntropySeed(_preSeed);
    }

    /// @notice Access 'struct_EntropyRegister_ID' in the EIX.
    /// @param _ID , _usersHexData 256bits hexadecimal string transferred by the user.
    /// @return usersEntropy_seed , end-user entropy seed
    /// @return verifyDuplicate , check duplicate entropy seeds.
    /// @return reveal_SecureEntropy , Secure entropy generated by the Contract and sent to the user.
    ///
    /// @dev You are free to use the return value at will.
    function callEntropy(bytes32 _ID)
        internal
        view
        returns (
            bytes32 usersEntropy_seed,
            bool verifyDuplicate,
            bytes32 reveal_SecureEntropy
        )
    {
        return EntroBeam(EIXcontract_address).struct_EntropyRegister_ID(_ID);
    }

    /// @notice Validate 'callEntropy' and extract Secure Entropy return value.
    /// @param _ID , _usersHexData 256bits hexadecimal string transferred by the user.
    /// @return reveal_SecureEntropy , Secure entropy generated by the Contract and sent to the user.
    function callResult(bytes32 _ID)
        public
        view
        returns (bytes32 reveal_SecureEntropy)
    {
        bytes32 _usersEntropy_seed;
        bool _verifyDuplicate;
        bytes32 _reveal_SecureEntropy;
        (
            _usersEntropy_seed,
            _verifyDuplicate,
            _reveal_SecureEntropy
        ) = callEntropy(_ID);

        if (
            _usersEntropy_seed ==
            0x0000000000000000000000000000000000000000000000000000000000000000
        ) {
            revert("Input entropy seed does not exist.");
        }

        /// Secure entropy is created when a transaction occurs that exceeds the EIX 'FormationNumber' value.
        /// For details, refer to the 'FormationNumber' comment of the EIX contract.
        /// The value of 'FormationNumber' may change. Check the exact value in a block explorer.
        /// Except for security reasons, almost all EIX variables and functions are declared public so
        /// that you can see their values transparently.
        if (
            /// In the logical OR operator code below, the bool result of IF is always the same
            /// regardless of whether it is used or not. In any case, if the requiement of
            /// 'FormationNumber' is not met, the secure entropy always returns '0'.

            // _reveal_SecureEntropy ==
            // 0x0000000000000000000000000000000000000000000000000000000000000000 ||
            registerID_DBseedInternal[_ID].ID_numberInEIX +
                EntroBeam(EIXcontract_address).FormationNumber() >
            EntroBeam(EIXcontract_address).numberLatestUsersEntropy()
        ) {
            revert("Secure entropy has not yet been generated.");
        }
        return _reveal_SecureEntropy;
    }

    /// 'registerID_DBnumberInternal' is incremented by 1 every time Entropy is requested from the EntroBeam contract.
    /// To check whether 'registerID_DBnumberInternal' has received Secure Entropy or not, We need a variable that starts at 1 and becomes +1 if secure entropy is assigned.
    uint public countInternal = 1;

    /// 'noiseInternal' and 'entropyInternal' are executed simultaneously when a transaction occurs.
    /// E.g.) Note that EntroBeam contract allocates secure entropy when 'FormationNumber'+1 transaction occurs.
    /// E.g.) If this contract alone generates a transaction in EntroBeam, and 'FormationNumber' is 10. 'FormationNumber'+1 = 11.
    /// E.g.) When the 11th transaction is generated, secure entropy is allocated in the EntroBeam contract, and 'noiseInternal' 
    /// E.g.) and 'entropyInternal' are activated and stored. All done at the same time(simultaneously) in one transaction(11th transaction).
    ///
    /// The call values of 'registerID_DBnumberInternal' and 'entropyInternal'-1 have a one-to-one correspondence.
    /// E.g.) To serach the enhanced secure entropy of 2 of 'registerID_DBnumberInternal', call 'entropyInternal' with 1.
    bytes32[] public noiseInternal; // Stores the hash value of all gas values of 'Assigned_EntropyChain'.
    bytes32[] public entropyInternal; // Stores enhanced secure entropy.

    /// @notice Store enhanced secure entropy in 'entropyInternal'.
    /// @dev search for the comment 'E.g.)'. Multi-transactions are more challenging to predict than single transactions, further increasing unpredictability in Blockchain.
    /// The critical point is that no matter how many multi-transactions, they must be executed simultaneously with just one transaction.
    function addNoiseEntropy() private {
        // Call the 'struct_EntropyRegister_ID' value of the EntroBeam corresponding to 'registerID_DBnumberInternal'.
        bytes32 _usersEntropy_seed;
        bool _verifyDuplicate;
        bytes32 _reveal_SecureEntropy;
        (
            _usersEntropy_seed,
            _verifyDuplicate,
            _reveal_SecureEntropy
        ) = callEntropy(registerID_DBnumberInternal[countInternal].ID_seed);

        // If Secure Entropy is assigned, generates Enhanced Secure Entropy.
        //
        // Again, this happens all at the same time in one transaction.
        // 
        if (_reveal_SecureEntropy != 0x0000000000000000000000000000000000000000000000000000000000000000) {
            // '_Add_Noise101' = keccak256'_sumGasFees101'. 
            bytes32 _Add_Noise101;
            // '_sumGasFees101' = Sum of 'Assigned_EntropyChain.leftgas' array
            uint _sumGasFees101;

            bytes32 _entropyByUsers;
            uint256 _entropyByBlockNumber;
            address _SourceAddress;
            uint256 _leftgas;

            // Hash the value of Assigned_EntropyChain.leftgas. All gas fees for this transaction are counted.
            // E.g.) If this contract alone generates a transaction in EntroBeam, and 'FormationNumber' is 10. 'FormationNumber'+1 = 11.
            // E.g.) Calculates all up to the 11th transaction gas fee.
            for (uint256 i = 0; i < EntroBeam(EIXcontract_address).Assigned_EntropyChain_length(); i++) {
                uint _a;
                _a = EntroBeam(EIXcontract_address).Assigned_EntropyChain(i);
                (
                    _entropyByUsers,
                    _entropyByBlockNumber,
                    _SourceAddress,
                    _leftgas
                ) = EntroBeam(EIXcontract_address).Array_EntropyChain(_a);

                _Add_Noise101 = keccak256(abi.encode(_sumGasFees101 += _leftgas));
            }

            noiseInternal.push(_Add_Noise101);
            entropyInternal.push(keccak256(abi.encode(_Add_Noise101, _reveal_SecureEntropy)));
            countInternal++;
        }
    }
}