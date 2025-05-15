// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.0;

contract BooleanSwitch{
    bool private toggle;

   //function to change the state
   function booleanSwitch()internal returns(bool){
    toggle = !toggle;
    return toggle;
   } 
   
   //function to get the toggle state

   function getToggleState() internal view returns(bool){
    return toggle;
   }

}