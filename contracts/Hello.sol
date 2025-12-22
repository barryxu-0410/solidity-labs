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

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract c {
  struct Students{
    uint id;
    uint score;
  }
  Students  public s;
  function st() public  {
    Students storage _st=s;
    _st.id=10;
    _st.score=100;
   
  }
  
}

contract map {
    mapping (uint => address) public i;
    function p(uint _id,address _address)public {
        i[_id]=_address;
    }
}

contract test {
    function iF(uint _number)public pure returns(bool){
        if(_number==0){
            return (true);
        }else{
            return(false);
        }
    }

    function For() public pure returns(uint256){
        uint sum=0;
        for(uint i = 0;i<10;i++){
            sum+=i;
        }
        return (sum);
    }

    function While() public pure returns(uint256){
        uint sum =0;
        uint i =0;
        do{
            sum += i;
            i++;
        }while(i<10);
        return(sum);
    }
}
