class User < ApplicationRecord
  has_one :user_role, -> { where del_status: false }, foreign_key: :user_code, primary_key: :user_code, inverse_of: :user
  has_one :role, through: :user_role
  has_one :entity_info, through: :user_role

  validates :first_name, :last_name, presence: { message: 'cannot be empty' }

  before_validation :generate_user_code, on: :create, if: -> { user_code.blank? }

  def fullname
    "#{first_name} #{last_name}"
  end

  def generate_user_code
    self.user_code ||= "USR#{Utils::UniqueCodeGenerator.generate(
      model: self.class,
      attribute: :user_code,
      check_exists: true
    )}"
  end
end
