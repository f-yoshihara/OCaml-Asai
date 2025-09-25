# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About This Repository

This is a learning repository for OCaml programming following the Japanese textbook "プログラミングの基礎" (Programming Fundamentals). The codebase contains practice exercises and notes organized by chapters, demonstrating functional programming concepts and design recipes.

## Repository Structure

- `chapter4/`, `chapter5/`, `chapter7/`, `chapter8/` - Contains practice exercises and design pattern examples for each chapter
- `past/` - Archive of completed exercises and code from earlier sessions
- `memo.md` - Comprehensive learning notes covering OCaml concepts, design recipes, and programming insights
- Design recipe documentation in individual chapter folders (e.g., `chapter4/Design_recipe_of_function.md`)

## Development Commands

### Running OCaml Code
```bash
ocaml
# In the OCaml REPL:
# #use "filename.ml";;
```

This is the primary way to execute and test OCaml files in this repository as documented in the README.

## Key Programming Concepts

This repository follows strict design recipes for OCaml development:

### Function Design Recipe (Chapter 4)
1. **目的 (Purpose)** - Define what the function does, input/output types
2. **例 (Examples)** - Create concrete input/output examples as executable tests
3. **本体 (Body)** - Implement the function logic
4. **テスト (Test)** - Verify functionality using the examples

### Template Design Recipe (Chapter 7)
- Templates are determined by input data types
- Use pattern matching (`match`) for structured data
- Test template syntax before implementation

## Code Style Conventions

- Functions include purpose comments in Japanese: `(* 目的 : ... *)`
- Type annotations: `(* function_name : type -> type *)`
- Test cases follow pattern: `let testN = function_call = expected_result`
- Pattern matching used extensively for data structure processing
- Recursive functions defined with `let rec`
- Local variables use `let ... in` expressions

## Architecture Notes

- Each chapter focuses on specific OCaml concepts (functions, conditionals, templates, records)
- Code demonstrates progression from basic functions to complex recursive algorithms
- Strong emphasis on type safety and functional programming principles
- Examples include mathematical problems (tsurukame algorithm), data processing, and sorting algorithms