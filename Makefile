
doc:
	./scripts/gen_doc.sh


format:
	./scripts/format_lib.sh

update:
	./scripts/test_lib.sh update

test:
	./scripts/test_lib.sh

validate:
	. venv/bin/activate; esphome version
	./scripts/validate_lib.sh

init:
	virtualenv --python=python3 venv
	. venv/bin/activate; pip install esphome; pip install jsonnet-docblock-parser
