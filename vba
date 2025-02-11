Sub ModifierName()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim i As Long
    Dim originalName As String
    Dim modifiedName As String
    
    ' Définir la feuille de travail active (ou modifiez "Feuil1" par le nom de votre feuille)
    Set ws = ThisWorkbook.Worksheets("Feuil1")
    
    ' Détermine la dernière ligne utilisée dans la colonne A (colonne source)
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Facultatif : ajouter un titre à la colonne C pour indiquer qu'il s'agit des noms modifiés
    ws.Range("C1").Value = "name modifier"
    
    ' Parcourir les lignes à partir de la ligne 2 (en supposant que la ligne 1 contient les entêtes)
    For i = 2 To lastRow
        originalName = ws.Cells(i, "A").Value
        
        ' Remplacer "-ASRReplica" par une chaîne vide
        modifiedName = Replace(originalName, "-ASRReplica", "")
        
        ' Copier le nom modifié dans la colonne C de la même ligne
        ws.Cells(i, "C").Value = modifiedName
    Next i
    
    MsgBox "Traitement terminé !", vbInformation
End Sub
