og:image: https://sinotrade.github.io/images/shioaji_spot_light-01.png

# Shioaji
![shioaji-logo](https://sinotrade.github.io/images/shioaji-logo-01.png)![sinopac-logo](https://www.sinotrade.com.tw/Images/logo.png)

[![PyPI - Status](https://img.shields.io/pypi/v/shioaji.svg?style=for-the-badge)](https://pypi.org/project/shioaji)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/shioaji.svg?style=for-the-badge)]()
[![PyPI - Downloads](https://img.shields.io/pypi/dm/shioaji.svg?style=for-the-badge)](https://pypi.org/project/shioaji)
[![Build - Status](https://img.shields.io/badge/build-passing-brightgreen.svg?style=for-the-badge)]()

[![Coverage](https://img.shields.io/badge/coverage%20-99%25-yellowgreen.svg?style=for-the-badge)]()
[![Binder](https://img.shields.io/badge/launch-Tutorial-ff69b4.svg?style=for-the-badge)](https://mybinder.org/v2/gh/Sinotrade/Sinotrade.github.io/master?filepath=tutorial%2Fshioaji_tutorial.ipynb)
[![doc](https://img.shields.io/badge/docs%20-passing-orange.svg?style=for-the-badge)](https://sinotrade.github.io/)
[![Gitter](https://img.shields.io/badge/chat-%20on%20gitter-46bc99.svg?style=for-the-badge)](https://gitter.im/Sinotrade/Shioaji?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

---

Shioaji is the most pythonic API for trading the Taiwan and global financial market. You can integrated your favorite Python packages such as NumPy, pandas, PyTorch or TensorFlow to build your trading model with the Shioaji API on cross-platform.

---

We are in early-release alpha. Expect some adventures and rough edges.

The key features are:

- Fast: High performance with c++ implement core and FPGA event broker.

- Easy: Designed to be easy to use and learn.

- Fast to code: With native python to integrate with large python ecosystem.

- Cross-Platform: The first one python trading API with Linux compatible in Taiwan.


## Installation
### Binaries
simple using pip to install
```
pip install shioaji
```
update shioaji with 

```
pip install -U shioaji
```
### Docker Image
simple run with interactive mode in docker 
```
docker run -it sinotrade/shioaji:latest
```
run with jupyter lab or notebook
```
docker run -p 8888:8888 sinotrade/shioaji:jupyter
```