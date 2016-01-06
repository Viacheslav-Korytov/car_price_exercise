class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
      t.string :name
      t.string :model_slug
      t.references :organization, index: true

      t.timestamps
    end
  end
end
