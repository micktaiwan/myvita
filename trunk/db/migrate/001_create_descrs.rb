class CreateDescrs < ActiveRecord::Migration
  def self.up
    create_table :descrs do |t|
    end
  end

  def self.down
    drop_table :descrs
  end
end
