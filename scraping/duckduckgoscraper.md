# Scraping search results on DuckDuckGo: `ddgr`

`ddgr` is a [command line tool for scraping search results from DuckDuckGo](https://github.com/jarun/ddgr)

If you have Homebrew installed, install it with `brew install ddgr` 

Try a command like this:

`ddgr -x --json paulbradshaw > pbddg.json`

The `-x` specifies that you want full URLs in the results (not just the domain)

The `--json` specifies that you want the results in JSON

At the end make sure to output the results using `>` and a filename that ends in `.json`
