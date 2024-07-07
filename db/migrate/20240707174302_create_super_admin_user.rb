class CreateSuperAdminUser < ActiveRecord::Migration[7.1]
  def change
    User.create!(email: 'erickhwk@gmail.com', password: 'contem15', role: 'super_admin')
  end
end
