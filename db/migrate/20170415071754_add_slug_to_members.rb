class AddSlugToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :slug, :string, unique: true

    Member.all.each do |member|
      member.slug = SecureRandom.hex
      member.save
    end
  end
end
