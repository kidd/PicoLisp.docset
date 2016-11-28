.PHONY: commit import

import:
	pil ./generate.l
	sh ./functions.sh
	mkdir -p picoLisp.docset/Contents/Resources/Documents
	mv docSet.dsidx picoLisp.docset/Contents/Resources/
	mv picoLisp/doc/*.html picoLisp.docset/Contents/Resources/Documents/
	rm -fr picoLisp-16.6.tgz

commit:
	sh ./commit.sh

install:
	cp -r picoLisp.docset ~/.docsets
