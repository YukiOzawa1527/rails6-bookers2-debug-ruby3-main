class CreateRelationsips < ActiveRecord::Migration[6.1]
  def change
    create_table :relationsips do |t|
    t.references :follower, foreign_key: { to_table: :users }
    t.references :followed, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
