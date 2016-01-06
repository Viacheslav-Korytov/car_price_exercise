class CreateModelTypes < ActiveRecord::Migration
  def change
    create_table :model_types do |t|
      t.string :name
      t.string :model_type_slug
      t.string :model_type_code
      t.integer :base_price
      t.references :car_model, index: true

      t.timestamps
    end
  end
end
