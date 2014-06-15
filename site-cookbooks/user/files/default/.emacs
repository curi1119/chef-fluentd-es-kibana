(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

(custom-set-variables
 '(display-time-mode 1)     ;; display clock on mode line
 '(line-number-mode 1)      ;; display line number on mode line
 '(column-number-mode 1)    ;; display character number on mode line
 '(tool-bar-mode nil)       ;; show tool menu bar
 '(transient-mark-mode 1)   ;; highlight region
 '(delete-selection-mode 1) ;; delete region by BS
 '(indicate-empty-lines t)  ;;
 '(truncate-lines 1)        ;; http://www.bookshelf.jp/soft/meadow_15.html
 '(truncate-partial-width-windows 1)
 )
(setq default-tab-width 2)           ; tab is 4 spaces characters
(setq-default indent-tabs-mode nil)  ; dont use tab character
(setq inhibit-startup-message t)     ; dont show initial window
(setq make-backup-files nil)         ; dont crate backup file
(setq auto-save-default nil)         ; dont save automatically
(setq visible-bell t)                ; dont beep

;; comment/uncomment-region
(global-set-key "\C-x;" 'comment-region)               ;; C-x ; commentout-region
(fset 'uncomment-region "\C-u\C-[xcomment-region\C-m")
(global-set-key "\C-x:" 'uncomment-region)             ;; C-x : uncomment-region
;; Edit
(global-unset-key "\C-x\C-u")                          ;; do nothing for C-x C-u
(global-set-key "\C-xh" 'mark-page)                    ;; region all buffer
(define-key global-map "\C-h" 'delete-backward-char)   ;; BS by C-h
(define-key global-map "\C-o" 'dabbrev-expand)         ;; C-o
(setq dabbrev-case-fold-search nil)                    ;;
(global-set-key "\M-I" 'indent-region)

(define-key ctl-x-map "p"
  #'(lambda (arg) (interactive "p") (other-window (- arg)))) ;; reverse C-x o using C-x p
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
