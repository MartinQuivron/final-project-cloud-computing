# Infrastructure Documentation

## Membres du groupe

- Martin Quivron
- Adel Eutamene

## Description

Cette infrastructure configure un environnement complet sur Azure pour déployer une application web. Elle inclut les ressources suivantes :

- Un **App Gateway** pour gérer les requêtes entrantes.
- Un **App Service** pour héberger l'application.
- Une base de données **PostgreSQL** pour stocker les données.
- Un **Blob Storage** pour le stockage de fichiers.
- Un **Virtual Network (VNet)** pour isoler les ressources.

---

## Variables

## Variables

Voici les variables utilisées pour configurer cette infrastructure :

| **Variable**               | **Description**                                | **Type**          | **Default**                                                   |
|-----------------------------|-----------------------------------------------|-------------------|--------------------------------------------------------------|
| `random_id`                | Identifiant aléatoire                         | `string`          | -                                                            |
| `resource_group_name`      | Nom du groupe de ressources                   | `string`          | -                                                            |
| `location`                 | Région pour les ressources                    | `string`          | `France Central`                                             |
| `username_db`              | Nom d'utilisateur pour la base de données     | `string`          | -                                                            |
| `password_db`              | Mot de passe pour la base de données          | `string` (sensitif)| -                                                            |
| `database_name`            | Nom de la base de données                     | `string`          | -                                                            |
| `database_host`            | Hôte de la base de données                    | `string`          | -                                                            |
| `storage_account_url`      | URL du compte de stockage                     | `string`          | -                                                            |
| `subnet_id_app_service`    | ID du sous-réseau pour l'App Service           | `string`          | -                                                            |
| `subnet_id_db`             | ID du sous-réseau pour la base de données     | `string`          | -                                                            |
| `subnet_id_app_gateway`    | ID du sous-réseau pour l'App Gateway           | `string`          | -                                                            |
| `docker_registry_url`      | URL du registre Docker                        | `string`          | `https://ghcr.io`                                            |
| `docker_image`             | Image Docker                                  | `string`          | `ghcr.io/martinquivron/final-project-cloud-computing/release_image:latest` |
| `docker_registry_username` | Nom d'utilisateur du registre Docker          | `string`          | `MartinQuivron`                                              |
| `docker_registry_password` | Mot de passe du registre Docker               | `string` (sensitif)| -                                                            |
| `subscription_id`          | ID de l'abonnement                            | `string`          | -                                                            |
| `vnet_address_space`       | Espace d'adressage du réseau virtuel          | `list(string)`    | `["10.0.0.0/16"]`                                            |
| `subnet_prefixes`          | Préfixes pour les sous-réseaux                | `list(string)`    | `["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]`             |

Chaque module (App Gateway, App Service, Blob Storage, Database, VNet) utilise ces variables pour configurer ses ressources. Les valeurs sensibles comme `password_db` et `docker_registry_password` doivent être sécurisées.

---

## Structure des fichiers

L'organisation des fichiers Terraform pour cette infrastructure est la suivante :

```

infrastructure/
├── main.tf               # Déclarations principales des ressources Terraform.
├── variables.tf          # Variables utilisées dans l'infrastructure.
├── outputs.tf            # Sorties des ressources Terraform.
├── .terraform.lock.hcl   # Fichier de verrouillage Terraform.
├── modules/              # Modules pour les ressources spécifiques :
│   ├── app_gateway/
│   │   ├── main.tf       # Logique principale pour l'App Gateway.
│   │   ├── outputs.tf    # Sorties pour l'App Gateway.
│   │   └── variables.tf  # Variables spécifiques à l'App Gateway.
│   ├── app_service/
│   │   ├── main.tf       # Logique principale pour l'App Service.
│   │   ├── outputs.tf    # Sorties pour l'App Service.
│   │   └── variables.tf  # Variables spécifiques à l'App Service.
│   ├── blob_storage/
│   │   ├── main.tf       # Logique principale pour le Blob Storage.
│   │   ├── outputs.tf    # Sorties pour le Blob Storage.
│   │   └── variables.tf  # Variables spécifiques au Blob Storage.
│   ├── database/
│   │   ├── main.tf       # Logique principale pour la base de données.
│   │   ├── outputs.tf    # Sorties pour la base de données.
│   │   └── variables.tf  # Variables spécifiques à la base de données.
│   └── vnet/
│       ├── main.tf       # Logique principale pour le réseau virtuel.
│       ├── outputs.tf    # Sorties pour le réseau virtuel.
│       └── variables.tf  # Variables spécifiques au réseau virtuel.
```

---



## Modules

| Module         | Usage                                              |
|----------------|----------------------------------------------------|
| `app_gateway`  | Provisionner une App Gateway pour gérer les requêtes |
| `app_service`  | Provisionner un service pour héberger l'application |
| `blob_storage` | Provisionner un stockage Azure Blob                |
| `database`     | Provisionner une base de données PostgreSQL        |
| `vnet`         | Provisionner un réseau virtuel pour isoler les ressources |


---

## Endpoints

| Endpoint       | Usage                                              |
|----------------|----------------------------------------------------|
|      `/`       | Root URL |
|  `/examples`   | Visualisation de la table "examples" |
|   `/dataAdd`   | Ajout de data dans la table "examples" |
|   `/quotes`    | Visualisation du fichier "quotes.json" |
|   `/docs`      | Accès à l'aide pour l'API |

---

## Virtual Network

|          Ressources           | Plage d'adresses |
|-------------------------------|------------------|
|      Réseau Virtuel (Vnet)    | 10.0.0.0/16 |
|    Sous-réseau App Service    | 10.0.1.0/24 |
|  Sous-réseau Base de données  | 10.0.2.0/24 |
|    Sous-réseau App Gateway    | 10.0.3.0/24 |

---

## Instructions

1. Clonez ce dépôt sur votre machine locale.
2. Assurez-vous d'avoir configuré vos identifiants Azure via le CLI ou les variables d'environnement.
3. Modifiez les variables nécessaires dans `variables.tf`.
4. Exécutez les commandes suivantes pour déployer l'infrastructure :
   ```bash
   terraform init
   terraform apply
