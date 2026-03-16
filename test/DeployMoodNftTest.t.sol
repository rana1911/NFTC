// SPDX-License-Identifier: MIT

pragma solidity ^0.8.33;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTAwIDEwMCIgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPCEtLSBGYWNlIENpcmNsZSAtLT4KICA8Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0NSIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIiBmaWxsPSJ5ZWxsb3ciIC8+CiAgPCEtLSBFeWVzIC0tPgogIDxjaXJjbGUgY3g9IjM1IiBjeT0iNDAiIHI9IjUiIGZpbGw9ImJsYWNrIiAvPgogIDxjaXJjbGUgY3g9IjY1IiBjeT0iNDAiIHI9IjUiIGZpbGw9ImJsYWNrIiAvPgogIDwhLS0gU21pbGUgLS0+CiAgPHBhdGggZD0iTSAzMCA2NSBRIDUwIDg1IDcwIDY1IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjUiIGZpbGw9Im5vbmUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgLz4KPC9zdmc+Cg==";
        string memory svg =
            '<svg viewBox="0 0 100 100" width="100" height="100" xmlns="http://www.w3.org/2000/svg">  <circle cx="50" cy="50" r="45" stroke="black" stroke-width="3" fill="yellow" />  <circle cx="35" cy="40" r="5" fill="black" />  <circle cx="65" cy="40" r="5" fill="black" />  <path d="M 30 65 Q 50 85 70 65" stroke="black" stroke-width="5" fill="none" stroke-linecap="round" /></svg>';
        string memory actualUri = deployer.svgToImageUri(svg);
        assertEq(keccak256(abi.encodePacked(actualUri)), keccak256(abi.encodePacked(expectedUri)));
    }
}
