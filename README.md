# RanjuRepo

A small Python example that prints a greeting and checks it with automated tests.

## Requirements

- Python 3

No third-party packages are required; the tests use Python's built-in `unittest` module.

## Run

From the repository folder, run:

```bash
./test.sh
```

The script prints `Hello, MacBook!` and runs the tests. A successful run ends with `OK`.

To run only the tests, use:

```bash
python3 test.py
```

## Files

- `test.py` contains the `greet()` function and its tests.
- `test.sh` prints the greeting and runs the tests.
