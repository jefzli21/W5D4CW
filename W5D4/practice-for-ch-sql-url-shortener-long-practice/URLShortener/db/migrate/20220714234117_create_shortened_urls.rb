class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string "long_url", null: false
      t.string "short_url", null: false, index:{unique: true}
      t.references :submitter, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
