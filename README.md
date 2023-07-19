# stm32 helloworld 

This is a simple boilerplate for `STM32` development for debian.


### Preparation

```bash
sudo apt-get install \
  gcc-arm-none-eabi \
  binutils-arm-none-eabi \
  libnewlib-arm-none-eabi \
  stlink-tools

git clone git@github.com:pylover/stlink.git
cd stlink
make clean
make release
sudo make install
sudo ldconfig
```

### Build & flash

```bash
make
make flash
make verify
```

### Analysize *.blf

```bash
arm-none-eabi-size -tA main.elf
```
