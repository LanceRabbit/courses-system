class PurchasingCourse
  prepend SimpleCommand

  attr_accessor :user, :course_id

  def initialize(user, course_id)
    @user = user
    @course_id = course_id
  end

  def call
    validate_course
    available_course

    purchasing
  rescue StandardError => e
    errors.add(:base, e.message)
  end

  private

  def course
    @course ||= Course.find(course_id)
  end

  def validate_course
    raise "The Course #{course.title} is unpublished" if course.unpublished?
  end

  def available_course
    raise "The Course #{course.title} are still available" if user_available_courses
  end

  def user_available_courses
    user.purchases
        .where(course_id: course.id)
        .where(Purchase.arel_table[:expired_at].gteq(Time.zone.now))
        .exists?
  end

  def purchasing
    Purchase.create!(
      user: user,
      course: course,
      price: course.price,
      currency: course.currency,
      expired_at: expired_at
    )
  end

  def expired_at
    Time.zone.now + course.activation_period.days
  end
end
