class CreateNumbers < ActiveRecord::Migration
  def self.up
    create_table :numbers do |t|
      t.string :title
      t.string :subtitle
      t.string :fact_sheet
      t.string :techniques
      t.string :target_audience
      t.string :duration
      t.string :awards
      t.string :history
      t.timestamps
    end
  end

  def self.down
    drop_table :numbers
  end
end

