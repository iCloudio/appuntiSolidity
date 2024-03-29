// The caret (^) symbol specifies that the code is compatible with the mentioned version and any new version till (but not including) 0.9.0.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    string public abc = "hello world";
    string name = "";
    // arrays: you have .length .push() .pop() and 'delete array[index;]'
    string[] public food = ["pizza", "eggs", "potatoes"];

    constructor(string memory _name){
        name = _name;
    }

    // you pay gas fee only on set function, reading from blockchain is free
    function setName(string memory _name) public {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function resetName() internal {
        name = "Ciaooo";
    }


    address private owner;
    // Custom Modifiers: special type of Solidity function that is used to modify the behavior of other functions
    // Modifiers are similar to functions, in that they can take arguments and have a return type. Modifiers can also be chained together, meaning that you can have multiple modifiers on a single function
    modifier onlyOwner {
        require(msg.sender == owner, 'Caller must be owner');
        _;
    }
    string kyc = "";
    function setKyc(string memory _kyc) onlyOwner public {
        kyc = _kyc;
    }

    /** MAPPING TYPES
     * You can think of mappings as hash tables, 
     * which are virtually initialised such that 
     * every possible key exists and is mapped to 
     * a value whose byte-representation is all zeros,
     * a type’s default value. 
     * The similarity ends there, the key data is not stored 
     * in a mapping, only its keccak256 hash is used to look 
     * up the value.
     */
    mapping(address => bool) public hasVoted; //
    //you can manipulate mapping inside and outside the smartContract
    
    struct Book {
        string title;
        string author;
        bool completed;
    }

    Book[] public books;

    function add(string memory _title, string memory _author) public {
        books.push(Book(_title, _author, false));
    }

    function get(uint _index)
        public view returns (string memory title, string memory author, bool completed){
            Book storage book = books[_index];
            return (book.title, book.author, book.completed);
        }

    function complete(uint _index) public {
        Book storage book = books[_index];
        book.completed = true;
    }


}

