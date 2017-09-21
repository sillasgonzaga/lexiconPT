---
title: "lexiconPT"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## lexiconPT: An R package that provides lexicons for Portuguese Text Analysis 

`lexiconPT` was developed to make it easy for analysts and researchers who want to perform text analysis and mining in Portuguese texts in R. Its main contribution is that it easily imports cleaned versions of some famous Portuguese lexicons, such as  [OpLexicon](http://ontolp.inf.pucrs.br/Recursos/downloads-OpLexicon.php) and SentiLex.

The cleaning process can be seen in `data-raw/setup.R`. Note that, in order to clean the SentiLex dataset in a tidy way, some assumptions had to be made (I'm gonna write a blog post about it). On the other hand, both OpLexicon versions were already cleaned.

To know how both lexicons were made, please see the help pages of the datasets to check their references.

To install `lexiconPT`, please run `devtools::install_github("sillasgonzaga/lexiconPT")`.
