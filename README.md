# Uniswap_foundry
UniswapV2 was written three years ago and uses outdated versions of Solidity tools  
Project goals:  
Achieve deep knowledge of the UniswapV2 implementation  
Learn Foundry, the next generation ethereum development environment  
You may use any online resources for the project.  
Read through the UniswapV2 code:  
**[Uniswap/v2-core](https://github.com/Uniswap/v2-core)**  
**[Uniswap/v2-periphery](https://github.com/Uniswap/v2-periphery)**  
**[Class Notes](https://drive.google.com/file/d/1nrstvabIItERQb-ilnnnlwSX49nQOIA8/view?usp=share_link)**(written by Jichu Wang, a former student at NEU)  

Copy the UniswapV2 code into a new Foundry project  
The original code had the core and periphery contracts in different repos. We recommend combining them into a single repo to simplify development, and copying libraries rather than using package management.  
UniswapV2Router01 should not be included.  
Upgrade the UniswapV2 code to the latest Solidity version that Foundry supports.  
Write Solidity tests that achieve >95% line coverage for each of the following contracts:  
__UniswapV2Router02__  
__UniswapV2Pair__  
__UniswapV2Factory__  
Generate and commit a line coverage report to assess the quality of your tests.  

<img width="754" alt="image" src="https://user-images.githubusercontent.com/113825112/233853123-ba899743-a0e0-44b1-a283-9155bd39df78.png">

