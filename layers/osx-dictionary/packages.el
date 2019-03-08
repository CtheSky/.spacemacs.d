;;; packages.el --- osx-dictionary layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Tianhong Chu <cthesky13@gmail.com>
;; URL: https://github.com/CtheSky/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET

;;; Code:

(defconst osx-dictionary-packages '(osx-dictionary))

(defun osx-dictionary/init-osx-dictionary ()
  ;; osx dictionary
  (use-package osx-dictionary
    :if (eq system-type 'darwin)
    :ensure t
    :config
    (defun osx-dict-in-other-window ()
      (interactive)
      (osx-dictionary-search-word-at-point)
      (other-window -1))
    (evil-define-key 'normal osx-dictionary-mode-map
      "q" 'osx-dictionary-quit
      "s" 'osx-dictionary-search-input
      "o" 'osx-dictionary-open-dictionary.app
      "r" 'osx-dictionary-read-word)
    (spacemacs/set-leader-keys "dc" 'osx-dict-in-other-window)))

;;; packages.el ends here
