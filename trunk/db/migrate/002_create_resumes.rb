class CreateResumes < ActiveRecord::Migration
  def self.up
    create_table :resumes do |t|
    end
  end

  def self.down
    drop_table :resumes
  end
end
