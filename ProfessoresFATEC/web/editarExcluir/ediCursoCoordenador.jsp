<%-- 
    Document   : ediCursoCoordenador
    Created on : 23 de abr. de 2023, 15:22:57
    Author     : alexs
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="config.Conexao"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Curso Coordenador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>
        <h1>Editar Curso Coordenador</h1>
        <%
            String valorCoor = null;
            String valorCurso = null;
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                String valorID = request.getParameter("id");
                st = new Conexao().conectar().createStatement();
                try {
                    rs = st.executeQuery("Select cc.codCursoCoordenador, c.nomeCoordenador, cs.nomeCurso, p.periodo from tbcoordenador c, tbcursos cs, tbperiodo p, tbcursocoordenador cc where cc.codCoordenador = c.codCoordenador and cs.codCurso = cc.codCurso and cs.codPeriodo = p.codPeriodo;");
                    while (rs.next()) {
                        valorCoor = rs.getString(2);
                        valorCurso = rs.getString(3);
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            }
        %>
        <form action="" method="post" id="editar">
        <label>Nome do Coordenador:</label><br>
        <input type="text" name="txtNomeCoordenador" value="<%=valorCoor %>"><br>
        <br>
        <label>Nome do Curso:</label><br>
        <input type="text" name="txtNomeCurso" value="<%=valorCurso %>"><br>
        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtNomeCurso">
            <option>Selecione o Curso</option>
            <%
                try {
                    st = new Conexao().conectar().createStatement();
                    rs = st.executeQuery("Select c.codCurso, c.nomeCurso, p.periodo from tbcursos c,tbperiodo p where c.codPeriodo = p.codPeriodo ");
                    while (rs.next()) {
                        out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + " periodo " + rs.getString(3) + "</option>");
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </select>
        <button type="submit" name="btnCadCursoCoordenador" class="btn btn-success"><i class="bi bi-clipboard2-fill"></i> Atualizar</button>
        </form>
        <br>
        <a href="/ProfessoresFATEC/index.jsp">Voltar</a>
    </body>
</html>

<%
    if(request.getParameter("btnAtualizar")!=null){
        String codCoordenador = request.getParameter("txtNomeCoordenador");
        String codCurso = request.getParameter("txtNomeCurso");
        try{
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbCurso set nomeCurso='" + codCoordenador + "'where codCurso='" + codCurso + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=/ProfessoresFATEC/index.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Curso atualizado com sucesso');");
            out.println("</script>");
        }catch(Exception e){
            out.println(e);
        }
    }
%>