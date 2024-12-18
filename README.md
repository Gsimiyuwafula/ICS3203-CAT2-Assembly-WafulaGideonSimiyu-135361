# ICS3203-CAT2-Assembly-WafulaGideonSimiyu-135361
# Finding the Largest Number in an Array (x86-64 Assembly)

## Assembly Code (LargestNumber.asm)


### Assemble the assembly file
```bash
nasm -f elf64 -o LargestNumber.o LargestNumber.asm
```
### Link the object file
```
ld -o LargestNumber LargestNumber.o
```
### Run the executable
```
./LargestNumber
```

# Task 2: Arrange Numbers in Ascending Order (x86 Assembly)**

### Task Overview:
This task requires writing an **x86 Assembly program** to arrange a given set of hexadecimal numbers in ascending order using the **Bubble Sort** algorithm. The numbers are provided in an array and need to be sorted in-place. The sorted numbers should then be displayed in **decimal format**.


### Link the Object File: Use ld to link the object file and create an executable:

```

ld -o AscendingOrder AscendingOrder.o
```
 ### Run the Executable: Execute the program to see the sorted array:

```

./AscendingOrder
```
##Task 3: Calculate Factorial (x86 Assembly)
###Task Overview
This program calculates the factorial of a given positive integer. It performs the following steps:

Prompts the user to input a positive integer.
Computes the factorial of the input number using a loop.
Displays the result (factorial) in decimal format.
Link the Object File:
After assembling the source code into an object file, use ld to link the object file and create an executable:

```
ld -o Factorial Factorial.o
```
###Run the Executable
Execute the program to input a number and see the computed factorial displayed:
```

./Factorial
```

