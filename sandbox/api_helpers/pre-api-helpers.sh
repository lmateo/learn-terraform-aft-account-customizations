#!/bin/bash

echo "Executing Pre-API Helpers"

echo "Delete VPC"
python ./$CUSTOMIZATION/api_helpers/python/vpc.py