require 'pg'

class LibraryManager

  def self.all
    @array = []
    rs = check_env.exec "SELECT * FROM inventory"
    rs.each do |row|
      @array << { :id => row['id'], :title => row['title'], :author => row['author'], 
:isbn => row['isbn'] }
    end
    return @array
  end

  def self.add(title, author, isbn)
    check_env.exec "INSERT INTO inventory (title, author, isbn) 
                              VALUES ('#{title}', '#{author}', '#{isbn}');"
  end

  def self.check_env
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect :dbname => 'library_test', :user => 'makers', :password => 'makers'
    else
      PG.connect :dbname => 'library', :user => 'makers', :password => 'makers'
    end
  end
end
