/************************************************/
/****** BD: TP3 - 2015-00 MOD 2 ******/
/************************************************/

USE master
IF EXISTS(select * from sys.databases where name='BDPacifico')
DROP DATABASE BDPacifico
GO

--Crea Base de Datos
CREATE DATABASE BDPacifico
GO

USE BDPacifico
GO

--GRUPO 01 - Campania
CREATE TABLE [dbo].[Campania](
	[Cod_Camp] [int] IDENTITY(1,1) NOT NULL,
	[Nro_Camp] [nvarchar](50) NOT NULL,
	[Fec_Ini] [datetime] NOT NULL,
	[Fec_Fin] [datetime] NOT NULL,
	[Qtd_Meta] [int] NOT NULL,
	[Flg_Flag] [bit] NOT NULL,
 CONSTRAINT [PK_Campania] PRIMARY KEY CLUSTERED 
(
	[Cod_Camp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - CanalVenta
CREATE TABLE [dbo].[CanalVenta](
	[Cod_Cnl_Vta] [int] IDENTITY(1,1) NOT NULL,
	[Nro_Cnl_Vta] [nvarchar](50) NOT NULL,
	[Txt_Tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CanalVenta] PRIMARY KEY CLUSTERED 
(
	[Cod_Cnl_Vta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - Cargo
CREATE TABLE [dbo].[Cargo](
	[Cod_Car] [int] IDENTITY(1,1) NOT NULL,
	[Nro_Car] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[Cod_Car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - Comisión
CREATE TABLE [dbo].[Comision](
	[Cod_Com] [int] IDENTITY(1,1) NOT NULL,
	[Nro_Com] [nvarchar](50) NOT NULL,
	[Fec_Reg] [datetime] NOT NULL,
	[Cod_Camp] [int] NOT NULL,
	[Cod_Cnl_Vta] [int] NOT NULL,
	[Cod_Car] [int] NOT NULL,
 CONSTRAINT [PK_Comision] PRIMARY KEY CLUSTERED 
(
	[Cod_Com] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - ComisionRequisito
CREATE TABLE [dbo].[ComisionRequisito](
	[Cod_Com] [int] NOT NULL,
	[Cod_Req] [int] NOT NULL,
 CONSTRAINT [PK_ComisionRequisito] PRIMARY KEY CLUSTERED 
(
	[Cod_Req] ASC,
	[Cod_Com] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - DetallePropuestaSolucion
CREATE TABLE [dbo].[DetallePropuestaSolucion](
	[Cod_Det_Prop_Sol] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Prop_Sol] [int] NOT NULL,
	[Num_Anio] [int] NOT NULL,
	[Num_Edad] [int] NOT NULL,
	[Ss_Mon_Prim] [decimal](10, 2) NOT NULL,
	[Ss_Mon_Ahr] [decimal](10, 2) NOT NULL,
	[Ss_Val_Resc] [decimal](10, 2) NOT NULL,
	[Ss_Mon_Aseg] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_DetallePropuestaSolucion] PRIMARY KEY CLUSTERED 
(
	[Cod_Det_Prop_Sol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - Empleado
CREATE TABLE [dbo].[Empleado](
	[Cod_Emp] [int] IDENTITY(1,1) NOT NULL,
	[Nro_Emp] [nvarchar](50) NOT NULL, 
	[Nro_Ape_Pat] [nvarchar](50) NOT NULL,
	[Nro_Ape_Mat] [nvarchar](max) NOT NULL,
	[Flg_Sex] [bit] NOT NULL,
	[Nu_Dni] [char](8) NOT NULL,  -- Grupo01 - Agregar	
	[Fe_Nacimiento] [date] NOT NULL, -- Grupo01 - Agregar
	[Nu_Telefono] [varchar](15) NOT NULL, -- Grupo01 - Agregar
	[Nu_Movil] [varchar](9) NOT NULL, -- Grupo01 - Agregar
	[Tx_Direccion] [varchar](100) NOT NULL, -- Grupo01 - Agregar
	[Co_Distrito] [int] NOT NULL, -- Grupo01 - Agregar
	[Tx_Correo] [varchar](100) NOT NULL, -- Grupo01 - Agregar
	[Co_Cargo] [int] NOT NULL, -- Grupo01 - Agregar
	[Co_Area] [int] NOT NULL, -- Grupo01 -- Agregar
	[Fe_RegistroIns] [datetime] NOT NULL, -- Grupo01 - Agregar
	[No_UsuarioIns] [varchar](20) NOT NULL, -- Grupo01 - Agregar
	[Fe_RegistroUpd] [datetime] NOT NULL, -- Grupo01 - Agregar
	[No_UsuarioUpd] [varchar](20) NOT NULL, -- Grupo01 - Agregar
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Cod_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--GRUPO 01 - PlanProducto
CREATE TABLE [dbo].[PlanProducto](
	[Cod_Plan_Prod] [int] IDENTITY(1,1) NOT NULL,
	[Nro_Plan_Prod] [varchar](50) NOT NULL,
	[Ss_Prim_Min] [decimal](18, 2) NOT NULL,
	[Ss_Sum_Min_Aseg] [int] NOT NULL,
	[Ss_Sum_Max_Aseg] [int] NOT NULL,
	[Cod_Prod] [int] NOT NULL,
 CONSTRAINT [PK_PlanProducto] PRIMARY KEY CLUSTERED 
(
	[Cod_Plan_Prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 --GRUPO 02
CREATE TABLE [dbo].[Producto](
	[Cod_Prod] [int] IDENTITY(1,1) NOT NULL,
	[Nro_Prod] [varchar](50) NOT NULL,
	[Fec_Crea] [datetime] NOT NULL,
    [FI_Estado] [varchar](50) NOT NULL,   --Grupo 01: Agregar campo
	[Flg_Flag] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Cod_Prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - PropuestaSolucion
CREATE TABLE [dbo].[PropuestaSolucion](
	[Cod_Prop_Sol] [int] IDENTITY(1,1) NOT NULL,
	[Ss_Mon_Prim] [decimal](18, 2) NOT NULL,
	[Fec_Nac] [datetime] NOT NULL,
	[Ss_Mon_Ret] [decimal](18, 2) NOT NULL,
	[Ss_Mon_Aseg] [decimal](18, 2) NOT NULL,
	[Cod_Pros] [int] NOT NULL,
	[Cod_Prod] [int] NOT NULL,
	[Cod_Plan] [int] NOT NULL, --Grupo02: Agregar campo
	[Fec_Crea] [datetime] NOT NULL, --Grupo02: Agregar campo
 CONSTRAINT [PK_PropuestaSolucion] PRIMARY KEY CLUSTERED 
(
	[Cod_Prop_Sol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - Prospecto
CREATE TABLE [dbo].[Prospecto](
	[Cod_Pros] [int] IDENTITY(1,1) NOT NULL,
	[Txt_Pros] [varchar](50) NULL, -- Grupo01: Cambió campo
	[Txt_Ape_Pat] [varchar](50) NULL,
	[Txt_Ape_Mat] [varchar](50) NULL,
	[Txt_Dir] [varchar](50) NULL,
	[Txt_Tel] [varchar](50) NULL,
	[Txt_Mov] [varchar](50) NULL,
	[Txt_Crr] [varchar](50) NULL, 
	[Num_DNI] [varchar](50) NULL, --Grupo 02: Agregar DNI
 CONSTRAINT [PK_Prospecto] PRIMARY KEY CLUSTERED 
(
	[Cod_Pros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - Rango
CREATE TABLE [dbo].[Rango](
	[Cod_Rang] [int] IDENTITY(1,1) NOT NULL,
	[Ss_Min] [float] NOT NULL,
	[Ss_Max] [float] NOT NULL,
	[Qtd_Cant] [int] NOT NULL,
	[Cod_Com] [int] NOT NULL,
 CONSTRAINT [PK_Rango] PRIMARY KEY CLUSTERED 
(
	[Cod_Rang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - Requisito
CREATE TABLE [dbo].[Requisito](
	[Cod_Req] [int] IDENTITY(1,1) NOT NULL,
	[Nro_Req] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Requisito] PRIMARY KEY CLUSTERED 
(
	[Cod_Req] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 01 - Foreign Key
ALTER TABLE [dbo].[Comision]  WITH CHECK ADD  CONSTRAINT [FK_CampaniaComision] FOREIGN KEY([Cod_Camp])
REFERENCES [dbo].[Campania] ([Cod_Camp])
GO

ALTER TABLE [dbo].[Comision] CHECK CONSTRAINT [FK_CampaniaComision]
GO

ALTER TABLE [dbo].[Comision]  WITH CHECK ADD  CONSTRAINT [FK_CanalVentaComision] FOREIGN KEY([Cod_Cnl_Vta])
REFERENCES [dbo].[CanalVenta] ([Cod_Cnl_Vta])
GO

ALTER TABLE [dbo].[Comision] CHECK CONSTRAINT [FK_CanalVentaComision]
GO

ALTER TABLE [dbo].[Comision]  WITH CHECK ADD  CONSTRAINT [FK_CargoComision] FOREIGN KEY([Cod_Car])
REFERENCES [dbo].[Cargo] ([Cod_Car])
GO

ALTER TABLE [dbo].[Comision] CHECK CONSTRAINT [FK_CargoComision]
GO

ALTER TABLE [dbo].[ComisionRequisito]  WITH CHECK ADD  CONSTRAINT [FK_ComisionComisionRequisito] FOREIGN KEY([Cod_Com])
REFERENCES [dbo].[Comision] ([Cod_Com])
GO

ALTER TABLE [dbo].[ComisionRequisito] CHECK CONSTRAINT [FK_ComisionComisionRequisito]
GO

ALTER TABLE [dbo].[ComisionRequisito]  WITH CHECK ADD  CONSTRAINT [FK_RequisitoComisionRequisito] FOREIGN KEY([Cod_Req])
REFERENCES [dbo].[Requisito] ([Cod_Req])
GO

ALTER TABLE [dbo].[ComisionRequisito] CHECK CONSTRAINT [FK_RequisitoComisionRequisito]
GO

ALTER TABLE [dbo].[DetallePropuestaSolucion]  WITH CHECK ADD  CONSTRAINT [FK_DetallePropuestaSolucion_PropuestaSolucion] FOREIGN KEY([Cod_Prop_Sol])
REFERENCES [dbo].[PropuestaSolucion] ([Cod_Prop_Sol])
GO

ALTER TABLE [dbo].[DetallePropuestaSolucion] CHECK CONSTRAINT [FK_DetallePropuestaSolucion_PropuestaSolucion]
GO

ALTER TABLE [dbo].[PlanProducto]  WITH CHECK ADD  CONSTRAINT [FK_PlanProducto_Producto] FOREIGN KEY([Cod_Prod])
REFERENCES [dbo].[Producto] ([Cod_Prod])
GO

ALTER TABLE [dbo].[PlanProducto] CHECK CONSTRAINT [FK_PlanProducto_Producto]
GO

ALTER TABLE [dbo].[PropuestaSolucion]  WITH CHECK ADD  CONSTRAINT [FK_PropuestaSolucion_Producto] FOREIGN KEY([Cod_Prod])
REFERENCES [dbo].[Producto] ([Cod_Prod])
GO

ALTER TABLE [dbo].[PropuestaSolucion] CHECK CONSTRAINT [FK_PropuestaSolucion_Producto]
GO

ALTER TABLE [dbo].[PropuestaSolucion]  WITH CHECK ADD  CONSTRAINT [FK_PropuestaSolucion_Prospecto] FOREIGN KEY([Cod_Pros])
REFERENCES [dbo].[Prospecto] ([Cod_Pros])
GO

ALTER TABLE [dbo].[PropuestaSolucion] CHECK CONSTRAINT [FK_PropuestaSolucion_Prospecto]
GO

ALTER TABLE [dbo].[Rango]  WITH CHECK ADD  CONSTRAINT [FK_ComisionRango] FOREIGN KEY([Cod_Com])
REFERENCES [dbo].[Comision] ([Cod_Com])
GO

ALTER TABLE [dbo].[Rango] CHECK CONSTRAINT [FK_ComisionRango]
GO

--GRUPO 02 - Departamento
CREATE TABLE [dbo].[Departamento](
	[Co_Departamento] [int] IDENTITY(1,1) NOT NULL,
	[No_Departamento] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DEPARTAMENTO] PRIMARY KEY CLUSTERED 
(
	[Co_Departamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Cliente
CREATE TABLE [dbo].[Cliente](
	[Co_Cliente] [int] NOT NULL,
	[No_Cliente] [varchar](80) NULL,
	[No_ApePaterno] [varchar](80) NULL,
	[No_ApeMaterno] [varchar](80) NULL,
	[Fi_Sexo] [varchar](1) NULL,
	[Nu_DNI] [varchar](8) NULL,
	[Fe_Nacimiento] [datetime] NULL,
	[Nu_Telefono] [varchar](20) NULL,
	[Nu_Movil] [varchar](20) NULL,
	[Tx_Direccion] [varchar](20) NULL,
	[Tx_Correo] [varchar](30) NULL,
	[Fi_Estado] [varchar](1) NULL,
	[Tx_CentroTrabajo] [varchar](80) NULL,
	[Tx_CargoTrabajo] [varchar](80) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Co_Cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Area
CREATE TABLE [dbo].[Area](
	[Co_Area] [int] NOT NULL,
	[No_Area] [varchar](80) NULL,
	[Tx_Descripcion] [varchar](120) NULL,
	[Tx_Responsable] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Co_Area] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Invitacion
CREATE TABLE [dbo].[Invitacion](
	[Co_Invitacion] [int] IDENTITY(1,1) NOT NULL,
	[Fe_Invitacion] [date] NOT NULL,
	[Fe_Expiracion] [date] NOT NULL,
	[Fl_Estado] [int] NOT NULL,
	[Fe_RegistroIns] [datetime] NOT NULL,
	[No_UsuarioIns] [varchar](20) NOT NULL,
	[Fe_RegistroUpd] [datetime] NOT NULL,
	[No_UsuarioUpd] [varchar](20) NOT NULL,	
 CONSTRAINT [PK_INVITACION] PRIMARY KEY CLUSTERED 
(
	[Co_Invitacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

--GRUPO 02 - Estado_Solicitud
CREATE TABLE [dbo].[Estado_Solicitud](
	[Co_Estado] [int] IDENTITY(1,1) NOT NULL,
	[No_Estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ESTADO_SOLICITUD] PRIMARY KEY CLUSTERED 
(
	[Co_Estado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Procedimiento 
CREATE TABLE [dbo].[Procedimiento](
	[Co_Procedimiento] [int] IDENTITY(1,1) NOT NULL,
	[No_Procedimiento] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PROCEDIMIENTO] PRIMARY KEY CLUSTERED 
(
	[Co_Procedimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Reclamo_Motivo 
CREATE TABLE [dbo].[Reclamo_Motivo](
	[Co_MotivoReclamo] [int] NOT NULL,
	[Tx_Descripcion] [varchar](150) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Co_MotivoReclamo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Tema 
CREATE TABLE [dbo].[Tema](
	[Co_Tema] [int] NOT NULL,
	[No_Nombre] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[Co_Tema] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Sugerencia 
CREATE TABLE [dbo].[Sugerencia](
	[Nu_Sugerencia] [int] NOT NULL,
	[Tx_Sugerencia] [varchar](400) NULL,
	[Fe_Registro] [datetime] NULL,
	[Fi_Estado] [varchar](1) NULL,
	[Co_Tema] [int] NULL,
	[Co_Area] [int] NULL,
	[Co_Cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Nu_Sugerencia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Poliza 
CREATE TABLE [dbo].[Poliza](
	[Co_Poliza] [int] NOT NULL,
	[Nu_Poliza] [varchar](20) NULL,
	[Co_Cliente] [int] NULL,
	[SS_Prima] [decimal](12, 2) NULL,
	[Fe_Creacion] [datetime] NULL,
	[Fe_Renovacion] [datetime] NULL,
	[Fe_InicioVigencia] [datetime] NULL,
	[Fe_Vencimiento] [datetime] NULL,
	[Tx_TipoPago] [varchar](20) NULL,
	[Tx_MarcaTarjeta] [varchar](20) NULL,
	[Nu_Tarjeta] [varchar](20) NULL,
	[Fl_Estado] [varchar](1) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Co_Poliza] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

--GRUPO 02 - Provincia 
CREATE TABLE [dbo].[Provincia](
	[Co_Provincia] [int] IDENTITY(1,1) NOT NULL,
	[No_Provincia] [varchar](100) NOT NULL,
	[Co_Departamento] [int] NOT NULL,
 CONSTRAINT [PK_PROVINCIA] PRIMARY KEY CLUSTERED 
(
	[Co_Provincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

--GRUPO 02 - Distrito
CREATE TABLE [dbo].[Distrito](
	[Co_Distrito] [int] IDENTITY(1,1) NOT NULL,
	[No_Distrito] [varchar](100) NOT NULL,
	[Co_Provincia] [int] NOT NULL,
 CONSTRAINT [PK_DISTRITO] PRIMARY KEY CLUSTERED 
(
	[Co_Distrito] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Reclamante
CREATE TABLE [dbo].[Reclamante](
	[Co_Reclamante] [int] NOT NULL,
	[No_Reclamante] [varchar](80) NULL,
	[No_ApePaterno] [varchar](80) NULL,
	[No_ApeMaterno] [varchar](80) NULL,
	[Fi_Sexo] [varchar](1) NULL,
	[Nu_DNI] [varchar](8) NULL,
	[Fe_Nacimiento] [datetime] NULL,
	[Tx_Telefono] [varchar](30) NULL,
	[Tx_Movil] [varchar](30) NULL,
	[Tx_Correo] [varchar](80) NULL,
	[Co_Distrito] [int] NULL,
	[Tx_Direccion] [varchar](150) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Co_Reclamante] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Prestadora
CREATE TABLE [dbo].[Prestadora](
	[Co_Prestadora] [int] IDENTITY(1,1) NOT NULL,
	[Nu_Ruc] [varchar](11) NOT NULL,
	[Tx_RazonSocial] [varchar](200) NOT NULL,
	[Tx_DomicilioFiscal] [varchar](200) NOT NULL,
	[Co_Distrito] [int] NOT NULL,
	[No_RepresentanteLegal] [varchar](100) NOT NULL,
	[No_ApePatRepresentanteLegal] [varchar](100) NOT NULL,
	[No_ApeMatRepresentanteLegal] [varchar](100) NOT NULL,
	[Tx_CorreoRepresentanteLegal] [varchar](100) NOT NULL,
	[Nu_TelefonoRepresentanteLegal] [varchar](15) NOT NULL,
	[Tx_PaginaWeb] [varchar](50) NULL,
	[Fe_Afiliacion] [date] NULL,
	[Fl_Activo] [int] NOT NULL,
	[Fe_RegistroIns] [datetime] NOT NULL,
	[No_UsuarioIns] [varchar](20) NOT NULL,
	[Fe_RegistroUpd] [datetime] NOT NULL,
	[No_UsuarioUpd] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PRESTADORA] PRIMARY KEY CLUSTERED 
(
	[Co_Prestadora] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

--GRUPO 02 - Reclamo
CREATE TABLE [dbo].[Reclamo](
	[Nu_Reclamo] [varchar](15) NOT NULL,
	[Co_Reclamante] [int] NULL,
	[Co_Empleado] [int] NULL,
	[Co_MotivoReclamo] [int] NULL,
	[Fe_Registro] [datetime] NULL,
	[Fe_Ocurrencia] [datetime] NULL,
	[Tx_LugIncidencia] [varchar](80) NULL,
	[Tx_PersAtendio] [varchar](150) NULL,
	[Tx_DescReclamo] [varchar](2000) NOT NULL,
	[Tx_ResInmediata] [varchar](2000) NULL,
	[Fi_Estado] [varchar](1) NULL,
	[Fe_CierreReclamo] [datetime] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Nu_Reclamo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Solicitud_Autorizacion
CREATE TABLE [dbo].[Solicitud_Autorizacion](
	[Co_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[Co_Poliza] [int] NOT NULL,
	[Co_Sede] [int] NOT NULL,
	[Fe_Solicitud] [date] NOT NULL,
	[No_Contacto] [varchar](100) NOT NULL,
	[No_ApePatContacto] [varchar](100) NOT NULL,
	[No_ApeMatContacto] [varchar](100) NOT NULL,
	[Nu_TelefonoContacto] [varchar](15) NOT NULL,
	[Tx_CorreoContacto] [varchar](100) NOT NULL,
	[Co_Procedimiento] [int] NOT NULL,
	[Ss_Monto] [decimal](10, 2) NOT NULL,
	[Co_Evaluador] [int] NOT NULL,
	[Co_Autorizador] [int] NOT NULL,
	[Tx_ObservacionEvaluador] [varchar](300) NULL,
	[Tx_ObservacionAutorizador] [varchar](300) NULL,
	[Fl_Estado] [int] NOT NULL,
	[Fe_RegistroIns] [datetime] NOT NULL,
	[No_UsuarioIns] [varchar](20) NOT NULL,
	[Fe_RegistroUpd] [datetime] NOT NULL,
	[No_UsuarioUpd] [varchar](20) NOT NULL,
 CONSTRAINT [PK_SOLICITUD_AUTORIZACION] PRIMARY KEY CLUSTERED 
(
	[Co_Solicitud] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Solicitud_Afiliacion
CREATE TABLE [dbo].[Solicitud_Afiliacion](
	[Co_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[Co_Invitacion] [int] NOT NULL,
	[Nu_Folio] [varchar](50) NOT NULL,
	[Fe_Solicitud] [date] NOT NULL,
	[No_Contacto] [varchar](100) NOT NULL,
	[No_ApePatContacto] [varchar](100) NOT NULL,
	[No_ApeMatContacto] [varchar](100) NOT NULL,
	[Nu_TelefonoContacto] [varchar](15) NOT NULL,
	[Tx_CorreoContacto] [varchar](100) NOT NULL,
	[Tx_EvaluacionSunat] [varchar](300) NULL,
	[Tx_EvaluacionRiesgos] [varchar](300) NULL,
	[Co_Coordinador] [int] NOT NULL,
	[Co_Evaluador] [int] NOT NULL,
	[Tx_EvaluacionServicios] [varchar](300) NULL,
	[Tx_ObservacionAprobador] [varchar](300) NULL,
	[Tx_ObservacionNegociador] [varchar](300) NULL,
	[Co_Estado] [int] NOT NULL,
	[Fe_RegistroIns] [datetime] NOT NULL,
	[No_UsuarioIns] [varchar](20) NOT NULL,
	[Fe_RegistroUpd] [datetime] NOT NULL,
	[No_UsuarioUpd] [varchar](20) NOT NULL,
 CONSTRAINT [PK_SOLICITUD_AFILIACION] PRIMARY KEY CLUSTERED 
(
	[Co_Solicitud] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Reclamo_Poliza
CREATE TABLE [dbo].[Reclamo_Poliza](
	[Co_ReclamoPoliza] [int] NOT NULL,
	[Fi_Estado] [varchar](20) NULL,
	[Co_Poliza] [int] NULL,
	[Nu_Reclamo] [varchar](15) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Co_ReclamoPoliza] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 02 - Foreign Key

ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [FK_DISTRITO_PROVINCIA] FOREIGN KEY([Co_Provincia]) REFERENCES [dbo].[Provincia] ([Co_Provincia])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [FK_DISTRITO_PROVINCIA]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD CONSTRAINT [FK_EMPLEADO_CARGO] FOREIGN KEY([Co_Cargo]) REFERENCES [dbo].[Cargo] ([Cod_Car])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_EMPLEADO_CARGO]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD CONSTRAINT [FK_EMPLEADO_AREA] FOREIGN KEY([Co_Area]) REFERENCES [dbo].[Area] ([Co_Area])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_EMPLEADO_AREA]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD CONSTRAINT [FK_EMPLEADO_DISTRITO] FOREIGN KEY([Co_Distrito]) REFERENCES [dbo].[Distrito] ([Co_Distrito])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_EMPLEADO_DISTRITO]
GO
ALTER TABLE [dbo].[Poliza]  WITH CHECK ADD FOREIGN KEY([Co_Cliente]) REFERENCES [dbo].[Cliente] ([Co_Cliente])
GO
ALTER TABLE [dbo].[Poliza]  WITH CHECK ADD FOREIGN KEY([Co_Cliente]) REFERENCES [dbo].[Cliente] ([Co_Cliente])
GO
ALTER TABLE [dbo].[Prestadora]  WITH CHECK ADD  CONSTRAINT [FK_PRESTADORA_DISTRITO] FOREIGN KEY([Co_Distrito]) REFERENCES [dbo].[Distrito] ([Co_Distrito])
GO
ALTER TABLE [dbo].[Prestadora] CHECK CONSTRAINT [FK_PRESTADORA_DISTRITO]
GO
ALTER TABLE [dbo].[PropuestaSolucion] CHECK CONSTRAINT [FK_PropuestaSolucion_Producto]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_PROVINCIA_DEPARTAMENTO] FOREIGN KEY([Co_Departamento]) REFERENCES [dbo].[Departamento] ([Co_Departamento])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_PROVINCIA_DEPARTAMENTO]
GO
ALTER TABLE [dbo].[Reclamante]  WITH CHECK ADD FOREIGN KEY([Co_Distrito]) REFERENCES [dbo].[Distrito] ([Co_Distrito])
GO
ALTER TABLE [dbo].[Reclamo]  WITH CHECK ADD FOREIGN KEY([Co_Empleado]) REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[Reclamo]  WITH CHECK ADD FOREIGN KEY([Co_MotivoReclamo]) REFERENCES [dbo].[Reclamo_Motivo] ([Co_MotivoReclamo])
GO
ALTER TABLE [dbo].[Reclamo]  WITH CHECK ADD FOREIGN KEY([Co_Reclamante]) REFERENCES [dbo].[Reclamante] ([Co_Reclamante])
GO
ALTER TABLE [dbo].[Reclamo_Poliza]  WITH CHECK ADD FOREIGN KEY([Co_Poliza]) REFERENCES [dbo].[Poliza] ([Co_Poliza])
GO
ALTER TABLE [dbo].[Reclamo_Poliza]  WITH CHECK ADD FOREIGN KEY([Nu_Reclamo]) REFERENCES [dbo].[Reclamo] ([Nu_Reclamo])
GO
ALTER TABLE [dbo].[Solicitud_Afiliacion]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUD_AFILIACION_EMPLEADO] FOREIGN KEY([Co_Coordinador]) REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[Solicitud_Afiliacion] CHECK CONSTRAINT [FK_SOLICITUD_AFILIACION_EMPLEADO]
GO
ALTER TABLE [dbo].[Solicitud_Afiliacion]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUD_AFILIACION_EMPLEADO1] FOREIGN KEY([Co_Evaluador]) REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[Solicitud_Afiliacion] CHECK CONSTRAINT [FK_SOLICITUD_AFILIACION_EMPLEADO1]
GO
ALTER TABLE [dbo].[Solicitud_Afiliacion]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUD_AFILIACION_ESTADO_SOLICITUD] FOREIGN KEY([Co_Estado]) REFERENCES [dbo].[Estado_Solicitud] ([Co_Estado])
GO
ALTER TABLE [dbo].[Solicitud_Afiliacion] CHECK CONSTRAINT [FK_SOLICITUD_AFILIACION_ESTADO_SOLICITUD]
GO
ALTER TABLE [dbo].[Solicitud_Afiliacion]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUD_AFILIACION_INVITACION] FOREIGN KEY([Co_Invitacion]) REFERENCES [dbo].[Invitacion] ([Co_Invitacion])
GO
ALTER TABLE [dbo].[Solicitud_Afiliacion] CHECK CONSTRAINT [FK_SOLICITUD_AFILIACION_INVITACION]
GO
ALTER TABLE [dbo].[Solicitud_Autorizacion]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUD_AUTORIZACION_EMPLEADO] FOREIGN KEY([Co_Evaluador]) REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[Solicitud_Autorizacion] CHECK CONSTRAINT [FK_SOLICITUD_AUTORIZACION_EMPLEADO]
GO
ALTER TABLE [dbo].[Solicitud_Autorizacion]  WITH CHECK ADD  CONSTRAINT [FK_SOLICITUD_AUTORIZACION_EMPLEADO1] FOREIGN KEY([Co_Autorizador]) REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[Solicitud_Autorizacion] CHECK CONSTRAINT [FK_SOLICITUD_AUTORIZACION_EMPLEADO1]
GO
ALTER TABLE [dbo].[Sugerencia]  WITH CHECK ADD FOREIGN KEY([Co_Area]) REFERENCES [dbo].[Area] ([Co_Area])
GO
ALTER TABLE [dbo].[Sugerencia]  WITH CHECK ADD FOREIGN KEY([Co_Cliente]) REFERENCES [dbo].[Cliente] ([Co_Cliente])
GO
ALTER TABLE [dbo].[Sugerencia]  WITH CHECK ADD FOREIGN KEY([Co_Tema]) REFERENCES [dbo].[Tema] ([Co_Tema])
GO

--GRUPO 03 - Servicios
CREATE TABLE Servicios(
numeroServicio		Int,
nombreServicio		Varchar(50),
detalle				Varchar(300),
categoria			Varchar(100),
activo				Int
)
GO

--GRUPO 03 - ServicioNegociacion
CREATE TABLE ServicioNegociacion(
tarifaAcordada		numeric,
tarifaPropuesta		numeric
)
GO

--GRUPO 03 - TipoPrestadora
CREATE TABLE TipoPrestadora(
numeroTipoPrestadora	Int,
descripción				Varchar(100),
activo					Int
)
GO

--GRUPO 03 - RedAtencion
CREATE TABLE RedAtencion(
numeroRed				Int,
nombreRed				Int
)
GO

--GRUPO 03 - ContratoPrestadora
CREATE TABLE ContratoPrestadora(
numeroContrato			Int,
fechaInicioContrato		Date,
fechaFinContrato		Date,
descripcionLegal		Varchar(100)
)
GO

--GRUPO 03 - ContratoServicio
CREATE TABLE ContratoServicio(
tarifaNueva		numeric,
fechaNueva		Date
)
GO

--GRUPO 04 - Periodo
CREATE TABLE [dbo].[Periodo](
	[IDPeriodo] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[IDPeriodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 04 - Materia
CREATE TABLE [dbo].[Materia](
	[IDMateria] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[IDMateria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

--GRUPO 04 - ProcedimientoSeguimiento
CREATE TABLE [dbo].[ProcedimientoSeguimiento](
	[IDProcedimientoSeguimiento] [int] NOT NULL,
	[IDPlan] [int] NOT NULL,
	[IDPeriodo] [int] NOT NULL,
	[EvaluacionVerificacion] [varchar](500) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[TiempoEjecucion] [varchar](50) NOT NULL,
	[IDEmpleadoResponsable] [int] NOT NULL,
	[IDRepresentanteUnidad] [int] NOT NULL,
	[Co_Area] [int] NOT NULL, -- Grupo 4- Cambiar
	[IDMateria] [int] NOT NULL,
	[Comentario] [varchar](250) NULL,
 CONSTRAINT [PK_ProcedimientoSeguimiento] PRIMARY KEY CLUSTERED 
(
	[IDProcedimientoSeguimiento] ASC,
	[IDPlan] ASC,
	[IDPeriodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

--GRUPO 04 - ProcedimientoAuditoria
CREATE TABLE [dbo].[ProcedimientoAuditoria](
	[IDProcedimientoAuditoria] [int] NOT NULL,
	[IDPlan] [int] NOT NULL,
	[IDPeriodo] [int] NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[TiempoEjecucion] [varchar](50) NOT NULL,
	[IDEmpleadoResponsable] [int] NOT NULL,
	[IDRepresentanteUnidad] [int] NOT NULL,
	[Co_Area] [int] NOT NULL, -- Grupo04 - Cambiar
	[IDMateria] [int] NOT NULL,
	[Comentario] [varchar](250) NULL,
 CONSTRAINT [PK_ProcedimientoAuditoria] PRIMARY KEY CLUSTERED 
(
	[IDProcedimientoAuditoria] ASC,
	[IDPlan] ASC,
	[IDPeriodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

--GRUPO 04 - PlanTrabajo
CREATE TABLE [dbo].[PlanTrabajo](
	[IDPlan] [int] NOT NULL,
	[IDPeriodo] [int] NOT NULL,
	[Actividades] [varchar](500) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Adjunto] [varbinary](max) NOT NULL,
	[Comentario] [varchar](250) NULL,
 CONSTRAINT [PK_PlanTrabajo] PRIMARY KEY CLUSTERED 
(
	[IDPlan] ASC,
	[IDPeriodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--GRUPO 04 - FormatoPlanTrabajo
CREATE TABLE [dbo].[FormatoPlanTrabajo](
	[IDFormatoPlanTrabajo] [int] NOT NULL,
	[IDPlan] [int] NOT NULL,
	[IDPeriodo] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[IDResponsable] [int] NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Adjunto] [varbinary](max) NOT NULL,
	[Comentario] [varchar](250) NULL,
 CONSTRAINT [PK_FormatoPlanTrabajo] PRIMARY KEY CLUSTERED 
(
	[IDFormatoPlanTrabajo] ASC,
	[IDPlan] ASC,
	[IDPeriodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProcedimientoSeguimiento]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoSeguimiento_Area] FOREIGN KEY([Co_Area])
REFERENCES [dbo].[Area] ([Co_Area])
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento] CHECK CONSTRAINT [FK_ProcedimientoSeguimiento_Area]
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoSeguimiento_Empleado] FOREIGN KEY([IDEmpleadoResponsable])
REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento] CHECK CONSTRAINT [FK_ProcedimientoSeguimiento_Empleado]
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoSeguimiento_Empleado1] FOREIGN KEY([IDRepresentanteUnidad])
REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento] CHECK CONSTRAINT [FK_ProcedimientoSeguimiento_Empleado1]
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoSeguimiento_Materia] FOREIGN KEY([IDMateria])
REFERENCES [dbo].[Materia] ([IDMateria])
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento] CHECK CONSTRAINT [FK_ProcedimientoSeguimiento_Materia]
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoSeguimiento_Periodo] FOREIGN KEY([IDPeriodo])
REFERENCES [dbo].[Periodo] ([IDPeriodo])
GO
ALTER TABLE [dbo].[ProcedimientoSeguimiento] CHECK CONSTRAINT [FK_ProcedimientoSeguimiento_Periodo]
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoAuditoria_Area] FOREIGN KEY([Co_Area])
REFERENCES [dbo].[Area] ([Co_Area])
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria] CHECK CONSTRAINT [FK_ProcedimientoAuditoria_Area]
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoAuditoria_Empleado] FOREIGN KEY([IDEmpleadoResponsable])
REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria] CHECK CONSTRAINT [FK_ProcedimientoAuditoria_Empleado]
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoAuditoria_Empleado1] FOREIGN KEY([IDRepresentanteUnidad])
REFERENCES [dbo].[Empleado] ([Cod_Emp])
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria] CHECK CONSTRAINT [FK_ProcedimientoAuditoria_Empleado1]
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoAuditoria_Materia] FOREIGN KEY([IDMateria])
REFERENCES [dbo].[Materia] ([IDMateria])
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria] CHECK CONSTRAINT [FK_ProcedimientoAuditoria_Materia]
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria]  WITH CHECK ADD  CONSTRAINT [FK_ProcedimientoAuditoria_Periodo] FOREIGN KEY([IDPeriodo])
REFERENCES [dbo].[Periodo] ([IDPeriodo])
GO
ALTER TABLE [dbo].[ProcedimientoAuditoria] CHECK CONSTRAINT [FK_ProcedimientoAuditoria_Periodo]
GO
ALTER TABLE [dbo].[PlanTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_PlanTrabajo_Periodo] FOREIGN KEY([IDPeriodo])
REFERENCES [dbo].[Periodo] ([IDPeriodo])
GO
ALTER TABLE [dbo].[PlanTrabajo] CHECK CONSTRAINT [FK_PlanTrabajo_Periodo]
GO
ALTER TABLE [dbo].[FormatoPlanTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_FormatoPlanTrabajo_Periodo] FOREIGN KEY([IDPeriodo])
REFERENCES [dbo].[Periodo] ([IDPeriodo])
GO
ALTER TABLE [dbo].[FormatoPlanTrabajo] CHECK CONSTRAINT [FK_FormatoPlanTrabajo_Periodo]
GO
ALTER TABLE [dbo].[FormatoPlanTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_FormatoPlanTrabajo_PlanTrabajo] FOREIGN KEY([IDPlan], [IDPeriodo])
REFERENCES [dbo].[PlanTrabajo] ([IDPlan], [IDPeriodo])
GO
ALTER TABLE [dbo].[FormatoPlanTrabajo] CHECK CONSTRAINT [FK_FormatoPlanTrabajo_PlanTrabajo]
GO


