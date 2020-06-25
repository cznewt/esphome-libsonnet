
format:
	bash ./scripts/format_lib.sh

update:
	bash ./scripts/test_lib.sh update

test:
	bash ./scripts/test_lib.sh

validate:
	. venv/bin/activate; esphome version
	bash ./scripts/validate_lib.sh

init:
	virtualenv --python=python3 venv
	. venv/bin/activate; pip install esphome; pip install jsonnet-docblock-parser
