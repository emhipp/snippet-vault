# compare two versions of a dataframe
compare_dfs <- function(df1, df2) {
  df1 <- as.data.frame(df1) |> dplyr::select(order(colnames(df1)))
  df2 <- as.data.frame(df2) |> dplyr::select(order(colnames(df2)))
  cmp <- arsenal::comparedf(df1, df2)
  return(cmp)
}
