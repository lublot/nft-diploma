// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Diploma is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  mapping(string => uint8) files;

  constructor() ERC721("diploma", "DPLM") {}

  function awardDiploma(address student, string memory tokenURI) public returns (uint256) {
    require(files[tokenURI] != 1, 'Error: the diploma is already vinculated to a student');
    files[tokenURI] = 1;
    _tokenIds.increment();

    uint256 newDiplomaId = _tokenIds.current();
    _safeMint(student, newDiplomaId);
    _setTokenURI(newDiplomaId, tokenURI);

    return newDiplomaId;
  }
}
