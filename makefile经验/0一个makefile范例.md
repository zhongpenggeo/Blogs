```makefile
#
# Makefile for processing MT data.
# Written by Yang Bo, IGG, CUG, 2013/06/04.
#
#.SECONDARY:
include sites.list

all: $(sites)

BIN=../scripts

%.pdf: %.edi
	site=`basename $@ .pdf`; \
	mkdir $$site; \
	cp $< $(BIN)/mkpara.sh $$site; \
	cp $(BIN)/Makefile_onesite $$site/Makefile; \
	cd $$site; \
	./mkpara.sh $$site; \
	make; \
	cp $@ ..

```

