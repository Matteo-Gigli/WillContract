//SPDX-License-Identifier: UNLICENSED

import "@openzeppelin/contracts/access/Ownable.sol";
import "./InheritanceInfo.sol";

pragma solidity ^0.8.4;

contract Inheritance is Ownable{


    InheritanceInfo private inheritanceInfo;

    event depositCreated(uint depositAmount, address sender);
    event InheritanceAdded(address receiver , uint percentage );
    event ImportWithdrawed(address receiver, uint amount);



    constructor(){
        transferOwnership(owner());
    }




    function setInheritanceInfoAddress(address _inheritanceInfoAddress)public onlyOwner{
        inheritanceInfo = InheritanceInfo(_inheritanceInfoAddress);
    }




    function getInheritanceInfoAddress()public view returns(address){
        return address(inheritanceInfo);
    }




    function deposit()external payable onlyOwner{
        require(msg.value > 0, "Can't set an inheritance of 0 ether!");
        inheritanceInfo.setDeposit(msg.value);
        emit depositCreated(msg.value, msg.sender);
    }




    function addInheretinceAddressAndPercentage(
        address _inheritanceAddress,
        uint _inheritancePercentage
        ) public onlyOwner{
            inheritanceInfo.setInheritancePercentage(_inheritanceAddress, _inheritancePercentage);
            emit InheritanceAdded(_inheritanceAddress, _inheritancePercentage);
        }





    error someGoesWrong(string text1, string text2, string text3);



    function YourInheritance()external payable{

        uint treasure = inheritanceInfo.getRestingAmount();
        bool isDeceased = inheritanceInfo.getDeceasedStatus();
        uint inheritanceVerified = inheritanceInfo.getInheritanceExpectationReward(msg.sender);

        if(isDeceased == true &&
           inheritanceInfo.getInheritanceWithdrawedPermission(msg.sender) == true &&
           inheritanceVerified > 0 &&
           treasure >= 0
           ){
               uint amountForInheritance = inheritanceInfo.calculateInheritance(msg.sender);
               uint treasureRemain = treasure - amountForInheritance;
               inheritanceInfo.setTreasure(treasureRemain);
               inheritanceInfo.setInheritancePercentage(msg.sender, 0);
               inheritanceInfo.setInheritanceWithdrawedPermission(msg.sender);
               payable(msg.sender).transfer(amountForInheritance);

               emit ImportWithdrawed(msg.sender, amountForInheritance);
           }else{
               revert someGoesWrong("Not Deceased!", "Already Withdraw!", "0 ethers is your reward now!");
           }
    }

}
