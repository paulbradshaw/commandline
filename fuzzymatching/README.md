# Fuzzy Matching - Max Harlow (Notes from CIJ Summer School 2018)

[CSVmatch tool on GitHub](https://github.com/maxharlow/csvmatch)

[Files here](https://github.com/maxharlow/tutorials/tree/master/find-connections-with-fuzzy-matching)

Example: [Offshore tax dealings: celebrities and sportsmen in leaked Jersey files](https://www.theguardian.com/uk-news/2014/jul/09/offshore-tax-dealings-celebrities-sportsmen-leaked-jersey-files) - scraped lists of important people - Who's Who, rich lists. Did fuzzy matching to see was on both lists (famous people, and leaked list).

Global Witness used this for [Jade: Myanmar's Big State Secret](https://www.globalwitness.org/en/campaigns/oil-gas-and-mining/myanmarjade/) - all the mining contracts are published online. Did fuzzy matching against lists of people serving the junta and matched lists.

Example: [UN paying blacklisted diamond company in Central African Republic](https://www.irinnews.org/investigation/2016/09/02/exclusive-un-paying-blacklisted-diamond-company-central-african-republic) - cross reference blacklisted companies against UN contracts.

## Command line

To open the current directory in Finder:

`open .`

To open a file in default program:

`open filename.csv`

Can open all with wildcard:

`open *.csv`

Install:

`pip3 install csvmatch`

OR:

`pip3 install --user csvmatch`

```
csvmatch \
forbes-billionaires.csv \
forbes-china-billionaires.csv \
--fields1 name \
--fields2 name
```

If problems see [this page on setting root](http://www.troubleshooters.com/linux/prepostpath.htm) (skip to end)

Push results to new file:

```
csvmatch \
forbes-billionaires.csv \
forbes-china-billionaires.csv \
--fields1 name \
--fields2 name \
> billionaires-from-china.csv
```

## Exact matching

*How many names on Forbes billionaires list are also on China billionaires list?*

## Naive approaches

* Ignore cases `-i` or `--ignore-case`
* Ignore common name prefixes (Mrs, Mr) `-t`
* Ignore non-alphanumerics `-l`
* Ignore non-Latin characters `-a`
* Ignore order of words
* Ignore domain-specific words

Example:

Orban, Viktor vs Viktor Orban (with accent)

*Which names from CIA World Leaders list are also on White House visitors list?*

```
csvmatch \
    cia-world-leaders.csv \
    white-house-visitors.csv \
    --fields1 leader_name \
    --fields2 visitor_name \
    --ignore-case \
    > leaders-visiting-trump.csv
```

## Use algorithms

```
csvmatch \
    cia-world-leaders.csv \
    forbes-china-billionaires.csv \
    --fields1 leader_name \
    --fields2 name \
    --fuzzy levenshtein \
    > billionaire-chinese-leaders.csv
```


### Machine learning option: Bilenko

> "This approach takes some records and asks you, the user, whether they are the same. After you have told the computer about a few records than do and don't match manually, it uses the power of machine learning to extrapolate out whether there are any other matches across the entire rest of your data." [source](https://github.com/maxharlow/tutorials/tree/master/find-connections-with-fuzzy-matching)


[For the rest see Max's tutorial](https://github.com/maxharlow/tutorials/tree/master/find-connections-with-fuzzy-matching)
