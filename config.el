(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
(put 'dired-find-alternate-file 'disabled nil)

(setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

(display-battery-mode 1)		; battery (useful for laptops)
(display-time-mode) 		; time clock 
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(blink-cursor-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-prettify-symbols-mode 1)	; this makes lambdas look cool in lisp

(setq scroll-conservatively 100)
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq ring-bell-function 'ignore)

;; Automatically pair parentheses
(electric-pair-mode t)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)

(unless (package-installed-p 'org-contrib)
  (package-install 'org-contrib))

(add-hook 'org-mode-hook 'org-indent-mode) ; indention looks better

(add-hook 'prog-mode-hook #'flymake-mode)

;; Message navigation bindings
(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "C-c p") #'flymake-goto-prev-error))

(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))

(unless (package-installed-p 'eglot)
    (package-install 'eglot))

(add-hook 'html-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)

(unless (package-installed-p 'corfu)
  (package-install 'corfu))

(add-hook 'prog-mode-hook #'corfu-mode)
(setq corfu-auto t)

(unless (package-installed-p 'guru-mode)
  (package-install 'guru-mode))
(guru-global-mode +1)
(setq guru-warn-only nil)

(unless (package-installed-p 'ement)
  (package-install 'ement))
