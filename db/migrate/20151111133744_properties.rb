class Properties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :name
			t.text :description
			t.integer :user_id
			t.timestamps
		end
	end
end
