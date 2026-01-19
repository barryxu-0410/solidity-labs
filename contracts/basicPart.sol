// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract A{
    event Received(address Sender, uint Value);
    receive() external payable { 
        emit Received(msg.sender,msg.value);
    }
}

contract B{   //接收ETH合约
    event Log(uint amount,uint gas);
    receive() external payable{
        emit Log(msg.value,gasleft());
    }
    function getBalance() view public returns(uint){
        return address(this).balance;
    }
}

contract C{     //发送ETH合约
    constructor() payable{}
    receive() external payable{}
    function transferETH(address payable _to,uint256 amount)external payable{
        _to.transfer(amount);
    }

    error CallFailed();
    function callETH(address payable _to,uint256 amount)external payable{
        (bool success,)=_to.call{value:amount}("");
        if(!success){
            revert CallFailed();
        }
    }
}

contract D {
    uint256 private _x = 0; // 状态变量x
    // 收到eth的事件，记录amount和gas
    event Log(uint amount, uint gas);
    
    fallback() external payable{}

    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable{
        _x = x;
        // 如果转入ETH，则释放Log事件
        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    // 读取x
    function getX() external view returns(uint x){
        x = _x;
    }
}

contract E{   //call：目标合约地址.call(字节码);
    event Response(bool success,bytes data);
    function callSetX(address payable _add,uint256 x)public payable{
        (bool success, bytes memory data)=_add.call{value:msg.value}(
            abi.encodeWithSignature("setX (uint256)",x)
        );
        emit Response(success, data);
    }
}





