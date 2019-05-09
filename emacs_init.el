(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; (el-get-bundle plantuml-mode
;; :type github
;; :name plantuml-mode
;; :pkgname "skuro/plantuml-mode"
;; :branch "master")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes nil)
 '(inhibit-startup-screen t)
 ;;'(org-babel-load-languages (quote ((plantuml . t) (emacs-lisp . t))))
 '(package-selected-packages
   (quote
    (puml-mode org-plus-contrib org melpa-upstream-visit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Takaoゴシック")))))

;; plantuml.jarへのパスを設定
;; (setq org-plantuml-jar-path "~/.emacs.d/lib/plantuml.jar")
(setq org-plantuml-jar-path "/emacs/plantuml.jar") ;;docker
(setq plantuml-output-type "utxt")
;; org-babelで使用する言語を登録
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))

(setq org-confirm-babel-evaluate nil)

(setq org-latex-classes '(("jsarticle"
            "\\documentclass{jsarticle}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{url}
\\usepackage{atbegshi}
\\AtBeginShipoutFirst{\\special{pdf:tounicode EUC-UCS2}}
\\usepackage[dvipdfmx,setpagesize=false]{hyperref}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
            ("\\section{%s}" . "\\section*{%s}")
            ("\\subsection{%s}" . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}" . "\\paragraph*{%s}")
            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
               ("jsbook"
            "\\documentclass{jsbook}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{url}
\\usepackage{atbegshi}
\\AtBeginShipoutFirst{\\special{pdf:tounicode EUC-UCS2}}
\\usepackage[dvipdfmx,setpagesize=false]{hyperref}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
            ("\\chapter{%s}" . "\\chapter*{%s}")
            ("\\section{%s}" . "\\section*{%s}")
            ("\\subsection{%s}" . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}" . "\\paragraph*{%s}")
            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
               ))
(setq org-startup-truncated nil)
(setq org-startup-folded nil)
(setq org-latex-default-class "jsarticle")

(setq org-latex-pdf-process
      '("platex -shell-escape %f"
        "platex -shell-escape %f"
        "bibtex %b"
        "platex -shell-escape %f"
        "platex -shell-escape %f"
        "dvipdfmx %b.dvi"))
(setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))



;; org change line
(setq org-startup-truncated nil)
(defun change-truncation()
  (interactive)
  (cond ((eq truncate-lines nil)
         (setq truncate-lines t))
        (t
         (setq truncate-lines nil))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;; 対応する括弧をハイライト
(show-paren-mode t)
;; c coding style // c言語用
(add-hook 'c++-mode-hook
'(lambda ()
(hs-minor-mode 1)))
(define-key global-map (kbd "C-x /") 'hs-toggle-hiding)

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (revert-buffer t t))

(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

(add-hook 'c-mode-hook '(lambda () (setq tab-width 2  indent-tabs-mode nil)))
(add-hook 'c++-mode-hook '(lambda () (setq tab-width 2  indent-tabs-mode nil)))

;;; clear buffer
(defun my-shell-hook ()
  (local-set-key "\C-cl" 'erase-buffer))
(add-hook 'shell-mode-hook 'my-shell-hook)

;;reload
(global-set-key
 [f12] 'eval-buffer)

;;; 背景色を黒にする(文字色を黒以外に変更してから)
(set-background-color "black")

;;; 文字色を設定する
(set-foreground-color "grey")

;;; カーソル色を設定する
(set-cursor-color "grey")

;; 選択中のリージョンの色を設定します。
(set-face-background 'region "dim grey")

;;; global-font-lock-mode(色の設定等）を有効にする
(global-font-lock-mode t)


;;(require 'anthy)
;;(setq default-input-method "japanese-anthy")
;;(anthy-change-hiragana-map "," "，") ;デフォルトで全角コンマ
;;(anthy-change-hiragana-map "." "．") ;デフォルトで全角ピリオド
(setq x-select-enable-clipboard t);copy to system clipboard
;;
;; MELPA
;;
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
