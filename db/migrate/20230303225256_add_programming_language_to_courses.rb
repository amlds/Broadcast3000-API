class AddProgrammingLanguageToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :programming_language, :string
  end
end
