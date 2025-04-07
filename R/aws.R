# reading CSV file from s3 bucket w/ date formatting
read_csv_from_s3 <- function(bucket, key) {
  out <-  data.table::fread(
    rawToChar(
      paws::s3()$get_object(
        Bucket = bucket,
        Key = key
      )$Body)) |>
    dplyr::mutate(across(lubridate::is.instant, as.Date))
  return(out)
}
