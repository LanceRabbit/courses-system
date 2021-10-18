namespace :dev do
  task fake_data: ["db:seed", :fake_courses, :fake_purchases]

  task fake_courses: :environment do
    1.upto(10) do |i|
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

  task fake_purchases: :environment do
    user = User.where(is_admin: false).first

    1.upto(4) do |i|
      course = Course.published.sample
      expired_at = if i != 4
        course.activation_period.days.after
      else
        Time.zone.yesterday
      end

      Purchase.create(
        user: user,
        course: course,
        price: course.price,
        currency: course.currency,
        expired_at: expired_at
      )
    end
  end
end
