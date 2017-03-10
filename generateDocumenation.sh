#!/bin/bash

jazzy \
   --clean \
	--author WillowTree \
	--author_url https://willowtreeapps.com \
	--github_url https://github.com/willowtreeapps/spruce-ios \
	--module-version 1.0 \
	--xcodebuild-arguments -scheme,Spruce \
	--module Spruce \
	--output docs/swift_output \
	--source-directory Spruce \
   --readme ./README.md
