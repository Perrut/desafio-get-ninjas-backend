class CreateUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_infos do |t|
      t.string :phone
      t.string :name
      t.string :email
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
