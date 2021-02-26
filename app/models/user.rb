class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable

  has_many :completed_tests
  has_many :tests, through: :completed_tests
  has_many :authored_tests, class_name: 'Test'
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Invalid email format' }

  def user_tests_level(level)
    tests.where(level: level)
  end

  def completed_test(test)
    completed_tests.order(id: :desc).find_by(test: test)
  end

  def admin?
    type == 'Admin'
  end

  def tests_passed(test_ids)
    self.completed_tests.successfully.where(test_id: test_ids).map(&:test_id).uniq.sort
  end

end
