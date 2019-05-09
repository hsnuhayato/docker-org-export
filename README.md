Running org-mode html export in docker container
================================================

installation
------------
docker pull  hsnuhayato/org-exporter

Download `docker-org-export` and `docker-org-export-pdf` script and add it to your PATH.

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
   

support pdf export
------------------
* Linux user: $ docker-org-export-pdf index.org

* Windows user(power shell): >  docker run --rm -i -t -v C:\Users\username:/emacs/tmp --workdir=/emacs hsnuhayato/org-exporter emacs --batch --load /emacs/emacs_init.el --file /emacs/tmp/index.org --eval '(org-latex-export-to-pdf)'
    * suppose that the target file is C:\Users\username\index.org. Sorry i haven't made a bat for windows, yet.
