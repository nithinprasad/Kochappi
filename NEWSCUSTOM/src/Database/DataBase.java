/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Anet
 */
public class DataBase {
Connection conn;
    public DataBase() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conn=this.connect();
        } catch (ClassNotFoundException e) {
            System.out.println("class not found in database connectivity"+e);
        }
    }

    public Connection connect() throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bineesh", "root", "");
        return conn;
    }

    public ResultSet exquery(String query1) throws Exception {
        //Connection conn = connect();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query1);
        return rs;
    }

    public int exupdate(String query2) throws Exception {
       // Connection conn = connect();
        Statement st = conn.createStatement();
        int i = st.executeUpdate(query2);
        return i;
    }
}
