# SSO - Single Sign-On Identity Provider (IDP)

## Overview
This project is a **Single Sign-On (SSO)** application, designed as an Identity Provider (IDP) server. It supports multi-tenancy using the [Apartment gem](https://github.com/influitive/apartment) in Rails. The application features a root domain and multiple tenant domains, each with its own users, admin users, organizations, and applications. Administrators can assign roles and rights to users within their tenant environments.

## Key Features

### Multi-Tenancy
- **Root Domain**: The central domain for the application.
- **Tenant Domains**: Separate domains for each tenant, managed via Apartment.

### User Management
- **Admin Users**: Administrators for tenant domains with special rights.
- **Regular Users**: Standard users within a tenant.

### Organizations and Applications
- Tenants can create organizations.
- Organizations can manage applications, users, and assign roles and rights.

### SSO Implementation
- Provides authentication for multiple domains via a single login (Single Sign-On).

## Technologies Used
- **Ruby on Rails**: Backend framework.
- **Apartment Gem**: Multi-tenancy management.
- **Devise**: Authentication.
- **PostgreSQL**: Database, supporting schema-based multi-tenancy.
- **Bootstrap**: Frontend styling.

## Installation

### Prerequisites
Ensure the following are installed:
- Ruby (>= 3.0.0)
- Rails (>= 7.0)
- PostgreSQL
- Node.js and Yarn

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/Rohitpanwar7826/SSO.git
   cd SSO
   ```
2. Install dependencies:
   ```bash
   bundle install
   yarn install
   ```
3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rake sample_data:build_schema_data
   ```
4. Start the server:
   ```bash
   rails server
   ```
5. Access the application:
   - Root domain: `http://sso.lvh.me:3000`
   - Tenant domains will follow the pattern: `http://<tenant_name>.lvh.me:3000`

## Usage

### Creating a Tenant
1. Access the root domain.
2. Log in as an admin.
3. Create a new tenant domain.

### Managing Users and Roles
1. Log in to the tenant domain as an admin.
2. Use the dashboard to:
   - Add users.
   - Assign roles and rights.

### Adding Organizations and Applications
1. Navigate to the **Organizations** section.
2. Create an organization.
3. Add applications to the organization and assign user roles.


## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For any questions or support, feel free to reach out:
- **Author**: Rohit Panwar
- **GitHub**: [Rohitpanwar7826](https://github.com/Rohitpanwar7826)
