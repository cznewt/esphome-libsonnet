#!/usr/bin/env python
# encoding: utf-8

import sys

from jsonnet_docblock_parser import parseFile

import json

class Generator:
  """The generator class that will generate the output."""

  def __init__(self) -> None:
    self.results = []

  def parse_json(self, results):
    """Parse the given results in JSON format."""
    self.results = results["docblocks"]
    output = {
        "docblocks": [],
        "file": results["file"],
    }

    # This results array contains all docblocks found in the file.
    for docblock in results["docblocks"]:
      output["docblocks"].append(docblock.render())
    print(output)
    return json.dumps(output, indent=4)

  def get_results(self):
    """Get the results that are stored in this generator."""
    return self.results


# Load a jsonnet or libsonnet file.
TEST_FILE = sys.argv[1]

# Parse the file.
docblocks = parseFile(TEST_FILE)
#print(docblocks)

#for docblock in docblocks['docblocks']:
 #   print(docblock.render())

# Load the generator.
generator = Generator()

# Parse Json based on the results.
data = generator.parse_json(docblocks)

# Print the json
print(data)