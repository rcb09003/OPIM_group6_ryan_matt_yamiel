class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :position
      t.string :employed
      t.decimal :salary
      t.datetime :start_date
      t.string :education
      t.string :skills

      t.timestamps
    end
  end
end
