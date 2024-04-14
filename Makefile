all:
	make html
	make pdf

install:
	pip install -r requirements.txt

clean:
	cd book; rm -rf \
		*.aux *.out *.log pylabimshow* myplot* myfile* \
		combined_files hello.txt hello.py data.mat test.txt vectools.py \
		module1.py pylabhistogram.pdf eu-pop-2017.csv \
		_build .ipynb_checkpoints

html:
	jupyter-book build book --builder html

linkcheck:
	jupyter-book build book --builder linkcheck

pdf: book/*-*.ipynb
	jupyter-book build book --builder pdflatex

nbval:
	@echo "Testing all chapters (apart from 18) with --nbval"
	pytest -v --nbval book --sanitize-with book/static/nbval_sanitize.cfg \
	    --ignore=book/18-environments.ipynb --ignore=book/_build
	@echo "Testing chapter 18 with --nbval-lax"
	pytest -v --nbval-lax book/18-environments.ipynb


nbval-native:
	@echo "Testing all chapters (apart from 18) with --nbval"
	pytest -v --nbval book --sanitize-with book/static/nbval_sanitize.cfg \
	    --ignore=book/18-environments.ipynb --ignore=book/_build
	@echo "Testing chapter 18 with --nbval-lax"
	pytest -v --nbval-lax book/18-environments.ipynb


docker-all:
	make docker-build
	make docker-html
	make docker-linkcheck
	make docker-pdf
	make docker-nbval

docker-build:
	docker build -t python4compscience .

# Occasionally (after changing branch) we need to force rebuild:
docker-build-nocache:
	docker build -t python4compscience2 --no-cache .

define DOCKER_RUN
docker run --rm -v $(CURDIR):/io	python4compscience
endef

docker-bash:
	docker run --workdir=/io -t -i -v $(CURDIR):/io python4compscience bash

docker-html:
	$(DOCKER_RUN) make html

docker-linkcheck:
	$(DOCKER_RUN) make linkcheck

docker-pdf:
	$(DOCKER_RUN) make pdf

docker-nbval:
	$(DOCKER_RUN) make nbval

docker-clean:
	$(DOCKER_RUN) make clean

docker-binder-nbval:
	$(DOCKER_RUN) make nbval-native

# to update the title page:
# - screenshot first page of pdf
# - (edit out date if desired)
# - add border around bitmap, for example using
#   "convert titlepage.png -shave 1x1 -bordercolor black -border 1 titlepage-with-border.png"
