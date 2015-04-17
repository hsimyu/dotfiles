$latex          = 'platex -kanji=utf8 --shell-escape -halt-on-error -guess-input-enc -synctex=1 -interaction=nonstopmode %S';
$latex_silent   = 'platex -kanji=utf8 -halt-on-error -guess-input-enc -synctex=1 -interaction=batchmode %S';
$dvipdf         = 'dvipdfmx %O -o %D %S';
$bibtex         = 'pbibtex -kanji=utf8 %B';
$makeindex      = 'mendex %O -o %D %S';
$max_repeat     = 5;
$pdf_mode       = 3;

# prevent latexmk from removing PDF after typeset,
#$pvc_view_file_via_temporary = 0;

if (-f 'C:/Program Files/SumatraPDF/SumatraPDF.exe') {
    $pdf_previewer = '"C:/Program Files/SumatraPDF/SumatraPDF.exe" -reuse-instance';
} elsif (-f 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe') {
    $pdf_previewer = '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance';
} else {
    $pdf_previewer  = '"C:\\Program Files (x86)\\Adobe\\Reader 11.0\\Reader\\AcroRd32.exe" /n %S';
}
