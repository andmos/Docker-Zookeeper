#!/bin/bash

for i in {1..5} ; do
  docker rm -f zoo${i}
done

