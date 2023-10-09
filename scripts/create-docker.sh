#!/bin/bash

brew install colima
colima nerdctl install

colima start \
	--arch x86_64 \
	--runtime containerd \
	--cpu 4 \
	--memory 8
