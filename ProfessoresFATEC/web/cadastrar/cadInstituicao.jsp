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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Instituição</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>

        <div class="container text-center">
            <div class="row">

                <div class="col">
                    <a href="../instituicao.jsp" class="btn btn-outline-dark"><i class="bi bi-arrow-left-circle-fill"></i> Voltar</a>
                    <br><br>
                    <div class="card border-secondary mb-3">
                        <div class="card-header"> 

                            <div class="row">
                                <div class="col-sm-5 col-md-6" style="text-align:left">Cadastrar Instituição</div>

                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                                    <form class="form-inline text-center" method="post" action="">

                                        <div class="input-group mb-3">
                                            <select type="text" class="form-select" name="txtBuscaInstituicao" aria-label="Recipient's username" aria-describedby="button-addon2" required>
                                                <option>Selecione a Instituição</option>
                                                <%
                                                    try {
                                                        st = new Conexao().conectar().createStatement();
                                                        rs = st.executeQuery("SELECT * from tbinstituicao");
                                                        while (rs.next()) {
                                                            if (rs.getString(5).equals("1")) {
                                                                out.println("<option value='" + rs.getString(2) + "'>" + rs.getString(2) + "</option>");
                                                            }
                                                        }
                                                    } catch (Exception e) {
                                                        out.println(e);
                                                    }
                                                %>
                                            </select>
                                            <button class="btn btn-outline-secondary" type="submit" name="btnBuscaInstituicao" id="button-addon2"><i class="bi bi-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <div class="card-body text-secondary">

                            <div class="row">
                                <div class="col-sm-5 col-md-6">

                                    <form class="form-inline" action="" method="post" class="input-group input-group-sm mb-3">

                                        <input type="text" class="form-control" placeholder="Digite o nome do Instituição" name="txtNomeInstituicao"  aria-label="Recipient's username"><br>
     
                                      
                                       <button type="submit" name="btnCadInstituicao" class="btn btn-success"><i class="bi bi-clipboard2-fill"></i> Cadastrar</button>
                                    </form>
                                    <%
                                        String codInstituicao = request.getParameter("txtNomeInstituicao");

                                        st = new Conexao().conectar().createStatement();

                                        if (request.getParameter("btnCadInstituicao") != null) {
                                            try {

                                                st.executeUpdate("insert into tbinstituicao(nomeInstituicao) values('" + codInstituicao + "')");

                                                out.println("<meta http-equiv='refresh' content='0;URL='../instituicao.jsp'>");
                                                out.println("<script type=\"text/javascript\">");
                                                out.println("alert('Cadastro de INSTITUICAO realizado com sucesso');");
                                                out.println("</script>");
                                            } catch (Exception e) {

                                            }
                                        }
                                    %>
                                </div>

                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                                    <%
                                        // ------------------ BUSCAR FORMAÇÃO DO PROFESSOR ------------------------
                                        if (request.getParameter("btnBuscaCursoCoordenador") != null) {
                                            String busca = request.getParameter("txtBuscaCursoCoordenador");
                                            try {
                                                st = new Conexao().conectar().createStatement();
                                                rs = st.executeQuery("Select tbprofessor.nomeProfessor, tbformacao.nomeFormacao, tbTipoFormacao.formacao, tbinstituicao.nomeInstituicao from tbFormacaoprofessor inner join tbformacao on tbFormacaoprofessor.codFormacao = tbformacao.codFormacao inner join tbTipoFormacao on tbFormacao.codTipoFormacao = tbTipoFormacao.codTipoFormacao inner join tbprofessor on tbprofessor.codProfessor = tbFormacaoprofessor.codProfessor inner join tbinstituicao on tbinstituicao.codInstituicao = tbFormacaoprofessor.codInstituicao where tbprofessor.nomeProfessor like '%" + busca + "%' ORDER BY nomeFormacao ASC");

                                                out.println("<table class='table table-bordered border-primary' style='width:100%'>");
                                                out.println("<h6 class='card-title'>Formação(ões) do(a) Professor(a) " + busca + "</h6>");
                                                out.println("<thead><tr><th  scope='col'>Formação</th><th scope='col'>Tipo</th><th scope='col'>Instituição</th><th  scope='col'>Editar</th></tr></thead>");
                                                out.println("<tbody>");
                                                while (rs.next()) {
                                                    out.println("<td>" + rs.getString(2) + "</td>");
                                                    out.println("<td>" + rs.getString(3) + "</td>");
                                                    out.println("<td>" + rs.getString(4) + "</td>");
                                                    out.println("<td><a href='../Editar.Excluir/ediFormacaoProfessor.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-fill'></i></a></td></tr>");
                                                }
                                                out.println("</tbody></table>");
                                                out.println("<a href='./cadFormacaoProfessor.jsp' class='btn btn-danger text-light'><i class='bi bi-x-circle-fill'></i>  Cancelar Busca</a>");
                                            } catch (Exception e) {
                                                out.println(e);
                                            }
                                        }
                                    %>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
