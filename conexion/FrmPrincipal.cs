using MotoRepuestosCR.DAL;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Drawing;
using System.Windows.Forms;
using System.Data;  


namespace MotoRepuestosCR
{
    public partial class FrmPrincipal : Form
    {
        private Panel panelMenu;
        private Panel panelContenido;
        private Label lblTitulo;

        public FrmPrincipal()
        {
            InitializeComponent();
            try
            {
                var cn = new ConexionOracle().ObtenerConexion();  
                cn.Close();  
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);  
            }
            InicializarUI();
            CargarVistaInicio();
        }

        private void InicializarUI()
        {
            // FORM
            this.Text = "MotoRepuestosCR";
            this.Size = new Size(900, 600);
            this.StartPosition = FormStartPosition.CenterScreen;

            // PANEL CONTENIDO
            panelContenido = new Panel();
            panelContenido.Dock = DockStyle.Fill;
            panelContenido.BackColor = Color.White;
            this.Controls.Add(panelContenido);

            // PANEL MENU
            panelMenu = new Panel();
            panelMenu.Width = 200;
            panelMenu.Dock = DockStyle.Left;
            panelMenu.BackColor = Color.FromArgb(44, 44, 44);
            this.Controls.Add(panelMenu);

            // TÍTULO
            lblTitulo = new Label();
            lblTitulo.Text = "Sistema MotoRepuestos";
            lblTitulo.Font = new Font("Segoe UI", 16, FontStyle.Bold);
            lblTitulo.AutoSize = true;
            lblTitulo.Location = new Point(20, 20);
            panelContenido.Controls.Add(lblTitulo);

            // BOTONES MENU
            AgregarBoton("Inicio", 20);
            AgregarBoton("Productos", 70);
            AgregarBoton("Clientes", 120);
            AgregarBoton("Ventas", 170);
            AgregarBoton("Detalle Venta", 220);
        }

        private void AgregarBoton(string texto, int top)
        {
            Button btn = new Button();
            btn.Text = texto;
            btn.Width = 180;
            btn.Height = 40;
            btn.Left = 10;
            btn.Top = top;
            btn.FlatStyle = FlatStyle.Flat;
            btn.ForeColor = Color.White;
            btn.BackColor = Color.FromArgb(64, 64, 64);

            // EVENTO CLICK
            btn.Click += (s, e) =>
            {
                if (texto == "Inicio")
                    CargarVistaInicio();
                else if (texto == "Productos")
                    CargarVistaProductos();
                else if (texto == "Clientes")
                    CargarVistaClientes();
                else if (texto == "Ventas")
                    CargarVistaVentas();
                else if (texto == "Detalle Venta")
                    CargarVistaDetalleVenta();
                else
                    lblTitulo.Text = "Módulo: " + texto;
            };

            panelMenu.Controls.Add(btn);
        }

        private void CargarVistaDetalleVenta()
        {
            panelContenido.Controls.Clear();

            Panel panelTitulo = new Panel()
            {
                Location = new Point(20, 10),
                Size = new Size(panelContenido.Width - 40, 70),
                BackColor = Color.White,
                Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
            };

            Label titulo = new Label()
            {
                Text = "Detalle de Venta",
                Font = new Font("Segoe UI", 18, FontStyle.Bold),
                ForeColor = Color.FromArgb(30, 30, 30),
                Location = new Point(15, 7),
                AutoSize = true
            };

            Label subtitulo = new Label()
            {
                Text = "Productos por venta",
                Font = new Font("Segoe UI", 9),
                ForeColor = Color.Gray,
                Location = new Point(17, 42),
                AutoSize = false,
                Width = 400
            };

            Panel linea = new Panel()
            {
                Height = 1,
                Dock = DockStyle.Bottom,
                BackColor = Color.FromArgb(220, 220, 220)
            };

            panelTitulo.Controls.Add(titulo);
            panelTitulo.Controls.Add(subtitulo);
            panelTitulo.Controls.Add(linea);

            Panel panelGrid = new Panel()
            {
                Location = new Point(20, 90),
                Size = new Size(600, 270),
                BackColor = Color.FromArgb(245, 245, 245),
                BorderStyle = BorderStyle.FixedSingle
            };

            DataGridView dgv = new DataGridView()
            {
                Dock = DockStyle.Fill,
                BackgroundColor = Color.White,
                BorderStyle = BorderStyle.None,
                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill,
                RowHeadersVisible = false,
                AllowUserToAddRows = false,
                EnableHeadersVisualStyles = false,
                GridColor = Color.LightGray,
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                MultiSelect = false
            };

            dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(60, 60, 60);
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.SelectionBackColor = Color.FromArgb(60, 60, 60);
            dgv.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            dgv.ColumnHeadersHeight = 35;

            dgv.DefaultCellStyle.Font = new Font("Segoe UI", 10);
            dgv.DefaultCellStyle.SelectionBackColor = Color.FromArgb(220, 220, 220);
            dgv.DefaultCellStyle.SelectionForeColor = Color.Black;

            dgv.RowTemplate.Height = 28;
            dgv.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;

            panelGrid.Controls.Add(dgv);

            dgv.Columns.Add("IdDetalle", "ID");
            dgv.Columns.Add("Venta", "Venta");
            dgv.Columns.Add("Producto", "Producto");
            dgv.Columns.Add("Cantidad", "Cantidad");
            dgv.Columns.Add("Precio", "Precio");

            dgv.Rows.Add("1", "Venta #1", "Cadena 428", "2", "12000");

            Panel panelForm = new Panel()
            {
                Location = new Point(640, 90),
                Size = new Size(260, 260),
                BackColor = Color.FromArgb(245, 245, 245)
            };

            Panel CrearInput(string labelText, int top)
            {
                Panel cont = new Panel()
                {
                    Width = 240,
                    Height = 60,
                    Top = top,
                    Left = 10
                };

                Label lbl = new Label()
                {
                    Text = labelText,
                    Font = new Font("Segoe UI", 9, FontStyle.Bold),
                    Location = new Point(0, 0),
                    AutoSize = true
                };

                TextBox txt = new TextBox()
                {
                    Width = 240,
                    Location = new Point(0, 25),
                    Font = new Font("Segoe UI", 10),
                    BorderStyle = BorderStyle.FixedSingle
                };

                cont.Controls.Add(lbl);
                cont.Controls.Add(txt);

                return cont;
            }

            ComboBox cmbVenta = new ComboBox()
            {
                Width = 240,
                Location = new Point(0, 25),
                DropDownStyle = ComboBoxStyle.DropDownList
            };

            Panel contVenta = new Panel() { Width = 240, Height = 60, Top = 0, Left = 10 };
            contVenta.Controls.Add(new Label() { Text = "Venta", Font = new Font("Segoe UI", 9, FontStyle.Bold), AutoSize = true });
            contVenta.Controls.Add(cmbVenta);


            ComboBox cmbProducto = new ComboBox()
            {
                Width = 240,
                Location = new Point(0, 25),
                DropDownStyle = ComboBoxStyle.DropDownList
            };

            Panel contProducto = new Panel() { Width = 240, Height = 60, Top = 60, Left = 10 }; contProducto.Controls.Add(new Label() { Text = "Producto", Font = new Font("Segoe UI", 9, FontStyle.Bold), AutoSize = true });
            contProducto.Controls.Add(cmbProducto);

            panelForm.Controls.Add(contVenta);
            panelForm.Controls.Add(contProducto);
            panelForm.Controls.Add(CrearInput("Cantidad", 120));

            Button btnAgregar = new Button() { Text = "Agregar", Location = new Point(640, 370), Width = 80 };
            Button btnEditar = new Button() { Text = "Editar", Location = new Point(730, 370), Width = 80 };
            Button btnEliminar = new Button() { Text = "Eliminar", Location = new Point(820, 370), Width = 80 };

            panelContenido.Controls.Add(panelTitulo);
            panelContenido.Controls.Add(panelGrid);
            panelContenido.Controls.Add(panelForm);
            panelContenido.Controls.Add(btnAgregar);
            panelContenido.Controls.Add(btnEditar);
            panelContenido.Controls.Add(btnEliminar);
        }





        private void CargarVistaProductos()
        {
            panelContenido.Controls.Clear();

            // TÍTULO
            Panel panelTitulo = new Panel()
            {
                Location = new Point(20, 10), // margen superior y lateral
                Size = new Size(panelContenido.Width - 40, 70),
                BackColor = Color.White,
                Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
            };

            Label titulo = new Label()
            {
                Text = "Gestión de Productos", // cambia según módulo
                Font = new Font("Segoe UI", 18, FontStyle.Bold),
                ForeColor = Color.FromArgb(30, 30, 30),
                Location = new Point(15, 7),
                AutoSize = true
            };

            // subtítulo 
            Label subtitulo = new Label()
            {
                Text = "Administración y control del módulo",
                Font = new Font("Segoe UI", 9),
                ForeColor = Color.Gray,
                Location = new Point(17, 42),
                AutoSize = false,
                Width = 400 
            };

            // línea inferior
            Panel linea = new Panel()
            {
                Height = 1,
                Dock = DockStyle.Bottom,
                BackColor = Color.FromArgb(220, 220, 220)
            };

            panelTitulo.Controls.Add(titulo);
            panelTitulo.Controls.Add(subtitulo);
            panelTitulo.Controls.Add(linea);

            Panel panelGrid = new Panel()
            {
                Location = new Point(20, 90),

                Size = new Size(panelContenido.Width - 300, 270), 
                Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right,

                BackColor = Color.FromArgb(245, 245, 245),
                BorderStyle = BorderStyle.FixedSingle
            };

            DataGridView dgv = new DataGridView()
            {
                Dock = DockStyle.Fill,
                BackgroundColor = Color.White,
                BorderStyle = BorderStyle.None,

                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells, 

                RowHeadersVisible = false,
                AllowUserToAddRows = false,
                EnableHeadersVisualStyles = false,
                GridColor = Color.LightGray,
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                MultiSelect = false
            };

            // HEADER
            dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(60, 60, 60);
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.SelectionBackColor = Color.FromArgb(60, 60, 60);
            dgv.ColumnHeadersDefaultCellStyle.SelectionForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            dgv.ColumnHeadersHeight = 35;

            // FILAS
            dgv.DefaultCellStyle.Font = new Font("Segoe UI", 10);
            dgv.DefaultCellStyle.SelectionBackColor = Color.FromArgb(220, 220, 220);
            dgv.DefaultCellStyle.SelectionForeColor = Color.Black;

            // ALTURA
            dgv.RowTemplate.Height = 28;

            // BORDES
            dgv.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;
            dgv.ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.None;

            panelGrid.Controls.Add(dgv);

            try 
            {
                using (var cn = new ConexionOracle().ObtenerConexion())
                using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_LISTAR_PRODUCTOS", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.BindByName = true;
                    cmd.Parameters.Add("p_resultado", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                    using (var da = new OracleDataAdapter(cmd))
                    {
                        var dt = new DataTable();
                        da.Fill(dt);

                        dgv.AutoGenerateColumns = true; 
                        dgv.DataSource = dt; 

                        if (dgv.Columns.Count >= 7) 
                        {
                            dgv.Columns[0].HeaderText = "ID"; 
                            dgv.Columns[1].HeaderText = "Nombre"; 
                            dgv.Columns[2].HeaderText = "Precio"; 
                            dgv.Columns[3].HeaderText = "Stock"; 
                            dgv.Columns[4].HeaderText = "Categoría"; 
                            dgv.Columns[5].HeaderText = "Marca"; 
                            dgv.Columns[6].HeaderText = "Proveedor"; 
                        }

                        
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            // PANEL DERECHO
            Panel panelForm = new Panel()
            {
                Location = new Point(640, 90),
                Size = new Size(260, 410), 
                BackColor = Color.FromArgb(245, 245, 245)
            };

           
            Panel CrearInput(string labelText, int top)
            {
                Panel cont = new Panel()
                {
                    Width = 240,
                    Height = 60,
                    Top = top,
                    Left = 10
                };

                Label lbl = new Label()
                {
                    Text = labelText,
                    Font = new Font("Segoe UI", 9, FontStyle.Bold),
                    Location = new Point(0, 0),
                    AutoSize = true
                };

                TextBox txt = new TextBox()
                {
                    Name = "txt" + labelText.Replace(" ", ""), 
                    Width = 240,
                    Location = new Point(0, 25),
                    Font = new Font("Segoe UI", 10),
                    BorderStyle = BorderStyle.FixedSingle
                };

                cont.Controls.Add(lbl);
                cont.Controls.Add(txt);

                return cont;
            }

            panelForm.Controls.Add(CrearInput("Nombre", 0));

            Panel contCategoria = new Panel() 
            {
                Width = 240,
                Height = 60,
                Top = 60,
                Left = 10
            };

            Label lblCategoria = new Label() 
            {
                Text = "Categoría",
                Font = new Font("Segoe UI", 9, FontStyle.Bold),
                Location = new Point(0, 0),
                AutoSize = true
            };

            ComboBox cbCategoria = new ComboBox() 
            {
                Name = "cbCategoria",
                Width = 240,
                Location = new Point(0, 25),
                DropDownStyle = ComboBoxStyle.DropDownList
            };

            contCategoria.Controls.Add(lblCategoria);
            contCategoria.Controls.Add(cbCategoria);

            panelForm.Controls.Add(contCategoria);

            Panel contMarca = new Panel() 
            {
                Width = 240,
                Height = 60,
                Top = 120,
                Left = 10
            };

            Label lblMarca = new Label() 
            {
                Text = "Marca",
                Font = new Font("Segoe UI", 9, FontStyle.Bold),
                Location = new Point(0, 0),
                AutoSize = true
            };

            ComboBox cbMarca = new ComboBox() 
            {
                Name = "cbMarca",
                Width = 240,
                Location = new Point(0, 25),
                DropDownStyle = ComboBoxStyle.DropDownList
            };

            contMarca.Controls.Add(lblMarca);
            contMarca.Controls.Add(cbMarca);

            panelForm.Controls.Add(contMarca);

            Panel contProveedor = new Panel() 
            {
                Width = 240,
                Height = 60,
                Top = 180,
                Left = 10
            };

            Label lblProveedor = new Label() 
            {
                Text = "Proveedor",
                Font = new Font("Segoe UI", 9, FontStyle.Bold),
                Location = new Point(0, 0),
                AutoSize = true
            };

            ComboBox cbProveedor = new ComboBox() 
            {
                Name = "cbProveedor",
                Width = 240,
                Location = new Point(0, 25),
                DropDownStyle = ComboBoxStyle.DropDownList
            };

            contProveedor.Controls.Add(lblProveedor);
            contProveedor.Controls.Add(cbProveedor);

            panelForm.Controls.Add(contProveedor);

            try 
            {
                using (var cn = new ConexionOracle().ObtenerConexion()) 
                {
                    // CATEGORÍAS 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_LISTAR_CATEGORIAS", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.BindByName = true;
                        cmd.Parameters.Add("p_resultado", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                        using (var da = new OracleDataAdapter(cmd))
                        {
                            var dtCat = new DataTable();
                            da.Fill(dtCat);

                            cbCategoria.DataSource = dtCat; 
                            cbCategoria.DisplayMember = "NOMBRE"; 
                            cbCategoria.ValueMember = "ID_CATEGORIA"; 
                        }
                    }

                    // MARCAS 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_LISTAR_MARCAS", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.BindByName = true;
                        cmd.Parameters.Add("p_resultado", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                        using (var da = new OracleDataAdapter(cmd))
                        {
                            var dtMarca = new DataTable();
                            da.Fill(dtMarca);

                            cbMarca.DataSource = dtMarca; 
                            cbMarca.DisplayMember = "NOMBRE"; 
                            cbMarca.ValueMember = "ID_MARCA"; 
                        }
                    }

                    // PROVEEDORES 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_LISTAR_PROVEEDORES", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.BindByName = true;
                        cmd.Parameters.Add("p_resultado", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                        using (var da = new OracleDataAdapter(cmd))
                        {
                            var dtProv = new DataTable();
                            da.Fill(dtProv);

                            cbProveedor.DataSource = dtProv; 
                            cbProveedor.DisplayMember = "NOMBRE"; 
                            cbProveedor.ValueMember = "ID_PROVEEDOR"; 
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            panelForm.Controls.Add(CrearInput("Precio", 242)); 
            panelForm.Controls.Add(CrearInput("Stock", 310)); 

            Button btnAgregar = new Button()
            {
                Text = "Agregar",
                Width = 80,
                Location = new Point(10, 380) 
            };

            Button btnEditar = new Button()
            {
                Text = "Editar",
                Width = 80,
                Location = new Point(95, 380) 
            };

            Button btnEliminar = new Button()
            {
                Text = "Eliminar",
                Width = 80,
                Location = new Point(180, 380) 
            };

            btnAgregar.Click += (s, e) => 
            {
                try
                {
                    var txtNombre = panelForm.Controls.Find("txtNombre", true)[0] as TextBox; 

                    var cb = panelForm.Controls.Find("cbCategoria", true)[0] as ComboBox; 
                    var cbMarcaSel = panelForm.Controls.Find("cbMarca", true)[0] as ComboBox; 
                    var cbProvSel = panelForm.Controls.Find("cbProveedor", true)[0] as ComboBox; 

                    var txtPrecio = panelForm.Controls.Find("txtPrecio", true)[0] as TextBox; 
                    var txtStock = panelForm.Controls.Find("txtStock", true)[0] as TextBox; 

                    using (var cn = new ConexionOracle().ObtenerConexion()) 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_INSERTAR_PRODUCTO", cn)) 
                    {
                        cmd.CommandType = CommandType.StoredProcedure; 
                        cmd.BindByName = true; 

                        cmd.Parameters.Add("p_nombre", txtNombre.Text); 
                        cmd.Parameters.Add("p_precio", Convert.ToDecimal(txtPrecio.Text)); 
                        cmd.Parameters.Add("p_stock", Convert.ToInt32(txtStock.Text)); 

                        cmd.Parameters.Add("p_id_categoria", Convert.ToInt32(cb.SelectedValue)); 
                        cmd.Parameters.Add("p_id_marca", Convert.ToInt32(cbMarcaSel.SelectedValue)); 
                        cmd.Parameters.Add("p_id_proveedor", Convert.ToInt32(cbProvSel.SelectedValue)); 

                        cmd.ExecuteNonQuery(); 

                        MessageBox.Show("Producto agregado"); 

                        CargarVistaProductos(); 
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message); 
                }
            };

            btnEditar.Click += (s, e) => 
            {
                try
                {
                    if (dgv.CurrentRow == null) return; 

                    var row = dgv.CurrentRow; 

                    int id = Convert.ToInt32(row.Cells[0].Value); 
                    string nombre = row.Cells[1].Value.ToString(); 
                    decimal precio = Convert.ToDecimal(row.Cells[2].Value); 
                    int stock = Convert.ToInt32(row.Cells[3].Value); 

                    var cbCat = panelForm.Controls.Find("cbCategoria", true)[0] as ComboBox; 

                    var cbMarcaEdit = panelForm.Controls.Find("cbMarca", true)[0] as ComboBox; 
                    var cbProv = panelForm.Controls.Find("cbProveedor", true)[0] as ComboBox; 

                    using (var cn = new ConexionOracle().ObtenerConexion()) 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_ACTUALIZAR_PRODUCTO", cn)) 
                    {
                        cmd.CommandType = CommandType.StoredProcedure; 
                        cmd.BindByName = true; 

                        cmd.Parameters.Add("p_id_producto", id); 
                        cmd.Parameters.Add("p_nombre", nombre); 
                        cmd.Parameters.Add("p_precio", precio); 
                        cmd.Parameters.Add("p_stock", stock); 
                        cmd.Parameters.Add("p_id_categoria", Convert.ToInt32(cbCat.SelectedValue)); 

                        cmd.Parameters.Add("p_id_marca", Convert.ToInt32(cbMarcaEdit.SelectedValue)); 
                        cmd.Parameters.Add("p_id_proveedor", Convert.ToInt32(cbProv.SelectedValue)); 

                        cmd.ExecuteNonQuery(); 
                    }

                    MessageBox.Show("Producto actualizado"); 
                    CargarVistaProductos(); 
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message); 
                }
            };

            btnEliminar.Click += (s, e) => 
            {
                try
                {
                    if (dgv.CurrentRow == null) return; 

                    var confirm = MessageBox.Show("¿Eliminar producto?", "Confirmar", MessageBoxButtons.YesNo); 
                    if (confirm != DialogResult.Yes) return; 

                    int id = Convert.ToInt32(dgv.CurrentRow.Cells[0].Value); 

                    using (var cn = new ConexionOracle().ObtenerConexion()) 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_ELIMINAR_PRODUCTO", cn)) 
                    {
                        cmd.CommandType = CommandType.StoredProcedure; 
                        cmd.BindByName = true; 

                        cmd.Parameters.Add("p_id_producto", id); 

                        cmd.ExecuteNonQuery(); 
                    }

                    MessageBox.Show("Producto eliminado"); 
                    CargarVistaProductos(); 
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message); 
                }
            };

            panelContenido.Controls.Add(panelTitulo);
            panelContenido.Controls.Add(panelGrid);
            panelContenido.Controls.Add(panelForm);
            panelForm.Controls.Add(btnAgregar); 
            panelForm.Controls.Add(btnEditar); 
            panelForm.Controls.Add(btnEliminar); 
        }





        private void CargarVistaClientes()
        {
            panelContenido.Controls.Clear();

            Panel panelTitulo = new Panel()
            {
                Location = new Point(20, 10),
                Size = new Size(panelContenido.Width - 40, 70),
                BackColor = Color.White,
                Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
            };

            Label titulo = new Label()
            {
                Text = "Gestión de Clientes",
                Font = new Font("Segoe UI", 18, FontStyle.Bold),
                ForeColor = Color.FromArgb(30, 30, 30),
                Location = new Point(15, 7),
                AutoSize = true
            };

            Label subtitulo = new Label()
            {
                Text = "Administración y control del módulo",
                Font = new Font("Segoe UI", 9),
                ForeColor = Color.Gray,
                Location = new Point(17, 42),
                AutoSize = false,
                Width = 400
            };

            Panel linea = new Panel()
            {
                Height = 1,
                Dock = DockStyle.Bottom,
                BackColor = Color.FromArgb(220, 220, 220)
            };

            panelTitulo.Controls.Add(titulo);
            panelTitulo.Controls.Add(subtitulo);
            panelTitulo.Controls.Add(linea);

            Panel panelGrid = new Panel()
            {
                Location = new Point(20, 90),
                Size = new Size(600, 270),
                BackColor = Color.FromArgb(245, 245, 245),
                BorderStyle = BorderStyle.FixedSingle
            };

            DataGridView dgv = new DataGridView()
            {
                Dock = DockStyle.Fill,
                BackgroundColor = Color.White,
                BorderStyle = BorderStyle.None,
                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill,
                RowHeadersVisible = false,
                AllowUserToAddRows = false,
                EnableHeadersVisualStyles = false,
                GridColor = Color.LightGray,
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                MultiSelect = false
            };

            // HEADER
            dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(60, 60, 60);
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.SelectionBackColor = Color.FromArgb(60, 60, 60);
            dgv.ColumnHeadersDefaultCellStyle.SelectionForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            dgv.ColumnHeadersHeight = 35;

            // FILAS
            dgv.DefaultCellStyle.Font = new Font("Segoe UI", 10);
            dgv.DefaultCellStyle.SelectionBackColor = Color.FromArgb(220, 220, 220);
            dgv.DefaultCellStyle.SelectionForeColor = Color.Black;

            // ALTURA FILAS
            dgv.RowTemplate.Height = 28;

            // BORDES
            dgv.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;
            dgv.ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.None;

            try 
            {
                using (var cn = new ConexionOracle().ObtenerConexion()) 
                using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_LISTAR_CLIENTES", cn)) 
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.BindByName = true;
                    cmd.Parameters.Add("p_resultado", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                    using (var da = new OracleDataAdapter(cmd))
                    {
                        var dt = new DataTable();
                        da.Fill(dt);

                        dgv.AutoGenerateColumns = true; 
                        dgv.DataSource = dt; 

                        if (dgv.Columns.Count >= 4) 
                        {
                            dgv.Columns[0].HeaderText = "ID"; 
                            dgv.Columns[1].HeaderText = "Nombre"; 
                            dgv.Columns[2].HeaderText = "Teléfono"; 
                            dgv.Columns[3].HeaderText = "Correo"; 

                            dgv.Columns[0].ReadOnly = true; 
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            panelGrid.Controls.Add(dgv);

            Panel panelForm = new Panel()
            {
                Location = new Point(640, 90),
                Size = new Size(260, 240),
                BackColor = Color.FromArgb(245, 245, 245)
            };

            Panel CrearInput(string labelText, int top)
            {
                Panel cont = new Panel()
                {
                    Width = 240,
                    Height = 60,
                    Top = top,
                    Left = 10
                };

                Label lbl = new Label()
                {
                    Text = labelText,
                    Font = new Font("Segoe UI", 9, FontStyle.Bold),
                    Location = new Point(0, 0),
                    AutoSize = true
                };

                TextBox txt = new TextBox()
                {
                    Name = "txt" + labelText.Replace(" ", ""), 
                    Width = 240,
                    Location = new Point(0, 25),
                    Font = new Font("Segoe UI", 10),
                    BorderStyle = BorderStyle.FixedSingle
                };

                cont.Controls.Add(lbl);
                cont.Controls.Add(txt);

                return cont;
            }

            panelForm.Controls.Add(CrearInput("Nombre", 0));
            panelForm.Controls.Add(CrearInput("Teléfono", 60));
            panelForm.Controls.Add(CrearInput("Correo", 120));

            Button btnAgregar = new Button() { Text = "Agregar", Location = new Point(10, 190), Width = 70 }; 
            Button btnEditar = new Button() { Text = "Editar", Location = new Point(90, 190), Width = 70 }; 
            Button btnEliminar = new Button() { Text = "Eliminar", Location = new Point(170, 190), Width = 70 }; 

            btnAgregar.Click += (s, e) => 
            {
                try
                {
                    var txtNombre = panelForm.Controls.Find("txtNombre", true)[0] as TextBox; 
                    var txtTelefono = panelForm.Controls.Find("txtTeléfono", true)[0] as TextBox; 
                    var txtCorreo = panelForm.Controls.Find("txtCorreo", true)[0] as TextBox; 

                    using (var cn = new ConexionOracle().ObtenerConexion()) 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_INSERTAR_CLIENTE", cn)) 
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.BindByName = true;

                        cmd.Parameters.Add("p_nombre", txtNombre.Text); 
                        cmd.Parameters.Add("p_telefono", txtTelefono.Text); 
                        cmd.Parameters.Add("p_correo", txtCorreo.Text); 

                        cmd.ExecuteNonQuery();
                    }

                    MessageBox.Show("Cliente agregado"); 
                    CargarVistaClientes(); 
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            };

            btnEditar.Click += (s, e) => 
            {
                try
                {
                    if (dgv.CurrentRow == null) return; 

                    var row = dgv.CurrentRow;

                    int id = Convert.ToInt32(row.Cells[0].Value); 
                    string nombre = row.Cells[1].Value.ToString(); 
                    string telefono = row.Cells[2].Value.ToString(); 
                    string correo = row.Cells[3].Value.ToString(); 

                    using (var cn = new ConexionOracle().ObtenerConexion()) 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_ACTUALIZAR_CLIENTE", cn)) 
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.BindByName = true;

                        cmd.Parameters.Add("p_id_cliente", id); 
                        cmd.Parameters.Add("p_nombre", nombre); 
                        cmd.Parameters.Add("p_telefono", telefono); 
                        cmd.Parameters.Add("p_correo", correo); 

                        cmd.ExecuteNonQuery();
                    }

                    MessageBox.Show("Cliente actualizado"); 
                    CargarVistaClientes(); 
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            };

            btnEliminar.Click += (s, e) => 
            {
                try
                {
                    if (dgv.CurrentRow == null) return; 

                    var confirm = MessageBox.Show("¿Eliminar cliente?", "Confirmar", MessageBoxButtons.YesNo); 
                    if (confirm != DialogResult.Yes) return; 

                    int id = Convert.ToInt32(dgv.CurrentRow.Cells[0].Value); 

                    using (var cn = new ConexionOracle().ObtenerConexion()) 
                    using (var cmd = new OracleCommand("MOTOREPUESTOSCR.SP_ELIMINAR_CLIENTE", cn)) 
                    {
                        cmd.CommandType = CommandType.StoredProcedure; 
                        cmd.BindByName = true; 

                        cmd.Parameters.Add("p_id_cliente", id); 

                        cmd.ExecuteNonQuery(); 
                    }

                    MessageBox.Show("Cliente eliminado"); 
                    CargarVistaClientes(); 
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message); 
                }
            };

            panelContenido.Controls.Add(panelTitulo);
            panelContenido.Controls.Add(panelGrid);
            panelContenido.Controls.Add(panelForm);
            panelForm.Controls.Add(btnAgregar); 
            panelForm.Controls.Add(btnEditar); 
            panelForm.Controls.Add(btnEliminar); 
        }

        private void CargarVistaVentas()
        {
            panelContenido.Controls.Clear();

            Panel panelTitulo = new Panel()
            {
                Location = new Point(20, 10),
                Size = new Size(panelContenido.Width - 40, 70),
                BackColor = Color.White,
                Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
            };

            Label titulo = new Label()
            {
                Text = "Gestión de Ventas",
                Font = new Font("Segoe UI", 18, FontStyle.Bold),
                ForeColor = Color.FromArgb(30, 30, 30),
                Location = new Point(15, 7),
                AutoSize = true
            };

            Label subtitulo = new Label()
            {
                Text = "Administración y control del módulo",
                Font = new Font("Segoe UI", 9),
                ForeColor = Color.Gray,
                Location = new Point(17, 42),
                AutoSize = false,
                Width = 400
            };

            Panel linea = new Panel()
            {
                Height = 1,
                Dock = DockStyle.Bottom,
                BackColor = Color.FromArgb(220, 220, 220)
            };

            panelTitulo.Controls.Add(titulo);
            panelTitulo.Controls.Add(subtitulo);
            panelTitulo.Controls.Add(linea);

            Panel panelGrid = new Panel()
            {
                Location = new Point(20, 90),
                Size = new Size(600, 270),
                BackColor = Color.FromArgb(245, 245, 245),
                BorderStyle = BorderStyle.FixedSingle
            };

            DataGridView dgv = new DataGridView()
            {
                Dock = DockStyle.Fill,
                BackgroundColor = Color.White,
                BorderStyle = BorderStyle.None,
                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill,
                RowHeadersVisible = false,
                AllowUserToAddRows = false,
                EnableHeadersVisualStyles = false,
                GridColor = Color.LightGray,
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                MultiSelect = false
            };

            // HEADER
            dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(60, 60, 60);
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.SelectionBackColor = Color.FromArgb(60, 60, 60);
            dgv.ColumnHeadersDefaultCellStyle.SelectionForeColor = Color.White;
            dgv.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            dgv.ColumnHeadersHeight = 35;

            // FILAS
            dgv.DefaultCellStyle.Font = new Font("Segoe UI", 10);
            dgv.DefaultCellStyle.SelectionBackColor = Color.FromArgb(220, 220, 220);
            dgv.DefaultCellStyle.SelectionForeColor = Color.Black;

            // ALTURA
            dgv.RowTemplate.Height = 28;

            // BORDES
            dgv.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;
            dgv.ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.None;

            panelGrid.Controls.Add(dgv);

            dgv.Columns.Add("Id", "ID");
            dgv.Columns.Add("Fecha", "Fecha");
            dgv.Columns.Add("Cliente", "Cliente");
            dgv.Columns.Add("Empleado", "Empleado");

            dgv.Rows.Add("1", "21/04/2026", "Juan Pérez", "Carlos Mora");
            dgv.Rows.Add("2", "22/04/2026", "María López", "Ana Pérez");

            Panel panelForm = new Panel()
            {
                Location = new Point(640, 90),
                Size = new Size(260, 240),
                BackColor = Color.FromArgb(245, 245, 245)
            };

            Panel CrearInput(string labelText, int top)
            {
                Panel cont = new Panel()
                {
                    Width = 240,
                    Height = 60,
                    Top = top,
                    Left = 10
                };

                Label lbl = new Label()
                {
                    Text = labelText,
                    Font = new Font("Segoe UI", 9, FontStyle.Bold),
                    Location = new Point(0, 0),
                    AutoSize = true
                };

                TextBox txt = new TextBox()
                {
                    Width = 240,
                    Location = new Point(0, 25),
                    Font = new Font("Segoe UI", 10),
                    BorderStyle = BorderStyle.FixedSingle
                };

                cont.Controls.Add(lbl);
                cont.Controls.Add(txt);

                return cont;
            }

            panelForm.Controls.Add(CrearInput("Fecha", 0));
            panelForm.Controls.Add(CrearInput("Cliente", 60));
            panelForm.Controls.Add(CrearInput("Total", 120));

            Button btnAgregar = new Button() { Text = "Agregar", Location = new Point(640, 350), Width = 80 };
            Button btnEditar = new Button() { Text = "Editar", Location = new Point(730, 350), Width = 80 };
            Button btnEliminar = new Button() { Text = "Eliminar", Location = new Point(820, 350), Width = 80 };

            panelContenido.Controls.Add(panelTitulo);
            panelContenido.Controls.Add(panelGrid);
            panelContenido.Controls.Add(panelForm);
            panelContenido.Controls.Add(btnAgregar);
            panelContenido.Controls.Add(btnEditar);
            panelContenido.Controls.Add(btnEliminar);
        }

        private void CargarVistaInicio()
        {
            panelContenido.Controls.Clear();

            Label titulo = new Label()
            {
                Text = "Sistema MotoRepuestos",
                Font = new Font("Segoe UI", 20, FontStyle.Bold),
                ForeColor = Color.FromArgb(30, 30, 30),
                AutoSize = true,
                Location = new Point(0, 120)
            };

            Label subtitulo = new Label()
            {
                Text = "Gestión de productos, clientes y ventas",
                Font = new Font("Segoe UI", 11),
                ForeColor = Color.Gray,
                AutoSize = true,
                Location = new Point(0, 170)
            };

            Label info = new Label()
            {
                Text = "Seleccione una opción del menú para comenzar",
                Font = new Font("Segoe UI", 10),
                ForeColor = Color.DimGray,
                AutoSize = true,
                Location = new Point(0, 210)
            };

            titulo.Left = (panelContenido.ClientSize.Width - titulo.PreferredWidth) / 2;
            subtitulo.Left = (panelContenido.ClientSize.Width - subtitulo.PreferredWidth) / 2;
            info.Left = (panelContenido.ClientSize.Width - info.PreferredWidth) / 2;
            panelContenido.Controls.Add(titulo);
            panelContenido.Controls.Add(subtitulo);
            panelContenido.Controls.Add(info);
        }
    }
}