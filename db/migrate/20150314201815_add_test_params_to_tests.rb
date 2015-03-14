class AddTestParamsToTests < ActiveRecord::Migration
  def change
    add_column :tests, :test_params, :string
  end
end
