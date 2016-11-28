.PHONY: commit import

import:
	pil ./generate.l
	sh ./functions.sh
	mkdir -p picoLisp.docset/Contents/Resources/Documents/form
	mv docSet.dsidx picoLisp.docset/Contents/Resources/
	mv picoLisp/doc/*.html picoLisp.docset/Contents/Resources/Documents/
	mv picoLisp/doc/form/*.html picoLisp.docset/Contents/Resources/Documents/form/
	rm -fr picoLisp-16.6.tgz

commit:
	sh ./commit.sh

install:
	cp -r picoLisp.docset ~/.docsets
