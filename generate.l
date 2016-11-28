
(de ls (Dir)
    (let (Res '())
      (in '(ls)
          (until (eof)
                 (let (L (line T))
                   (if (match '("r" "e" "f" @A) (chop L))
                       (push 'Res L)
                       nil))))
      Res))


(de processdir (Dir Pref)
   (chdir Dir
      (for File (ls Dir)
           (in File
               (until (eof)
                     (let (L (line T)
                           Fun (and (from "<a name=\"") (till "\"")) )
                       (when Fun
                         (prinl "sqlite3 docSet.dsidx 'insert into searchIndex(name,type,path) VALUES (\""
                                Fun "\", \"Function\", \"" Pref File "#" Fun "\")'"))))))))


(call "wget" "http://software-lab.de/picoLisp-16.6.tgz")
(call "tar" "-zxf" "picoLisp-16.6.tgz")

(out "functions.sh"
     (prinl "sqlite3 docSet.dsidx  'create table searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);  CREATE UNIQUE INDEX anchr  ON searchIndex (name, type, path);'")
     (processdir "picoLisp/doc/" "")
     (processdir "picoLisp/doc/form/" "form/"))

(bye)
