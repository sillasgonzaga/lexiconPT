
# http://www.clayford.net/statistics/creating-an-r-data-package/
# http://thecoatlessprofessor.com/programming/creating-an-r-data-package/
# http://rmhogervorst.nl/cleancode/blog/2016/03/07/create-package-for-dataset.html


# https://www.scribd.com/presentation/330341180/Introducao-a-Data-Science
# https://www.researchgate.net/publication/260289818_Some_clues_on_irony_detection_in_tweets



library(devtools)
library(tidyverse)
library(magrittr)
library(stringr)
library(stringi)
dir.create("data")
dir.create("data-raw")

remove_non_ascii <- function(data){
  non_ascii <- showNonASCII(data$term)
  data[!data$term %in% non_ascii, ]
}


# download oplexicon
download.file("http://ontolp.inf.pucrs.br/Recursos/downloads/OpLexicon/oplexicon_v3.0.zip", "data-raw/oplexicon_v3.0.zip")
download.file("http://ontolp.inf.pucrs.br/Recursos/downloads/OpLexicon/oplexicon_v2.1.zip", "data-raw/oplexicon_v2.1.zip")
# unzip files
unzip("data-raw/oplexicon_v2.1.zip", exdir = "data-raw")
unzip("data-raw/oplexicon_v3.0.zip", exdir = "data-raw")



# download sentilexpt 2.0

# https://github.com/diasdavid/METI-EADW/tree/master/src/sentimentAnalisys
# http://dmir.inesc-id.pt/project/SentiLex-PT_02
download.file("https://raw.githubusercontent.com/diasdavid/METI-EADW/master/src/sentimentAnalisys/SentiLex-lem-PT02.txt",
              "data-raw/SentiLex-lem-PT02.txt")
#download.file("https://raw.githubusercontent.com/diasdavid/METI-EADW/master/src/sentimentAnalisys/SentiLex-flex-PT02.txt",
#              "data-raw/SentiLex-flex-PT02.txt")



####  01 - Read, clean and save oplexicon 3.0 ####
op30 <- read.csv("data-raw/oplexicon_v3.0/lexico_v3.0.txt", stringsAsFactors = FALSE, header = FALSE)
names(op30) <- c("term", "type", "polarity", "polarity_revision")
# fix encoding
op30$term %<>% stri_trans_general("latin-ascii")
# remove non-ASCII strings to make pgk CRAN-compatible
op30 %<>% remove_non_ascii()
# save data
oplexicon_v3.0 <- op30
use_data(oplexicon_v3.0, overwrite = TRUE)

####  02 - Read, clean and save oplexicon 2.1 ####
op21 <- read.table("data-raw/lexico_v2.1txt", sep = ",", stringsAsFactors = FALSE)
names(op21) <- c("term", "type", "polarity")
# fix encoding
op21$term %<>% stri_trans_general("latin-ascii")
# remove non-ASCII strings to make pgk CRAN-compatible
op21 %<>% remove_non_ascii()
# save data
oplexicon_v2.1 <- op21
use_data(oplexicon_v2.1, overwrite = TRUE)


####  02 - Read, clean and save sentilex-flex-pt02 ####
sentilex_lem <- read.table("data-raw/SentiLex-lem-PT02.txt", sep = ",", stringsAsFactors = FALSE)
# break second column into multiple ones
splt <- strsplit(sentilex_lem$V1, ";")
str(splt)
splt %>% map_dbl(length)
# write function
clean_N0N1 <- function(x){
  # x is character vector

  # remove REV if present
  rev <- which(str_detect(x, "REV="))
  if (length(rev) !=0) {x <- x[-rev]}

  i1 <- which(str_detect(x, "POL:N1="))
  i2 <- which(str_detect(x, "POL:N0="))
  # remove POL:N1 only if POL:N0 is not present in the vector
  if (length(i1) != 0 & length(i2) != 0) {x <- x[-i1]}
  x
}

splt <- splt %>% map(clean_N0N1)
# for the first element, separate term from classification
v1 <- splt %>% map(1)
v1 <- v1 %>% map(strsplit, "\\.")
# for the second element of v1, extract string after = sign
v1_term <- v1 %>% map(1) %>% map_chr(1)
v1_pos <- v1 %>% map(1) %>% map_chr(2) %>% str_sub(start = 5)
# for the second element, just remove TG=HUM: from the string
v2 <- splt %>% map_chr(2) %>% str_replace_all("TG=HUM:", "")
# for the third element, extract polarity (number after = sign)
v3 <- splt %>% map_chr(3) %>% str_sub(8) %>% as.numeric()
# for the 4th element, extract polarity classification (string after = sign)
v4 <- splt %>% map_chr(4) %>% str_replace_all("ANOT=", "")

# make final dataframe
sentilex_lem <- data.frame(
  term = v1_term, grammar_category = v1_pos, polarity = v3,
  polarity_target = v2, polarity_classification = v4,
  stringsAsFactors = FALSE
)
# fix encoding
sentilex_lem$term %<>% stri_trans_general("latin-ascii")
# remove non-ASCII strings to make pgk CRAN-compatible
sentilex_lem %<>% remove_non_ascii()
# finally, save data
sentiLex_lem_PT02 <- sentilex_lem
use_data(sentiLex_lem_PT02, overwrite = TRUE)

