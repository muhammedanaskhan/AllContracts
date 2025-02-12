//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.28;

contract SimpleStorage {
    string private _data;

    constructor(string memory data) {
        _data = data;
    }

    function setData(string memory data) public{
        _data = data;
    }

    function getData() public view returns(string memory) {
        return _data;
    }
}
 