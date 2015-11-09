class AddPapercliptoProfile < ActiveRecord::Migration
  def change
    add_attachment :profiles, :image
  end
end
