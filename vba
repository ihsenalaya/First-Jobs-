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


Sub ColorerCellulesUniques()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim colIndex As Long
    Dim cell As Range
    Dim headerCell As Range
    Dim searchRange As Range
    
    ' Définir la feuille de travail (modifiez "Feuil1" par le nom de votre feuille)
    Set ws = ThisWorkbook.Worksheets("Feuil1")
    
    ' Rechercher la colonne dont l'en-tête est "Aqui" dans la première ligne
    Set headerCell = ws.Rows(1).Find(What:="Aqui", LookIn:=xlValues, LookAt:=xlWhole)
    
    If headerCell Is Nothing Then
        MsgBox "La colonne avec l'en-tête 'Aqui' n'a pas été trouvée.", vbExclamation
        Exit Sub
    Else
        colIndex = headerCell.Column
    End If
    
    ' Déterminer la dernière ligne utilisée dans la colonne "Aqui"
    lastRow = ws.Cells(ws.Rows.Count, colIndex).End(xlUp).Row
    
    ' Définir la plage de recherche (à partir de la ligne 2, en supposant que la ligne 1 contient les en-têtes)
    Set searchRange = ws.Range(ws.Cells(2, colIndex), ws.Cells(lastRow, colIndex))
    
    ' Parcourir chaque cellule de la plage
    For Each cell In searchRange
        ' Vérifier le nombre d'occurrences de la valeur de la cellule dans la plage
        If Application.WorksheetFunction.CountIf(searchRange, cell.Value) = 1 Then
            ' Si la valeur est unique, colorer la cellule (ici en jaune)
            cell.Interior.Color = vbYellow
        Else
            ' Optionnel : enlever la coloration si la valeur n'est pas unique
            cell.Interior.ColorIndex = xlNone
        End If
    Next cell
    
    MsgBox "Mise en surbrillance terminée !", vbInformation
End Sub

## verifier les répétitions dans deux colonnes 


Sub ColorerCellulesCorrespondantes()
    Dim ws As Worksheet
    Dim lastRowA As Long
    Dim lastRowC As Long
    Dim cell As Range
    Dim searchRange As Range
    
    ' Définir la feuille de travail (modifiez "Feuil1" par le nom de votre feuille)
    Set ws = ThisWorkbook.Worksheets("Feuil1")
    
    ' Déterminer la dernière ligne utilisée dans la colonne A
    lastRowA = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Déterminer la dernière ligne utilisée dans la colonne C
    lastRowC = ws.Cells(ws.Rows.Count, "C").End(xlUp).Row
    
    ' Définir la plage de recherche dans la colonne C (à partir de la ligne 2)
    Set searchRange = ws.Range("C2:C" & lastRowC)
    
    ' Parcourir chaque cellule de la colonne A (à partir de la ligne 2)
    For Each cell In ws.Range("A2:A" & lastRowA)
        ' Vérifier si la valeur de la cellule se trouve dans la plage de recherche (colonne C)
        If Application.WorksheetFunction.CountIf(searchRange, cell.Value) > 0 Then
            ' Si la valeur est trouvée, colorer la cellule en jaune
            cell.Interior.Color = vbYellow
        Else
            ' Sinon, enlever la coloration
            cell.Interior.ColorIndex = xlNone
        End If
    Next cell
    
    MsgBox "Vérification terminée !", vbInformation
End Sub
