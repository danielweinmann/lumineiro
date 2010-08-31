class CreateNumbers < ActiveRecord::Migration
  def self.up
    create_table :numbers do |t|
      t.string :title
      t.string :subtitle
      t.text :fact_sheet
      t.text :techniques
      t.string :target_audience
      t.string :duration
      t.text :awards
      t.text :history
      t.timestamps
    end
  end

  def self.down
    drop_table :numbers
  end
end

