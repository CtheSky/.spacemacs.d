;;; packages.el --- eterm-256color layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Tianhong Chu<cthesky13@gmail.com>
;; URL: https://github.com/CtheSky/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst eterm-256color-packages '(eterm-256color))

(defun eterm-256color/init-eterm-256color ()
  (use-package eterm-256color
    :ensure t
    :hook (term-mode . eterm-256color-mode)))


;;; packages.el ends here
