;;; buzz-mode.el --- A major mode for the Buzz programming language -*- lexical-binding: t -*-

;; Version: 0.0.1
;; Author: XXIV
;; Keywords: files, buzz
;; Package-Requires: ((emacs "24.3"))
;; Homepage: https://github.com/thechampagne/buzz-mode

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; A major mode for the Buzz programming language.

;;;; Installation

;; You can use built-in package manager (package.el) or do everything by your hands.

;;;;; Using package manager

;; Add the following to your Emacs config file

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)
;; (package-initialize)

;; Then use `M-x package-install RET buzz-mode RET` to install the mode.
;; Use `M-x buzz-mode` to change your current mode.

;;;;; Manual

;; Download the mode to your local directory.  You can do it through `git clone` command:

;; git clone git://github.com/thechampagne/buzz-mode.git

;; Then add path to buzz-mode to load-path list — add the following to your Emacs config file

;; (add-to-list 'load-path
;; 	     "/path/to/buzz-mode/")
;; (require 'buzz-mode)

;; Use `M-x buzz-mode` to change your current mode.

;;; Code:

(defconst buzz-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?\' "\"" table)
    (modify-syntax-entry ?\" "\"" table)
    table))


(defconst buzz-keywords
  '("or" "and" "as" "return"
    "if" "else" "while" "for"
    "foreach" "switch" "break"
    "continue" "default" "const"
    "fun" "in" "do" "until" "is"
    "object" "obj" "static" "protocol"
    "enum" "throw" "catch" "try" "test"
    "import" "export" "extern" "from"
    "resume" "resolve" "yield"))


(defconst buzz-data-types
  '("ud" "void" "pat" "str"
    "int" "float" "bool"
    "Function" "fib"))


(defconst buzz-operators
  '(">" "<" "+" "-"
    "*" "/" "%" "?"
    "!" "=" "==" "!="
    "!>" ">=" "<=" "??"
    "+=" "-=" "*=" "/="
    "++" "--" "->" ">>"
    "<<" "^" "\\" "~"))


(defconst buzz-constants
  '("true" "false" "null"))


(defconst buzz-font-lock-keywords
  (list
   `("\\(|.*\\)" . font-lock-comment-face)
   `(,(regexp-opt buzz-constants 'words) . font-lock-constant-face)
   `(,(regexp-opt buzz-data-types 'words) . font-lock-type-face)
   `(,(regexp-opt buzz-keywords 'symbols) . font-lock-keyword-face)
   `(,(regexp-opt buzz-operators) . font-lock-builtin-face)))

;;;###autoload
(define-derived-mode buzz-mode prog-mode "Buzz"
  "A major mode for the Buzz programming language."
  :syntax-table buzz-mode-syntax-table
  (setq-local font-lock-defaults '(buzz-font-lock-keywords))
  (setq-local comment-start "| ")
  (setq-local comment-end ""))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.buzz\\'" . buzz-mode))

(provide 'buzz-mode)

;;; buzz-mode.el ends here
