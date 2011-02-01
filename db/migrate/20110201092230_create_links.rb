class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :cat
      t.string :subcat
      t.string :industry
      t.string :author
      t.string :linkurl

      t.timestamps
    end
    add_index :links, :user_id
  end

  def self.down
    drop_table :links
  end
end
