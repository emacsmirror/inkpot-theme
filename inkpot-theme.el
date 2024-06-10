;;; inkpot-theme.el --- A port of vim's inkpot theme -*- lexical-binding: t -*-

;; SPDX-License-Identifier: GPL-2.0-or-later
;; Author: Sarah Iovan <sarah@hwaetageek.com>
;;         Campbell Barton <ideasman42@gmail.com>
;; URL: https://codeberg.org/ideasman42/emacs-inkpot-theme
;; Version: 0.1
;; Package-Requires: ((emacs "24.1"))

;;; Commentary:

;; A dark color scheme with bright easily identifiable colors,
;; without being garish.  Based on VIM's InkPot theme.

;;; Code:

(deftheme inkpot
  "Dark color scheme with bright easily identifiable colors.")

(defgroup inkpot nil
  "InkPot theme and it's settings."
  :group 'inkpot)

(defcustom inkpot-theme-use-box t
  "Show outline around mode-line and header."
  :type 'boolean)

(defcustom inkpot-theme-use-black-background nil
  "Use a black background."
  :type 'boolean)

;; Colors from original Vim theme (for reference)
;; as of https://github.com/ciaranm/inkpot (Feb 11, 2013)

;; Ordered around the color wheel, starting at red.
;; Include VIM usage in comments.

(let ((ip-red-dark "#6e2e2e") ; bg:Error
      (ip-red-dark+0.2 "#6d3030") ; bg:DiffDelete
      (ip-red-mid "#af4f4b") ; fg:Title
      (ip-red-bright "#ce4e4e") ; bg:ErrorMsg
      ;; (ip-red-light+4.5 "#cc6666") ; sp:SpellBad

      (ip-orange-dark "#ad600b") ; fg:doxygenSpecialMultilineDesc fg:doxygenSpecialOnelineDesc
      ;; (ip-orange-dark+12.3 "#ad7b20") ; bg:doxygenComment
      (ip-orange-bright "#cd8b00") ; fg:Comment
      (ip-orange-light "#df9f2d") ; fg:Underlined
      ;; (ip-orange-light+11.7 "#fdd090") ; fg:doxygenParam fg:doxygenPrev fg:doxygenSmallSpecial fg:doxygenSpecial

      (ip-brown-mid "#ad7b57") ; bg:Search
      ;; (ip-brown-mid+12.6 "#cd8b60") ; bg:IncSearch
      (ip-brown-mid+13 "#ce8e4e") ; bg:WarningMsg
      ;; (ip-brown-mid+13.8 "#d0a060") ; fg:Folded
      ;; (ip-brown-mid+31.4 "#fdab60") ; fg:doxygenBrief fg:doxygenSpecial

      (ip-brown-bright "#f0ad6d") ; fg:Number
      (ip-brown-light "#ffcd8b") ; fg:Constant fg:String
      (ip-brown-light+30.9 "#ffffcd") ; fg:DiffText fg:DiffChange fg:DiffDelete fg:DiffAdd

      (ip-cream-light "#cfbfad") ; fg:Normal fg:MBENormal fg:MatchParen

      ;; (ip-yellow-mid "#cccc66") ; sp:SpellLocal
      (ip-yellow-bright "#ffcd00") ; fg:Question

      (ip-green-mid "#306d30") ; bg:DiffAdd
      (ip-green-bright "#00ff8b") ; fg:User1 fg:Directory
      ;; (ip-green-light "#8fff8b") ; bg:lCursor

      (ip-cyan-mid "#306b8f") ; bg:DiffChange
      (ip-cyan-bright "#409090") ; fg:PreProc
      ;; (ip-cyan-light "#66cccc") ; sp:SpellCap

      ;; Use name 'slate' as the palette has many de-saturated blues.
      (ip-slate-dark-inverted "#b38363")
      (ip-slate-dark "#1e1e27") ; bg:Normal
      (ip-slate-dark+7.6 "#2e2e37") ; bg:CursorLine
      (ip-slate-dark+7.9 "#2e2e3f") ; bg:MBENormal bg:MBEChanged bg:PmenuSel
      (ip-slate-dark+15.7 "#3e3e5e") ; bg:StatusLine bg:User1 bg:User2 bg:StatusLineNC bg:VertSplit

      (ip-slate-dark+7.6-bg "#2e2e37") ; ip-slate-dark+7.6, background adjusted.

      (ip-slate-mid "#4e4e8f") ; bg:MBEVisibleNormal bg:MBEVisibleChanged bg:Visual bg:Pmenu bg:MatchParen
      (ip-slate-light "#7070a0") ; fg:User2
      (ip-slate-light+5.5 "#7e7eae") ; fg:ModeMsg fg:MoreMsg
      (ip-slate-light+5.9 "#6e6eaf") ; bg:WildMenu bg:PmenuSbar bg:PmenuThumb
      (ip-slate-lite+17.7 "#8b8bcd") ; fg:FoldColumn fg:LineNr fg:NonText

      (ip-blue-bright "#808bed") ; fg:Statement fg:TaglistTagName
      (ip-blue-bright+1.6 "#8b8bff") ; bg:Cursor bg:CursorIM

      ;; (ip-purple-dark "#3b205d") ; fg:SpecialKey
      ;; (ip-purple-dark+10.4 "#4b208f") ; bg:Folded
      ;; (ip-purple-mid "#4a2a4a") ; bg:DiffText

      ;; (ip-pink-dark-3.9 "#cc66cc") ; sp:SpellRare
      (ip-pink-bright "#c080d0") ; fg:Special fg:SpecialChar fg:perlSpecialMatch fg:perlSpecialString
      ;;                           fg:cSpecialCharacter fg:cFormat fg:Conceal
      (ip-pink-light "#ff8bff") ; fg:Identifier fg:Type

      ;; Tones.
      (ip-grey+18 "#2e2e2e") ; bg:FoldColumn bg:LineNr bg:ColorColumn
      (ip-grey+19 "#303030") ; fg:IncSearch fg:Search fg:Todo
      (ip-grey+25 "#404040") ; fg:Cursor fg:lCursor fg:CursorIM bg:String bg:SpecialChar bg:perlSpecialMatch
      ;;                       bg:perlSpecialString bg:cSpecialCharacter bg:cFormat
      (ip-grey+73 "#b9b9b9") ; fg:StatusLine fg:StatusLineNC fg:VertSplit
      ;; (ip-grey+81 "#cfcfcd") ; fg:MBEVisibleNormal
      (ip-grey+93 "#eeeeee") ; fg:WildMenu fg:MBEChanged fg:MBEVisibleChanged fg:Visual fg:Pmenu fg:PmenuSel
      ;;                       fg:PmenuSbar fg:PmenuThumb

      (ip-black "#000000") ; bg:Normal
      (ip-white "#ffffff") ; fg:ErrorMsg fg:WarningMsg
      ;; End palette colors.

      ;; Colors not from the palette.
      (ip-slate-dark-hi-1 "#2A2A36") ; ip-slate-dark V  +6 (HSLUV)
      (ip-slate-dark-hi-2 "#373745") ; ip-slate-dark V +12 (HSLUV)

      (box-outline
       (cond
        (inkpot-theme-use-box
         (list :box (list :line-width -1 :color "#7070a0")))
        (t
         nil))))

  (when inkpot-theme-use-black-background
    (setq ip-slate-dark "#000000")
    (setq ip-slate-dark+7.6-bg "#181818")

    (setq ip-slate-dark-hi-1 "#131313")
    (setq ip-slate-dark-hi-2 "#1F1F1F")

    (setq ip-grey+25 "#1E1E1E"))

  (custom-theme-set-faces
   ;; Theme name.
   'inkpot

   ;; Basic coloring.
   `(default ((t (:foreground ,ip-cream-light :background ,ip-slate-dark))))
   '(default-italic ((t (:italic t))))
   `(cursor ((t (:background ,ip-blue-bright+1.6))))
   `(escape-glyph ((t (:foreground ,ip-slate-lite+17.7)))) ; Not matching GVIM, just nice color.
   `(fringe ((t (:foreground ,ip-slate-lite+17.7 :background ,ip-grey+18))))
   `(highlight ((t (:background ,ip-grey+25))))
   `(region ((t (:foreground ,ip-white :background ,ip-slate-mid))))
   ;; Match GVIM secondary selection (which is the background inverted).
   `(secondary-selection ((t (:foreground ,ip-slate-dark-inverted :inverse-video t))))
   ;; Success output.
   `(success ((t (:foreground ,ip-green-bright))))
   `(warning ((t (:foreground ,ip-white :background ,ip-brown-mid+13))))
   `(error ((t (:foreground ,ip-white :background ,ip-red-dark))))

   ;; UI.
   `(button ((t (:underline t :foreground ,ip-pink-light))))
   `(link ((t (:foreground ,ip-pink-light))))
   `(link-visited ((t (:foreground ,ip-pink-bright)))) ; Not a vim color, just a little darker.
   ;; FIXME.
   `(widget-field ((t (:foreground ,ip-pink-bright :background ,ip-yellow-bright))))
   ;; Follow other window border colors (mode-line in this case), don't blend in with the fringe.
   `(scroll-bar ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+15.7))))

   ;; Default (font-lock)
   `(font-lock-builtin-face ((t (:foreground ,ip-pink-light))))
   `(font-lock-comment-face ((t (:foreground ,ip-orange-bright))))
   `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-doc-face ((t (:foreground ,ip-blue-bright)))) ; Alternate comment face.
   `(font-lock-doc-markup-face ((t (:foreground ,ip-cyan-bright))))
   `(font-lock-constant-face ((t (:foreground ,ip-cyan-bright))))
   `(font-lock-function-name-face ((t (:foreground ,ip-pink-bright))))
   `(font-lock-keyword-face ((t (:foreground ,ip-blue-bright))))
   `(font-lock-preprocessor-face ((t (:foreground ,ip-cyan-bright))))
   `(font-lock-string-face ((t (:foreground ,ip-brown-light :background ,ip-grey+25))))
   `(font-lock-type-face ((t (:foreground ,ip-pink-light))))
   '(font-lock-variable-name-face ((t nil)))
   `(font-lock-warning-face ((t (:foreground ,ip-white :background ,ip-red-dark))))

   `(font-lock-negation-char-face ((t (:foreground ,ip-cream-light)))) ; currently no change.
   `(font-lock-regexp-grouping-construct ((t (:foreground ,ip-blue-bright :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,ip-pink-bright :weight bold))))

   ;; Mode line.
   ;; Follow GVIM, inactive mode-line isn't bold.
   `(header-line ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+15.7 :bold t ,@box-outline))))
   `(header-line-inactive ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+15.7 ,@box-outline))))
   `(mode-line ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+15.7 ,@box-outline))))
   `(mode-line-active ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+15.7 :bold t ,@box-outline))))
   `(mode-line-inactive ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+15.7 ,@box-outline))))
   `(mode-line-buffer-id ((t (:foreground ,ip-grey+73 :bold nil ,@box-outline))))


   `(hl-line ((t (:background ,ip-slate-dark+7.6-bg))))

   `(show-paren-match-face ((t (:background ,ip-slate-mid))))
   `(show-paren-match ((t (:background ,ip-slate-mid))))
   `(show-paren-match-expression ((t (:background ,ip-slate-dark+7.9))))
   ;; GVIM doesn't contain this color, use error color.
   `(show-paren-mismatch ((t (:foreground ,ip-white :background ,ip-red-dark))))

   ;; Note: original theme doesn't show different colors here,
   ;; simply use bold for 'isearch'.
   `(isearch ((t (:foreground ,ip-grey+19 :background ,ip-brown-mid :bold t))))
   `(isearch-fail ((t (:foreground ,ip-white :background ,ip-red-bright))))
   `(lazy-highlight ((t (:foreground ,ip-grey+19 :background ,ip-brown-mid))))

   `(minibuffer-prompt ((t (:foreground ,ip-slate-light+5.5 :bold t))))

   `(line-number ((t (:foreground ,ip-slate-lite+17.7 :background ,ip-grey+18))))
   `(line-number-current-line ((t (:foreground ,ip-yellow-bright :background ,ip-slate-dark :bold t))))

   ;; white-space.
   '(whitespace-trailing ((nil (:background "#343443"))))
   '(whitespace-space ((nil (:foreground "#434357"))))
   '(whitespace-tab ((nil (:foreground "#434357"))))

   ;; `eglot`.
   `(eglot-inlay-hint-face ((t (:foreground ,ip-slate-light+5.9 :background ,ip-slate-dark+7.6-bg))))
   `(eglot-type-hint-face ((t (:foreground ,ip-slate-light+5.9 :background ,ip-slate-dark+7.6-bg))))
   `(eglot-parameter-hint-face ((t (:foreground ,ip-slate-light+5.9 :background ,ip-slate-dark+7.6-bg))))

   ;; xref mode.
   `(xref-line-number ((t (:foreground ,ip-slate-lite+17.7 :background ,ip-grey+18))))

   ;; tab-bar-mode.
   `(tab-bar ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+7.6-bg :bold t))))
   `(tab-bar-tab ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+15.7 ,@box-outline))))
   `(tab-bar-tab-inactive ((t (:foreground ,ip-grey+73 :background ,ip-slate-dark+15.7 :bold nil :italic t))))

   ;; which-func (shows in the mode-line).
   `(which-func ((t (:foreground ,ip-grey+73 :bold t))))

   ;; compilation-mode
   ;;
   ;; Not matching vim, since there doesn't seem to be exact equivalents.
   `(compilation-warning ((t (:foreground ,ip-orange-bright))))
   `(compilation-error ((t (:foreground ,ip-red-mid))))

   ;; diff-mode
   ;;
   ;; Not from the inkpot palette, dark colors so we can see the refined colors properly.
   '(diff-added ((t (:background "#163616"))))
   '(diff-removed ((t (:background "#361616"))))
   ;; Refine colors for emacs 27+.
   `(diff-refine-added ((t (:background ,ip-green-mid))))
   `(diff-refine-removed ((t (:background ,ip-red-dark+0.2))))

   ;; Headers:
   ;; These are displayed grouped.
   `(diff-header ((t (:foreground ,ip-brown-light+30.9 :background ,ip-grey+18))))
   ;; Use the same colors, too many tones here makes diff headers overly busy.
   `(diff-index ((t (:foreground ,ip-brown-light+30.9 :background ,ip-grey+25))))
   `(diff-file-header ((t (:foreground ,ip-brown-light+30.9 :background ,ip-grey+25))))
   ;; These are displayed side-by-side, a rare exception where a black
   ;; background is useful to visually separate content.
   `(diff-hunk-header ((t (:foreground ,ip-cream-light :background ,ip-slate-dark+15.7))))
   `(diff-function ((t (:foreground ,ip-yellow-bright :background ,ip-slate-dark+15.7))))

   ;; ediff-mode
   `(ediff-current-diff-A ((t (:foreground ,ip-cream-light :background ,ip-red-mid))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,ip-cream-light :background ,ip-red-mid))))
   `(ediff-current-diff-B ((t (:foreground ,ip-cream-light :background ,ip-green-mid))))
   `(ediff-current-diff-C ((t (:foreground ,ip-cream-light :background ,ip-cyan-mid))))
   `(ediff-even-diff-A ((t (:background ,ip-slate-dark+7.6))))
   `(ediff-even-diff-Ancestor ((t (:background ,ip-slate-dark+7.6))))
   `(ediff-even-diff-B ((t (:background ,ip-slate-dark+7.6))))
   `(ediff-even-diff-C ((t (:background ,ip-slate-dark+7.6))))
   `(ediff-fine-diff-A ((t (:foreground ,ip-cream-light :background ,ip-red-bright :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,ip-cream-light :background ,ip-red-bright :weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,ip-cream-light :background ,ip-green-bright :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,ip-cream-light :background ,ip-cyan-bright :weight bold))))
   `(ediff-odd-diff-A ((t (:background ,ip-slate-dark+15.7))))
   `(ediff-odd-diff-Ancestor ((t (:background ,ip-slate-dark+15.7))))
   `(ediff-odd-diff-B ((t (:background ,ip-slate-dark+15.7))))
   `(ediff-odd-diff-C ((t (:background ,ip-slate-dark+15.7))))

   ;; dired-mode
   `(dired-directory ((t (:foreground ,ip-green-bright))))
   `(dired-header ((t (:foreground ,ip-orange-bright))))
   `(dired-symlink ((t (:foreground ,ip-yellow-bright :bold t))))
   `(dired-broken-symlink ((t (:foreground ,ip-yellow-bright :background ,ip-red-dark :bold t))))

   `(w3m-anchor ((t (:foreground ,ip-pink-bright))))
   `(info-xref ((t (:foreground ,ip-cyan-bright))))
   `(info-menu-star ((t (:foreground ,ip-cyan-bright))))
   `(message-cited-text ((t (:foreground ,ip-orange-bright))))
   '(gnus-cite-face-1 ((t (:foreground "#708090"))))
   `(gnus-cite-face-2 ((t (:foreground ,ip-orange-light))))
   '(gnus-cite-face-3 ((t (:foreground "#ad7fa8"))))
   '(gnus-cite-face-4 ((t (:foreground "#4090904"))))
   `(gnus-group-mail-1-empty-face ((t (:foreground ,ip-pink-bright))))
   `(gnus-group-mail-1-face ((t (:foreground ,ip-pink-bright :bold t))))
   `(gnus-group-mail-2-empty-face ((t (:foreground ,ip-cyan-bright))))
   `(gnus-group-mail-2-face ((t (:foreground ,ip-cyan-bright :bold t))))
   '(gnus-group-mail-3-empty-face ((t (:foreground "#506dbd"))))
   `(gnus-group-mail-3-face ((t (:foreground ,ip-orange-bright :bold t))))
   `(gnus-group-mail-3 ((t (:foreground ,ip-orange-bright :bold t))))
   `(gnus-group-mail-low-empty-face ((t (:foreground ,ip-slate-lite+17.7))))
   `(gnus-group-mail-low-face ((t (:foreground,ip-slate-lite+17.7 :bold t))))
   `(gnus-group-news-1-empty-face ((t (:foreground ,ip-pink-bright))))
   `(gnus-group-news-1-face ((t (:foreground ,ip-pink-bright :bold t))))
   `(gnus-group-news-2-empty-face ((t (:foreground ,ip-cyan-bright))))
   `(gnus-group-news-2-face ((t (:foreground ,ip-cyan-bright :bold t))))
   '(gnus-group-news-3-empty-face ((t (:foreground "#506dbd"))))
   '(gnus-group-news-3-empty ((t (:foreground "#506dbd"))))
   `(gnus-group-news-3-face ((t (:foreground ,ip-orange-bright :bold t))))
   `(gnus-group-news-low-empty-face ((t (:foreground,ip-slate-lite+17.7))))
   `(gnus-group-news-low-face ((t (:foreground,ip-slate-lite+17.7 :bold t))))
   '(gnus-header-name-face ((t (:foreground "#ab60ed" :bold t))))
   `(gnus-header-from ((t (:foreground ,ip-orange-bright :bold t))))
   `(gnus-header-subject ((t (:foreground ,ip-blue-bright))))
   `(gnus-header-content ((t (:foreground ,ip-cyan-bright :italic t))))
   `(gnus-header-newsgroups-face ((t (:foreground ,ip-pink-light :bold t :italic t))))
   '(gnus-signature-face ((t (:foreground "#708090" :italic t))))
   `(gnus-summary-cancelled-face ((t (:foreground ,ip-orange-bright))))
   `(gnus-summary-cancelled ((t (:foreground ,ip-orange-bright))))
   '(gnus-summary-high-ancient-face ((t (:foreground "#ab60ed" :bold t))))
   `(gnus-summary-high-read-face ((t (:foreground ,ip-pink-bright :bold t))))
   `(gnus-summary-high-ticked-face ((t (:foreground ,ip-red-mid :bold t))))
   `(gnus-summary-high-unread-face ((t (:foreground ,ip-brown-light :bold t))))
   `(gnus-summary-low-ancient-face ((t (:foreground ,ip-pink-bright :italic t))))
   '(gnus-summary-low-read-face ((t (:foreground "#ab60ed" :italic t))))
   `(gnus-summary-low-ticked-face ((t (:foreground ,ip-red-mid :italic t))))
   `(gnus-summary-low-unread-face ((t (:foreground ,ip-brown-light :italic t))))
   `(gnus-summary-normal-ancient-face ((t (:foreground ,ip-slate-lite+17.7))))
   '(gnus-summary-normal-read-face ((t (:foreground "#2e3436"))))
   '(gnus-summary-normal-read ((t (:foreground "#2e3436"))))
   `(gnus-summary-normal-ticked-face ((t (:foreground ,ip-red-mid))))
   `(gnus-summary-normal-unread-face ((t (:foreground ,ip-brown-light))))
   `(gnus-summary-selected ((t (:foreground ,ip-brown-light :background ,ip-grey+25))))
   `(gnus-header-from ((t (:foreground ,ip-orange-bright :bold t))))
   '(message-header-name-face ((t (:foreground "#ab60ed"))))
   '(message-header-name ((t (:foreground "#ab60ed"))))
   `(message-header-newsgroups-face ((t (:foreground ,ip-pink-light :bold t italic t))))
   `(message-header-other-face ((t (:foreground ,ip-cyan-bright))))
   `(message-header-other ((t (:foreground ,ip-cyan-bright))))
   `(message-header-xheader-face ((t (:foreground ,ip-cyan-bright))))
   `(message-header-subject ((t (:foreground ,ip-blue-bright))))
   `(message-header-to ((t (:foreground ,ip-orange-bright))))
   `(message-header-cc ((t (:foreground ,ip-cyan-bright))))
   `(font-latex-bold-face ((t (:foreground ,ip-orange-bright))))
   `(font-latex-italic-face ((t (:foreground ,ip-blue-bright :italic t))))
   '(font-latex-string-face ((t (:foreground "#708090"))))
   '(font-latex-match-reference-keywords ((t (:foreground "#708090"))))
   '(font-latex-match-variable-keywords ((t (:foreground "#708090"))))

   ;; Haskell.
   `(haskell-operator-face ((t (:foreground ,ip-blue-bright))))

   ;; Org-Mode.
   '(org-hide ((t (:foreground "#708090"))))
   `(org-level-1 ((t (:foreground ,ip-slate-lite+17.7 :height 1.0 :bold t))))
   `(org-level-2 ((t (:foreground ,ip-cyan-bright :height 1.0 :bold nil))))
   `(org-level-3 ((t (:foreground ,ip-orange-light :height 1.0 :bold t))))
   `(org-level-4 ((t (:foreground ,ip-red-mid :height 1.0 :bold nil))))
   `(org-date ((t (:underline t :foreground ,ip-brown-bright))))
   `(org-footnote ((t (:underline t :foreground ,ip-orange-dark))))
   '(org-link ((t (:underline t :foreground "#708090"))))
   `(org-special-keyword ((t (:foreground ,ip-orange-dark))))
   `(org-verbatim ((t (:foreground ,ip-brown-light :background ,ip-grey+25))))
   `(org-code ((t (:foreground ,ip-brown-light :background ,ip-grey+25))))
   '(org-block ((t (:foreground "#708090"))))
   '(org-quote ((t (:inherit org-block :slant italic))))
   '(org-verse ((t (:inherit org-block :slant italic))))
   `(org-todo ((t (:foreground ,ip-red-mid :bold t))))
   `(org-done ((t (:foreground ,ip-cyan-bright :bold t))))
   `(org-warning ((t (:underline t :foreground ,ip-cyan-bright))))
   `(org-agenda-structure ((t (:weight bold :foreground ,ip-red-mid))))
   `(org-agenda-date ((t (:foreground ,ip-cyan-bright))))
   `(org-agenda-date-weekend ((t (:weight normal :foreground,ip-slate-lite+17.7))))
   `(org-agenda-date-today ((t (:weight bold :foreground ,ip-orange-bright))))

   ;; reStructuredText.
   `(rst-external ((t (:foreground ,ip-pink-light))))
   `(rst-definition ((t (:foreground ,ip-cyan-bright))))
   `(rst-directive ((t (:foreground ,ip-blue-bright))))
   '(rst-emphasis1 ((t (:italic t))))
   '(rst-emphasis2 ((t (:weight bold t))))
   `(rst-reference ((t (:foreground ,ip-pink-light))))
   ;; titles baseline.
   `(rst-adornment ((t (:foreground ,ip-red-mid))))
   ;; titles.
   `(rst-level-1 ((t (:foreground ,ip-red-mid))))
   `(rst-level-2 ((t (:foreground ,ip-red-mid))))
   `(rst-level-3 ((t (:foreground ,ip-red-mid))))
   `(rst-level-4 ((t (:foreground ,ip-red-mid))))
   `(rst-level-5 ((t (:foreground ,ip-red-mid))))
   `(rst-level-6 ((t (:foreground ,ip-red-mid))))
   ;; `markdown-mode`.
   `(markdown-header-face-1 ((t (:foreground ,ip-red-mid))))
   `(markdown-header-face-2 ((t (:foreground ,ip-red-mid))))
   `(markdown-header-face-3 ((t (:foreground ,ip-red-mid))))
   `(markdown-header-face-4 ((t (:foreground ,ip-red-mid))))
   `(markdown-header-face-5 ((t (:foreground ,ip-red-mid))))
   `(markdown-header-face-6 ((t (:foreground ,ip-red-mid))))
   `(markdown-header-rule-face ((t (:foreground ,ip-red-mid))))

   ;; Colors for popular plugins.

   ;; vundo (elpa).
   `(vundo-node ((t (:foreground ,ip-slate-dark+15.7))))
   `(vundo-stem ((t (:foreground ,ip-slate-dark+15.7))))
   `(vundo-branch-stem ((t (:foreground ,ip-slate-light))))
   `(vundo-saved ((t (:foreground ,ip-slate-light))))
   `(vundo-last-saved ((t (:foreground ,ip-cream-light))))
   `(vundo-highlight ((t (:foreground ,ip-yellow-bright))))

   ;; anzu (melpa)
   `(anzu-mode-line ((t (:foreground ,ip-grey+93 :weight normal))))
   `(anzu-mode-line-no-match ((t (:foreground ,ip-grey+73 :weight normal))))

   ;; highlight-numbers (melpa).
   `(highlight-numbers-number ((t (:foreground ,ip-brown-bright))))

   ;; diff-hl (melpa)
   ;; Use brighter colors to stand out from fringe.
   `(diff-hl-insert ((t (:background ,ip-green-mid))))
   `(diff-hl-delete ((t (:background ,ip-red-mid))))
   `(diff-hl-change ((t (:background ,ip-slate-mid))))

   ;; lsp-mode (melpa).
   `(lsp-face-highlight-read ((t (:background ,ip-slate-dark+7.9))))
   `(lsp-face-highlight-write ((t (:background ,ip-slate-dark+7.9))))
   `(lsp-face-highlight-textual ((t (:background ,ip-slate-dark+7.9))))
   ;; Arbitrary, could be a little lighter?
   `(lsp-face-semhl-comment ((t (:foreground ,ip-grey+25))))

   ;; Without this, inherit from `font-lock-type-face' face which isn't so nice.
   `(lsp-face-semhl-interface ((t (:foreground ,ip-pink-bright))))
   `(lsp-face-semhl-parameter ((t (:foreground ,ip-cream-light))))
   `(lsp-face-semhl-variable ((t (:foreground ,ip-cream-light))))
   `(lsp-face-semhl-constant ((t (:foreground ,ip-cream-light))))
   `(lsp-face-semhl-function ((t (:foreground ,ip-pink-bright))))

   ;; `dap-mode' (melpa).
   `(dap-ui-marker-face ((t (:background ,ip-slate-dark+7.6))))

   ;; magit-commit-mark (melpa).
   `(magit-commit-mark-read-face ((t (:foreground ,ip-slate-light))))
   `(magit-commit-mark-unread-face ((t (:foreground ,ip-green-bright))))

   ;; auto-complete (melpa).
   `(ac-candidate-face ((t (:foreground ,ip-white :background ,ip-slate-mid))))
   `(ac-selection-face ((t (:foreground ,ip-white :background ,ip-slate-dark+7.9 :weight bold))))

   ;; ivy (melpa).
   `(ivy-current-match ((t (:foreground ,ip-white :background ,ip-slate-mid))))
   ;; highlight matching chars (same as isearch).
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,ip-grey+19 :background ,ip-brown-mid))))

   ;; company (melpa).
   `(company-tooltip ((t (:foreground ,ip-white :background ,ip-slate-mid))))
   `(company-tooltip-selection ((t (:background ,ip-slate-dark+7.9 :weight bold))))
   `(company-tooltip-annotation ((t (:foreground ,ip-cream-light))))
   `(company-tooltip-common ((t (:foreground ,ip-grey+19 :background ,ip-brown-mid))))

   `(company-scrollbar-bg ((t (:background ,ip-slate-light+5.9))))
   ;; Not based on original theme, could change.
   `(company-scrollbar-fg ((t (:background ,ip-black))))

   ;; helm (melpa).
   `(helm-selection ((t (:background ,ip-slate-dark+7.6))))

   ;; fancy-dabbrev (melpa).
   ;; Colors selected from the palette to be a balance: not too intrusive, not too faded.
   `(fancy-dabbrev-preview-face ((t (:foreground ,ip-slate-light+5.5 :background ,ip-slate-dark+7.6-bg))))
   ;; mono-complete (melpa)
   `(mono-complete-preview-face ((t (:foreground ,ip-slate-light+5.5 :background ,ip-slate-dark+7.6-bg))))

   ;; neotree (melpa).
   `(neo-banner-face ((t (:foreground ,ip-orange-bright))))
   `(neo-header-face ((t (:foreground ,ip-orange-bright))))
   `(neo-root-dir-face ((t (:foreground ,ip-blue-bright))))
   `(neo-dir-link-face ((t (:foreground ,ip-green-bright))))
   `(neo-expand-btn-face ((t (:foreground ,ip-blue-bright))))
   `(neo-file-link-face ((t (:foreground ,ip-cream-light))))

   ;; highlight-indent-guides (melpa).
   `(highlight-indent-guides-odd-face ((t (:background ,ip-slate-dark-hi-2))))
   `(highlight-indent-guides-even-face ((t (:background ,ip-slate-dark-hi-1))))

   ;; hl-indent-scope (melpa).
   `(hl-indent-scope-odd-face ((t (:background ,ip-slate-dark-hi-2))))
   `(hl-indent-scope-even-face ((t (:background ,ip-slate-dark-hi-1))))

   ;; visual-indentation-mode (stand alone package).
   `(visual-indentation-light-face ((t (:background ,ip-slate-dark-hi-2))))
   `(visual-indentation-dark-face ((t (:background ,ip-slate-dark-hi-1))))

   ;; highlight-operators (melpa).
   `(highlight-operators-face ((t (:foreground ,ip-blue-bright))))

   ;; highlight-symbol (melpa).
   ;; Color selected because it's visible without being overly distracting.
   `(highlight-symbol-face ((t (:background ,ip-slate-dark+15.7))))
   ;; idle-highlight-mode (melpa).
   `(idle-highlight ((t (:background ,ip-slate-dark+15.7))))

   ;; swiper (melpa).
   ;; NOTE: This color is needed as a more subtle tone that doesn't make comments unreadable.
   `(swiper-line-face ((t (:background ,ip-grey+18 :extend t))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'inkpot)
;; Local Variables:
;; fill-column: 120
;; indent-tabs-mode: nil
;; End:
;;; inkpot-theme.el ends here
