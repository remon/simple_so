class AddCountryIdToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :country_id, :integer

  end
end
