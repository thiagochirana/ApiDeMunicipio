class CreateMunicipios < ActiveRecord::Migration[7.1]
  def change
    create_table :municipios do |t|
      t.string :nome
      t.integer :idIBGE
      t.references :estado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
