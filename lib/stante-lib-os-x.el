;;; stante-lib-os-x.el --- Stante Pede Library: OS X support
;;
;; Copyright (c) 2012, 2013 Sebastian Wiesner
;;
;; Author: Sebastian Wiesner <lunaryorn@gmail.com>
;; URL: https://gihub.com/lunaryorn/stante-pede.git
;; Keywords: extensions

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 3 of the License, or (at your option) any later
;; version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.

;; You should have received a copy of the GNU General Public License along with
;; GNU Emacs; see the file COPYING.  If not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
;; USA.


;;; Commentary:

;; OS X support functions.

;; `stante-find-os-x-coreutils' searches for GNU Coreutils on OS X.

;;; Code:

(defun stante-id-of-bundle (bundle)
  "Get the ID of a BUNDLE.

BUNDLE is the user-visible name of the bundle as string.  Return
the id of the bundle as string.

Do not use this function in code.  IDs are constant, hence use it
*during development* to determine the ID of the bundle, and then
hard-code the bundle ID in your code."
  (let ((script (format "id of app \"%s\"" bundle)))
    (car (process-lines "osascript" "-e" script))))

;;;###autoload
(defun stante-path-of-bundle (id)
  "Get the path of a bundle with ID.

ID is the bundle ID (see `stante-id-of-bundle' as string.  Return
the directory path of the bundle as string."
  (let ((query (format "kMDItemCFBundleIdentifier == '%s'" id)))
    (car (process-lines "mdfind" query))))

(provide 'stante-lib-os-x)

;;; stante-lib-os-x.el ends here
