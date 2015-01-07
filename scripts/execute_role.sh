#!/bin/bash --login

knife bootstrap chef-test03 -x root -P Password9! -E prod -r "role[test]"