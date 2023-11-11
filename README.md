# Project1

Terminal Commands to make the .o files:
- ca65 src/backgrounds.asm
- ca65 src/controllers.asm
- ca65 src/reset.asm
- ca65 src/input.asm



Terminal Command to make the .nes file (file that emulator will run):
- ld65 src/backgrounds.o src/controllers.o src/input.o src/reset.o -C nes.cfg -o input.nes

Description:
We are first assembling each .asm file to create .o files. Once that is done, we pass all of the .o files to the linker. Instead of using the default NES linker config (-t nes), we use our new custom config (-C nes.cfg). The output from the linker is placed into the input.nes ROM file.