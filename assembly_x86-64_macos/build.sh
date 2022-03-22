#!/bin/sh

# get nasm through hombrew:
# `brew install nasm`

# Assemble
# macho64 is the 64bit macos executable format
nasm -f macho64 hello.s

# Link
# -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib is required for libSystem (-lSystem)
# xcrun --show-sdk-path
ld -macosx_version_min 10.8.0 -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -o hello hello.o
