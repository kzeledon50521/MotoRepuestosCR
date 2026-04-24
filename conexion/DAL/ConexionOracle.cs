using Oracle.ManagedDataAccess.Client;
using System.Configuration;

namespace MotoRepuestosCR.DAL
{
    public class ConexionOracle
    {
        private readonly string cadenaConexion = "User Id=system;Password=1234;Data Source=localhost:1521/XEPDB1;";

        public OracleConnection ObtenerConexion()
        {
            string connectionString = cadenaConexion;  
            OracleConnection cn = new OracleConnection(connectionString);  
            cn.Open();  
            return cn;  
        }
    }
}