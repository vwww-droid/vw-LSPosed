#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Building libxposed/api..."
cd libxposed/api
./gradlew :api:publishApiPublicationToMavenLocal

echo "Building libxposed/service..."
cd ../service
./gradlew :interface:publishInterfacePublicationToMavenLocal

echo "Building zipAll..."
cd ../../
./gradlew clean zipAll

echo "Build completed successfully!"


