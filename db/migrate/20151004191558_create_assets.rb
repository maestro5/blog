class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string     :data
      t.string     :filename
      t.belongs_to :assetable, polymorphic: true, index: true
      t.string     :type
      
      t.timestamps null: false
    end
  end
end
