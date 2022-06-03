//SPDX-License-Identifier: UNLICENSED

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Inheritance.sol";

pragma solidity ^0.8.4;

contract InheritanceInfo is Ownable{

    uint private treasure;
    uint percentSetted;
    address private delegateOwner;
    bool private deceased = false;
    mapping(address=>uint) private expectedInheritancePercentage;
    mapping(address => bool) private inheritanceWithdrawed;
    mapping(address=>uint) private amountDeposit;

    event isDead(bool status);


    Inheritance private inheritance;


    modifier onlyDelegateOwner(){
        msg.sender == address(delegateOwner);
        _;
    }


    modifier onlyInheritanceAddress{
        msg.sender == address(inheritance);
        _;
    }



    constructor(){
        transferOwnership(owner());
    }




    function setInheritanceAddress(address payable _inheritanceAddress)public onlyOwner{
        inheritance = Inheritance(_inheritanceAddress);
    }




    function getInheritanceAddress()public view returns(address){
        return address(inheritance);
    }




    function addDelegateOwner(address _delegateOwner)public onlyOwner{
        delegateOwner = _delegateOwner;
    }




    function setDeposit(uint _amount)public onlyInheritanceAddress{
        amountDeposit[owner()] = _amount;
        treasure = _amount;
    }



    function getDeposit()public view returns(uint){
        return amountDeposit[owner()];
    }




    function setTreasure(uint _treasure)public onlyInheritanceAddress{
        treasure = _treasure;
    }




    function getRestingAmount()public view returns(uint){
        return treasure;
    }




    function isDeceased()public onlyDelegateOwner{
        deceased = true;
        emit isDead(deceased);
    }





    function getDeceasedStatus()public view returns(bool){
        return deceased;
    }





    function setInheritancePercentage(
        address _inheritanceAddress,
        uint _percent
        )public onlyInheritanceAddress{
            percentSetted += _percent;
            require(_percent <= 100, "Out of Percent!");
            require(percentSetted <= 100, "Out of Percent!");
            expectedInheritancePercentage[_inheritanceAddress] = _percent;
            inheritanceWithdrawed[_inheritanceAddress] = true;
        }





    function getInheritanceExpectationReward(address addToCheck)public view returns(uint){
        return expectedInheritancePercentage[addToCheck];
    }




    function calculateInheritance(address addToCheck) public view returns(uint){
        uint percentage = expectedInheritancePercentage[addToCheck];
        uint amountToReceive = (amountDeposit[owner()] * percentage) / 100;
        return(amountToReceive);
    }






    function setInheritanceWithdrawedPermission(address addToCheck)public onlyInheritanceAddress{
        inheritanceWithdrawed[addToCheck] = false;
    }





    function getInheritanceWithdrawedPermission(address addToCheck)public view returns(bool){
        return inheritanceWithdrawed[addToCheck];
    }
}
