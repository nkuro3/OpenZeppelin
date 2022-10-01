// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * this import includes
 * - onlyOwner
 */
// error happen. But can use.
import "@openzeppelin/contracts/access/Ownable.sol";

// Error HH409: Trying to import ../node_modules/@openZeppelin/contracts/access/Ownable.sol from contracts/Box.sol, but it has an incorrect casing.
// import "../node_modules/@openZeppelin/contracts/access/Ownable.sol";

contract Box is Ownable {
    uint256 private _value;

    event ValueChanged(uint256 value);

    function store(uint256 value) public onlyOwner {
        _value = value;
        emit ValueChanged(value);
    }

    function retrieve() public view returns (uint256) {
        return _value;
    }
}