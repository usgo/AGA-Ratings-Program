# AGA Ratings Program

This program scans the AGA Database for tournaments that have been added but not yet rated.

It is intended to be run after the tournaments have been uploaded into the database.

Basic Operations:
1. Receive tournament file from TD
2. Run scripts from aga-ratings, refer to documentation
3. Run ./check
3a. If errors between players check with TD before proceeding
4. Run ./bayrate
5. Run ./bayrate --commit

Compiling the code creates several binaries:

Check - Application to search db for earliest unrated game in db. Will display any games with unusual results, eg. [1d defeating 7d] or [20k defeating 10k] in even games.
Bayrate - Application to rate tournaments. Default operation is a 'dry run' of ratings to see if there are any issues. Will rate any tournamentsrments that need to be rated and run through each one. Changes to ratings and sigma are displayed for reference.

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
