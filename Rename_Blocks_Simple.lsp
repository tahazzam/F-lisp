(defun c:RenameBlocks (/ ss block layerName count reportFile)
  (setq ss (ssget "X")) ; Select all blocks
  (setq layerName "LayerName") ; Replace it with the desired layer name
  (setq count 0)
  (setq reportFile (open "C:\path\to\report.txt" "w")) ; Set report file path

  (if (not ss)
    (princ "No blocks found.")
    (progn
      (repeat (sslength ss)
        (setq block (ssname ss count))
        (setq name (strcat layerName "_" (itoa count))) ; Renaming logic
        (command "-block" "R" block name)
        (write-line (strcat "Renamed: " (vlax-ename->vla-object block) " to " name) reportFile)
        (setq count (1+ count))
      )
      (write-line (strcat "Total blocks renamed: " (itoa count)) reportFile)
      (close reportFile)
    )
  )
  (princ)
)