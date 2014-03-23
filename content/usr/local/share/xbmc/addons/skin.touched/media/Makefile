TARGET=Textures.xbt
XBMCTEX=/mnt/src/git-mk01/xbmc-rpi/tools/TexturePacker/TexturePacker

IMAGES := $(shell find . -name "*jpg")
IMAGES += $(shell find . -name "*png")
IMAGES += $(shell find . -name "*gif")

all: $(TARGET)

.PHONY: force

$(TARGET): $(XBMCTEX) $(IMAGES)
	$(XBMCTEX) -input . -output $(TARGET)

$(XBMCTEX): force
	$(MAKE) -C /mnt/src/git-mk01/xbmc-rpi/tools/TexturePacker

clean:
	rm -f $(TARGET)
distclean: clean

