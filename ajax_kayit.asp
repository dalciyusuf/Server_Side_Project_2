<%@ Language=VBScript codepage=65001 %>
<%

On Error Resume Next

Dim x, y, conn, path, sql
x = Request.Form("x")
y = Request.Form("y")


If x <> "" and y <> "" Then
    Set conn = Server.CreateObject("ADODB.Connection")
    path = "C:\inetpub\wwwroot\Koordinat\data.mdb"
    
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
    
    If Err.Number = 0 Then
        ' SQL INSERT komutu
        sql = "INSERT INTO Koordinatlar (X_Pos, Y_Pos) VALUES (" & CInt(x) & "," & CInt(y) & ")"
        conn.Execute(sql)
        
        conn.Close
        Set conn = Nothing
        Response.Write "OK"
    Else
        Response.Write "Hata: " & Err.Description
    End If
End If
%>