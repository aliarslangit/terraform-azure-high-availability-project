
################################################################################################  
#                                       Primary Region                                         #
################################################################################################ 


#provision a resource group in Primary Region
module "primary-rg" {
  source   = "./modules/management/azure_resource_group"
  rgname   = "rg-eus-dr"
  location = "eastus"
}

#provision ASP in Primary Region
module "primary-asp-plan" {
  source   = "./modules/webapps/azure_app_service_plan"
  rgname   = module.primary-rg.resource_group_name
  location = "eastus"
  aspname  = "eus-asp-dr"
  skusize  = "S1"
  os_type  = "Linux"
}

#provision webapp for the frontend service in Primary Region
module "primary-app-frontend" {
  source   = "./modules/webapps/azure_app_service"
  rgname   = module.primary-rg.resource_group_name
  location = "eastus"
  appname  = "eus-frontend-app-dr"
  aspid    = module.primary-asp-plan.asp_id
}

#provision webapp for the backend service in Primary Region
module "primary-app-backend" {
  source   = "./modules/webapps/azure_app_service"
  rgname   = module.primary-rg.resource_group_name
  location = "eastus"
  appname  = "eus-backend-app-dr"
  aspid    = module.primary-asp-plan.asp_id
}

#provision SQL Database for the data storage in Primary Region
module "primary-sql" {
  source        = "./modules/database/azure_sql"
  rgname        = module.primary-rg.resource_group_name
  location      = "eastus"
  sqlservername = "primarysqlserverdr"
  dbname        = "primarydb"
  dbsize        = "1024"
  username      = "dbuser1"
  password      = "P@ssw0rd!"
  sku_name      = "BC_Gen5_2"
  db_version    = "12.0"
}

################################################################################################  
#                                       Secondary Region                                       #
################################################################################################ 

#provision a resource group in Secondary Region
module "secondary-rg" {
  source   = "./modules/management/azure_resource_group"
  rgname   = "rg-eus-dr"
  location = "westeurope"
}

#provision ASP in Secondary Region
module "secondary-asp-plan" {
  source   = "./modules/webapps/azure_app_service_plan"
  rgname   = module.secondary-rg.resource_group_name
  location = "westeurope"
  aspname  = "eus-asp-dr"
  skusize  = "S1"
  os_type  = "Linux"
}

#provision webapp for the frontend service in Secondary Region
module "secondary-app-frontend" {
  source   = "./modules/webapps/azure_app_service"
  rgname   = module.secondary-rg.resource_group_name
  location = "westeurope"
  appname  = "eus-frontend-app-dr"
  aspid    = module.secondary-asp-plan.asp_id
}

#provision webapp for the backend service in Secondary Region
module "secondary-app-backend" {
  source   = "./modules/webapps/azure_app_service"
  rgname   = module.secondary-rg.resource_group_name
  location = "westeurope"
  appname  = "eus-backend-app-dr"
  aspid    = module.secondary-asp-plan.asp_id
}

#provision SQL Database for the data storage in Secondary Region
module "secondary-sql" {
  source        = "./modules/database/azure_sql"
  rgname        = module.secondary-rg.resource_group_name
  location      = "westeurope"
  sqlservername = "secondarysqlserverdr"
  dbname        = "secondarydb"
  dbsize        = "1024"
  username      = "dbuser1"
  password      = "P@ssw0rd!"
  sku_name      = "BC_Gen5_2"
  db_version    = "12.0"
}


################################################################################################  
#                                       Traffic Manager                                        #
################################################################################################  
module "global-tm" {
  source = "./modules/networking/azure_traffic_manager"
  rgname = module.primary-rg.resource_group_name
  name   = "global-trafficmanager-dr"
  primary_hostname = module.primary-app-frontend.asp_hostname
  secondary_hostname = module.secondary-app-frontend.asp_hostname
  primary_location = "eastus"
  secondary_location = "westeurope"
}
################################################################################################  
#                                       SQL Geo-Replication                                    #
################################################################################################  
module "geo-Replication" {
  source = "./modules/database/azure_sql_failover"
  primary_db_id = module.primary-sql.db_id
  secondary_db_id = module.secondary-sql.db_id
  primary_server_id = module.primary-sql.server_id
  secondary_server_id = module.secondary-sql.server_id
}