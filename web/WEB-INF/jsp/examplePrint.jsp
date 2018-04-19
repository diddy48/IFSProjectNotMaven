<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <c:url value="/resources/js/jspdf.js" var="jspdf" />
    <c:url value="/resources/js/jquery-2.1.3.js" var="jquery" />
    <c:url value="/resources/js/pdfFromHTML.js" var="pdfFromHTML" />
    <head>
        <title>HTML to PDF</title>
    </head>
    <body>

        <div id="HTMLtoPDF">

            <h2>Tabella gruppo NC:</h2>

            <table border=1 cellspacing=0>
                <colgroup id="a" span="5"></colgroup>
                <thead>
                    <tr><th>Nome</th><th>Cognome</th></tr>
                </thead>
                <tbody>
                    <tr><td>Giandomenico</td><td>Modugno</td></tr>
                    <tr><td>Gabriele</td><td>Romano</td></tr>
                    <tr><td>Octavian</td><td>Stegarescu</td></tr>
                    <tr><td>Danu</td><td>Mawatage</td></tr>
                </tbody>
            </table>

        </div>
        <br>
        <input type="submit" value="Scarica PDF" onclick="HTMLtoPDF()" >
        <br/>
        <!-- <a href=""></a>-->


        <script src="${jspdf}"></script>
        <script src="${jquery}"></script>
        <script src="${pdfFromHTML}"></script>
    </body>
</html>