// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LostAndFound {
    struct Item {
        address owner;
        string description;
        bool isFound;
        uint256 reward;
    }

    mapping(uint256 => Item) public items;
    uint256 public itemCount;

    event ItemReported(uint256 indexed itemId, address owner, string description);
    event ItemFoundAndClaimed(uint256 indexed itemId, address finder);

    function reportLostItem(string memory _description) public payable {
        itemCount++;
        items[itemCount] = Item({
            owner: msg.sender,
            description: _description,
            isFound: false,
            reward: msg.value
        });

        emit ItemReported(itemCount, msg.sender, _description);
    }

    function claimFoundItem(uint256 _itemId) public {
        require(_itemId > 0 && _itemId <= itemCount, "Invalid item ID");
        require(!items[_itemId].isFound, "Item already claimed");

        items[_itemId].isFound = true;
        payable(msg.sender).transfer(items[_itemId].reward);

        emit ItemFoundAndClaimed(_itemId, msg.sender);
    }

    function getItemDetails(uint256 _itemId) public view returns (Item memory) {
        return items[_itemId];
    }
}