def setup_test_database
  con = PG.connect :dbname => 'library_test', 
                       :user => 'makers', :password => 'makers'
  con.exec "TRUNCATE inventory;"
  con.exec "INSERT INTO inventory (title, author, isbn) 
            VALUES('The cat sat on the mat', 'Jacob Ibanez', '9746352187643');"
end
