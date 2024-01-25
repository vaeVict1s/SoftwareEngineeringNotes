function cleanupconfig() {
    find -regextype posix-extended -regex ".*\.(log|aux|out|toc|bcf|xml|blg|bbl|-blx\.bib)$" -exec rm "{}" \;
}

function recompilepdftex() {
    [[ $# != 1 ]] && echo "Provide file path!" && return 1
    filePath="$1"
    find -regextype posix-extended -regex ".*\.(log|aux|out|toc|bcf|xml|blg|bbl|-blx\.bib)$" -exec rm "{}" \; && \  
    pdflatex "${filePath}" && \
    bibtex "${filePath%.tex}" && \
    pdflatex "${filePath}" && \
    pdflatex "${filePath}"
}
