#!/usr/bin/env bash
# iCE40 UltraLite checks on iCEcube2 bitstreams (see README.md). Uses the tools
# of this source tree (icepack, icebox); run after "make".
set -e
cd "$(dirname "$0")"
TOP=../..
export PYTHONPATH=$TOP/icebox
w=$(mktemp -d); trap 'rm -rf $w' EXIT
for b in *.bin; do
	$TOP/icepack/icepack -u $b $w/t.asc
	$TOP/icepack/icepack $w/t.asc $w/t.bin
	# compare from the 7EAA997E preamble (the header comment before it is not configuration)
	python3 -c 'import sys; a, b = (open(f, "rb").read() for f in sys.argv[1:]); s = lambda d: d[d.index(b"\x7e\xaa\x99\x7e"):]; sys.exit(s(a) != s(b))' $b $w/t.bin
	! python3 $TOP/icebox/icebox_explain.py $w/t.asc | grep -q -e "No DB entries" -e UNKNOWN_FUNCTION
	python3 $TOP/icebox/icebox_vlog.py $w/t.asc > $w/t.v
	echo "ok  $b"
done
