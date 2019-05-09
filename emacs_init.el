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
;; (load (expand-file-name (concat (getenv "HOME") "/.emacs.d/init")))

;; (setq load-path (cons "~/.emacs.d/elisp" load-path))
;; (setq load-path (cons "~/.emacs.d/elpa/org-plus-contrib-20161010" load-path))
;; (setq load-path (cons "/usr/local/share/emacs/site-lisp/rtags" load-path))

;; Enable puml-mode for PlantUML files old
;;(setq org-plantuml-jar-path "~/Downloads/plantuml.jar")
;;(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
;;(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))

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

;; (require 'acp)
;; (add-hook 'c++-mode-hook 'electric-pair-mode)
;; (add-hook 'tex-mode-hook 'electric-pair-mode)
;; (add-hook 'c-mode-hook 'electric-pair-mode)
;; (add-hook 'python-mode-hook 'electric-pair-mode)

;; (require 'json-mode)
;; (add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
;; (add-hook 'Javascript-mode-hook 'electric-pair-mode)
;; (add-hook 'json-mode-hook 'electric-pair-mode)

;;(autoload 'gtags-mode "gtags" "" t)
;;(setq gtags-mode-hook
;;      '(lambda ()
;;         (local-set-key "\M-t" 'gtags-find-tag)
;;         (local-set-key "\M-r" 'gtags-find-rtag)
;;        (local-set-key "\M-s" 'gtags-find-symbol)
;;         (local-set-key "\C-t" 'gtags-pop-stack)
;;         ))
;;(add-hook 'c-mode-common-hook
;;          '(lambda()
;;             (gtags-mode 1)
;;             (gtags-make-complete-list)
;;             ))
;; (add-hook 'emacs-lisp-mode-hook 'acp-mode)
;; (add-hook 'lisp-mode-hook 'acp-mode)
;; (add-hook 'c++-mode-hook 'acp-mode)
;; (add-hook 'tex-mode-hook 'acp-mode)
;; (setq acp-paren-alist
;;   '((?( . ?))
;;     (?[ . ?])
;;     (?{ . ?})
;;     (?$ . ?$)
;;     (?\" . ?\")
;;     (?\' . ?\')))
;; (setq acp-insertion-functions
;;    '((mark-active . acp-surround-with-paren)
;;      ((thing-at-point 'symbol) . acp-surround-symbol-with-paren)
;;      (t . acp-insert-paren)))
;; (defun acp-surround-symbol-with-paren (n)
;;   (save-excursion
;;     (save-restriction
;;       (narrow-to-region (car (bounds-of-thing-at-point 'symbol)) (cdr (bounds-of-thing-at-point 'symbol)))
;;       (goto-char (point-min))
;;       (insert-char (car (acp-current-pair)) n)
;;       (goto-char (point-max))
;;       (insert-char (cdr (acp-current-pair)) n)
;; )))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'tabbar)
;; (tabbar-mode)
;; ;(global-set-key "\M-]" 'tabbar-forward)  ; 次のタブ
;; ;(global-set-key "\M-[" 'tabbar-backward) ; 前のタブ
;; ;(global-set-key [M-right] 'tabbar-forward)  ; 次のタブ
;; ;(global-set-key [M-left] 'tabbar-backward) ; 前のタブ
;; (global-set-key [C-right] 'tabbar-forward)  ; 次のタブ
;; (global-set-key [C-left] 'tabbar-backward) ; 前のタブ
;; (global-set-key [XF86Forward] 'tabbar-forward)  ; 次のタブ
;; (global-set-key [XF86Back] 'tabbar-backward) ; 前のタブ
;; ;; タブ上でマウスホイールを使わない
;; (tabbar-mwheel-mode nil)
;; ;; グループを使わない
;; (setq tabbar-buffer-groups-function nil)
;; ;; 左側のボタンを消す
;; (dolist (btn '(tabbar-buffer-home-button
;;                tabbar-scroll-left-button
;;                tabbar-scroll-right-button))
;;   (set btn (cons (cons "" nil)
;;                  (cons "" nil))))

;; ;; 色設定
;; (set-face-attribute ; バー自体の色
;;   'tabbar-default nil
;;    :background "gray85"
;;    :family "Inconsolata"
;;    :height 1.0)
;; (set-face-attribute ; アクティブなタブ
;;   'tabbar-selected nil
;;    :background "black"
;;    :foreground "white"
;;    :weight 'bold
;;    :box nil)
;; (set-face-attribute ; 非アクティブなタブ
;;   'tabbar-unselected nil
;;    :background "gray85"
;;    :foreground "black"
;;    :box nil)
;; ;; M-4 で タブ表示、非表示
;; (global-set-key "\M-4" 'tabbar-mode)
;; (global-set-key "\M-3" 'kill-buffer)
;; ;off tool bar
;; (tool-bar-mode -1)

;; (defun my-tabbar-buffer-list ()
;;   (delq nil
;;         (mapcar #'(lambda (b)
;;                     (cond
;;                      ;; Always include the current buffer.
;;                      ((eq (current-buffer) b) b)
;;                      ((buffer-file-name b) b)
;;                      ((char-equal ?\  (aref (buffer-name b) 0)) nil)
;; 		     ((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
;; 		     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
;;                      ((buffer-live-p b) b)))
;;                 (buffer-list))))
;; (setq tabbar-buffer-list-function 'my-tabbar-buffer-list)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun tabbar-add-tab (tabset object &optional append)
;;   "Add to TABSET a tab with value OBJECT if there isn't one there yet.
;; If the tab is added, it is added at the beginning of the tab list,
;; unless the optional argument APPEND is non-nil, in which case it is
;; added at the end."
;;   (let ((tabs (tabbar-tabs tabset)))
;;     (if (tabbar-get-tab object tabset)
;;         tabs
;;       (let ((tab (tabbar-make-tab object tabset)))
;;         (tabbar-set-template tabset nil)
;;         (set tabset
;;              (if (or (tabbar-tab-derived-mode-p 'dired-mode tab) (tabbar-tab-derived-mode-p 'c++-mode tab))
;;                  (sort (cons tab tabs) #'tabbar-default-directory<)
;;                (if append
;;                    (append tabs (list tab))
;;                  (cons tab tabs))))))))

;; (defun tabbar-default-directory< (a b)
;;   "Is the `default-directory' of tab A `string<' than that of B?"
;;   (string<
;;    (expand-file-name (buffer-local-value 'default-directory (car a)))
;;    (expand-file-name (buffer-local-value 'default-directory (car b)))))

;; (defun tabbar-tab-derived-mode-p (mode tab)
;;   "Is the major mode of TAB derived from MODE?"
;;   (with-current-buffer (car tab)
;;     (derived-mode-p mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; ;; space
;; (require 'whitespace)
;; (set-face-foreground 'whitespace-space "DarkGoldenrod1")
;; (set-face-background 'whitespace-space nil)
;; (set-face-bold-p 'whitespace-space t)
;; (set-face-foreground 'whitespace-tab "DarkOliveGreen1")
;; (set-face-background 'whitespace-tab nil)
;; (set-face-underline  'whitespace-tab t)
;; (setq whitespace-style '(face tabs tab-mark spaces space-mark))
;; (setq whitespace-space-regexp "\\(\x3000+\\)")
;; (setq whitespace-display-mappings
;;       '((space-mark ?\x3000 [?\□])
;;         (tab-mark   ?\t   [?\xBB ?\t])
;;         ))
;; (global-whitespace-mode 1) ; 全角スペースを常に表示
;; (global-set-key (kbd "C-x w") 'global-whitespace-mode) ; 全角スペース表示の切替

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

;; ;;; for markdown
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; (setq markdown-command "pandoc")

;; ;;;git
;; (require 'magit)
;; (global-set-key (kbd "C-x g") 'magit-status)

;; ;;;cmake
;; (require 'cmake-mode); Add cmake listfile names to the mode list.
;; (setq auto-mode-alist
;;    (append
;;    '(("CMakeLists\\.txt\\'" . cmake-mode))
;;    '(("\\.cmake\\'" . cmake-mode))
;;    auto-mode-alist))

;; ;;;ros-launch
;; (setq auto-mode-alist
;;    (append
;;     '(("\\.launch\\'" . xml-mode))
;;    auto-mode-alist))

;;;etags
;;(global-set-key (kbd "M-*") 'pop-tag-mark)


;; ;;rtags
;; (require 'rtags)
;; (defun rtags-c-c++-mode-init ()
;;     (when (rtags-is-indexed)
;;       (local-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
;;       ;;(local-set-key (kbd "M-;") 'rtags-find-symbol)
;;       (local-set-key (kbd "M-@") 'rtags-find-references)
;;       (local-set-key (kbd "M-,") 'rtags-location-stack-back)))
;; (add-hook 'c-mode-common-hook 'rtags-c-c++-mode-init)


;; (require 'package)
;; (package-initialize)
;; (require 'rtags)
;; (require 'company)

;; (setq rtags-autostart-diagnostics t)
;; (rtags-diagnostics)
;; (setq rtags-completions-enabled t)
;; (push 'company-rtags company-backends)
;; (global-company-mode)
;; (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))













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
;; ;;; GDB 関連
;; ;;; 有用なバッファを開くモード
;; (setq gdb-many-windows t)

;; ;;; 変数の上にマウスカーソルを置くと値を表示
;; (add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))

;; ;;; I/O バッファを表示
;; (setq gdb-use-separate-io-buffer t)

;; ;;; t にすると mini buffer に値が表示される
;; (setq gud-tooltip-echo-area nil)
;; (put 'erase-buffer 'disabled nil)

;; ;;; リモート
;; (require 'tramp)
;; (setq tramp-default-method "ssh")

;; ;;; japanese
;; (require 'mozc)
;; (setq default-input-method "japanese-mozc")
;; (global-set-key  (kbd "C-SPC") 'toggle-input-method)
