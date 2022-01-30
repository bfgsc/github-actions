#!/bin/sh

set -e

sh -c "terraform fmt -check -diff -recursive"