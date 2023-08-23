#!/bin/bash

echo "Executing Post-API Helpers"

echo "Delete VPC"
python ./$CUSTOMIZATION/api_helpers/python/vpc.py