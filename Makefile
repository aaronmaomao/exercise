#

default: mwos.img
	
mwos.img: mbr.bin
	java -jar ./tools/file.jar -name mwos.img -szie 1440 -fill mbr.bin
	
mbr.bin: mbr.asm
	nasm -f bin mbr.asm -o mbr.bin -l mbr.lst
	
clean:
	del /Q .\*.lst
	del /Q .\*.bin
	del /Q .\*.img
