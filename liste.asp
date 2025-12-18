<%@ Language=VBScript codepage=65001 %>
<%
' Turkce karakter sorunu olmamasi icin codepage ekledik
On Error Resume Next

Response.Write "<h2>Veritabani Kesin Kontrol (V4)</h2>"

' 1. Baglanti Nesnesini Olustur ve Ac
Dim myConn, myRs, mySql, myPath
Set myConn = Server.CreateObject("ADODB.Connection")

' Veritabani yolunu kontrol et (C:\inetpub\wwwroot\Koordinat\data.mdb)
myPath = "C:\inetpub\wwwroot\Koordinat\data.mdb"

' Baglantiyi acmayi dene
myConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & myPath

If Err.Number <> 0 Then
    Response.Write "<b style='color:red'>Baglanti Hatasi:</b> " & Err.Description
    Response.End ' Hata varsa burada dur
End If

Response.Write "<p style='color:green'>Baglanti Kuruldu!</p>"

' 2. Verileri Cek
mySql = "SELECT ID, X_Pos, Y_Pos FROM Koordinatlar"
Set myRs = myConn.Execute(mySql)

If Err.Number <> 0 Then
    Response.Write "<b style='color:red'>Sorgu Hatasi:</b> " & Err.Description
Else
    Response.Write "<table border='1' cellpadding='5'>"
    Response.Write "<tr><th>ID</th><th>X</th><th>Y</th></tr>"
    
    If myRs.EOF Then
        Response.Write "<tr><td colspan='3'>Tablo su an bos.</td></tr>"
    Else
        Do While Not myRs.EOF
            Response.Write "<tr>"
            Response.Write "<td>" & myRs("ID") & "</td>"
            Response.Write "<td>" & myRs("X_Pos") & "</td>"
            Response.Write "<td>" & myRs("Y_Pos") & "</td>"
            Response.Write "</tr>"
            myRs.MoveNext
        Loop
    End If
    Response.Write "</table>"
End If

' 3. Temizlik
Set myRs = Nothing
myConn.Close
Set myConn = Nothing
%>