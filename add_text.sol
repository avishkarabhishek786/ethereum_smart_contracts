pragma solidity >=0.4.22 <0.7.0;

contract MyMCQs {
    uint256 public questionsCount = 0;
    Questions[] public questionLists;
    //mapping(uint => Questions) public quests;
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender==owner);
        _;
    }
    
    struct Questions {
        uint _id;
        string _questionText;
    }
    
    function addQuestion
    (
        string memory _questionText
    ) public onlyOwner {
        questionsCount += 1;
        questionLists.push(Questions(questionsCount, _questionText));
    }
    
}
