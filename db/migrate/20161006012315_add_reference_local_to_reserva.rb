class AddReferenceLocalToReserva < ActiveRecord::Migration
  def change
    add_reference :reservas, :local, index: true, foreign_key: true
  end
end
