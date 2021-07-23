pragma solidity ^0.8.0;
contract TimeLock{
    uint timeToWithdrawfund; //declares the variable for fund withdrawal
    
        modifier timeElapse() {
      // require(_totalSupply<totalToMint,"Guy, how far na");
        require(block.timestamp-(timeToWithdrawfund)>=50 seconds,"50 seconds has not been completed yet");
        _;
    }
    
     constructor(){
        timeToWithdrawfund = block.timestamp;
    }

    mapping   (address => uint) bank;
    function deposit() public payable{
        bank[msg.sender] += msg.value;
    }
    function withdraw(uint _amount) public  timeElapse{
        require(_amount <= bank[msg.sender]);
        bank[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
     }   
    
     

    function fundsCollected() public view returns(uint){
        uint result = bank[msg.sender];
         return result;
    }
}