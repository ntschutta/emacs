(setq load-path (cons "~/.emacs.d" load-path))

;; language modes  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; scala ;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/scala")  
;; (require 'scala-mode-auto)

;; customizations  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set up alt key to work as META on Mac
(set-keyboard-coding-system 'mac-roman)
;; (mac-key-mode)
(setq mac-option-modifier 'meta)
;;(setq mac-command-key-is-meta nil)

(put 'downcase-region 'disabled nil)

;; always use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; color theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-arjen)
;(color-theme-charcoal-black)
(color-theme-billw)



;; handy extensions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; winring - for save/restore window configurations
;(require 'winring)
;(winring-initialize)

;; ack 
(require 'ack)    

;; docbook
(autoload 'docbook-xml-mode "docbook-xml-mode" "Major mode for Docbook" t)

;; flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(setq-default flyspell-mode t)
;; auto-load for flyspell mode
(dolist (hook '(markdown-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; light symbol
(autoload 'light-symbol "light-symbol" "Float-over highlighting for symbols." t)

;; magit (git support)
(require 'magit)

;; snippets ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; load up modes for msf-abbrev
;(require 'ruby-mode)

;; load up msf-abbrevs
;(add-to-list 'load-path "~/.emacs.d/msf-abbrev")
;; ensure abbrev mode is always on
;(setq-default abbrev-mode t)
;; do not bug me about saving my abbreviations
;(setq save-abbrevs nil)

;; msf-abbrev
;(require 'msf-abbrev)
;(setq msf-abbrev-verbose t) ;; optional
;(setq msf-abbrev-root "~/.emacs.d/msf-abbrev/abbrevs")
;(global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
;(global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
;(msf-abbrev-load)


;; yasnippet
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; snippets ;;

;; paraedit
;(autoload 'paredit-mode "paredit" "Minor mode for pseu  do-structurally editing Lisp code." t)

;; word count minor mode
;(setq load-path (cons (expand-file-name "~/.emacs.d") load-path))
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

;; wrap-region
(add-to-list 'load-path "~/.emacs.d/wrap-region.el")
(require 'wrap-region)
(wrap-region-mode t)
(add-hook 'ruby-mode-hook
          '(lambda() (wrap-region-mode t)
))
(add-hook 'markdown-mode-hook
          '(lambda() (wrap-region-mode t)
))


;; associations ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add markdown mode automatically
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; html mode for HTML fils
(setq auto-mode-alist (cons '("\\.html?$" . html-mode) auto-mode-alist))

;; Rake files are ruby too
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))


;; load-em up ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'shell)
(require 'ruby-mode)

;; small (found) functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; found world count function
(defun word-count nil "Count words in buffer" (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(longlines-wrap-follows-window-size t)
 '(mac-command-modifier (quote alt))
 '(mac-font-panel-mode nil)
 '(speedbar-use-images nil)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
;; clojure-mode
(add-to-list 'load-path "~/opt/clojure-mode")
(require 'clojure-mode)
;; swank-clojure
;(add-to-list 'load-path "~/opt/swank-clojure")
;(require 'swank-clojure-autoload)
;(swank-clojure-config
; (setq swank-clojure-jar-path "~/.clojure/clojure.jar")
;  (setq swank-clojure-extra-classpaths
;         (list "~/.clojure/clojure-contrib.jar")))
;; slime
;(eval-after-load "slime"
;  '(progn (slime-setup '(slime-repl))))

;(add-to-list 'load-path "~/opt/slime")
;(require 'slime)
;(slime-setup)


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;;; scheme...
(require 'xscheme)

;; Use ibuffer for buffer nav
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; change the font size to something more readable for old eyes
(set-face-attribute 'default nil :height 175)

;; fire up org mode, bind certain keys
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

;; add icicles
(add-to-list 'load-path "~/opt/icicles/icicles")
(require 'icicles)

;; start speed bar and set to show all filetypes
;; upper left hand corner, add types
(setq speedbar-frame-parameters '((left . 0) (width . 34) ))
(speedbar 1)
(speedbar-add-supported-extension ".xml")
(speedbar-add-supported-extension ".md")
(custom-set-variables
 '(speedbar-show-unknown-files t)
)

;; modify some keybings...
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
