<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.text.DecimalFormat"%>

<%
    double valor = Double.parseDouble(request.getParameter("valor"));
    double juros = Double.parseDouble(request.getParameter("juros"));
    double mes = Double.parseDouble(request.getParameter("mes"));
    double juros2 = juros / 100;
    int meses = (int) mes;
    double pot = Math.pow((1 + juros2), mes) * juros2;
    double pot2 = Math.pow((1 + juros2), mes) - 1;
    double parcela = valor * (pot / pot2);
    double devedor = (valor - parcela);
    double juros3 = valor * juros2;
    double parcela2 = valor - devedor;
    int i = 1;
    DecimalFormat df = new DecimalFormat("###,##0.00");
%>

<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="style/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>

        <div class="container">
            <br><br>
            <table class="table table-sm table-bordered">
                <tr>
                    <th scope="row">Valor A Financiar</th>
                    <td><%=(df.format(valor))%></td>
                </tr>
                <tr>
                    <th scope="row">Taxa De Juros</th>
                    <td><%= juros%>%</td>
                </tr>
                <tr>
                    <th scope="row">Meses</th>
                    <td><%= mes%></td>
                </tr>
            </table>
            <br><br>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Período</th>
                        <th scope="col">Saldo Devedor</th>
                        <th scope="col">Parcela</th>
                        <th scope="col">Juros</th>
                        <th scope="col">Amortização</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <th scope="row">0</th>
                        <td><%=(df.format(valor))%></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <%do { %>
                        <% valor = (valor + juros3) - parcela2;%>
                        <th scope="row"><%=i%></th>
                        <td><%=(df.format(valor))%></td>
                        <td><%=(df.format(parcela2))%></td>
                        <td><%=(df.format(juros3))%></td>
                        <td><%=(df.format(parcela2 - juros3))%></td>
                        <%juros3 = valor * juros2; %>
                    </tr>

                    <% devedor = valor; %>
                    <% devedor = valor - parcela;%>
                    <%i++; %>
                    <% } while (i <= meses);%>

                </tbody>
            </table>
            <br><br>
            <h2>Novo cálculo</h2>
            <br>
            <form action="tabelaPrice.jsp">
                <div class="form-group">
                    <label for="valor">Valor a Financiar (R$)</label>
                    <input class="form-control" type="number" name="valor"/>
                </div>
                <div class="form-group">
                    <label for="taxa">Taxa de juros mensal %</label>
                    <input class="form-control" type="number" name="juros"/>
                </div>
                <div class="form-group">
                    <label for="meses">Quantidade de meses</label>
                    <input class="form-control" type="number" name="mes"/>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>

    </body>
</html>
