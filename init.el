;; load emacs 24's package system. Add MELPA repository.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   ;;'("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; require use-package
(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wheatgrass))
 '(package-selected-packages
   '(grip-mode use-package markdown-mode ag multiple-cursors dockerfile-mode web-beautify json-mode rainbow-delimiters slime-volleyball flycheck-gometalinter company-go ivy magit projectile go-mode php-mode company-terraform terraform-doc terraform-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Go mode configurations
(add-hook 'before-save-hook 'gofmt-before-save)
(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup)))


;; Ivy config
;;(ivy-mode 1)
;;(setq ivy-use-virtual-buffers t)
;;(setq ivy-count-format "(%d/%d) ")

;; Projectile
;;(projectile-global-mode)
;;(setq projectile-completion-system 'helm)
;;(helm-projectile-on)


;; FROM MY OLD CONFIG

;;(use-package ivy
;;  :ensure t
;;  :init


;;  (setq ivy-height 20)
;;  :delight
;;  :config (ivy-mode 1)
;;  :bind
;;  ("C-c k" . counsel-ag))

;;(use-package ivy-hydra
;;  :ensure t )

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq enable-recursive-minibuffers t)
(setq projectile-completion-system 'ivy)
(setq magit-completing-read-function 'ivy-completing-read)
(setq ivy-height 20)


(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)

(helm-mode 1)
(ivy-mode 1)

(global-set-key (kbd "C-c f") 'projectile-find-file)
(projectile-global-mode)
(setq projectile-completion-system 'helm)

;;    (require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; If you want to automatically format before saving a file,
;; add the following hook to your Emacs configuration:

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'json-mode
  '(add-hook 'json-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'sgml-mode
  '(add-hook 'html-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

(eval-after-load 'css-mode
  '(add-hook 'css-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))

;; Settings for multiple cursors
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

;; Enable Org mode
(require 'org)
;; Settings for org mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-agenda-files '("~/max/org/agenda/"))

;; Settings and keybindings for the markdown mode
(add-hook 'markdown-mode-hook #'grip-mode)
(add-hook 'org-mode-hook #'grip-mode)
(use-package grip-mode
  :ensure t
  :bind (:map markdown-mode-command-map
	      ("g" . grip-mode)))

;; A GitHub username for API authentication
(setq grip-github-user "Sil3x")

;; A GitHub password or auth token for API auth
(setq grip-github-password "e228623914c31ee1bea414374c2c7c47047288aa")

 
;; Use embedded webkit to previe
;; This requires GNU/Emacs version >= 26 and built with the `--with-xwidgets`
;; option.
(setq grip-preview-use-webkit t)
