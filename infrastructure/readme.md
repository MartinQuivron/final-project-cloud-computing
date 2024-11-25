# Infrastructure Documentation

## Description

Cette infrastructure configure un environnement complet sur Azure pour déployer une application web. Elle inclut les ressources suivantes :

- Un **App Gateway** pour gérer les requêtes entrantes.
- Un **App Service** pour héberger l'application.
- Une base de données **PostgreSQL** pour stocker les données.
- Un **Blob Storage** pour le stockage de fichiers.
- Un **Virtual Network (VNet)** pour isoler les ressources.

---

## Variables

| Variable                     | Default                         | Description                                                          |
|------------------------------|---------------------------------|----------------------------------------------------------------------|
| `location`                   | `francecentral`                | Localisation des ressources Azure                                   |
| `resource_group_name`        | `my-resource-group`            | Nom du groupe de ressources dans lequel toutes les ressources sont regroupées |
| `app_service_name`           | `my-app-service`               | Nom de l'App Service                                                |
| `database_server_name`       | `my-database-server`           | Nom du serveur PostgreSQL                                           |
| `database_name`              | `my-database`                  | Nom de la base de données dans le serveur                           |
| `database_username`          | `dbadmin`                      | Nom d'utilisateur administrateur pour la base de données            |
| `database_password`          | `password123`                  | Mot de passe administrateur pour la base de données                 |
| `blob_storage_name`          | `myblobstorage`                | Nom du compte de stockage Azure                                     |
| `vnet_name`                  | `my-vnet`                      | Nom du réseau virtuel                                               |

---

## Output

| Variable      | Description                                                 |
|---------------|-------------------------------------------------------------|
| `app_gateway` | L'URL de l'App Gateway pour accéder à l'application         |
| `database`    | Détails de connexion à la base de données                  |
| `storage`     | URL pour accéder au compte de stockage                     |

---

## Structure des fichiers

L'organisation des fichiers Terraform pour cette infrastructure est la suivante :

infrastructure/ ├── main.tf # Déclarations principales des ressources Terraform. ├── variables.tf # Variables utilisées dans l'infrastructure. ├── outputs.tf # Sorties des ressources Terraform. ├── terraform.tfstate # Fichier d'état généré après l'application. ├── terraform.tfstate.backup# Sauvegarde de l'état Terraform. ├── .terraform.lock.hcl # Fichier de verrouillage Terraform. ├── modules/ # Modules pour les ressources spécifiques : │ ├── app_gateway/ │ │ ├── main.tf # Logique principale pour l'App Gateway. │ │ ├── outputs.tf # Sorties pour l'App Gateway. │ │ └── variables.tf # Variables spécifiques à l'App Gateway. │ ├── app_service/ │ │ ├── main.tf # Logique principale pour l'App Service. │ │ ├── outputs.tf # Sorties pour l'App Service. │ │ └── variables.tf # Variables spécifiques à l'App Service. │ ├── blob_storage/ │ │ ├── main.tf # Logique principale pour le Blob Storage. │ │ ├── outputs.tf # Sorties pour le Blob Storage. │ │ └── variables.tf # Variables spécifiques au Blob Storage. │ ├── database/ │ │ ├── main.tf # Logique principale pour la base de données. │ │ ├── outputs.tf # Sorties pour la base de données. │ │ └── variables.tf # Variables spécifiques à la base de données. │ └── vnet/ │ ├── main.tf # Logique principale pour le réseau virtuel. │ ├── outputs.tf # Sorties pour le réseau virtuel. │ └── variables.tf # Variables spécifiques au réseau virtuel.

---

## Modules

| Module         | Usage                                              |
|----------------|----------------------------------------------------|
| `app_gateway`  | Provisionner une App Gateway pour gérer les requêtes |
| `app_service`  | Provisionner un service pour héberger l'application |
| `blob_storage` | Provisionner un stockage Azure Blob                |
| `database`     | Provisionner une base de données PostgreSQL        |
| `vnet`         | Provisionner un réseau virtuel pour isoler les ressources |

Chaque module a la structure suivante :


---

## Instructions

1. Clonez ce dépôt sur votre machine locale.
2. Assurez-vous d'avoir configuré vos identifiants Azure via le CLI ou les variables d'environnement.
3. Modifiez les variables nécessaires dans `variables.tf`.
4. Exécutez les commandes suivantes pour déployer l'infrastructure :
   ```bash
   terraform init
   terraform plan
   terraform apply
