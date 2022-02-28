

#install.packages("RJDBC")
library(RJDBC)
library(dplyr)
library(civis)

setwd("C:/Users/pouliots/FCC-FAC/Ag Economics - Data")

#download.file('https://s3.amazonaws.com/redshift-downloads/drivers/jdbc/1.2.36.1060/RedshiftJDBC42-no-awssdk-1.2.36.1060.jar','RedshiftJDBC42-no-awssdk-1.2.36.1060.jar')

# connect to Amazon Redshift
driver <- JDBC("com.amazon.redshift.jdbc42.Driver", "RedshiftJDBC42-no-awssdk-1.2.36.1060.jar", identifier.quote="`")

# url <- "<JDBCURL>:<PORT>/<DBNAME>?user=<USER>&password=<PW>
url <- "jdbc:redshift://agbrain-redshift-cluster.cfzxplmjijps.us-east-1.redshift.amazonaws.com:5439/dev?user=sebastien&password=hg53!fJPg8"
conn <- dbConnect(driver, url)

#dbListTables(conn)


q1 <- tbl(conn, "comtrade_annual")

q2 <- q1 %>%
  #mutate(HS_two = as.character(trunc(as.numeric(commodity_code)/10000)), year = as.character(year)) %>%
  #dplyr::select(year, commodity_code, HS_two) %>%
  #dplyr::filter(commodity_code == "810199") %>%
  dplyr::select(-classification, -period, -partner_iso, -trade_flow_code, -reporter_iso, -partner_iso, -qty_unit_code) %>%
  dplyr::filter(aggregate_level != 6) %>%
  #head() %>%
  as.data.frame() %>%
  tbl_df()

q2






# q1 <- tbl(conn, "comtrade")
# 
# q2 <- q1 %>%
#   #mutate(HS_two = as.character(trunc(as.numeric(commodity_code)/10000)), year = as.character(year)) %>%
#   #dplyr::select(year, commodity_code, HS_two) %>%
#   #dplyr::filter(commodity_code == "810199") %>%
#   dplyr::select(-classification, -period, -partner_iso, -trade_flow_code, -reporter_iso, -partner_iso, -qty_unit_code) %>%
#   dplyr::filter(aggregate_level != 6) %>%
#   #head() %>%
#   as.data.frame() %>%
#   tbl_df()
#   
# q2
# 
# 
# q1 %>%
#   mutate(year = as.character(year))
# 
# 
# q1 %>% 
#   dplyr::select(commodity_code)
# 
# 


%>%
  dplyr::select(commodity_code)


str_extract(c("010216", "026454"),2)

trunc(as.numeric(c("010216", "026454"))/10000)

  mutate(date = as_date(paste0(period, "01"))) %>%
  arrange(date)

dbDisconnect(conn)
