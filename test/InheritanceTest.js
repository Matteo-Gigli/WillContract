const Inheritance = artifacts.require("Inheritance");
const InheritanceInfo = artifacts.require("InheritanceInfo");

contract("Inheritance.sol, InheritanceInfo.sol functionality", function(accounts){

    //Inheritance.sol
    it("Should set the right InheritanceInfo contract address", async()=>{
        let instance = await Inheritance.deployed();
        let inheritanceInfo = await InheritanceInfo.deployed();
        await instance.setInheritanceInfoAddress(inheritanceInfo.address);
        let inheritanceInfoAddress = await instance.getInheritanceInfoAddress();
        assert.equal(inheritanceInfoAddress, inheritanceInfo.address);
    })



    //InheritanceInfo.sol
    it("Should set the right InheritanceInfo contract address", async()=>{
        let instance = await InheritanceInfo.deployed();
        let inheritance = await Inheritance.deployed();
        await instance.setInheritanceAddress(inheritance.address);
        let inheritanceAddress = await instance.getInheritanceAddress();
        assert.equal(inheritanceAddress, inheritance.address);
    })




    //Inheritance.sol
    it("Should be able to deposit some value", async()=>{
        let instance = await Inheritance.deployed();
        let inheritanceInfo = await InheritanceInfo.deployed();
        await instance.deposit({value: 10000000000000000000});
        let depositInInheritanceInfoContract = await inheritanceInfo.getDeposit()
        assert.equal(depositInInheritanceInfoContract, 10000000000000000000)
    })




    //Inheritance.sol
    it("Should be able to set different percentage of Inheritance, for different persons", async()=>{
        let instance = await Inheritance.deployed();
        let inheritanceInfo = await InheritanceInfo.deployed();
        await instance.deposit({value: 10000000000000000000});
        await instance.addInheretinceAddressAndPercentage(accounts[3], 50);
        await instance.addInheretinceAddressAndPercentage(accounts[4], 50);
        let resultAccounts3 = await inheritanceInfo.calculateInheritance(accounts[3]);
        let resultAccounts4 = await inheritanceInfo.calculateInheritance(accounts[4]);
        assert.equal(parseFloat(resultAccounts3), 5000000000000000000);
        assert.equal(parseFloat(resultAccounts4), 5000000000000000000);
    })


    //Inheritance.sol

    it("Should be able to set a decease event(only delegate owner) and pick the inheritance", async()=>{
        let instance = await Inheritance.deployed();
        let inheritanceInfo = await InheritanceInfo.deployed();
        await instance.deposit({value: 10000000000000000000});
        //await instance.addInheretinceAddressAndPercentage(accounts[3], 20);
        //await instance.addInheretinceAddressAndPercentage(accounts[4], 30);
        //await instance.addInheretinceAddressAndPercentage(accounts[5], 50);
        await inheritanceInfo.addDelegateOwner(accounts[2]);
        await inheritanceInfo.isDeceased({from: accounts[2]});
        await instance.YourInheritance({from: accounts[3]});
        await instance.YourInheritance({from: accounts[4]});
        //await instance.YourInheritance({from: accounts[5]});
        let restingAmount = await inheritanceInfo.getRestingAmount();
        assert.equal(restingAmount, 0);
    })
})