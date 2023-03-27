// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IFakeToken{
    function transfer(address _to, uint256 _amount) external;
    function transferFrom(address _from, address _to, uint256 _amount) external;

}

contract AirDropToken{

    //Мы должны депонировать монеты в смарт-контракт AirDropToken
    function airdropWithTransfer(
        IFakeToken _tokenAddress, 
        address[] memory _addressArray, 
        uint256[] memory _amountArray) public {

            for (uint8 i = 0; i<_addressArray.length; i++)
            {
                _tokenAddress.transfer(_addressArray[i], _amountArray[i]);
            }

    }

    //Мы должны сделать approve монет для адреса смарт-контракта AirDropToken
    function airdropWithTransferFrom(
        IFakeToken _tokenAddress, 
        address[] memory _addressArray, 
        uint256[] memory _amountArray) public {

            for (uint8 i = 0; i<_addressArray.length; i++)
            {
                _tokenAddress.transferFrom(msg.sender, _addressArray[i], _amountArray[i]);
            }
            
    }
}