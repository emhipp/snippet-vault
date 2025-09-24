# reading CSV file from s3 bucket w/ date formatting
read_csv_from_s3 <- function(bucket, key, version=NULL, header=TRUE) {
  out <-  data.table::fread(
    rawToChar(
      paws::s3()$get_object(
        Bucket = bucket,
        Key = key,
        VersionId = version
      )$Body), header=header) |>
    dplyr::mutate(across(lubridate::is.instant, as.Date))
  return(out)
}

# write data frame as CSV file to s3
write_csv_to_s3 <- function(df, bucket, key, col_names=TRUE) {
  withr::with_tempfile("temp", {
    readr::write_csv(df, temp, col_names=col_names)
    paws::s3()$put_object(
      Body = temp,
      Bucket = bucket,
      Key = key
    )
  })
}

# set AWS SSO parameters
Sys.setenv(AWS_PROFILE = "")
