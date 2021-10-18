%w[language math chemical algorithms programming].each do |category|
  Category.create(name: category)
end

%w[admin test].each do |user|
  User.create(
    email: "#{user}@test.com",
    password: "#{user}12345",
    is_admin: user == 'admin'
  )
end
