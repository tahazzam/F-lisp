;; AutoCAD Drawing Manager v3
;; This is a sample code for managing AutoCAD drawings.

(defun c:ManageDrawings (/ drawingList)
  (setq drawingList '())

  ;; Function to add a drawing to the list
  (defun AddDrawing (drawingName)
    (setq drawingList (append drawingList (list drawingName)))
    (princ (strcat "Added drawing: " drawingName "\n")))

  ;; Function to list all drawings
  (defun ListDrawings ()
    (princ "List of Drawings:\n")
    (foreach drawing drawingList
      (princ (strcat drawing "\n"))))

  ;; Sample usage
  (AddDrawing "Drawing1.dwg")
  (AddDrawing "Drawing2.dwg")
  (ListDrawings)
  (princ))

(princ)