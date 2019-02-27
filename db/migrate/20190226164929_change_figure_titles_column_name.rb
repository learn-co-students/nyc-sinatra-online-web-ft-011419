class ChangeFigureTitlesColumnName < ActiveRecord::Migration
  def change
    rename_column :figure_titles, :titles_id, :title_id
  end
end
