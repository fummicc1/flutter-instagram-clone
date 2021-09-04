#!/bin/bash
flutter format lib > /dev/null
git diff --exit-code --quiet .