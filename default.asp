<%@ Language=VBScript codepage=65001 %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Koordinat Cizim Sistemi</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; text-align: center; background-color: #f0f2f5; margin: 0; padding: 20px; }
        h2 { color: #333; }
        /* İşaretçi koordinat sisteminde de gözüksün diye ekledim hocam */
        canvas { 
            background-color: #ffffff; 
            border: 3px solid #34495e; 
            cursor: crosshair; /* Isaretciyi arti yapar */
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            display: block;
            margin: 20px auto;
        }
        .status-box { background: #fff; padding: 10px; display: inline-block; border-radius: 5px; border: 1px solid #ccc; color: #555; font-weight: bold; }
    </style>
</head>
<body>

    <h2>Koordinat Sistemi - Veritabani Baglantili</h2>
    <canvas id="myCanvas" width="800" height="500"></canvas>
    <div id="statusMsg" class="status-box">Baslamak icin ekrana tiklayin...</div>

    <script>
        var canvas = document.getElementById("myCanvas");
        var ctx = canvas.getContext("2d");
        var points = [];

        // --- VERITABANINDAN MEVCUT NOKTALARI YUKLE ---
        <%
        Dim conn, rs, path, sql
        Set conn = Server.CreateObject("ADODB.Connection")
        path = "C:\inetpub\wwwroot\Koordinat\data.mdb"
        conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & path
        
        sql = "SELECT X_Pos, Y_Pos FROM Koordinatlar ORDER BY ID ASC"
        Set rs = conn.Execute(sql)
        
        If Not rs.EOF Then
            Do While Not rs.EOF
        %>
                points.push({x: <%=rs("X_Pos")%>, y: <%=rs("Y_Pos")%>});
        <%
                rs.MoveNext
            Loop
        End If
        rs.Close
        Set rs = Nothing
        conn.Close
        Set conn = Nothing
        %>
        // --------------------------------------------

        // Ilk cizimi yap 
        draw();

        // Kaydettiğimiz Kısım
        canvas.addEventListener("mousedown", function(e) {
            var rect = canvas.getBoundingClientRect();
            var x = Math.round(e.clientX - rect.left);
            var y = Math.round(e.clientY - rect.top);

            points.push({x: x, y: y});
            draw();
            saveToDB(x, y);
        });

        // Fare Hareket Olayi (Isaretciyi gormek icin)
        canvas.addEventListener("mousemove", function(e) {
            var rect = canvas.getBoundingClientRect();
            var mX = Math.round(e.clientX - rect.left);
            var mY = Math.round(e.clientY - rect.top);
            
            draw(); // Once mevcut sekli ciz
            
            // Anlik fare konumuna rehber daire ciz
            ctx.beginPath();
            ctx.arc(mX, mY, 6, 0, Math.PI * 2);
            ctx.strokeStyle = "rgba(52, 152, 219, 0.7)"; 
            ctx.lineWidth = 2;
            ctx.stroke();
            
            document.getElementById("statusMsg").innerText = "Konum: X=" + mX + ", Y=" + mY;
        });

        function draw() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            if (points.length === 0) return;

            // Cizgileri ciz
            ctx.beginPath();
            ctx.lineWidth = 2;
            ctx.strokeStyle = "#e74c3c"; // Kirmizi cizgi
            ctx.moveTo(points[0].x, points[0].y);

            for (var i = 1; i < points.length; i++) {
                ctx.lineTo(points[i].x, points[i].y);
            }
            ctx.stroke();

            // Noktalari ciz
            ctx.fillStyle = "#2980b9"; // Mavi noktalar
            for (var i = 0; i < points.length; i++) {
                ctx.beginPath();
                ctx.arc(points[i].x, points[i].y, 4, 0, Math.PI * 2);
                ctx.fill();
            }
        }

        function saveToDB(x, y) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "ajax_kayit.asp", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    console.log("Veritabanina kaydedildi.");
                }
            };
            xhr.send("x=" + x + "&y=" + y);
        }
    </script>
</body>
</html>