# AGA Ratings Program

This program scans the AGA Database for tournaments that have been added but not yet rated.

It is intended to be run after the tournaments have been uploaded into the database.

Compiling the code creates several binaries:

**TODO: document the binaries and what each one is used for**

## Building and Running with Docker

To build and run with the provided Dockerfile, first copy `db_passwords.example.h` to `db_passwords.h` and fill in the values.

Now run:

```
docker build -t agaratings .
```

Run with:

```
docker run --rm -it agaratings <binary-to-execute>
```

e.g., to check for tournaments that haven't been rated yet, `docker run --rm -it agaratings check`
