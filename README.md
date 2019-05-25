Running org-mode html and pdf export in docker container
================================================

installation
------------
docker pull  hsnuhayato/org-exporter.

Download `docker-org-export` and `docker-org-export-pdf` script from ![github](https://github.com/hsnuhayato/docker-org-export/tree/support_pdf "github") repository(support_pdf branch) and add it to your PATH.

running
-------

You can transform your org-file to html like this:

    docker-org-export index.org


seqdiag
-------
There is `seqdiag` support, so you can use this in your source code:

    #+begin_src seqdiag :file wap_success_seqdiag.png
    seqdiag {
    A -> B [label="Test edge"];
    }
    #+end_src
   
Also, support plantuml and gnuplot.Please refer to the example.org file in support_pdf branch of my ![github](https://github.com/hsnuhayato/docker-org-export/tree/support_pdf "github") repository.

support pdf export
------------------
* Linux user: $ docker-org-export-pdf example.org

* Windows user(power shell): >  docker run --rm -i -t -v C:\Users\username:/emacs/tmp --workdir=/emacs hsnuhayato/org-exporter emacs --batch --load /emacs/emacs_init.el --file /emacs/tmp/example.org --eval '(org-latex-export-to-pdf)'
    * suppose that the target file is C:\Users\username\example.org. Sorry i haven't made a bat for windows, yet.
