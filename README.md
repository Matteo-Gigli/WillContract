# WillContract

<h2>💀  Will Contract</h2>

<br>

<h2> 📑 Project</h2>

<br>
<br>

<h3>The idea is to create a smart contract to manage an inheritance for different actors.</h3>
<h3>We can set an amount, a delegate owner(to unlock the funds), and even a different percent of our inheritance for different address.</h3>
<h3>That it means i can give to Alice(address A) a 40% of my inheritance and at the same time, i can set for Alex(address B) a 20%, Mark(address C) 20% ...</h3>

<br>
<br>

<h2>💬 How to use with contracts...</h2>

<br>
<br>

<h3>First of all we are going to deploy Inheritance.sol and InheritanceInfo.sol.</h3>

<br>

<h3>Once contracts are deployed go in Inheritance.sol and use the setInheritanceInfoAddress(address...) function to add the InheritanceInfo Address.</h3>
<h3>Now we have a pointer on our InheritanceInfo Contract.</h3>

<br>

<h3>Go in InheritanceInfo.sol and do the same thing using the setInheritanceAddress(address ...) function to add the Inheritance Address.</h3>

<br>

<h3>Now set a delegate owner, using addDelegateOwner(address...) function in InheritanceInfo.sol, to add an address to unlock funds when the owner will pass away </h3>

<br>

<h3>Now we can start to make a deposit.</h3>
<h3>Go in Inheritance.sol and use deposit()function to make a deposit. Cannot set a 0 deposit and only the owner of the contract can do that.</h3>
<h3>deposit() using setDeposit(uint...) function, setted in InheritanceInfo.sol .</h3>
<h3>setDeposit(uint...) function is used to capture and use the data from using the deposit() function. </h3>
<h3>Now the deposit is setted, and we can see this, using the getDeposit() function in InheritanceInfo.sol</h3>

<br>
<br>

<h3>Now we can go to set inheritance receiving address, and percentage.</h3>
<h3>We can do this using addInheretinceAddressAndPercentage(address..., uint...).</h3>
<h3>This functions help us to set a different percentage of inheritance for the addresses.</h3>
<h3>If i have 10 ether as deposit and i want to give 20% to an address, 30% to another address, and 50% to another address, i can do it.</h3>

<br>
<br>

<h3>Once setted all this stuff we can go in InheritanceInfo.sol and using the different functions to check all we have setted!</h3>

<br>
<br>

<h3>Now to have the Inheritance something must to happen.</h3>
<h3>First of all using the isDeceased() function in InheritanceInfo.sol (only the delegate owner can call this function), we have to set the owner is passed away.</h3>
<h3>If we don't do this, once we use the getYourInheritance() function in Inheritance.sol will not work!</h3>
<h3>As we can see, in this function, there are a bunch of requirements must to be satisfied to withdraw our part of inheritance.</h3>
<h3>Once everything is satisfied we will have our part of Inheritance</h3>

<br>
<br>

<h2>🔨 Built with:</h2>

<br>
<br>

<h3>Solidity</h3>
<h3>Truffle</h3>
