;;; packages.el --- k8s layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
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
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `k8s-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `k8s/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `k8s/pre-init-PACKAGE' and/or
;;   `k8s/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst k8s-packages '(kubernetes kubernetes-evil))

(defun k8s/init-kubernetes ()
  (use-package kubernetes
    :commands (kubernetes-overview)
    :custom
    (kubernetes-poll-frequency 360000 "Manual refresh to avoid stuck")
    (kubernetes-redraw-frequency 360000 "Manual refresh to avoid stuck")
    )
  )

(defun k8s/init-kubernetes-evil ()
  (use-package kubernetes-evil)
  )
;;; packages.el ends here
