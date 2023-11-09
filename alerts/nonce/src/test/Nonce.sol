pragma solidity ^0.8.17;
import { Alert } from "phylax-std/Alert.sol";
import { Safe } from "safe-contracts/contracts/Safe.sol";

contract TestNonce is Alert {
    uint256 ethereum;
    address[] safes;

    function setUp() public {
        optimism = enableChain("ethereum");
        string memory root = vm.projectRoot();
        string memory path = string.concat(root, "safes.json");
        string memory json = vm.readFile(path);
        safes = vm.parseJsonAddressArray(json, ".safes");
    }

    function testExposeNonce() public chain(ethereum){
        for(uint i; i < safes.length; i++){
            uint256 nonce = Safe(payable(safes[i])).nonce();
            string memory safeName = string.concat("safe-", vm.toString(i));
            ph.export(safeName, vm.toString(nonce));
        }
    }
    
    function testDiff() public chain(ethereum){
        for(uint i; i < safes.length; i++){
            uint256 current = Safe(payable(safes[i])).nonce();
            vm.roll(block.number - 1);
            uint256 last = Safe(payable(safes[i])).nonce();
            assertEq(last, current);
        }
    }
}