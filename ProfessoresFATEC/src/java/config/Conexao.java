/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;
import java.sql.*;
import com.mysql.jdbc.Driver;
/**
 *
 * @author rovil
 */
public class Conexao {
    public Connection conectar() throws SQLException
    {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost/bdprofessoresfateccotia?"
                    + "useTimezone=true&serverTimezone=UTC&user=root&password=root");      
        }
        catch(ClassNotFoundException e)
        {
            throw new RuntimeException(e); 
        }
    }  
}