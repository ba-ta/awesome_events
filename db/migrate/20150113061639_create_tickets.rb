class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user,  index: true
      t.references :event, index: true, null:false
      t.string     :comment

      t.timestamps                      null: false
    end
    add_foreign_key :tickets, :users
    add_foreign_key :tickets, :events
  end
end
