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
                                    <a  href="./coordenadores.jsp" class="nav-link ">Coordenadores</a>
                                </li>
                                <li class="nav-item">
                                    <a  class="nav-link active">Intituição</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
