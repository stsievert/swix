all:
	# make
	cd docs; make html
	
	# removing folders
	rm -rf _sources
	rm -rf _static
	
	# removing html
	rm *.html
	rm searchindex.js
	
	# republishing
	cp -R docs/_build/html/* .
