.PHONY: commit import

import:
	wget http://software-lab.de/picoLisp-16.6.tgz
	tar zxvf picoLisp*tgz
	grep '\<a name\>' ./picoLisp/doc/ref?.html >output.txt
	pil ./generate.l
	sqlite3 docSet.dsidx  'create table searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);  CREATE UNIQUE INDEX anchr  ON searchIndex (name, type, path);'
	sh ./functions.sh
	mkdir -p picoLisp.docset/Contents/Resources/Documents
	mv docSet.dsidx picoLisp.docset/Contents/Resources/
	mv picoLisp/doc/*.html picoLisp.docset/Contents/Resources/Documents/
	rm -fr picoLisp-16.6.tgz

commit:
	sh ./commit.sh

install:
	cp -r picoLisp.docset ~/.docsets
