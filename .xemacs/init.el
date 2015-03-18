(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\M-g" 'goto-line)

; stuff from Boum
(cond ((fboundp 'global-font-lock-mode)
      (global-font-lock-mode t)
      (setq font-lock-maximum-decoration t)))

;; I hate suspend!
(global-set-key "\C-x\C-z"
               '(lambda()
                  (interactive)
                  (message "Nothing!")))

;; Set the name of the host and current path/file in title bar:
(setq frame-title-format
     (list (format "%s %%S: %%j " (system-name))
           '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Column & line numbers in mode bar
(column-number-mode t)
(line-number-mode t)



;; do not add new lines with arrow down at end of buffer
(setq next-line-add-newlines nil)

; get rid of scroll bars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; get rid of tool bars
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

; get rid of menu bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; repeat last kdbd macro
(global-set-key [f5] 'call-last-kbd-macro)

;; turn on paren matching
(when (fboundp 'show-paren-mode)
      (show-paren-mode t)
      (setq show-paren-style 'mixed))

;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;;will make the last line end in a carriage return.
(setq require-final-newline t) 

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(put 'downcase-region 'disabled nil)

(defun my-indent-setup ()
;;;		(setq indent-tabs-mode t)
;;;		(setq indent-tab-mode t)
		(setq indent-tabs-mode nil)
		(setq indent-tab-mode nil)
		(setq c-basic-offset 4)
		(setq tab-width 4))

(setq auto-mode-alist
      (append '(("\\.\\(CC?\\|HH?\\)\\'" . c++-mode)
        ("\\.[ch]\\(pp\\|xx\\|\\+\\+\\)\\'" . c++-mode)
        ("\\.\\(cc\\|hh\\)\\'" . c++-mode)
        ) auto-mode-alist ))


(add-hook 'c-mode-hook 'my-indent-setup)
(add-hook 'c-mode-hook 'turn-on-font-lock)
(add-hook 'c++-mode-hook 'my-indent-setup)
(add-hook 'c++-mode-hook 'turn-on-font-lock)

(add-hook 'c-mode-hook '(lambda () (local-set-key "\C-m" 'c-context-line-break)))
(add-hook 'c-mode-hook '(lambda () (c-set-offset 'substatement-open '0))) 
(add-hook 'c++-mode-hook '(lambda () (local-set-key "\C-m" 'c-context-line-break)))
(add-hook 'c++-mode-hook '(lambda () (c-set-offset 'substatement-open '0))) 
  
(setq vc-handled-backends nil)

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
 	
(setq gud-gdb-command-name "/mnt/project/granite/gdb/7.8/bin/gdb")

