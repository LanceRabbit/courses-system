namespace :dev do
  task fake_courses: :environment do
    3.times do |i|
      course = Course.create(
        title: "course-#{i}",
        activation_period: rand(1..30),
        price: rand(100..500),
        status: ['unpublished', 'published'].sample,
        slug: "course-#{i}",
        currency: CoursesSystemConfig::CURRENCY.sample,
        category: Category.all.sample
      )
      puts "create courese #{course.title} , #{course.title}"
    end
  end
end
