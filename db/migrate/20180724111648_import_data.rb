class ImportData < ActiveRecord::Migration[5.1]
  def change
    ## very slow
    #Rake::Task['db:data:load'].invoke

    ## using system commands to load from sql file seems unsafe
    # system("psql BibleQuizAPI < #{Rails.root.join('db', 'data.sql')}")
  end
end
