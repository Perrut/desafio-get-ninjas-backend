class CreateRequestInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :request_infos do |t|
      t.string :question1
      t.string :question2
      t.string :question3
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
