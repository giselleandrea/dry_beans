
# README 

- API Backend creada en Abril de 2024.
- Autor: Giselle Andrea Quiceno Osorio
- user: giselleandrea

## Dependencias 

* Rails version 
```bash
rails "7.1.3"
```
* ruby version
```bash
ruby "3.1.4"
```
* Migration
```bash
rails db:migrate
```
* Database
```bash
gem "mysql2", "~> 0.5"

rails db:create

adapter: mysql2
database: dry_beans
database: dry_beans_test
socket: /var/run/mysqld/mysqld.sock

```
* Running Api
```bash
rails server

default http://localhost:3000 

```
* Running Seeds 
```bash
rails db:seed
```

* Tests
```bash
rails test .../dry_beans/test/controllers/api/v1/routes_controller_test.rb
rails test .../dry_beans/test/controllers/api/v1/trips_controller_test.rb
rails test .../dry_beans/test/controllers/api/v1/deliveries_controller_test.rb

```

## Rutas de la API.

* Routes
```bash
GET    http://localhost:3000/api/v1/routes/show
GET    http://localhost:3000/api/v1/routes/route_trip/:id
POST   http://localhost:3000/api/v1/routes/create
PUT    http://localhost:3000/api/v1/routes/update/:id
DELETE http://localhost:3000/api/v1/routes/delete/:id
```

* Trips
```bash
GET    http://localhost:3000/api/v1/trips/show
GET    http://localhost:3000/api/v1/trips/trip_show/:id
POST   http://localhost:3000/api/v1/trips/create
PUT    http://localhost:3000/api/v1/trips/update/:id
DELETE http://localhost:3000/api/v1/trips/delete/:id
```db

* Deliveries
```bash
GET    http://localhost:3000/api/v1/deliveries/show
POST   http://localhost:3000/api/v1/deliveries/create
POST   http://localhost:3000/api/v1/deliveries/change_status
PUT    http://localhost:3000/api/v1/deliveries/update/:id
DELETE http://localhost:3000/api/v1/deliveries/delete/:id
```

* Lists
```bash
GET    http://localhost:3000/api/v1/lists/all_status
GET    http://localhost:3000/api/v1/lists/all_type_delivery
```




