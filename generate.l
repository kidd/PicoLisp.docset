
(de ls (Dir)
    (let (Res '())
      (chdir "picoLisp/doc/"
       (in '(list ls )
           (until (eof)
                  (let (L (line T))
                    (if (match '("r" "e" "f" @A) (chop L))
                        (push 'Res L)
                        nil)))))
      Res))

#(call "wget" "http://software-lab.de/picoLisp-16.6.tgz")
(call "tar" "-zxf" "picoLisp-16.6.tgz")

(de processdir (Dir Pref)
    (for File (ls Dir)
         (chdir Dir
                (in File
                    (until (eof)
                           (let (L (line T)
                                 Fun (and (from "<a name=\"") (till "\"")) )
                             (prinl "sqlite3 docSet.dsidx 'insert into searchIndex(name,type,path) VALUES (\""
                                    Fun "\", \"Function\", \"" Pref File "#" Fun "\")'")))))))

(let (entry nil)
  (out "function.sh"
       (prinl "sqlite3 docSet.dsidx  'create table searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);  CREATE UNIQUE INDEX anchr  ON searchIndex (name, type, path);'")
       (processdir "picoLisp/doc/" "")
       (processdir "picoLisp/doc/form/" "form/")))

(bye)
