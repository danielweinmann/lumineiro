class CreateEmbeddedVideos < ActiveRecord::Migration
  def self.up
    create_table :embedded_videos do |t|
      t.string :title
      t.text :code
      t.timestamps
    end
  end

  def self.down
    drop_table :embedded_videos
  end
end

