library(fbRads)
library(devtools)
install_version("httr", version = "1.1.0", repos = "http://cran.us.r-project.org")
library(httr)
app <- oauth_app('facebook', '2095248854051744', '47bbff7bdad4191089dfd988e23e5301')
Sys.setenv('HTTR_SERVER_PORT' = '1410/')
tkn <- oauth2.0_token(
  oauth_endpoints('facebook'), app, scope = 'business_management',
  type  = 'application/x-www-form-urlencoded', cache = FALSE)
tkn <- jsonlite::fromJSON(names(tkn$credentials))$access_token
tkn

fbad_init(accountid = '2056898141263786', token = tkn, version = '3.0')

fbacc <- fbad_init('2056898141263786',tkn , version = '3.0')
fbacc
aud_id <- fbad_create_audience(fbacc,'R-help posters','Unique e-mail addresses in R-help 1997-2015')
fbad_read_audience(fbacc, aud_id,'approximate_count')

campaign <-fbad_create_campaign(fbacc,      name ='Promote my useR! 2015 talk')

fbad_list_ad(fields = c('name', 'effective_status'))
fbad_list_ad(statuses = 'ACTIVE', fields = 'name')

