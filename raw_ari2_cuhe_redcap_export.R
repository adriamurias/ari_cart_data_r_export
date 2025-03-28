# Packages
library(DBI)

# Get DB credentials (stored in '.Renviron')
ari_cart_server = Sys.getenv('ARI_CART_SERVER')
ari_cart_database = Sys.getenv('ARI_CART_DATABASE')
ari_cart_username = Sys.getenv('ARI_CART_USERNAME')
ari_cart_password = Sys.getenv('ARI_CART_PASSWORD')
ari_cart_port = Sys.getenv('ARI_CART_PORT')
ari_cart_driver = 'ODBC Driver 17 for SQL Server'

# Connection object
mssqlconnection <- dbConnect(
  odbc::odbc(),
  Driver = ari_cart_driver,
  Server = ari_cart_server,
  Database = ari_cart_database,
  UID = ari_cart_username,
  PWD = ari_cart_password,
  Port = ari_cart_port
)

# Tables
ari2_cuhe_redcap_screening <- dbReadTable(mssqlconnection,
                                          Id(schema = "raw", table = "ari2_cuhe_redcap_screening"),
                                          check.names = FALSE)
ari2_cuhe_redcap_car_t_infusion <- dbReadTable(mssqlconnection,
                                               Id(schema = "raw", table = "ari2_cuhe_redcap_car_t_infusion"),
                                               check.names = FALSE)
ari2_cuhe_redcap_analytic <- dbReadTable(mssqlconnection,
                                         Id(schema = "raw", table = "ari2_cuhe_redcap_analytic"),
                                         check.names = FALSE)
ari2_cuhe_redcap_adverse_events <- dbReadTable(mssqlconnection,
                                               Id(schema = "raw", table = "ari2_cuhe_redcap_adverse_events"),
                                               check.names = FALSE)
ari2_cuhe_redcap_followup <- dbReadTable(mssqlconnection,
                                         Id(schema = "raw", table = "ari2_cuhe_redcap_followup"),
                                         check.names = FALSE)
ari2_cuhe_redcap_followup_completed <- dbReadTable(mssqlconnection,
                                                   Id(schema = "raw", table = "ari2_cuhe_redcap_followup_completed"),
                                                   check.names = FALSE)
