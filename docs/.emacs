(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :sla\
nt normal :weight bold :height 161 :width normal :foundry "monotype" :family "Courier New"))))
 '(font-lock-comment-face ((t (:foreground "firebrick")))))

(define-derived-mode cuda-mode c-mode "CUDA"
  "CUDA mode."
  (setq c-basic-offset 4))

(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))

(global-font-lock-mode t)
(show-paren-mode t)
(global-auto-revert-mode 1)
;;(global-linum-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
;;(setq gdb-many-windows t)
(setq backup-inhibited t)
(setq column-number-mode t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indentation))))

(global-set-key (kbd "\C-z") 'write-print)
(global-font-lock-mode t)
(show-paren-mode t)
(global-auto-revert-mode 1)
;;(global-linum-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
;;(setq gdb-many-windows t)
(setq backup-inhibited t)
(setq column-number-mode t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indentation))))
 
 (global-set-key (kbd "\C-z") 'write-print)
;(global-set-key (kbd "<M-down>") 'enlarge-window)
;(global-set-key (kbd "<M-up>") 'shrink-window)
;(global-set-key (kbd "<M-right>") 'enlarge-window-horizontally)
;(global-set-key (kbd "<M-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<prior>")'kill-compilation)
(global-set-key (kbd "<f8>") 'split-window-right)
(global-set-key (kbd "<next>") 'my-compile)
(global-set-key (kbd "C-c w") 'toggle-truncate-lines)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-left>") 'windmove-left)
;(global-set-key (kbd "S-<end>") 'mark-from-point-to-end-of-line)

(defun write-print ()
  (interactive)
  (insert "print()")
  (call-interactively 'backward-char))

(setq smart-compile-alist
      '(("\\.py\\'"."python3 %f")
        ("\\.c\\'"."gcc %f -o a -std=c11 && ./a")
        ("\\.for\\'"."ifort -ffixed-line-length-none %f -o %n.exe")
        ("\\.f90\\'"."gfortran -fopenmp %f -o a && ./a")
        ("\\.tex\\'"."pdflatex %f %n")
        ("\\.cu\\'"."nvcc -arch=sm_75 -o a %f && ./a")
        ("\\.sim\\'"."plink --simulate %f --make-bed --out test --simulate-ncases 10 --simulate-ncontrols 10")))
(setq compilation-read-command nil)

(defun my-compile ()
  "Save and compile"
  (interactive)
  (call-interactively 'save-buffer)
  (call-interactively 'smart-compile))

(electric-pair-mode 1)

(add-hook 'python-mode-hook
          (lambda () (setq python-indent-offset 4)))
 
