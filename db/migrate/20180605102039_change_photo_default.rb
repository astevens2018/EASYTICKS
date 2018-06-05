class ChangePhotoDefault < ActiveRecord::Migration[5.2]
  def change
  change_column_null :users, :photo, 'http://static.tvtropes.org/pmwiki/pub/images/320px-thomasandgordon26_1713.png'
  end
end
