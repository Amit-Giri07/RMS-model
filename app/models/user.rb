class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {
    admin: 0,
    manager: 1,
    cashier: 2,
    waiter: 3,
    kitchen_staff: 4
  }
end
