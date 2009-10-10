;; use UTF-8
(prefer-coding-system 'utf-8)

; Lines shouldn't be longer than 79 chars
(setq fill-column 72)

;; make pretty
(global-font-lock-mode 1)

;; shows current selected region
(setq-default transient-mark-mode t)

;; indent via spaces not tabs
(setq-default indent-tabs-mode nil)

;; titlebar = buffer unless filename
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; show paired parenthasis
(show-paren-mode 1)
 
;; TAB => 4*'\b'
(setq default-tab-width 4)

;; line numbers
(global-linum-mode 1)
(setq column-number-mode  t)