class CreateEleves < ActiveRecord::Migration[5.1]
  def change
    create_table :eleves do |t|
      t.string :name
      t.string :mail
      t.string :password
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
