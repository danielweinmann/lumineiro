class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
      t.text :text
      t.timestamps
    end
  end

  def self.down
    drop_table :histories
  end
end

