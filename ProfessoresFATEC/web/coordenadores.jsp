<%-- 
    Document   : coordenadores
    Created on : 23 de abr. de 2023, 15:02:20
    Author     : alexs
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<%
    Statement st = null;
    ResultSet rs = null;
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Curso dos Coordenadores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>








        <div class="container text-center">
            <div class="row">

                <div class="col">

                    <div class="card ">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a href="./index.jsp" class="nav-link ">Curso dos Coordenadores</a>
                                </li>
                                <li class="nav-item ">
                                    <a  class="nav-link active">Coordenadores</a>
                                </li>
                                <li class="nav-item">
                                    <a href="./instituicao.jsp" class="nav-link">Intituição</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div style="text-align: left">
                                <a href="./cadastrar\cadCoordenadores.jsp" class="btn btn-success"><i class="bi bi-clipboard2-fill"></i> Cadastrar Coordenadores</a>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Coordenador</th>
                                     
                                        <th scope="col">Editar</th>
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        try {
                                            st = new Conexao().conectar().createStatement();
                                            rs = st.executeQuery("select * from tbcoordenador;");
                                            out.println("<tr>");
                                            while (rs.next()) {
                                                out.println("<td>" + rs.getString(1) + "</td>");
                                                out.println("<td>" + rs.getString(2) + "</td>");
                  
                                                out.print("<td><a href='editarExcluir/ediCoordenador.jsp?funcao=editar&id=" + rs.getString(1) + "'><button class='btn btn-primary'><i class='bi bi-pencil-fill'></i> Editar</button></a></td>");
                                                out.print("<td><a href='editarExcluir/ediCoordenador.jsp?funcao=excluir&id=" + rs.getString(1) + "'><button class='btn btn-danger'><i class='bi bi-x-lg'></i> Excluir</button></a></td></tr>");
                                            }
                                        } catch (Exception e) {
                                            out.println(e);
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
