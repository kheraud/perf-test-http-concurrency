#!/usr/bin/env bash
# This file:
#
#  - Launch load tests on a specific url then outputs stat and plots result

usage() { echo "Usage: $0 [-d <duration: 5>] [-r <rate: 50>] [-t <target-dir: /tmp>] [-n <name: default>] [-o <output: hist[0,50ms,100ms,200ms,300ms]] -u <url>" 1>&2; exit 1; }
dependency() { echo "Dependencies: Can't find vegeta in your path" 1>&2; exit 1; }

d=5                                 # Default duration : 5 sec
r=50                                # Default rate : 50 req / sec
t="/tmp"                            # Default result directory
n="default"                    # Default name of run : default
o="hist[0,50ms,100ms,200ms,300ms]"  # Default stdout report stats

while getopts ":d:r:t:n:o:u:" param; do
    case "${param}" in
        d)
            d=${OPTARG}
            [ -n "$d" ] && [ "$d" -eq "$d" ] || usage
            ;;
        r)
            r=${OPTARG}
            [ -n "$r" ] && [ "$r" -eq "$r" ] || usage
            ;;
        t)
            t=${OPTARG}
            [ -d "$t" ] || usage
            ;;
        n)
            n=${OPTARG}
            [ "${n//[0-9A-Za-z]/}" = "" ]] || usage
            ;;
        o)
            o=${OPTARG}
            ;;
        u)
            u=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${u}" ]; then
    usage
fi

if ! [ -x "$(command -v vegeta)" ]; then
    dependency
fi

_bin_path="${t}/vg-load-${n}.bin"
_plot_path="${t}/vg-plot-${n}.html"

echo "GET ${u}" | vegeta attack -duration="${d}s" -rate="${r}" -output="${_bin_path}"
vegeta report -type="${o}" < "${_bin_path}"
vegeta plot -title="Run of ${n} (d=${d}, r=${r})" -output="${_plot_path}" < "${_bin_path}"