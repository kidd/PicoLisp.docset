(out "functions.sh"
 (in "output.txt"
    (until (eof)
       (let (File (and (from "picoLisp/doc/") (till ":"))
             Fun (and (from "<a name=\"") (till "\"")) )
         (prinl "sqlite3 docSet.dsidx 'insert into searchIndex(name,type,path) VALUES (\""
                Fun "\", \"Function\", \"" File "#" Fun "\")'")))))

(bye)
