class AddMessageDisplayAndNbrCarrouselToSchools < ActiveRecord::Migration[7.0]
  def change
    add_column :schools, :message_display, :string
    add_column :schools, :nbr_carrousel, :integer
  end
end
