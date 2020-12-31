/* The following code describes how to use strings in solidity. Important to note that length("Abhihsek") will return 8 which is correct. However length("€bÁnç!") 
*  will return 10 which is incorrect. This is because string type is a utf-8 representation of that string so there is no String.length property. It is required to 
*  convert that string into bytes but then it str_bytes.length will return bytes length not string length. Some characters could be multibytes hence output is 10.
*  As a conclusion we should be conscious about the use of length property when using strings.
*  More info - https://hackernoon.com/working-with-strings-in-solidity-c4ff6d5f8008
*/

pragma solidity ^0.5.2;

contract Strings {
  function length(string memory str) pure public returns(uint) {
    bytes memory str_bytes = bytes(str);
    return str_bytes.length;
  }

  function concatenate(string memory str1, string memory str2) pure public returns(string memory) {
    bytes memory str_bytes1 = bytes(str1);
    bytes memory str_bytes2 = bytes(str2);
    string memory str = new string(str_bytes1.length + str_bytes2.length);
    bytes memory str_bytes = bytes(str);

    uint k = 0;
    for(uint i = 0; i < str_bytes1.length; i++) {
      str_bytes[k] = str_bytes1[i];
      k++;
    }
    for(uint i = 0; i < str_bytes2.length; i++) {
      str_bytes[k] = str_bytes2[i];
      k++;
    }

    return string(str_bytes);
  }
}
