class CreateCollectForms < ActiveRecord::Migration[6.1]
  def change
    create_table :collect_forms do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
