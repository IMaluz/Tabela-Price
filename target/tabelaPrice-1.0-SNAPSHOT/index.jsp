<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="style/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <br><br>
        <div class="container">
            <form action="tabelaPrice.jsp">
                <div class="form-group">
                    <label for="valor">Valor a Financiar (R$)</label>
                    <input class="form-control" type="number" name="valor" required />
                </div>
                <div class="form-group">
                    <label for="taxa">Taxa de juros mensal %</label>
                    <input class="form-control" type="number" name="juros" required />
                </div>
                <div class="form-group">
                    <label for="meses">Quantidade de meses</label>
                    <input class="form-control" type="number" name="mes" required />
                </div>
                <button class="btn btn-secondary btn-lg container center-align" type="submit" name="random" value="calcular">Calcular</button>
            </form>
        <br><br>
    </div>
    <div class="d-flex flex-row justify-content-center align-items-center">
        <footer>            
            <%@include file="WEB-INF/jspf/footer.jspf"%>
        </footer>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>

</body>
</html>
