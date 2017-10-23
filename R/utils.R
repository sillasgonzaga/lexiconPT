#' get_word_sentiment
#'
#' Lookup word or term in datasets available on lexiconPT
#'
#' @param word character.
#'
#' @return A list of all datasets available on lexiconPT filtered by the inputed word.
#' @examples{
#'   get_word_sentiment("cantar")
#'   \dontshow{
#'   get_word_sentiment("facil")
#'   }
#'  }
#' @export
get_word_sentiment <- function(word){

  notAvailable <- function(df) {
    if(nrow(df) == 0) return("Word not present in dataset") else df
  }
  x1 <- notAvailable(oplexicon_v2.1[oplexicon_v2.1[["term"]] == word, ])
  x2 <- notAvailable(oplexicon_v3.0[oplexicon_v3.0[["term"]] == word, ])
  x3 <- notAvailable(sentiLex_lem_PT02[sentiLex_lem_PT02[["term"]] == word, ])


  list(
    oplexicon_v2.1 = x1,
    oplexicon_v3.0 = x2,
    sentilex = x3
  )
}

