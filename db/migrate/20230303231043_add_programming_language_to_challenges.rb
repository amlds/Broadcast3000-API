class AddProgrammingLanguageToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :programming_language, :string
  end
end
