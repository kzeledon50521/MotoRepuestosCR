using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MotoRepuestosCR.DAL;
using Oracle.ManagedDataAccess.Client;

namespace MotoRepuestosCR
{
    public partial class FrmPrincipal : Form
    {
        public FrmPrincipal()
        {
            InitializeComponent();

            try
            {
                ConexionOracle conexion = new ConexionOracle();
                using (OracleConnection cn = conexion.ObtenerConexion())
                {
                    MessageBox.Show("Conexión exitosa a Oracle.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error de conexión: " + ex.Message);
            }
        }
    }
}
