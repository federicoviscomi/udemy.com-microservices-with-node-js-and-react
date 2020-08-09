#!/usr/bin/env bash
set -euo pipefail
YAML_FILES="all_yaml.txt"
rm ${YAML_FILES} 2>/dev/null || true
find . -not -path "*/node_modules/*" -type f -name "*.yaml" -exec greadlink -f {} \; > ${YAML_FILES}
while IFS= read -r YAML_FILE; do
    echo "$YAML_FILE"
    sed -i '' 's/stephengrider/federicoviscomi/g' "${YAML_FILE}"
done < ${YAML_FILES}