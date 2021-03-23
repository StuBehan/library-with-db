require 'pg'

class LibraryManager

  def self.all
    @array = []
    rs = self.check_env.exec "SELECT * FROM inventory"
    rs.each do |row|
      @array << { :id => row['id'], :title => row['title'], :author => row['author'], :isbn => row['isbn'] }
    end
    return @array
  end

  def self.add(title, author, isbn)
    rs = self.check_env.exec "INSERT INTO inventory (title, author, isbn) 
                              VALUES ('#{title}', '#{author}', '#{isbn}');"
  end

  def self.check_env
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'library_test', 
                       :user => 'makers', :password => 'makers'
    else
      con = PG.connect :dbname => 'library', 
                       :user => 'makers', :password => 'makers'
    end
  end
end