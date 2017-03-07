class RenameAgendaItems < ActiveRecord::Migration[5.0]
  def change
    rename_table :agenda_items, :tasks
  end
end
