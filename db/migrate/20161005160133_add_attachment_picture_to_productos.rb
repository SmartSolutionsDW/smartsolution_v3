class AddAttachmentPictureToProductos < ActiveRecord::Migration
  def self.up
    change_table :productos do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :productos, :picture
  end
end
