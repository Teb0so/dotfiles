#!/bin/sh

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

if [ -n "$branch" ]; then
    echo "branch: $branch"
else
    echo "branch: none"
fi

