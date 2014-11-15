class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.text :html
      t.references :category
      t.timestamps
    end
  end
end
