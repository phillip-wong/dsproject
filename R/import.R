#' @title Import
#'
#' @description Imports a variety of different data files
#'
#' @param file name of file in path.
#' @param ... extra parameters passed into files.
#'
#' @import haven readxl vroom
#'
#' @seealso
#' * [haven::read_sas()] read sas7bdat files
#' * [haven::read_stata()] read dta files
#' * [haven::read_spss()] read sav files
#' * [readxl::read_excel()] read excel files
#' * [vroom::vroom()] read most files fast
#'
#' @export
#'
#' @return returns a data frame of file.
#' @examples
#' # import(data.csv)
import <- function(file, ...){

  # if no file specified, prompt user

  if(missing(file))
    file <- file.choose()


  # get file info

  file <- tolower(file)
  basename <- basename(file)
  extension <- tools::file_ext(file)


  # import dataset

  df <- switch(extension,
           "sas7bdat" = haven::read_sas(file, ...),
           "dta" = haven::read_stata(file, ...),
           "sav" = haven::read_spss(file, ...),
           "xlsx" = readxl::read_excel(file, ...),
           "xls" = readxl::read_excel(file, ...),
           vroom::vroom(file, ...)
           )

  # return data frame
  return(df)
}

