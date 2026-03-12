using Oracle.ManagedDataAccess.Client;

namespace MotoRepuestosCR.DAL
{
    public class ConexionOracle
    {
        private readonly string cadenaConexion = "User Id=system;Password=1234;Data Source=localhost:1521/XEPDB1;";

        public OracleConnection ObtenerConexion()
        {
            OracleConnection cn = new OracleConnection(cadenaConexion);
            cn.Open();
            return cn;
        }
    }
}