<%-- 
    Document   : cadFormacaoProfessor
    Created on : 21 de abr. de 2023, 19:09:32
    Author     : mathe
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%> 

<%
    Statement st = null;
    ResultSet rs = null;
%> 
<!DOCTYPE html>
<html>
    <head>

        <title>Editar Curso dos Cooordenadores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>


        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <h1>Editar Curso Coordenador</h1>
                    <%
                        String nomeCoordenador = null;
                        String nomeCurso = null;
                        String codCoordenador = null;
                        String codCurso = null;

                        if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                            String valorID = request.getParameter("id");
                            st = new Conexao().conectar().createStatement();
                            try {
                                rs = st.executeQuery("Select c.nomeCoordenador, c.codCoordenador, cs.nomeCurso, cs.codCurso from tbcoordenador c, tbcursos cs, tbcursocoordenador cc where cc.codCoordenador = c.codCoordenador and cs.codCurso = cc.codCurso and cc.codCursoCoordenador = '"+valorID+"';");
                                while (rs.next()) {

                                    nomeCoordenador = rs.getString(1);
                                    codCoordenador = rs.getString(2);
                                    nomeCurso = rs.getString(3);
                                    codCurso = rs.getString(4);

                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        }
                    %>
                    <form action="" method="post" id="editar">
                        <div class="form-group text-center">
                            <label class="text-light">Coordenador:</label><br>
                            <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtNomeCoordenador">
                                <option value="<%=codCoordenador%>"><%=nomeCoordenador%></option>
                                <%
                                    try {
                                        st = new Conexao().conectar().createStatement();
                                        rs = st.executeQuery("SELECT * from tbcoordenador");
                                        while (rs.next()) {
                                            if (rs.getString(2).equals(nomeCoordenador) != true) {
                                                out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
                                
                            </select>
                        </div>
                        <br>
                        <div class="form-group text-center">
                            <label class="text-light">Curso:</label><br>
                            <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtCurso">
                                <option value="<%=codCurso%>"><%=nomeCurso%></option>
                                <%
                                    try {
                                        st = new Conexao().conectar().createStatement();
                                        rs = st.executeQuery("SELECT * from tbcursos");
                                        while (rs.next()) {
                                            if (rs.getString(2).equals(nomeCurso) != true) {
                                                out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
                            </select>
                        </div>
                        <br>


                        <div class="form-group text-center">
                            <input class="form-control mx-auto" Style="width: 300px;" type="submit" name="btnAtualizar" value="Atualizar">
                        </div>
                    </form>
                    <br>
                    <div class="text-center">
                        <button type="button" class="btn btn-light">
                            <a class="text-dark" href="../index.jsp">Voltar</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<%
    if (request.getParameter("btnAtualizar") != null) {
        String id = request.getParameter("id");
        String Coordenador = request.getParameter("txtNomeCoordenador");
        String Curso = request.getParameter("txtCurso");

        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbcursocoordenador set codCoordenador='" + Coordenador + "', codCurso='" + Curso + "' where codCursoCoordenador='" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=../coordenadores.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Formação atualizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>


