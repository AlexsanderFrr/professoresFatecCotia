<%-- 
    Document   : ediCoordenador
    Created on : 23 de abr. de 2023, 16:18:50
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
        <title>Editar Coordenador</title>
    </head>
    <body>
        <h1>Editar Coordenador</h1>
        <%
        String valorCoor=null;
        if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("editar")){
            String valorID = request.getParameter("id");
            st = new Conexao().conectar().createStatement();
            try{
                rs = st.executeQuery("Select * from tbCoordenador where codCoordenador='"+ valorID +"'");
                while(rs.next()){
                    valorCoor = rs.getString(2);
                }
            }catch(Exception e){
                out.println(e);
            }
        }
    %>
        <form action="" method="post" id="editar">
        <label>Nome Coordernador:</label><br>
        <input type="text" name="txtCoor" value="<%=valorCoor %>"><br>
        <br>
        <input type="submit" name="btnAtualizar" value="Atualizar">
    </form>
    <br>
    <a href="/ProfessoresFATEC/coordenadores.jsp">Voltar</a>
    </body>
</html>

<%
    if(request.getParameter("btnAtualizar")!=null){
        String id = request.getParameter("id");
        String coor = request.getParameter("txtCoor");
        try{
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbCoordenador set nomeCoordenador='" + coor + "'where codCoordenador='" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=/ProfessoresFATEC/coordenadores.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Especialidade atualizado com sucesso');");
            out.println("</script>");
        }catch(Exception e){
            out.println(e);
        }
    }
%>
