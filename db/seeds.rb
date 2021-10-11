%w[language math chemical algorithms programming].each do |category|
  Category.create(name: category)
end
