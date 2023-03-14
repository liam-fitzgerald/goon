#!/bin/bash

rsync -avL --delete ../trees/urbit/pkg/base-dev/ ../trees/zod/goon/
rsync -avL ./urb/ ../trees/zod/goon/

