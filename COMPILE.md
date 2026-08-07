# Compilation and Execution Guide

## JavaScript
```bash
# Make executable (optional)
chmod +x nonsense-poem-generator.js

# Run
node nonsense-poem-generator.js
node nonsense-poem-generator.js 5
```

## C
```bash
# Compile
gcc -o nonsense-poem-generator-c nonsense-poem-generator.c

# Run
./nonsense-poem-generator-c
./nonsense-poem-generator-c 5
```

## C++
```bash
# Compile
g++ -std=c++17 -o nonsense-poem-generator-cpp nonsense-poem-generator.cpp

# Run
./nonsense-poem-generator-cpp
./nonsense-poem-generator-cpp 5
```

## Fortran
```bash
# Compile (requires gfortran)
gfortran -o nonsense-poem-generator-f90 nonsense-poem-generator.f90

# Run
./nonsense-poem-generator-f90
./nonsense-poem-generator-f90 5
```

## Java
```bash
# Compile
javac NonsensePoemGenerator.java

# Run
java NonsensePoemGenerator
java NonsensePoemGenerator 5
```

## Pascal
```bash
# Compile (requires Free Pascal Compiler - fpc)
fpc nonsense-poem-generator.pas

# Run
./nonsense-poem-generator
./nonsense-poem-generator 5
```

## Prolog
```bash
# Run with SWI-Prolog
swipl -g main -t halt nonsense-poem-generator.pl
swipl -g main -t halt nonsense-poem-generator.pl -- 5

# Or interactively
swipl nonsense-poem-generator.pl
?- main([5]).
```

## Compile All (requires all compilers installed)
```bash
gcc -o nonsense-poem-generator-c nonsense-poem-generator.c
g++ -std=c++17 -o nonsense-poem-generator-cpp nonsense-poem-generator.cpp
gfortran -o nonsense-poem-generator-f90 nonsense-poem-generator.f90
javac NonsensePoemGenerator.java
fpc nonsense-poem-generator.pas
```
