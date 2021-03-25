pragma solidity >=0.7.0 <0.9.0;

contract DepositLogger {
    
    struct MintData {
        uint256 counter;
        uint256 timestamp;
        uint256 ethIn;
        uint256 daodMinted;
        uint256 ethLeftAfterWithdrwal;
    }
    
    mapping(address=>MintData[]) public mintLog; 
    
    function addMintData(uint256 _ethIn, uint256 _daodMinted) private {
        uint256 deposits_count = mintLog[msg.sender].length;
        mintLog[msg.sender].push(MintData(deposits_count++, block.timestamp, _ethIn, _daodMinted, _ethIn));
    }
    
    function viewMintData(address _user) public view returns(uint[] memory, uint[] memory, uint[] memory, uint[] memory) {
        uint256[] memory userMintLogTimestamp = new uint256[](mintLog[_user].length);
        uint256[] memory userMintLogEthIn = new uint256[](mintLog[_user].length);
        uint256[] memory userMintLogDaodMinted = new uint256[](mintLog[_user].length);
        uint256[] memory userMintLogEthLeftAfterWithdrawal = new uint256[](mintLog[_user].length);
        
        for(uint i = 0; i < mintLog[_user].length; i++) {
            userMintLogTimestamp[i] = mintLog[_user][i].timestamp;
            userMintLogEthIn[i] = mintLog[_user][i].ethIn;
            userMintLogDaodMinted[i] = mintLog[_user][i].daodMinted;
            userMintLogEthLeftAfterWithdrawal[i] = mintLog[_user][i].ethLeftAfterWithdrwal;
        }
        return (userMintLogTimestamp, userMintLogEthIn, userMintLogDaodMinted, userMintLogEthLeftAfterWithdrawal);
    } 
    
    function viewMintData2(address _user) public view returns(MintData[] memory) {
        return mintLog[_user];
    } 
    
    function deleteMintData(address _user) private {
        for(uint i = 0; i < mintLog[_user].length; i++) {
            if(mintLog[_user][i].ethLeftAfterWithdrwal<=0) {
                delete mintLog[_user][i];
            }
        }
    }
    
}
