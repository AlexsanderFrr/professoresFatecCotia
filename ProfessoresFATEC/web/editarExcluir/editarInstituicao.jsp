<%-- 
    Document   : editarInstituicao
    Created on : 29 de abr. de 2023, 00:18:15
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
        <title>Editar Instituição</title>
    </head>
    <body> 
        <h1>Editar Instituição</h1>
        <%
            String valorInst = null;
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                String valorID = request.getParameter("id");
                st = new Conexao().conectar().createStatement();
                try {
                    rs = st.executeQuery("Select * from tbInstituicao where codInstituicao='" + valorID + "'");
                    while (rs.next()) {
                        valorInst = rs.getString(2);
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            }
        %>
        <form action="" method="post" id="editar">
            <label>Nome da Instituição:</label><br>
            <input type="text" name="txtInst" value="<%=valorInst%>"><br>
            <br>
            <input type="submit" name="btnAtualizar" value="Atualizar">
        </form>
        <br>
        <a href="/ProfessoresFATEC/instituicao.jsp">Voltar</a>
    </body>
</html>

<%
    if (request.getParameter("btnAtualizar") != null) {
        String id = request.getParameter("id");
        String inst = request.getParameter("txtInst");
        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbInstituicao set nomeInstituicao='" + inst + "'where codInstituicao = '" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=/ProfessoresFATEC/instituicao.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Instituição atualizada com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>


