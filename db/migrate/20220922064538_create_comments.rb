class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
#  t.に続くのがカラムの型、その右側にシンボルで記載されるものがカラム名。
#  ここではt.references型を使う。これは他テーブルから情報を参照する際に用いる型。 
#  userと記載するとuser_idというカラムが生成される。
      t.references :prototype, null: false, foreign_key: true
#  外部キー制約『foreign_key: true』対応する主キーのレコードが存在しないと保存できない。
#  not null制約『null: false』空の値だと保存できない。
      t.text :content, null: false

      t.timestamps
    end
  end
end
