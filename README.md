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

### STlink v2 firmware version

Update your programmer firmware using `CubeProgrammer`

```
Found 1 stlink programmers
  version:    V2J42S7
  serial:     030030000800003550334D4E
  flash:      0 (pagesize: 0)
  sram:       0
  chipid:     0x000
  dev-type:   unknown
```

### Build & flash

```bash
make clean all
make flash
make verify
```

### Analize *.blf

```bash
arm-none-eabi-size -tA main.elf
```
