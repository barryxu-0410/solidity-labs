//SPDX-License-Identifier:MIT
pragma solidity ^0.8.21;
contract helloweb3{
    string public _string = "Hello Web3";
}

contract Function {
    uint public number = 5;
    function add(uint _number)public pure  returns(uint newnumber){
        newnumber=_number+1;
    }

    function returnMuti() public pure returns(uint,bool,uint256[3] memory){
        return (1,true,[uint256(1),2,4]);
    }
}

contract DataStorage{
    //storge>memory>calldata  #消耗gas
    function fcalldata(uint[] calldata _x) public pure returns(uint[] calldata){
        return (_x);
    }

uint[] x = [1,2,3]; // 状态变量：数组 x

function fStorage() public{
    //声明一个storage的变量 xStorage，指向x。修改xStorage也会影响x
    uint[] storage xStorage = x;
    xStorage[0] = 100;
}
}
