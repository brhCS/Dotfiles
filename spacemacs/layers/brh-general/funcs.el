;; General emacs functions

(defun brh/shell-region (start end)
  "Execute region in an inferior shell"
  (interactive "r")
  (shell-command (buffer-substring-no-properties start end)))

(defun brh/cleanup-org-tables()
  "Replace org-table formatting with markdown formatting"
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "-+-" nil t) (replace-match "-|-"))))

(defun brh/_diff-buffer (ref)
  "Diff the current buffer against ref"
  (save-buffer 0)
  (vc-version-ediff (list buffer-file-name) ref ""))

(defun brh/diff-origin-master ()
  "Diff the current buffer against origin/master"
  (interactive)
    (brh/_diff-buffer "origin/master"))

(defun brh/diff-origin-dev ()
  "Diff the current buffer against origin/dev"
  (interactive)
  (brh/_diff-buffer "origin/dev"))

(defun brh/diff-head ()
  "Diff the current buffer against HEAD"
  (interactive)
  (brh/_diff-buffer "HEAD"))

(defun brh/diff-ref ()
  "Diff the current buffer against an entered ref"
  (interactive)
  (brh/_diff-buffer (read-string "Ref to diff against: ")))
