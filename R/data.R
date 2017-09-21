

#' OpLexicon V2.1
#'
#' OpLexicon is a sentiment lexicon for the Portuguese language. Please see SOUZA and VIEIRA (2012) and
#' SOUZA et al. (2012) for its complete reference and documentation.
#'
#' @format A data frame with 30677 rows and 3 variables:
#' \describe{
#'   \item{\code{term}}{character. The word or term.}
#'   \item{\code{type}}{character. Grammar classification of the word or term.}
#'   \item{\code{polarity}}{integer. Numeric classification of the polarity or sentiment. It can only assume the values of -1, 0, and 1}
#' }
#' @source \url{http://ontolp.inf.pucrs.br/Recursos/downloads-OpLexicon.php}
"oplexicon_v2.1"



#' OpLexicon V3.0
#'
#' OpLexicon is a sentiment lexicon for the Portuguese language. Please see SOUZA and VIEIRA (2012) and
#' SOUZA et al. (2012) for its complete reference and documentation.
#'
#' @format A data frame with 32191 rows and 4 variables:
#' \describe{
#'   \item{\code{term}}{character. The word of term. It also includes emoticons.}
#'   \item{\code{type}}{character. The type of the term.}
#'   \item{\code{polarity}}{integer. Numeric classification of the polarity or sentiment.}
#'   \item{\code{polarity_revision}}{character. Was the polarity obtained manually (A) or automatically (C)?}
#' }
#' @source \url{http://ontolp.inf.pucrs.br/Recursos/downloads-OpLexicon.php}
"oplexicon_v3.0"




#' SentiLex-PT02
#'
#' A sentiment lexicon designed for the extraction of sentiment and opinion about human entities in Portuguese texts.
#' Please see SILVA, CARVALHO, COSTA and SARMENTO (2010) for its complete reference and documentation.
#'
#' @format A data frame with 7014 rows and 5 variables:
#' \describe{
#'   \item{\code{term}}{character The word of term.}
#'   \item{\code{grammar_category}}{character. The grammar classification of the term.}
#'   \item{\code{polarity}}{double. Numeric classification of the polarity or sentiment.}
#'   \item{\code{polarity_target}}{character. Polarity target. It can be N0 (subject), N1 (complement) or N2 (no documentation was found for what it means).}
#'   \item{\code{polarity_classification}}{character. Was the polarity obtained manually (MAN) or automatically (JALC)?.}
#' }
#' @source Mário J. Silva, Paula Carvalho, Carlos Costa, Luís Sarmento, Automatic Expansion of a Social Judgment Lexicon for Sentiment Analysis Technical Report. TR 10-08. University of Lisbon, Faculty of Sciences, LASIGE, December 2010. doi: 10455/6694
"sentiLex_lem_PT02"
