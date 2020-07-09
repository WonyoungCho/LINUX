# LINUX

```
$ emacs ~/.emacs
(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 161 :width normal :foundry "monotype" :family "Courier New")))))

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

;;(custom-set-variables
;; '(haskell-mode-hook '(turn-on-haskell-indentation)))

(normal-erase-is-backspace-mode 1)

(global-set-key (kbd "\C-z") 'write-print)
;(global-set-key (kbd "<M-down>") 'enlarge-window)
;(global-set-key (kbd "<M-up>") 'shrink-window)
;(global-set-key (kbd "<M-right>") 'enlarge-window-horizontally)
;(global-set-key (kbd "<M-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<prior>")'kill-compilation)
(global-set-key (kbd "<f9>") 'my-compile)
(global-set-key (kbd "<f8>") 'split-window-right)
(global-set-key (kbd "<next>") 'my-compile)
(global-set-key (kbd "C-c w") 'toggle-truncate-lines)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-left>") 'windmove-left)

(defun write-print ()
  (interactive)
  (insert "print()")
  (call-interactively 'backward-char))

(setq smart-compile-alist
      '(("\\.py\\'"."python %n.py")
	("\\.for\\'"."ifort -ffixed-line-length-none %f -o %n.exe")
        ("\\.f90\\'"."gfortran -fopenmp %f -o a && ./a")
        ("\\.tex\\'"."pdflatex %f %n")
	("\\.cu\\'"."nvcc -arch=sm_52 -o a %f && ./a")))
(setq compilation-read-command nil)

(defun my-compile ()
  "Save and compile"
  (interactive)
  (call-interactively 'save-buffer)
  (call-interactively 'smart-compile))

(normal-erase-is-backspace-mode 1)

(electric-pair-mode 1) 

(xterm-mouse-mode 1)

(setq select-active-rgions nil)
(setq mouse-drag-copy-region t)
(global-set-key (kbd "<mouse-3>") 'mouse-yank-at-click)

(add-hook 'python-mode-hook
  (lambda () (setq python-indent-offset 4)))
```
