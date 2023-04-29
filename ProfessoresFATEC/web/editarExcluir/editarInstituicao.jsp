<%-- 
    Document   : editarInstituicao
    Created on : 29 de abr. de 2023, 00:18:15
    Author     : alexs
--%>

<%
    Statement st = null;
    ResultSet rs = null;
%>�
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo Forma��o</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>   



        <div class="container text-center">
            <div class="row">
                <div class="col">

                    <h1>Editar Forma��o</h1>
                    <%
                        String nomeFormacao = null;
                        String codFormacao = null;
                        String tipoFormacao = null;

                        if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                            String valorID = request.getParameter("id");
                            st = new Conexao().conectar().createStatement();
                            try {
                                rs = st.executeQuery("Select  f.nomeFormacao, t.codTipoFormacao, t.formacao from tbformacao f,tbtipoformacao t where codformacao='" + valorID + "' and f.codTipoFormacao = t.codTipoFormacao");

                                while (rs.next()) {
                                    nomeFormacao = rs.getString(1);
                                    codFormacao = rs.getString(2);
                                    tipoFormacao = rs.getString(3);

                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        }
                    %>


                    <form action="" method="post" id="editar">
                        <div class="form-group text-center">
                            <label class="text-light">Forma��o:</label><br>
                            <input class="form-control mx-auto" Style="width: 300px;" type="text" name="txtformacao" value="<%=nomeFormacao%>"><br>
                        </div>
                        <select  name="txttipoformacao"><br>
                            <option value="<%=codFormacao%>"><%=tipoFormacao%></option>
                            <%
                                try {
                                    st = new Conexao().conectar().createStatement();
                                    rs = st.executeQuery("Select * from tbTipoFormacao");
                                    while (rs.next()) {
                                        if (rs.getString(2).equals(tipoFormacao) != true) {
                                            out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                                        }
                                    }
                                } catch (Exception e) {
                                    out.println(e);
                                }
                            %>
                        </select>



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
                    </div><!-- </div> -->
                </div>
            </div>
        </div><!-- comment -->    
    </body>
</html>



<%
    if (request.getParameter("btnAtualizar") != null) {
        String id = request.getParameter("id");
        String formacao = request.getParameter("txtformacao");
        String tipoformacao = request.getParameter("txttipoformacao");
        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbformacao set nomeFormacao='" + formacao + "' , codTipoFormacao = '" + tipoformacao + "' where codformacao='" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=../index.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Forma��o atualizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>

