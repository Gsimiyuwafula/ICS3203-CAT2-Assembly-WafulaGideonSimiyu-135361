# ICS3203-CAT2-Assembly-WafulaGideonSimiyu-135361
# Finding the Largest Number in an Array (x86-64 Assembly)

## Assembly Code (LargestNumber.asm)

```bash
# Assemble the assembly file
nasm -f elf64 -o LargestNumber.o LargestNumber.asm

# Link the object file
ld -o LargestNumber LargestNumber.o

# Run the executable
./LargestNumber

