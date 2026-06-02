# 🛒 Retail Ordering System

A full-featured retail ordering web application built with **ASP.NET Core 8 MVC**, **Entity Framework Core**, and **SQL Server**. It supports product browsing, cart management, order placement, loyalty points, coupon codes, and a full admin panel.

---

## 📸 Features

### Customer Side
- Browse products by category and brand
- Add to cart and place orders
- Apply coupon codes at checkout
- Earn and view loyalty points
- User registration and login (ASP.NET Core Identity)

### Admin Panel
- Admin dashboard
- Product management (Create, Edit, Delete)
- User management
- Role-based access control (Admin role)

### API
- RESTful Product API (`/api/products`) with Swagger UI
- JWT authentication for API access

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | ASP.NET Core 8 MVC |
| ORM | Entity Framework Core |
| Database | SQL Server (LocalDB / SQL Express) |
| Auth | ASP.NET Core Identity + JWT |
| Frontend | Razor Views, Bootstrap 5 |
| API Docs | Swagger / Swashbuckle |
| Rate Limiting | AspNetCoreRateLimit |

---

## 📁 Project Structure

```
RetailOrderingSystem/
├── Areas/
│   ├── Admin/               # Admin controllers and views
│   └── Identity/            # Login, Register, Logout pages
├── Controllers/
│   ├── API/                 # ProductsApiController (REST)
│   ├── CartController.cs
│   ├── HomeController.cs
│   ├── LoyaltyController.cs
│   ├── OrderController.cs
│   └── ProductController.cs
├── Models/                  # EF Core entities
├── Repositories/            # Repository pattern (IProductRepository)
├── Services/                # EmailService
├── Data/                    # ApplicationDbContext
├── Migrations/              # EF Core migrations
├── Views/                   # Razor views
└── wwwroot/                 # Static files (CSS, JS, Bootstrap)
```

---

## ⚙️ Getting Started

### Prerequisites
- [.NET 8 SDK](https://dotnet.microsoft.com/download)
- SQL Server or SQL Server Express
- Visual Studio 2022 (recommended) or VS Code

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/RetailOrderingSystem.git
cd RetailOrderingSystem
```

### 2. Configure the Database

Open `appsettings.json` and update the connection string to match your SQL Server setup:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=YOUR_SERVER;Database=RetailOrderingDB;Trusted_Connection=True;TrustServerCertificate=True"
}
```

> ⚠️ **Never commit your real connection string.** Use `appsettings.Development.json` or environment variables for local development.

### 3. Apply Migrations

```bash
dotnet ef database update
```

### 4. Seed Initial Data

Run the SQL script `SQLQuery1.sql` against your database to:
- Add the Admin role to your user
- Insert default Categories (Pizza, Cold Drinks, Breads, Snacks)
- Insert default Brands (Home Brand, Premium, Local)

Update the email in the script to match your registered account:
```sql
WHERE u.Email = 'youremail@example.com'
```

### 5. Run the Application

```bash
dotnet run
```

Or press **F5** in Visual Studio.

The app will be available at `https://localhost:7xxx` (see `Properties/launchSettings.json`).

---

## 🔑 Admin Access

1. Register an account via `/Identity/Account/Register`
2. Run `SQLQuery1.sql` to assign the Admin role to your account
3. Access the admin panel at `/Admin/Dashboard`

---

## 📡 API

The REST API is available at `/api/products` and documented via Swagger at:
```
https://localhost:{port}/swagger
```

JWT authentication is required for protected API endpoints. Configure the JWT key in `appsettings.json`:
```json
"Jwt": {
  "Key": "YOUR_SECRET_KEY_HERE",
  "Issuer": "RetailOrderingAPI",
  "Audience": "RetailOrderingAPIUsers"
}
```

---

## 🚀 Deployment Notes

- Set `ASPNETCORE_ENVIRONMENT=Production` in your hosting environment
- Store secrets (connection strings, JWT keys) in environment variables or Azure Key Vault — never in `appsettings.json`
- Run `dotnet publish -c Release` to build for production

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
