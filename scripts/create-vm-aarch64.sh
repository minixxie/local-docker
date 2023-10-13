#!/bin/bash

brew install colima
colima nerdctl install

colima start \
	--arch aarch64 \
	--runtime containerd \
	--cpu 4 \
	--memory 8
