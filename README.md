# Courses-System

## Required

```shell
Ruby 2.6.7
Rails 5.2.6
Postgres 12
```

### setup database

```shell
cp config/database.example.yml database.yml
```

```shell
rails db:create && rails db:migrate
```

## addtest data

```shell
rails dev:fake_data
```

## API

test user account.

```shell
email: test@test.com
password: test12345
```

### login

```ruby
/api/v1/login
```

#### request

```shell
curl -d '{"email":"test@test.com", "password":"password"}' -H "Content-Type: application/json" -X POST http://localhost:3000/api/v1/login
```

#### response

```json
{
    "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MzQ1MzE4MzR9.B25_fZ8neon0R1b5JIfIaCm6a6E7ew3UUUQvqNek_bM",
    "status": "ok"
}
```

### purchasing course

```ruby
/api/v1/purchases
```

#### request

```shell
curl -d '{"course_id": 8}' -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MzQ1MzQ0NDl9.q5ZeNtBkpml6qVpStrTaJioAQB_91Q1XGaN3vOVnM6g" -X POST http://localhost:3000/api/v1/purchases
```

#### response

Purchasing course successfully.

```shell
{"message":"Purchasing course successfully","status":"created"}
```

if without parameters will got below error.

```shell
{"error":"course_id is missing"}
```

### view purchased courses

```shell
curl -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MzQ1MzgwODN9.j41bdRXIIWk8copTBT1f50lEgHeN0hGrEnpCYTKSy8E" -X GET http://localhost:3002/api/v1/purchases?category_id=2&avaiabled=1
```

## Admin

```shell
admin@test.com
admin12345
```

```shell
http://localhost:3000/login
```

### courses

```shell
http://localhost:3000/admin/
or
http://localhost:3002/admin/courses
```

### create course

```shell
http://localhost:3000/admin/courses/new
```

### edit course

```shell
http://localhost:3002/admin/courses/[slug]/edit
```
