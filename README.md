# 🎭 Nonsense Poem Generator

Generate delightfully random nonsense poems! Available in **multiple programming languages**:

- 🐚 **Bash** - Simple shell script
- 📘 **TypeScript** - Modern JavaScript with types
- 🟨 **JavaScript** - Plain Node.js
- 🔵 **C** - Classic compiled performance
- ⚡ **C++** - Modern C++ with OOP
- 🔬 **Fortran** - Scientific computing classic
- ☕ **Java** - Enterprise-grade OOP
- 📐 **Pascal** - Structured programming
- 🧠 **Prolog** - Logic programming

## Features

- 🎲 Randomly combines words from curated word banks
- 📝 Multiple poem templates (AABB rhyme, haiku-style, narrative, repetitive, Q&A, list)
- 🎨 Generates unique poems every time
- ⚡ Quick and easy to run
- 🌍 Same functionality across all languages

## Quick Start

### Bash Version (Simplest - No Dependencies)

```bash
# Make executable
chmod +x nonsense-poem-generator.sh

# Generate 3 poems (default)
./nonsense-poem-generator.sh

# Generate 5 poems
./nonsense-poem-generator.sh 5

# Generate 10 poems
./nonsense-poem-generator.sh 10
```

### TypeScript Version

```bash
# Install dependencies (first time only)
npm install

# Generate 3 poems (default)
npm start

# Generate 5 poems
npx ts-node nonsense-poem-generator.ts 5
```

### JavaScript Version

```bash
# No installation needed!
node nonsense-poem-generator.js
node nonsense-poem-generator.js 5
```

### C Version

```bash
# Compile once
gcc -o nonsense-poem-generator-c nonsense-poem-generator.c

# Run
./nonsense-poem-generator-c 5
```

### C++ Version

```bash
# Compile once
g++ -std=c++17 -o nonsense-poem-generator-cpp nonsense-poem-generator.cpp

# Run
./nonsense-poem-generator-cpp 5
```

### Fortran Version

```bash
# Compile once (requires gfortran)
gfortran -o nonsense-poem-generator-f90 nonsense-poem-generator.f90

# Run
./nonsense-poem-generator-f90 5
```

### Java Version

```bash
# Compile once
javac NonsensePoemGenerator.java

# Run
All versions implement the same core functionality with language-specific idioms:

### Interpreted Languages
- **Bash**: Pure shell script, 4 templates, no dependencies
- **TypeScript/JavaScript**: 6 templates, module support, modern syntax
- **Prolog**: Logic-based, declarative approach

### Compiled Languages
- **C**: Fast, minimal overhead, procedural style
- **C++**: OOP design with STL, modern C++17
- **Fortran**: Array operations, scientific computing heritage
- **Java**: Platform-independent bytecode, OOP
- **Pascal**: Structured programming, readable syntax

### Performance
All compiled versions execute in ~1-5ms. Interpreted versions take ~10-50ms.
All feel instant for typical use (generating 3-10 poems).
```

### Prolog Version

```bash
# Run with SWI-Prolog
swipl -g main -t halt nonsense-poem-generator.pl -- 5
```

See [COMPILE.md](COMPILE.md) for detailed compilation instructions.

## Examples

```
Poem #1:
------------------------------------------------------------
The bouncy penguin wiggles frantically,
While purple toasters rest beneath a cloud.
With sparkly delight and invisible glee,
They tumble together wild and free!

Poem #2:
------------------------------------------------------------
The waffle dances,
gleefully it dances,
fuzzy and grumpy it dances,
Oh, how that waffle dances!

Poem #3:
------------------------------------------------------------
I saw:
A squeaky telescope that somersaults backwards,
A luminous flamingo under the stars,
And a wobbly harmonica doing peculiar things,
All while the jellied banana prances!
```

## Customization

Want to add your own words? Edit the word banks at the top of either file:

- `adjectives` - Describing words
- `nouns` - Things and creatures
- `verbs` - Actions
- `adverbs` - How actions are done
- `prepositions` - Positional words
- `places` - Locations

## Technical Details

### TypeScript Version
- Uses template functions for different poem structures
- More sophisticated randomization
- Can be imported as a module
- 6 different poem templates

### Bash Version
- Pure shell script, no dependencies
- Portable and lightweight
- 4 poem templates
- Works on any Unix-like system

## License

MIT - Have fun generating nonsense!
