class CreateBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|

          t.text :name

          t.timestamps

      end

    Barber.create :name => 'White Barber Mage'
    Barber.create :name => 'Black Barber Mage'
    Barber.create :name => 'Blue Barber Mage'

  end
end
