class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title, null: false
      t.text :catch_copy, null: false
      t.text :concept, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
#t.references :userでuser_idというカラムが生成される。
#foreign_key: trueという記述を加えることで、外部キー制約を設定できる。