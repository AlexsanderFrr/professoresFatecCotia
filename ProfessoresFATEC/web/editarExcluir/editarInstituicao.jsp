

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
       
    </head>
    <body>
        <h1>Editar Instituição</h1>
        <%
            String valorCoor = null;
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                String valorID = request.getParameter("id");
                st = new Conexao().conectar().createStatement();
                try {
                    rs = st.executeQuery("Select * from tbInstituicao where codInstituicao='" + valorID + "'");
                    while (rs.next()) {
                        valorCoor = rs.getString(2);
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            }
        %>
        <form action="" method="post" id="editar">
            <label>Nome Coordernador:</label><br>
            <input type="text" name="txtInst" value="<%=valorCoor%>"><br>
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
        String coor = request.getParameter("txtInst");
        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbInstituicao set nomeInstituicao='" + coor + "'where codInstituicao='" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=/ProfessoresFATEC/instituicao.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Instituicao atualizada com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>
