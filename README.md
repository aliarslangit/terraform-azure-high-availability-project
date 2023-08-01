Azure PaaS Multi-Region DR Implementation
============
[![GitHub Stars](https://img.shields.io/github/stars/IgorAntun/node-chat.svg)](https://github.com/aliarslangit/terraform-azure-high-availability-project/stargazers) [![GitHub Issues](https://img.shields.io/github/issues/IgorAntun/node-chat.svg)](https://github.com/aliarslangit/terraform-azure-high-availability-project/issues) [![Current Version](https://img.shields.io/badge/version-1.0.0-green.svg)](https://github.com/aliarslangit/terraform-azure-high-availability-project) [![Live Demo](https://img.shields.io/badge/demo-online-green.svg)](https://igorantun.com/chat) 

This repository includes the terraform scripts to implement multi-region DR solution for Azure PaaS services.

---
## Overview

Active-active DR ensures that your application remains available and responsive even if one region becomes unavailable due to a disaster or other reasons. Traffic Manager allows you to configure DNS-based traffic routing, and by using this service, you can direct traffic to healthy endpoints in different regions.

your application will be able to survive a failure in one region, and users will automatically be directed to the healthy instances in other regions, ensuring high availability and disaster recovery capability.

### Key Features
1: Deployment of Azure Services in two different Regions <br>
2: Geo-Replication is enabled across primary and secondary sql databases <br>
3: Traffic Manager is used to route traffic towards available region

<a href="https://www.buymeacoffee.com/igorantun" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>

---

## Azure Services
- Azure App Service Plan 
- Azure App Services 
- Azure SQL Server
- Azure SQL Database
- Azure Traffic Manager

#### There are 2 Resource Groups in different regions:
- **East US:** This is primary region and acts as a point of communication unless it becomes unavailable due to any disaster or outage.
- **West Europe:** This region acts as a secondary region and will be automatically Up & Running during outage in primary region.
---



## Requirements
Before you can deploy this solution over Azure, you need to fulfill few dependencies which are listed below.
### 1: Terraform
Terraform is an open-source infrastructure as code (IaC) tool developed by HashiCorp. It allows you to define and manage your infrastructure in an efficient way. Terraform can be installed from the official website: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

### 2: Azure Subscription
You need an enabled Azure subscription where you can provision the resources/services.

---
## Usage
### 1: Terraform Backend
After installing Terraform you need to configure the backend to store terraform statefile in provider.tf file.
https://github.com/aliarslangit/terraform-azure-high-availability-project/blob/main/providers.tf
```python
  backend "azurerm" {
    resource_group_name  = "{resource group name}"
    storage_account_name = "{storage account name}"
    container_name       = "{containername}"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
```
### 2: Authenticate to Azure:
You need to authenticate to your Azure subscription before you can run terraform commands. There are a number of methods to authenticate including:
#### 1: Azure CLI: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli
#### 2: Service Principal: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret


---
## Deploying Infrastructure
There are three core commands to kick-off the deployment.
> ### terraform init  <br>
To initialize the backend and installing required providers and modules.

> ### terraform plan  <br>
It shows the summary of all the changes that are going to be made in your Azure environment.
> ### terraform apply
It will ask you to provide a confirmation (yes/no) and your deployment will be triggered.
## License
>You can check out the full license [here](https://github.com/aliarslangit/terraform-azure-high-availability-project/blob/main/license.txt)

