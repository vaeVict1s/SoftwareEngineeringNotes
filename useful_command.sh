function cleanupconfig() {
    find . -regextype posix-extended -regex ".*log$|.*aux$|.*out$|.*toc|.*bcf|.*xml|.*blg|.*bbl|.*blx\.bib" -exec rm "{}" \;
}

function recompilepdftex() {
    find -regextype posix-extended -regex ".*log$|.*aux$|.*out$|.*toc|.*bcf|.*xml|.*blg|.*bbl|.*blx\.bib" -exec rm "{}" \; && \  
    pdflatex SoftWareEngineeringNotes.tex && \
    bibtex SoftWareEngineeringNotes && \
    pdflatex SoftWareEngineeringNotes.tex && \
    pdflatex SoftWareEngineeringNotes.tex
}
