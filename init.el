;-*- coding: utf-8 -*-


(setq hippie-expand-try-functions-list
             '(try-complete-lisp-symbol
                         try-complete-lisp-symbol-partially
                                  try-expand-dabbrev
                                           try-expand-dabbrev-from-kill
                                                    try-expand-dabbrev-all-buffers
                                                             try-expand-line
                                                                      try-complete-file-name-partially
                                                                               try-complete-file-name))


;; package.el
(require 'package)
(add-to-list 'package-archives
                          '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
                          '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-ruby)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))



;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

;; local sources
;(setq el-get-sources
;      '((:name emacs-goodies-el :type apt-get)))

(setq my-packages
      (append
       '(el-get package color-theme color-theme-zenburn)
       ;;'(el-get nognus gnus-identities color-theme-zenburn zenburn-theme) ;;offlineimap cssh switch-window vkill google-maps nxhtml xcscope yasnippet)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)




;; Don't show the welcome message
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; Default font
;(set-default-font "-xos4-terminus-medium-r-normal-*-12-120-72-72-c-60-iso8859-2")


;; Support 256 colors in screen
;;   - http://article.gmane.org/gmane.emacs.devel/109504/
;(if (not (window-system)) (load "term/rxvt"))
;(defun terminal-init-screen ()
;  "Terminal initialization function for screen."
;  ;; Use the rxvt color initialization code.
;  (rxvt-register-default-colors)
;  (tty-set-up-initial-frame-faces)
;)

;; Encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)


;; Load preferred theme
(color-theme-zenburn)

;; org-mode config
(load-file "~/.emacs.d/local-orgmode.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/progetti/org/libreit.org" "~/progetti/org/personale.org" "~/progetti/org/informatica.org" "~/progetti/org/notes.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
