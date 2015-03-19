(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\M-g" 'goto-line)

(define-key input-decode-map "\e\eOA" [(C-up)])
(define-key input-decode-map "\e\eOB" [(C-down)])

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

;; stuff from Greg Taleck
(global-set-key [C-M-tab] 'clang-format-region)

;; Set up shells
;;(setq explicit-shell-file-name "/u/gtaleck/bin/eshell")
(setq column-number-mode t)
(setq history-length 1024)
(shell)
(rename-buffer "s3")
(shell)
(rename-buffer "s2")
(shell)
(rename-buffer "s1")

;; set up grep to exclude dirs
(setq grep-command "grep --exclude=\\*.svn-base --exclude=\\*.o -nH -e ")

;; Function keys
(defun switch-to-buffer-s1 (n)
  (interactive "p")
  (switch-to-buffer "s1"))
(global-set-key [f1] 'switch-to-buffer-s1)
(defun switch-to-buffer-s2 (n)
  (interactive "p")
  (switch-to-buffer "s2"))
(global-set-key [f2] 'switch-to-buffer-s2)
(defun switch-to-buffer-s3 (n)
  (interactive "p")
  (switch-to-buffer "s3"))
(global-set-key [f3] 'switch-to-buffer-s3)

(global-set-key "\M-q" 'complete-symbol)

;; Make C-M-l and C-M-u switch open buffers
(define-key global-map "\C-\M-l" 'bury-buffer)
;; there's no unbury-buffer builtin so we create one here
(defun unbury-buffer ()
  (interactive)
  (let ((buffer-list (nreverse (buffer-list)))
 buffer)
    (while (string-match "\\` " 
    (buffer-name
     (prog1 (setq buffer (car buffer-list))
       (setq buffer-list (cdr buffer-list))))))
    (switch-to-buffer buffer)))
(define-key global-map "\C-\M-u" 'unbury-buffer)


(defun whitespace () (interactive)
  "Eliminate whitespace at ends of all lines in the buffer."
  (save-excursion
   (goto-char (point-min))
   (while (re-search-forward "[ \t][ \t]*$" nil t)
     (delete-region (match-beginning 0) (point)))))

;;; This functions deletes whitespace - including newlines - up to the
;;; next non-whitespace char. Useful when working on Text cut'n'pasted
;;; from Netscape.
(defun del2white () (interactive)
  "deletes whitespace up to the next non-whitespace char"
  (save-excursion
    (if (re-search-forward "[ \t\r\n]*[^ \t\r\n]" nil t)
		(delete-region (match-beginning 0) (- (point) 1)))))
(global-set-key [(ctrl \\)] 'del2white)

(setq auto-mode-alist
      (append
       (list
                '("\\.c$"      . c++-mode)
                '("\\.q$"      . c++-mode)
                '("\\.h$"      . c++-mode)
                '("\\.cs$"     . c++-mode)
                '("\\.hs$"     . c++-mode)
                '("\\.hpp$"    . c++-mode)
                '("\\.cpp$"    . c++-mode)
                '("\\.ipp$"    . c++-mode)
                '("\\.lpc$"    . c++-mode)
                '("\\.pike$"   . c++-mode)
                '("\\.a$"      . ada-mode)
                '("\\.cc$"     . c++-mode)
                '("\\.y$"      . c++-mode)
                '("\\.el$"     . emacs-lisp-mode)
                '("\\.java$"   . java-mode)
                '("\\common_defs"  . makefile-mode)
                '("\\cxx_defs"     . makefile-mode)
                '("\\common_rules" . makefile-mode)
                '("\\Makefile"     . makefile-mode)
                '("\\Makefile*"    . makefile-mode)
                '("\\Makerules"    . makefile-mode)
                )
       auto-mode-alist))

;; ====================
;; insert date and time

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

(global-set-key "\C-c\C-d" 'insert-current-date-time)
(global-set-key "\C-c\C-t" 'insert-current-time)
;;;(global-linum-mode)

(add-hook 'c++-mode-hook
      '(lambda()
        (font-lock-add-keywords
         nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; add the new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT
           ("\\<[A-Z]+[A-Z_]+\\>" . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; user-types (customize!)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(t\\|type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
           ))
        ) t)
(setq create-lockfiles nil)

;; end gtaleck
