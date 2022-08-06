;;; package stuff ;;;
;;; package stuff ;;;;; Added by Package.el.  This must come before configurations of
;;; package stuff ;;;;; installed packages.  Don't delete this line.  If you don't want it,
;;; package stuff ;;;;; just comment it out by adding a semicolon to the start of the line.
;;; package stuff ;;;;; You may delete these explanatory comments.
;;; package stuff ;;;;(package-initialize)
;;; package stuff ;;;(add-to-list 'load-path "~/.emacs.d/other_packages/")
;;; package stuff ;;;
;;; package stuff ;;;(require 'package) ;; You might already have this line
;;; package stuff ;;;(add-to-list 'package-archives
;;; package stuff ;;;             '("melpa" . "https://melpa.org/packages/"))
;;; package stuff ;;;(package-initialize) ;; You might already have this line
;;; package stuff ;;;
;;; package stuff ;;;;load yaml-mode.el (acquired from https://github.com/yoshiki/yaml-mode)
;;; package stuff ;;;(load "~/.emacs.d/other_packages/yaml-mode.el")
;;; package stuff ;;;
;;; package stuff ;;;(custom-set-variables
;;; package stuff ;;; ;; custom-set-variables was added by Custom.
;;; package stuff ;;; ;; If you edit it by hand, you could mess it up, so be careful.
;;; package stuff ;;; ;; Your init file should contain only one such instance.
;;; package stuff ;;; ;; If there is more than one, they won't work right.
;;; package stuff ;;; '(js2-basic-offset 2)
;;; package stuff ;;; '(package-selected-packages (quote (json-mode typescript-mode ag))))

;;NEW BEN (setq typescript-indent-level 2)
;;NEW BEN (add-hook 'json-mode-hook
;;NEW BEN           (lambda ()
;;NEW BEN             (make-local-variable 'js-indent-level)
;;NEW BEN             (setq js-indent-level 2)))

;;NEW BEN (global-set-key "\C-x\C-m" 'execute-extended-command)
;;NEW BEN (global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
;;NEW BEN (global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\M-g" 'goto-line)
;;NEW BEN (global-set-key "\M-+" 'gdb)
(global-set-key "\M-@" 'ag)

;;NEW BEN2 (setq initial-scratch-message "")

;; We set `user-emacs-directory' here so we can use command-line
;; switch different emacs configuration like following:
;;
;;    emacs -q -l ~/coldnew-spacemacs/init.el
;;NEW BEN2 (defconst user-emacs-directory
;;NEW BEN2   (file-name-directory (or load-file-name (buffer-file-name)))
;;NEW BEN2   "My emacs config directory.")

;;NEW BEN (defconst user-cache-directory
;;NEW BEN   (file-name-as-directory (concat user-emacs-directory ".cache"))
;;NEW BEN   "My emacs storage area for persistent files.")
;;NEW BEN ;; create the `user-cache-directory' if not exists
;;NEW BEN (make-directory user-cache-directory t)

;;NEW BEN ;;; backup
;;NEW BEN (let ((backup-dir (concat user-cache-directory "backup")))
;;NEW BEN   ;; Move backup file to `~/.emacs.d/.cache/backup'
;;NEW BEN   (setq backup-directory-alist `(("." . ,backup-dir)))
;;NEW BEN   ;; Makesure backup directory exist
;;NEW BEN   (when (not (file-exists-p backup-dir))
;;NEW BEN     (make-directory backup-dir t)))

;;NEW BEN2 (setq delete-by-moving-to-trash nil)
;;NEW BEN (setq version-control t)
;; NEW BEN5(setq kept-old-versions 10)
;; NEW BEN5(setq kept-new-versions 20)
;; NEW BEN5(setq delete-old-versions t)
;; NEW BEN5(setq backup-by-copying t)
;; NEW BEN5
;; NEW BEN5;;NEW BEN (setq gdb-show-main t)
;; NEW BEN5
;; NEW BEN5; stuff from Boum
;; NEW BEN5;;NEW BEN3(cond ((fboundp 'global-font-lock-mode)
;; NEW BEN5;;NEW BEN3      (global-font-lock-mode t)
;; NEW BEN5;;NEW BEN3      (setq font-lock-maximum-decoration t)))
;; NEW BEN5
;; NEW BEN5
;; NEW BEN5;; I hate suspend!
;; NEW BEN5(global-set-key "\C-x\C-z"
;; NEW BEN5               '(lambda()
;; NEW BEN5                  (interactive)
;; NEW BEN5                  (message "Nothing!")))

;;NEW BEN6;; nocase sort lines
;;NEW BEN6(defun sort-lines-nocase ()
;;NEW BEN6  (interactive)
;;NEW BEN6  (let ((sort-fold-case t))
;;NEW BEN6    (call-interactively 'sort-lines)))

;; Set the name of the host and current path/file in title bar:
;;NEW BEN (setq frame-title-format
;;NEW BEN      (list (format "%s %%S: %%j " (system-name))
;;NEW BEN            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;;NEW BEN6;; Column & line numbers in mode bar
;;NEW BEN6(column-number-mode t)
;;NEW BEN6(line-number-mode t)

;;; use aspell as the ispell program
;;NEW BEN2 (setq ispell-program-name "aspell")

;; Function keys
;;NEW BEN2 (defun switch-to-buffer-s1 (n)
;;NEW BEN2   (interactive "p")
;;NEW BEN2   (switch-to-buffer "s1"))
;;NEW BEN2 (global-set-key [f1] 'switch-to-buffer-s1)
;;NEW BEN2 (defun switch-to-buffer-s2 (n)
;;NEW BEN2   (interactive "p")
;;NEW BEN2   (switch-to-buffer "s2"))
;;NEW BEN2 (global-set-key [f2] 'switch-to-buffer-s2)
;;NEW BEN2 (defun switch-to-buffer-s3 (n)
;;NEW BEN2   (interactive "p")
;;NEW BEN2   (switch-to-buffer "s3"))
;;NEW BEN2 (global-set-key [f3] 'switch-to-buffer-s3)

;;(global-set-key "\M-q" 'complete-symbol)


;;NEW BEN6;; do not add new lines with arrow down at end of buffer
;;NEW BEN6(setq next-line-add-newlines nil)

;; NEW BEN5; get rid of scroll bars
;; NEW BEN5(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;NEW BEN3; get rid of tool bars
;;NEW BEN3(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;NEW BEN3
;;NEW BEN3; get rid of menu bar
;;NEW BEN3(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; repeat last kdbd macro
;;NEW BEN2 (global-set-key [f6] 'call-last-kbd-macro)

; compile stuff
;;NEW BEN2 (global-set-key "\M-$" 'compile)
;;NEW BEN2 (setq compile-command "buck build //realtime/bladerunner/modules/...")

;;NEW BEN6;; turn on paren matching
;;NEW BEN6(when (fboundp 'show-paren-mode)
;;NEW BEN6      (show-paren-mode t)
;;NEW BEN6      (setq show-paren-style 'mixed))

;; Use "y or n" answers instead of full words "yes or no"
(defalias 'yes-or-no-p 'y-or-n-p)

;;will make the last line end in a carriage return.
(setq require-final-newline t)

;; NEW BEN5;disable backup
;; NEW BEN5(setq backup-inhibited t)
;; NEW BEN5;disable auto save
;; NEW BEN5(setq auto-save-default nil)
;; NEW BEN5
;; NEW BEN5(put 'downcase-region 'disabled nil)

(defun my-indent-setup ()
;;;             (setq indent-tabs-mode t)
;;;             (setq indent-tab-mode t)
                (setq indent-tabs-mode nil)
                (setq indent-tab-mode nil)
                (setq c-basic-offset 2)
                (setq tab-width 8))

(defun my-c-indent-setup ()
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8)
  (setq tab-width 8))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hh\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.C\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.H\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.CC\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.HC\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;(setq auto-mode-alist
;      (append '(("\\.\\(CC?\\|HH?\\)\\'" . c++-mode)
;        ("\\.c\\(pp\\|xx\\|\\+\\+\\)\\'" . c++-mode)
;        ("\\.\\(cc\\|hh\\)\\'" . c++-mode)
;        ) auto-mode-alist ))


(add-hook 'c-mode-hook 'my-c-indent-setup)
(add-hook 'c-mode-hook 'turn-on-font-lock)
(add-hook 'c++-mode-hook 'my-indent-setup)
(add-hook 'c++-mode-hook 'turn-on-font-lock)

(add-hook 'c-mode-hook '(lambda () (local-set-key "\C-m" 'c-context-line-break)))
(add-hook 'c-mode-hook '(lambda () (c-set-offset 'substatement-open '0)))
(add-hook 'c++-mode-hook '(lambda () (local-set-key "\C-m" 'c-context-line-break)))
(add-hook 'c++-mode-hook '(lambda () (c-set-offset 'substatement-open '0)))

;;NEW BEN6(setq vc-handled-backends nil)
;;NEW BEN6
;;NEW BEN6 ;; Compilation output
;;NEW BEN6(setq compilation-scroll-output t)

;;;;;; Use "%" to jump to the matching parenthesis.
;;;(defun goto-match-paren (arg)
;;;  "Go to the matching parenthesis if on parenthesis, otherwise insert
;;;the character typed."
;;;  (interactive "p")
;;;  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;;    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;;    (t                    (self-insert-command (or arg 1))) ))
;;;(global-set-key "%" `goto-match-paren)


(setq mouse-yank-at-point t)


;;NEW BEN6(put 'upcase-region 'disabled nil)
;;NEW BEN6

;;NEW BEN2 (custom-set-faces
;;NEW BEN2  ;; custom-set-faces was added by Custom.
;;NEW BEN2  ;; If you edit it by hand, you could mess it up, so be careful.
;;NEW BEN2  ;; Your init file should contain only one such instance.
;;NEW BEN2  ;; If there is more than one, they won't work right.
;;NEW BEN2  )
;;NEW BEN2
;;NEW BEN2 (setq ag-arguments '("--all-text"))
;(setq ag-arguments '("--unrestricted"))
