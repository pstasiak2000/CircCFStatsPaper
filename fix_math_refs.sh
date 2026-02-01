#!/bin/bash
# This script is used for fixing mathematical symbols in bib files outputted from a citation manager such as Zotero.
# Typically Zotero will incorrectly parse special symbols such as superscripts or mathematical symbols into a syntax not readable by BibTex
# Assuming a standard ASCII declaration in a Zotero entry, such as 4HE for $^4$He, the script will detect the declaration and replace the text directly in the .bib with correctly parsed BibTeX readable code.
# Works on a case by case basis.
# If there sre symbols which are not represented here, add them below:


# Usage: ./fix_bib_inplace.sh file.bib

FILE="$1"

if [ -z "$FILE" ]; then
    echo "Usage: $0 file.bib"
    exit 1
fi

# Convert 4He -> \ensuremath{{}^4\mathrm{He}}
sed -i -E 's/4He/\\ensuremath{{}^4\\mathrm{He}}/g' "$FILE"

# Convert 3He -> \ensuremath{{}^3\mathrm{He}}
sed -i -E 's/3He/\\ensuremath{{}^3\\mathrm{He}}/g' "$FILE"

# Convert T=0 -> \ensuremath{T=0}
sed -i -E 's/T=0/\\ensuremath{T=0}/g' "$FILE"

# Convert TLambda or T_lambda -> \ensuremath{T_{\lambda}}
sed -i -E 's/T[Ll]ambda/\\ensuremath{T_{\\lambda}}/g' "$FILE"

echo "All substitutions applied in-place for $FILE"
