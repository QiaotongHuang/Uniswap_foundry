// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/UniswapV2Factory.sol";
import "../src/UniswapV2Pair.sol";
import "./mocks/ERC20Mintable.sol";

contract UniswapV2FactoryTest is Test {
    UniswapV2Factory factory;

    ERC20Mintable tokenA;
    ERC20Mintable tokenB;
    ERC20Mintable tokenC;
    ERC20Mintable tokenD;

    function setUp() public {
        factory = new UniswapV2Factory();

        tokenA = new ERC20Mintable("Token A", "TKNA");
        tokenB = new ERC20Mintable("Token B", "TKNB");
        tokenC = new ERC20Mintable("Token C", "TKNC");
        tokenD = new ERC20Mintable("Token D", "TKND");
    }

    function encodeError(string memory error)
        internal
        pure
        returns (bytes memory encoded)
    {
        encoded = abi.encodeWithSignature(error);
    }

    function testCreatePair() public {
        address pairAddress = factory.createPair(
            address(tokenB),
            address(tokenA)
        );

        UniswapV2Pair pair = UniswapV2Pair(pairAddress);

        assertEq(pair.token0(), address(tokenA));
        assertEq(pair.token1(), address(tokenB));
    }

    function testCreatePairZeroAddress() public {
        vm.expectRevert(encodeError("ZeroAddress()"));
        factory.createPair(address(0), address(tokenA));

        vm.expectRevert(encodeError("ZeroAddress()"));
        factory.createPair(address(tokenB), address(0));
    }

    function testCreatePairPairExists() public {
        factory.createPair(address(tokenB), address(tokenA));

        vm.expectRevert(encodeError("PairExists()"));
        factory.createPair(address(tokenB), address(tokenA));
    }

    function testCreatePairIdenticalTokens() public {
        vm.expectRevert(encodeError("IdenticalAddresses()"));
        factory.createPair(address(tokenA), address(tokenA));
    }
}
