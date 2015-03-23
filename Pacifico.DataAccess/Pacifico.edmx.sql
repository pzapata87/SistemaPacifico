
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/23/2015 18:11:14
-- Generated from EDMX file: D:\Proyectos\Desarrollo - Aplicacion Academica\Desarrollo\SistemaPacifico\Pacifico.DataAccess\Pacifico.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BDPacifico];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Sugerenci__Co_Ar__2BFE89A6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sugerencia] DROP CONSTRAINT [FK__Sugerenci__Co_Ar__2BFE89A6];
GO
IF OBJECT_ID(N'[dbo].[FK__Sugerenci__Co_Ar__66603565]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sugerencia] DROP CONSTRAINT [FK__Sugerenci__Co_Ar__66603565];
GO
IF OBJECT_ID(N'[dbo].[FK_EMPLEADO_AREA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_EMPLEADO_AREA];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoAuditoria_Area]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoAuditoria] DROP CONSTRAINT [FK_ProcedimientoAuditoria_Area];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoSeguimiento_Area]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoSeguimiento] DROP CONSTRAINT [FK_ProcedimientoSeguimiento_Area];
GO
IF OBJECT_ID(N'[dbo].[FK_EMPLEADO_CARGO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_EMPLEADO_CARGO];
GO
IF OBJECT_ID(N'[dbo].[FK__Poliza__Co_Clien__245D67DE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Poliza] DROP CONSTRAINT [FK__Poliza__Co_Clien__245D67DE];
GO
IF OBJECT_ID(N'[dbo].[FK__Sugerenci__Co_Cl__2CF2ADDF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sugerencia] DROP CONSTRAINT [FK__Sugerenci__Co_Cl__2CF2ADDF];
GO
IF OBJECT_ID(N'[dbo].[FK__Sugerenci__Co_Cl__6754599E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sugerencia] DROP CONSTRAINT [FK__Sugerenci__Co_Cl__6754599E];
GO
IF OBJECT_ID(N'[dbo].[FK_ComisionRango]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rango] DROP CONSTRAINT [FK_ComisionRango];
GO
IF OBJECT_ID(N'[dbo].[FK_PROVINCIA_DEPARTAMENTO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Provincia] DROP CONSTRAINT [FK_PROVINCIA_DEPARTAMENTO];
GO
IF OBJECT_ID(N'[dbo].[FK_DetallePropuestaSolucion_PropuestaSolucion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetallePropuestaSolucion] DROP CONSTRAINT [FK_DetallePropuestaSolucion_PropuestaSolucion];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamant__Co_Di__2645B050]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamante] DROP CONSTRAINT [FK__Reclamant__Co_Di__2645B050];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamant__Co_Di__5AEE82B9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamante] DROP CONSTRAINT [FK__Reclamant__Co_Di__5AEE82B9];
GO
IF OBJECT_ID(N'[dbo].[FK_DISTRITO_PROVINCIA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Distrito] DROP CONSTRAINT [FK_DISTRITO_PROVINCIA];
GO
IF OBJECT_ID(N'[dbo].[FK_EMPLEADO_DISTRITO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_EMPLEADO_DISTRITO];
GO
IF OBJECT_ID(N'[dbo].[FK_PRESTADORA_DISTRITO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Prestadora] DROP CONSTRAINT [FK_PRESTADORA_DISTRITO];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo__Co_Empl__2739D489]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo] DROP CONSTRAINT [FK__Reclamo__Co_Empl__2739D489];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo__Co_Empl__5BE2A6F2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo] DROP CONSTRAINT [FK__Reclamo__Co_Empl__5BE2A6F2];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoAuditoria_Empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoAuditoria] DROP CONSTRAINT [FK_ProcedimientoAuditoria_Empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoAuditoria_Empleado1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoAuditoria] DROP CONSTRAINT [FK_ProcedimientoAuditoria_Empleado1];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoSeguimiento_Empleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoSeguimiento] DROP CONSTRAINT [FK_ProcedimientoSeguimiento_Empleado];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoSeguimiento_Empleado1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoSeguimiento] DROP CONSTRAINT [FK_ProcedimientoSeguimiento_Empleado1];
GO
IF OBJECT_ID(N'[dbo].[FK_SOLICITUD_AFILIACION_EMPLEADO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Solicitud_Afiliacion] DROP CONSTRAINT [FK_SOLICITUD_AFILIACION_EMPLEADO];
GO
IF OBJECT_ID(N'[dbo].[FK_SOLICITUD_AFILIACION_EMPLEADO1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Solicitud_Afiliacion] DROP CONSTRAINT [FK_SOLICITUD_AFILIACION_EMPLEADO1];
GO
IF OBJECT_ID(N'[dbo].[FK_SOLICITUD_AUTORIZACION_EMPLEADO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Solicitud_Autorizacion] DROP CONSTRAINT [FK_SOLICITUD_AUTORIZACION_EMPLEADO];
GO
IF OBJECT_ID(N'[dbo].[FK_SOLICITUD_AUTORIZACION_EMPLEADO1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Solicitud_Autorizacion] DROP CONSTRAINT [FK_SOLICITUD_AUTORIZACION_EMPLEADO1];
GO
IF OBJECT_ID(N'[dbo].[FK_SOLICITUD_AFILIACION_ESTADO_SOLICITUD]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Solicitud_Afiliacion] DROP CONSTRAINT [FK_SOLICITUD_AFILIACION_ESTADO_SOLICITUD];
GO
IF OBJECT_ID(N'[dbo].[FK_FormatoPlanTrabajo_Periodo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FormatoPlanTrabajo] DROP CONSTRAINT [FK_FormatoPlanTrabajo_Periodo];
GO
IF OBJECT_ID(N'[dbo].[FK_FormatoPlanTrabajo_PlanTrabajo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FormatoPlanTrabajo] DROP CONSTRAINT [FK_FormatoPlanTrabajo_PlanTrabajo];
GO
IF OBJECT_ID(N'[dbo].[FK_SOLICITUD_AFILIACION_INVITACION]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Solicitud_Afiliacion] DROP CONSTRAINT [FK_SOLICITUD_AFILIACION_INVITACION];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoAuditoria_Materia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoAuditoria] DROP CONSTRAINT [FK_ProcedimientoAuditoria_Materia];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoSeguimiento_Materia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoSeguimiento] DROP CONSTRAINT [FK_ProcedimientoSeguimiento_Materia];
GO
IF OBJECT_ID(N'[dbo].[FK_PlanTrabajo_Periodo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlanTrabajo] DROP CONSTRAINT [FK_PlanTrabajo_Periodo];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoAuditoria_Periodo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoAuditoria] DROP CONSTRAINT [FK_ProcedimientoAuditoria_Periodo];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedimientoSeguimiento_Periodo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProcedimientoSeguimiento] DROP CONSTRAINT [FK_ProcedimientoSeguimiento_Periodo];
GO
IF OBJECT_ID(N'[dbo].[FK_PlanProducto_Producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlanProducto] DROP CONSTRAINT [FK_PlanProducto_Producto];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo_P__Co_Po__2A164134]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo_Poliza] DROP CONSTRAINT [FK__Reclamo_P__Co_Po__2A164134];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo_P__Co_Po__5EBF139D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo_Poliza] DROP CONSTRAINT [FK__Reclamo_P__Co_Po__5EBF139D];
GO
IF OBJECT_ID(N'[dbo].[FK_PropuestaSolucion_Producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropuestaSolucion] DROP CONSTRAINT [FK_PropuestaSolucion_Producto];
GO
IF OBJECT_ID(N'[dbo].[FK_PropuestaSolucion_Prospecto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropuestaSolucion] DROP CONSTRAINT [FK_PropuestaSolucion_Prospecto];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo__Co_Recl__29221CFB]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo] DROP CONSTRAINT [FK__Reclamo__Co_Recl__29221CFB];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo__Co_Recl__5DCAEF64]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo] DROP CONSTRAINT [FK__Reclamo__Co_Recl__5DCAEF64];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo__Co_Moti__282DF8C2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo] DROP CONSTRAINT [FK__Reclamo__Co_Moti__282DF8C2];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo__Co_Moti__5CD6CB2B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo] DROP CONSTRAINT [FK__Reclamo__Co_Moti__5CD6CB2B];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo_P__Nu_Re__2B0A656D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo_Poliza] DROP CONSTRAINT [FK__Reclamo_P__Nu_Re__2B0A656D];
GO
IF OBJECT_ID(N'[dbo].[FK__Reclamo_P__Nu_Re__5FB337D6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reclamo_Poliza] DROP CONSTRAINT [FK__Reclamo_P__Nu_Re__5FB337D6];
GO
IF OBJECT_ID(N'[dbo].[FK__Sugerenci__Co_Te__2DE6D218]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sugerencia] DROP CONSTRAINT [FK__Sugerenci__Co_Te__2DE6D218];
GO
IF OBJECT_ID(N'[dbo].[FK__Sugerenci__Co_Te__68487DD7]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sugerencia] DROP CONSTRAINT [FK__Sugerenci__Co_Te__68487DD7];
GO
IF OBJECT_ID(N'[dbo].[FK_ComisionComisionRequisito]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ComisionRequisito] DROP CONSTRAINT [FK_ComisionComisionRequisito];
GO
IF OBJECT_ID(N'[dbo].[FK_RequisitoComisionRequisito]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ComisionRequisito] DROP CONSTRAINT [FK_RequisitoComisionRequisito];
GO
IF OBJECT_ID(N'[dbo].[FK_CanalVentaComision]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comision] DROP CONSTRAINT [FK_CanalVentaComision];
GO
IF OBJECT_ID(N'[dbo].[FK_CampaniaComision]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comision] DROP CONSTRAINT [FK_CampaniaComision];
GO
IF OBJECT_ID(N'[dbo].[FK_CargoComision]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comision] DROP CONSTRAINT [FK_CargoComision];
GO
IF OBJECT_ID(N'[dbo].[FK_TipoVisitaVisita]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Visita] DROP CONSTRAINT [FK_TipoVisitaVisita];
GO
IF OBJECT_ID(N'[dbo].[FK_ProspectoVisita]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Visita] DROP CONSTRAINT [FK_ProspectoVisita];
GO
IF OBJECT_ID(N'[dbo].[FK_TipoPlanPoliza]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Poliza] DROP CONSTRAINT [FK_TipoPlanPoliza];
GO
IF OBJECT_ID(N'[dbo].[FK_PolizaBeneficiario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BeneficiarioSet] DROP CONSTRAINT [FK_PolizaBeneficiario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Area]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Area];
GO
IF OBJECT_ID(N'[dbo].[Campania]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Campania];
GO
IF OBJECT_ID(N'[dbo].[CanalVenta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CanalVenta];
GO
IF OBJECT_ID(N'[dbo].[Cargo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cargo];
GO
IF OBJECT_ID(N'[dbo].[Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente];
GO
IF OBJECT_ID(N'[dbo].[Comision]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comision];
GO
IF OBJECT_ID(N'[dbo].[Departamento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Departamento];
GO
IF OBJECT_ID(N'[dbo].[DetallePropuestaSolucion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DetallePropuestaSolucion];
GO
IF OBJECT_ID(N'[dbo].[Distrito]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Distrito];
GO
IF OBJECT_ID(N'[dbo].[Empleado]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleado];
GO
IF OBJECT_ID(N'[dbo].[Estado_Solicitud]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Estado_Solicitud];
GO
IF OBJECT_ID(N'[dbo].[FormatoPlanTrabajo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FormatoPlanTrabajo];
GO
IF OBJECT_ID(N'[dbo].[Invitacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invitacion];
GO
IF OBJECT_ID(N'[dbo].[Materia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Materia];
GO
IF OBJECT_ID(N'[dbo].[Periodo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Periodo];
GO
IF OBJECT_ID(N'[dbo].[PlanProducto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlanProducto];
GO
IF OBJECT_ID(N'[dbo].[PlanTrabajo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlanTrabajo];
GO
IF OBJECT_ID(N'[dbo].[Poliza]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Poliza];
GO
IF OBJECT_ID(N'[dbo].[Prestadora]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Prestadora];
GO
IF OBJECT_ID(N'[dbo].[Procedimiento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Procedimiento];
GO
IF OBJECT_ID(N'[dbo].[ProcedimientoAuditoria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProcedimientoAuditoria];
GO
IF OBJECT_ID(N'[dbo].[ProcedimientoSeguimiento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProcedimientoSeguimiento];
GO
IF OBJECT_ID(N'[dbo].[Producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Producto];
GO
IF OBJECT_ID(N'[dbo].[PropuestaSolucion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PropuestaSolucion];
GO
IF OBJECT_ID(N'[dbo].[Prospecto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Prospecto];
GO
IF OBJECT_ID(N'[dbo].[Provincia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Provincia];
GO
IF OBJECT_ID(N'[dbo].[Rango]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rango];
GO
IF OBJECT_ID(N'[dbo].[Reclamante]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reclamante];
GO
IF OBJECT_ID(N'[dbo].[Reclamo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reclamo];
GO
IF OBJECT_ID(N'[dbo].[Reclamo_Motivo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reclamo_Motivo];
GO
IF OBJECT_ID(N'[dbo].[Reclamo_Poliza]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reclamo_Poliza];
GO
IF OBJECT_ID(N'[dbo].[Requisito]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Requisito];
GO
IF OBJECT_ID(N'[dbo].[Solicitud_Afiliacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Solicitud_Afiliacion];
GO
IF OBJECT_ID(N'[dbo].[Solicitud_Autorizacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Solicitud_Autorizacion];
GO
IF OBJECT_ID(N'[dbo].[Sugerencia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sugerencia];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Tema]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tema];
GO
IF OBJECT_ID(N'[dbo].[ComisionRequisito]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ComisionRequisito];
GO
IF OBJECT_ID(N'[dbo].[Visita]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Visita];
GO
IF OBJECT_ID(N'[dbo].[TipoVisita]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoVisita];
GO
IF OBJECT_ID(N'[dbo].[TipoPlan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoPlan];
GO
IF OBJECT_ID(N'[dbo].[BeneficiarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BeneficiarioSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Area'
CREATE TABLE [dbo].[Area] (
    [Co_Area] int  NOT NULL,
    [No_Area] varchar(80)  NULL,
    [Tx_Descripcion] varchar(120)  NULL,
    [Tx_Responsable] varchar(150)  NULL
);
GO

-- Creating table 'Campania'
CREATE TABLE [dbo].[Campania] (
    [Cod_Camp] int IDENTITY(1,1) NOT NULL,
    [Nro_Camp] nvarchar(50)  NOT NULL,
    [Fec_Ini] datetime  NOT NULL,
    [Fec_Fin] datetime  NOT NULL,
    [Qtd_Meta] int  NOT NULL,
    [Flg_Flag] bit  NOT NULL
);
GO

-- Creating table 'CanalVenta'
CREATE TABLE [dbo].[CanalVenta] (
    [Cod_Cnl_Vta] int IDENTITY(1,1) NOT NULL,
    [Nro_Cnl_Vta] nvarchar(50)  NOT NULL,
    [Txt_Tipo] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Cargo'
CREATE TABLE [dbo].[Cargo] (
    [Cod_Car] int IDENTITY(1,1) NOT NULL,
    [Nro_Car] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Cliente'
CREATE TABLE [dbo].[Cliente] (
    [Co_Cliente] int  NOT NULL,
    [No_Cliente] varchar(80)  NULL,
    [No_ApePaterno] varchar(80)  NULL,
    [No_ApeMaterno] varchar(80)  NULL,
    [Fi_Sexo] varchar(1)  NULL,
    [Nu_DNI] varchar(8)  NULL,
    [Fe_Nacimiento] datetime  NULL,
    [Nu_Telefono] varchar(20)  NULL,
    [Nu_Movil] varchar(20)  NULL,
    [Tx_Direccion] varchar(20)  NULL,
    [Tx_Correo] varchar(30)  NULL,
    [Fi_Estado] varchar(1)  NULL,
    [Tx_CentroTrabajo] varchar(80)  NULL,
    [Tx_CargoTrabajo] varchar(80)  NULL
);
GO

-- Creating table 'Comision'
CREATE TABLE [dbo].[Comision] (
    [Cod_Com] int IDENTITY(1,1) NOT NULL,
    [Nro_Com] nvarchar(50)  NOT NULL,
    [Fec_Reg] datetime  NOT NULL,
    [Cod_Camp] int  NOT NULL,
    [Cod_Cnl_Vta] int  NOT NULL,
    [Cod_Car] int  NOT NULL
);
GO

-- Creating table 'Departamento'
CREATE TABLE [dbo].[Departamento] (
    [Co_Departamento] int IDENTITY(1,1) NOT NULL,
    [No_Departamento] varchar(100)  NOT NULL
);
GO

-- Creating table 'DetallePropuestaSolucion'
CREATE TABLE [dbo].[DetallePropuestaSolucion] (
    [Cod_Det_Prop_Sol] int IDENTITY(1,1) NOT NULL,
    [Cod_Prop_Sol] int  NOT NULL,
    [Num_Anio] int  NOT NULL,
    [Num_Edad] int  NOT NULL,
    [Ss_Mon_Prim] decimal(10,2)  NOT NULL,
    [Ss_Mon_Ahr] decimal(10,2)  NOT NULL,
    [Ss_Val_Resc] decimal(10,2)  NOT NULL,
    [Ss_Mon_Aseg] decimal(10,2)  NOT NULL
);
GO

-- Creating table 'Distrito'
CREATE TABLE [dbo].[Distrito] (
    [Co_Distrito] int IDENTITY(1,1) NOT NULL,
    [No_Distrito] varchar(100)  NOT NULL,
    [Co_Provincia] int  NOT NULL
);
GO

-- Creating table 'Empleado'
CREATE TABLE [dbo].[Empleado] (
    [Cod_Emp] int IDENTITY(1,1) NOT NULL,
    [Nro_Emp] nvarchar(50)  NOT NULL,
    [Nro_Ape_Pat] nvarchar(50)  NOT NULL,
    [Nro_Ape_Mat] nvarchar(max)  NOT NULL,
    [Flg_Sex] bit  NOT NULL,
    [Nu_Dni] char(8)  NOT NULL,
    [Fe_Nacimiento] datetime  NOT NULL,
    [Nu_Telefono] varchar(15)  NOT NULL,
    [Nu_Movil] varchar(9)  NOT NULL,
    [Tx_Direccion] varchar(100)  NOT NULL,
    [Co_Distrito] int  NOT NULL,
    [Tx_Correo] varchar(100)  NOT NULL,
    [Co_Cargo] int  NOT NULL,
    [Co_Area] int  NOT NULL,
    [Fe_RegistroIns] datetime  NOT NULL,
    [No_UsuarioIns] varchar(20)  NOT NULL,
    [Fe_RegistroUpd] datetime  NOT NULL,
    [No_UsuarioUpd] varchar(20)  NOT NULL
);
GO

-- Creating table 'Estado_Solicitud'
CREATE TABLE [dbo].[Estado_Solicitud] (
    [Co_Estado] int IDENTITY(1,1) NOT NULL,
    [No_Estado] varchar(50)  NOT NULL
);
GO

-- Creating table 'FormatoPlanTrabajo'
CREATE TABLE [dbo].[FormatoPlanTrabajo] (
    [IDFormatoPlanTrabajo] int  NOT NULL,
    [IDPlan] int  NOT NULL,
    [IDPeriodo] int  NOT NULL,
    [Descripcion] varchar(250)  NOT NULL,
    [IDResponsable] int  NOT NULL,
    [Version] varchar(50)  NOT NULL,
    [Adjunto] varbinary(max)  NOT NULL,
    [Comentario] varchar(250)  NULL
);
GO

-- Creating table 'Invitacion'
CREATE TABLE [dbo].[Invitacion] (
    [Co_Invitacion] int IDENTITY(1,1) NOT NULL,
    [Fe_Invitacion] datetime  NOT NULL,
    [Fe_Expiracion] datetime  NOT NULL,
    [Fl_Estado] int  NOT NULL,
    [Fe_RegistroIns] datetime  NOT NULL,
    [No_UsuarioIns] varchar(20)  NOT NULL,
    [Fe_RegistroUpd] datetime  NOT NULL,
    [No_UsuarioUpd] varchar(20)  NOT NULL
);
GO

-- Creating table 'Materia'
CREATE TABLE [dbo].[Materia] (
    [IDMateria] int  NOT NULL,
    [Descripcion] varchar(250)  NOT NULL
);
GO

-- Creating table 'Periodo'
CREATE TABLE [dbo].[Periodo] (
    [IDPeriodo] int  NOT NULL,
    [Descripcion] varchar(50)  NOT NULL
);
GO

-- Creating table 'PlanProducto'
CREATE TABLE [dbo].[PlanProducto] (
    [Cod_Plan_Prod] int IDENTITY(1,1) NOT NULL,
    [Nro_Plan_Prod] varchar(50)  NOT NULL,
    [Ss_Prim_Min] decimal(18,2)  NOT NULL,
    [Ss_Sum_Min_Aseg] int  NOT NULL,
    [Ss_Sum_Max_Aseg] int  NOT NULL,
    [Cod_Prod] int  NOT NULL
);
GO

-- Creating table 'PlanTrabajo'
CREATE TABLE [dbo].[PlanTrabajo] (
    [IDPlan] int  NOT NULL,
    [IDPeriodo] int  NOT NULL,
    [Actividades] varchar(500)  NOT NULL,
    [FechaCreacion] datetime  NOT NULL,
    [FechaFin] datetime  NOT NULL,
    [Version] varchar(50)  NOT NULL,
    [Adjunto] varbinary(max)  NOT NULL,
    [Comentario] varchar(250)  NULL
);
GO

-- Creating table 'Poliza'
CREATE TABLE [dbo].[Poliza] (
    [Co_Poliza] int  NOT NULL,
    [Nu_Poliza] varchar(20)  NULL,
    [Co_Cliente] int  NULL,
    [SS_Prima] decimal(12,2)  NULL,
    [Fe_Creacion] datetime  NULL,
    [Fe_Renovacion] datetime  NULL,
    [Fe_InicioVigencia] datetime  NULL,
    [Fe_Vencimiento] datetime  NULL,
    [Tx_TipoPago] varchar(20)  NULL,
    [Tx_MarcaTarjeta] varchar(20)  NULL,
    [Nu_Tarjeta] varchar(20)  NULL,
    [Fl_Estado] varchar(1)  NULL,
    [Cod_Plan] int  NOT NULL
);
GO

-- Creating table 'Prestadora'
CREATE TABLE [dbo].[Prestadora] (
    [Co_Prestadora] int IDENTITY(1,1) NOT NULL,
    [Nu_Ruc] varchar(11)  NOT NULL,
    [Tx_RazonSocial] varchar(200)  NOT NULL,
    [Tx_DomicilioFiscal] varchar(200)  NOT NULL,
    [Co_Distrito] int  NOT NULL,
    [No_RepresentanteLegal] varchar(100)  NOT NULL,
    [No_ApePatRepresentanteLegal] varchar(100)  NOT NULL,
    [No_ApeMatRepresentanteLegal] varchar(100)  NOT NULL,
    [Tx_CorreoRepresentanteLegal] varchar(100)  NOT NULL,
    [Nu_TelefonoRepresentanteLegal] varchar(15)  NOT NULL,
    [Tx_PaginaWeb] varchar(50)  NULL,
    [Fe_Afiliacion] datetime  NULL,
    [Fl_Activo] int  NOT NULL,
    [Fe_RegistroIns] datetime  NOT NULL,
    [No_UsuarioIns] varchar(20)  NOT NULL,
    [Fe_RegistroUpd] datetime  NOT NULL,
    [No_UsuarioUpd] varchar(20)  NOT NULL
);
GO

-- Creating table 'Procedimiento'
CREATE TABLE [dbo].[Procedimiento] (
    [Co_Procedimiento] int IDENTITY(1,1) NOT NULL,
    [No_Procedimiento] varchar(100)  NOT NULL
);
GO

-- Creating table 'ProcedimientoAuditoria'
CREATE TABLE [dbo].[ProcedimientoAuditoria] (
    [IDProcedimientoAuditoria] int  NOT NULL,
    [IDPlan] int  NOT NULL,
    [IDPeriodo] int  NOT NULL,
    [FechaInicio] datetime  NOT NULL,
    [FechaFin] datetime  NOT NULL,
    [TiempoEjecucion] varchar(50)  NOT NULL,
    [IDEmpleadoResponsable] int  NOT NULL,
    [IDRepresentanteUnidad] int  NOT NULL,
    [Co_Area] int  NOT NULL,
    [IDMateria] int  NOT NULL,
    [Comentario] varchar(250)  NULL
);
GO

-- Creating table 'ProcedimientoSeguimiento'
CREATE TABLE [dbo].[ProcedimientoSeguimiento] (
    [IDProcedimientoSeguimiento] int  NOT NULL,
    [IDPlan] int  NOT NULL,
    [IDPeriodo] int  NOT NULL,
    [EvaluacionVerificacion] varchar(500)  NOT NULL,
    [FechaInicio] datetime  NOT NULL,
    [FechaFin] datetime  NOT NULL,
    [TiempoEjecucion] varchar(50)  NOT NULL,
    [IDEmpleadoResponsable] int  NOT NULL,
    [IDRepresentanteUnidad] int  NOT NULL,
    [Co_Area] int  NOT NULL,
    [IDMateria] int  NOT NULL,
    [Comentario] varchar(250)  NULL
);
GO

-- Creating table 'Producto'
CREATE TABLE [dbo].[Producto] (
    [Cod_Prod] int IDENTITY(1,1) NOT NULL,
    [Nro_Prod] varchar(50)  NOT NULL,
    [Fec_Crea] datetime  NOT NULL,
    [FI_Estado] varchar(50)  NOT NULL,
    [Flg_Flag] bit  NOT NULL
);
GO

-- Creating table 'PropuestaSolucion'
CREATE TABLE [dbo].[PropuestaSolucion] (
    [Cod_Prop_Sol] int IDENTITY(1,1) NOT NULL,
    [Ss_Mon_Prim] decimal(18,2)  NOT NULL,
    [Fec_Nac] datetime  NOT NULL,
    [Ss_Mon_Ret] decimal(18,2)  NOT NULL,
    [Ss_Mon_Aseg] decimal(18,2)  NOT NULL,
    [Cod_Pros] int  NOT NULL,
    [Cod_Prod] int  NOT NULL,
    [Cod_Plan] int  NOT NULL,
    [Fec_Crea] datetime  NOT NULL
);
GO

-- Creating table 'Prospecto'
CREATE TABLE [dbo].[Prospecto] (
    [Cod_Pros] int IDENTITY(1,1) NOT NULL,
    [Txt_Pros] varchar(50)  NULL,
    [Txt_Ape_Pat] varchar(50)  NULL,
    [Txt_Ape_Mat] varchar(50)  NULL,
    [Txt_Dir] varchar(50)  NULL,
    [Txt_Tel] varchar(50)  NULL,
    [Txt_Mov] varchar(50)  NULL,
    [Txt_Crr] varchar(50)  NULL,
    [Num_DNI] varchar(50)  NULL
);
GO

-- Creating table 'Provincia'
CREATE TABLE [dbo].[Provincia] (
    [Co_Provincia] int IDENTITY(1,1) NOT NULL,
    [No_Provincia] varchar(100)  NOT NULL,
    [Co_Departamento] int  NOT NULL
);
GO

-- Creating table 'Rango'
CREATE TABLE [dbo].[Rango] (
    [Cod_Rang] int IDENTITY(1,1) NOT NULL,
    [Ss_Min] float  NOT NULL,
    [Ss_Max] float  NOT NULL,
    [Qtd_Cant] int  NOT NULL,
    [Cod_Com] int  NOT NULL
);
GO

-- Creating table 'Reclamante'
CREATE TABLE [dbo].[Reclamante] (
    [Co_Reclamante] int  NOT NULL,
    [No_Reclamante] varchar(80)  NULL,
    [No_ApePaterno] varchar(80)  NULL,
    [No_ApeMaterno] varchar(80)  NULL,
    [Fi_Sexo] varchar(1)  NULL,
    [Nu_DNI] varchar(8)  NULL,
    [Fe_Nacimiento] datetime  NULL,
    [Tx_Telefono] varchar(30)  NULL,
    [Tx_Movil] varchar(30)  NULL,
    [Tx_Correo] varchar(80)  NULL,
    [Co_Distrito] int  NULL,
    [Tx_Direccion] varchar(150)  NULL
);
GO

-- Creating table 'Reclamo'
CREATE TABLE [dbo].[Reclamo] (
    [Nu_Reclamo] varchar(15)  NOT NULL,
    [Co_Reclamante] int  NULL,
    [Co_Empleado] int  NULL,
    [Co_MotivoReclamo] int  NULL,
    [Fe_Registro] datetime  NULL,
    [Fe_Ocurrencia] datetime  NULL,
    [Tx_LugIncidencia] varchar(80)  NULL,
    [Tx_PersAtendio] varchar(150)  NULL,
    [Tx_DescReclamo] varchar(2000)  NOT NULL,
    [Tx_ResInmediata] varchar(2000)  NULL,
    [Fi_Estado] varchar(1)  NULL,
    [Fe_CierreReclamo] datetime  NULL
);
GO

-- Creating table 'Reclamo_Motivo'
CREATE TABLE [dbo].[Reclamo_Motivo] (
    [Co_MotivoReclamo] int  NOT NULL,
    [Tx_Descripcion] varchar(150)  NULL
);
GO

-- Creating table 'Reclamo_Poliza'
CREATE TABLE [dbo].[Reclamo_Poliza] (
    [Co_ReclamoPoliza] int  NOT NULL,
    [Fi_Estado] varchar(20)  NULL,
    [Co_Poliza] int  NULL,
    [Nu_Reclamo] varchar(15)  NULL
);
GO

-- Creating table 'Requisito'
CREATE TABLE [dbo].[Requisito] (
    [Cod_Req] int IDENTITY(1,1) NOT NULL,
    [Nro_Req] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Solicitud_Afiliacion'
CREATE TABLE [dbo].[Solicitud_Afiliacion] (
    [Co_Solicitud] int IDENTITY(1,1) NOT NULL,
    [Co_Invitacion] int  NOT NULL,
    [Nu_Folio] varchar(50)  NOT NULL,
    [Fe_Solicitud] datetime  NOT NULL,
    [No_Contacto] varchar(100)  NOT NULL,
    [No_ApePatContacto] varchar(100)  NOT NULL,
    [No_ApeMatContacto] varchar(100)  NOT NULL,
    [Nu_TelefonoContacto] varchar(15)  NOT NULL,
    [Tx_CorreoContacto] varchar(100)  NOT NULL,
    [Tx_EvaluacionSunat] varchar(300)  NULL,
    [Tx_EvaluacionRiesgos] varchar(300)  NULL,
    [Co_Coordinador] int  NOT NULL,
    [Co_Evaluador] int  NOT NULL,
    [Tx_EvaluacionServicios] varchar(300)  NULL,
    [Tx_ObservacionAprobador] varchar(300)  NULL,
    [Tx_ObservacionNegociador] varchar(300)  NULL,
    [Co_Estado] int  NOT NULL,
    [Fe_RegistroIns] datetime  NOT NULL,
    [No_UsuarioIns] varchar(20)  NOT NULL,
    [Fe_RegistroUpd] datetime  NOT NULL,
    [No_UsuarioUpd] varchar(20)  NOT NULL
);
GO

-- Creating table 'Solicitud_Autorizacion'
CREATE TABLE [dbo].[Solicitud_Autorizacion] (
    [Co_Solicitud] int IDENTITY(1,1) NOT NULL,
    [Co_Poliza] int  NOT NULL,
    [Co_Sede] int  NOT NULL,
    [Fe_Solicitud] datetime  NOT NULL,
    [No_Contacto] varchar(100)  NOT NULL,
    [No_ApePatContacto] varchar(100)  NOT NULL,
    [No_ApeMatContacto] varchar(100)  NOT NULL,
    [Nu_TelefonoContacto] varchar(15)  NOT NULL,
    [Tx_CorreoContacto] varchar(100)  NOT NULL,
    [Co_Procedimiento] int  NOT NULL,
    [Ss_Monto] decimal(10,2)  NOT NULL,
    [Co_Evaluador] int  NOT NULL,
    [Co_Autorizador] int  NOT NULL,
    [Tx_ObservacionEvaluador] varchar(300)  NULL,
    [Tx_ObservacionAutorizador] varchar(300)  NULL,
    [Fl_Estado] int  NOT NULL,
    [Fe_RegistroIns] datetime  NOT NULL,
    [No_UsuarioIns] varchar(20)  NOT NULL,
    [Fe_RegistroUpd] datetime  NOT NULL,
    [No_UsuarioUpd] varchar(20)  NOT NULL
);
GO

-- Creating table 'Sugerencia'
CREATE TABLE [dbo].[Sugerencia] (
    [Nu_Sugerencia] int  NOT NULL,
    [Tx_Sugerencia] varchar(400)  NULL,
    [Fe_Registro] datetime  NULL,
    [Fi_Estado] varchar(1)  NULL,
    [Co_Tema] int  NULL,
    [Co_Area] int  NULL,
    [Co_Cliente] int  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Tema'
CREATE TABLE [dbo].[Tema] (
    [Co_Tema] int  NOT NULL,
    [No_Nombre] varchar(80)  NULL
);
GO

-- Creating table 'ComisionRequisito'
CREATE TABLE [dbo].[ComisionRequisito] (
    [Cod_Com] int  NOT NULL,
    [Cod_Req] int  NOT NULL
);
GO

-- Creating table 'Visita'
CREATE TABLE [dbo].[Visita] (
    [Cod_Visita] int IDENTITY(1,1) NOT NULL,
    [Cod_Pros] int  NOT NULL,
    [Fec_Ini] datetime  NOT NULL,
    [Fec_Fin] datetime  NOT NULL,
    [Txt_Comentario] nvarchar(200)  NULL,
    [Cod_Tipo_Visita] int  NOT NULL
);
GO

-- Creating table 'TipoVisita'
CREATE TABLE [dbo].[TipoVisita] (
    [Cod_Tipo_Visita] int IDENTITY(1,1) NOT NULL,
    [Nro_Visita] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'TipoPlan'
CREATE TABLE [dbo].[TipoPlan] (
    [Cod_Plan] int IDENTITY(1,1) NOT NULL,
    [Nro_Plan] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'BeneficiarioSet'
CREATE TABLE [dbo].[BeneficiarioSet] (
    [Cod_Benef] int IDENTITY(1,1) NOT NULL,
    [Num_DNI] nvarchar(8)  NOT NULL,
    [Txt_Ape_Pat] nvarchar(50)  NOT NULL,
    [Txt_Nombre] nvarchar(50)  NOT NULL,
    [Txt_Ape_Mat] nvarchar(50)  NOT NULL,
    [Co_Poliza] int  NOT NULL,
    [Po_Cap_Aseg] decimal(6,2)  NOT NULL,
    [Fec_Nac] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Co_Area] in table 'Area'
ALTER TABLE [dbo].[Area]
ADD CONSTRAINT [PK_Area]
    PRIMARY KEY CLUSTERED ([Co_Area] ASC);
GO

-- Creating primary key on [Cod_Camp] in table 'Campania'
ALTER TABLE [dbo].[Campania]
ADD CONSTRAINT [PK_Campania]
    PRIMARY KEY CLUSTERED ([Cod_Camp] ASC);
GO

-- Creating primary key on [Cod_Cnl_Vta] in table 'CanalVenta'
ALTER TABLE [dbo].[CanalVenta]
ADD CONSTRAINT [PK_CanalVenta]
    PRIMARY KEY CLUSTERED ([Cod_Cnl_Vta] ASC);
GO

-- Creating primary key on [Cod_Car] in table 'Cargo'
ALTER TABLE [dbo].[Cargo]
ADD CONSTRAINT [PK_Cargo]
    PRIMARY KEY CLUSTERED ([Cod_Car] ASC);
GO

-- Creating primary key on [Co_Cliente] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [PK_Cliente]
    PRIMARY KEY CLUSTERED ([Co_Cliente] ASC);
GO

-- Creating primary key on [Cod_Com] in table 'Comision'
ALTER TABLE [dbo].[Comision]
ADD CONSTRAINT [PK_Comision]
    PRIMARY KEY CLUSTERED ([Cod_Com] ASC);
GO

-- Creating primary key on [Co_Departamento] in table 'Departamento'
ALTER TABLE [dbo].[Departamento]
ADD CONSTRAINT [PK_Departamento]
    PRIMARY KEY CLUSTERED ([Co_Departamento] ASC);
GO

-- Creating primary key on [Cod_Det_Prop_Sol] in table 'DetallePropuestaSolucion'
ALTER TABLE [dbo].[DetallePropuestaSolucion]
ADD CONSTRAINT [PK_DetallePropuestaSolucion]
    PRIMARY KEY CLUSTERED ([Cod_Det_Prop_Sol] ASC);
GO

-- Creating primary key on [Co_Distrito] in table 'Distrito'
ALTER TABLE [dbo].[Distrito]
ADD CONSTRAINT [PK_Distrito]
    PRIMARY KEY CLUSTERED ([Co_Distrito] ASC);
GO

-- Creating primary key on [Cod_Emp] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [PK_Empleado]
    PRIMARY KEY CLUSTERED ([Cod_Emp] ASC);
GO

-- Creating primary key on [Co_Estado] in table 'Estado_Solicitud'
ALTER TABLE [dbo].[Estado_Solicitud]
ADD CONSTRAINT [PK_Estado_Solicitud]
    PRIMARY KEY CLUSTERED ([Co_Estado] ASC);
GO

-- Creating primary key on [IDFormatoPlanTrabajo], [IDPlan], [IDPeriodo] in table 'FormatoPlanTrabajo'
ALTER TABLE [dbo].[FormatoPlanTrabajo]
ADD CONSTRAINT [PK_FormatoPlanTrabajo]
    PRIMARY KEY CLUSTERED ([IDFormatoPlanTrabajo], [IDPlan], [IDPeriodo] ASC);
GO

-- Creating primary key on [Co_Invitacion] in table 'Invitacion'
ALTER TABLE [dbo].[Invitacion]
ADD CONSTRAINT [PK_Invitacion]
    PRIMARY KEY CLUSTERED ([Co_Invitacion] ASC);
GO

-- Creating primary key on [IDMateria] in table 'Materia'
ALTER TABLE [dbo].[Materia]
ADD CONSTRAINT [PK_Materia]
    PRIMARY KEY CLUSTERED ([IDMateria] ASC);
GO

-- Creating primary key on [IDPeriodo] in table 'Periodo'
ALTER TABLE [dbo].[Periodo]
ADD CONSTRAINT [PK_Periodo]
    PRIMARY KEY CLUSTERED ([IDPeriodo] ASC);
GO

-- Creating primary key on [Cod_Plan_Prod] in table 'PlanProducto'
ALTER TABLE [dbo].[PlanProducto]
ADD CONSTRAINT [PK_PlanProducto]
    PRIMARY KEY CLUSTERED ([Cod_Plan_Prod] ASC);
GO

-- Creating primary key on [IDPlan], [IDPeriodo] in table 'PlanTrabajo'
ALTER TABLE [dbo].[PlanTrabajo]
ADD CONSTRAINT [PK_PlanTrabajo]
    PRIMARY KEY CLUSTERED ([IDPlan], [IDPeriodo] ASC);
GO

-- Creating primary key on [Co_Poliza] in table 'Poliza'
ALTER TABLE [dbo].[Poliza]
ADD CONSTRAINT [PK_Poliza]
    PRIMARY KEY CLUSTERED ([Co_Poliza] ASC);
GO

-- Creating primary key on [Co_Prestadora] in table 'Prestadora'
ALTER TABLE [dbo].[Prestadora]
ADD CONSTRAINT [PK_Prestadora]
    PRIMARY KEY CLUSTERED ([Co_Prestadora] ASC);
GO

-- Creating primary key on [Co_Procedimiento] in table 'Procedimiento'
ALTER TABLE [dbo].[Procedimiento]
ADD CONSTRAINT [PK_Procedimiento]
    PRIMARY KEY CLUSTERED ([Co_Procedimiento] ASC);
GO

-- Creating primary key on [IDProcedimientoAuditoria], [IDPlan], [IDPeriodo] in table 'ProcedimientoAuditoria'
ALTER TABLE [dbo].[ProcedimientoAuditoria]
ADD CONSTRAINT [PK_ProcedimientoAuditoria]
    PRIMARY KEY CLUSTERED ([IDProcedimientoAuditoria], [IDPlan], [IDPeriodo] ASC);
GO

-- Creating primary key on [IDProcedimientoSeguimiento], [IDPlan], [IDPeriodo] in table 'ProcedimientoSeguimiento'
ALTER TABLE [dbo].[ProcedimientoSeguimiento]
ADD CONSTRAINT [PK_ProcedimientoSeguimiento]
    PRIMARY KEY CLUSTERED ([IDProcedimientoSeguimiento], [IDPlan], [IDPeriodo] ASC);
GO

-- Creating primary key on [Cod_Prod] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [PK_Producto]
    PRIMARY KEY CLUSTERED ([Cod_Prod] ASC);
GO

-- Creating primary key on [Cod_Prop_Sol] in table 'PropuestaSolucion'
ALTER TABLE [dbo].[PropuestaSolucion]
ADD CONSTRAINT [PK_PropuestaSolucion]
    PRIMARY KEY CLUSTERED ([Cod_Prop_Sol] ASC);
GO

-- Creating primary key on [Cod_Pros] in table 'Prospecto'
ALTER TABLE [dbo].[Prospecto]
ADD CONSTRAINT [PK_Prospecto]
    PRIMARY KEY CLUSTERED ([Cod_Pros] ASC);
GO

-- Creating primary key on [Co_Provincia] in table 'Provincia'
ALTER TABLE [dbo].[Provincia]
ADD CONSTRAINT [PK_Provincia]
    PRIMARY KEY CLUSTERED ([Co_Provincia] ASC);
GO

-- Creating primary key on [Cod_Rang] in table 'Rango'
ALTER TABLE [dbo].[Rango]
ADD CONSTRAINT [PK_Rango]
    PRIMARY KEY CLUSTERED ([Cod_Rang] ASC);
GO

-- Creating primary key on [Co_Reclamante] in table 'Reclamante'
ALTER TABLE [dbo].[Reclamante]
ADD CONSTRAINT [PK_Reclamante]
    PRIMARY KEY CLUSTERED ([Co_Reclamante] ASC);
GO

-- Creating primary key on [Nu_Reclamo] in table 'Reclamo'
ALTER TABLE [dbo].[Reclamo]
ADD CONSTRAINT [PK_Reclamo]
    PRIMARY KEY CLUSTERED ([Nu_Reclamo] ASC);
GO

-- Creating primary key on [Co_MotivoReclamo] in table 'Reclamo_Motivo'
ALTER TABLE [dbo].[Reclamo_Motivo]
ADD CONSTRAINT [PK_Reclamo_Motivo]
    PRIMARY KEY CLUSTERED ([Co_MotivoReclamo] ASC);
GO

-- Creating primary key on [Co_ReclamoPoliza] in table 'Reclamo_Poliza'
ALTER TABLE [dbo].[Reclamo_Poliza]
ADD CONSTRAINT [PK_Reclamo_Poliza]
    PRIMARY KEY CLUSTERED ([Co_ReclamoPoliza] ASC);
GO

-- Creating primary key on [Cod_Req] in table 'Requisito'
ALTER TABLE [dbo].[Requisito]
ADD CONSTRAINT [PK_Requisito]
    PRIMARY KEY CLUSTERED ([Cod_Req] ASC);
GO

-- Creating primary key on [Co_Solicitud] in table 'Solicitud_Afiliacion'
ALTER TABLE [dbo].[Solicitud_Afiliacion]
ADD CONSTRAINT [PK_Solicitud_Afiliacion]
    PRIMARY KEY CLUSTERED ([Co_Solicitud] ASC);
GO

-- Creating primary key on [Co_Solicitud] in table 'Solicitud_Autorizacion'
ALTER TABLE [dbo].[Solicitud_Autorizacion]
ADD CONSTRAINT [PK_Solicitud_Autorizacion]
    PRIMARY KEY CLUSTERED ([Co_Solicitud] ASC);
GO

-- Creating primary key on [Nu_Sugerencia] in table 'Sugerencia'
ALTER TABLE [dbo].[Sugerencia]
ADD CONSTRAINT [PK_Sugerencia]
    PRIMARY KEY CLUSTERED ([Nu_Sugerencia] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Co_Tema] in table 'Tema'
ALTER TABLE [dbo].[Tema]
ADD CONSTRAINT [PK_Tema]
    PRIMARY KEY CLUSTERED ([Co_Tema] ASC);
GO

-- Creating primary key on [Cod_Com], [Cod_Req] in table 'ComisionRequisito'
ALTER TABLE [dbo].[ComisionRequisito]
ADD CONSTRAINT [PK_ComisionRequisito]
    PRIMARY KEY CLUSTERED ([Cod_Com], [Cod_Req] ASC);
GO

-- Creating primary key on [Cod_Visita] in table 'Visita'
ALTER TABLE [dbo].[Visita]
ADD CONSTRAINT [PK_Visita]
    PRIMARY KEY CLUSTERED ([Cod_Visita] ASC);
GO

-- Creating primary key on [Cod_Tipo_Visita] in table 'TipoVisita'
ALTER TABLE [dbo].[TipoVisita]
ADD CONSTRAINT [PK_TipoVisita]
    PRIMARY KEY CLUSTERED ([Cod_Tipo_Visita] ASC);
GO

-- Creating primary key on [Cod_Plan] in table 'TipoPlan'
ALTER TABLE [dbo].[TipoPlan]
ADD CONSTRAINT [PK_TipoPlan]
    PRIMARY KEY CLUSTERED ([Cod_Plan] ASC);
GO

-- Creating primary key on [Cod_Benef] in table 'BeneficiarioSet'
ALTER TABLE [dbo].[BeneficiarioSet]
ADD CONSTRAINT [PK_BeneficiarioSet]
    PRIMARY KEY CLUSTERED ([Cod_Benef] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Co_Area] in table 'Sugerencia'
ALTER TABLE [dbo].[Sugerencia]
ADD CONSTRAINT [FK__Sugerenci__Co_Ar__2BFE89A6]
    FOREIGN KEY ([Co_Area])
    REFERENCES [dbo].[Area]
        ([Co_Area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Sugerenci__Co_Ar__2BFE89A6'
CREATE INDEX [IX_FK__Sugerenci__Co_Ar__2BFE89A6]
ON [dbo].[Sugerencia]
    ([Co_Area]);
GO

-- Creating foreign key on [Co_Area] in table 'Sugerencia'
ALTER TABLE [dbo].[Sugerencia]
ADD CONSTRAINT [FK__Sugerenci__Co_Ar__66603565]
    FOREIGN KEY ([Co_Area])
    REFERENCES [dbo].[Area]
        ([Co_Area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Sugerenci__Co_Ar__66603565'
CREATE INDEX [IX_FK__Sugerenci__Co_Ar__66603565]
ON [dbo].[Sugerencia]
    ([Co_Area]);
GO

-- Creating foreign key on [Co_Area] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_EMPLEADO_AREA]
    FOREIGN KEY ([Co_Area])
    REFERENCES [dbo].[Area]
        ([Co_Area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EMPLEADO_AREA'
CREATE INDEX [IX_FK_EMPLEADO_AREA]
ON [dbo].[Empleado]
    ([Co_Area]);
GO

-- Creating foreign key on [Co_Area] in table 'ProcedimientoAuditoria'
ALTER TABLE [dbo].[ProcedimientoAuditoria]
ADD CONSTRAINT [FK_ProcedimientoAuditoria_Area]
    FOREIGN KEY ([Co_Area])
    REFERENCES [dbo].[Area]
        ([Co_Area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoAuditoria_Area'
CREATE INDEX [IX_FK_ProcedimientoAuditoria_Area]
ON [dbo].[ProcedimientoAuditoria]
    ([Co_Area]);
GO

-- Creating foreign key on [Co_Area] in table 'ProcedimientoSeguimiento'
ALTER TABLE [dbo].[ProcedimientoSeguimiento]
ADD CONSTRAINT [FK_ProcedimientoSeguimiento_Area]
    FOREIGN KEY ([Co_Area])
    REFERENCES [dbo].[Area]
        ([Co_Area])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoSeguimiento_Area'
CREATE INDEX [IX_FK_ProcedimientoSeguimiento_Area]
ON [dbo].[ProcedimientoSeguimiento]
    ([Co_Area]);
GO

-- Creating foreign key on [Co_Cargo] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_EMPLEADO_CARGO]
    FOREIGN KEY ([Co_Cargo])
    REFERENCES [dbo].[Cargo]
        ([Cod_Car])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EMPLEADO_CARGO'
CREATE INDEX [IX_FK_EMPLEADO_CARGO]
ON [dbo].[Empleado]
    ([Co_Cargo]);
GO

-- Creating foreign key on [Co_Cliente] in table 'Poliza'
ALTER TABLE [dbo].[Poliza]
ADD CONSTRAINT [FK__Poliza__Co_Clien__245D67DE]
    FOREIGN KEY ([Co_Cliente])
    REFERENCES [dbo].[Cliente]
        ([Co_Cliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Poliza__Co_Clien__245D67DE'
CREATE INDEX [IX_FK__Poliza__Co_Clien__245D67DE]
ON [dbo].[Poliza]
    ([Co_Cliente]);
GO

-- Creating foreign key on [Co_Cliente] in table 'Sugerencia'
ALTER TABLE [dbo].[Sugerencia]
ADD CONSTRAINT [FK__Sugerenci__Co_Cl__2CF2ADDF]
    FOREIGN KEY ([Co_Cliente])
    REFERENCES [dbo].[Cliente]
        ([Co_Cliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Sugerenci__Co_Cl__2CF2ADDF'
CREATE INDEX [IX_FK__Sugerenci__Co_Cl__2CF2ADDF]
ON [dbo].[Sugerencia]
    ([Co_Cliente]);
GO

-- Creating foreign key on [Co_Cliente] in table 'Sugerencia'
ALTER TABLE [dbo].[Sugerencia]
ADD CONSTRAINT [FK__Sugerenci__Co_Cl__6754599E]
    FOREIGN KEY ([Co_Cliente])
    REFERENCES [dbo].[Cliente]
        ([Co_Cliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Sugerenci__Co_Cl__6754599E'
CREATE INDEX [IX_FK__Sugerenci__Co_Cl__6754599E]
ON [dbo].[Sugerencia]
    ([Co_Cliente]);
GO

-- Creating foreign key on [Cod_Com] in table 'Rango'
ALTER TABLE [dbo].[Rango]
ADD CONSTRAINT [FK_ComisionRango]
    FOREIGN KEY ([Cod_Com])
    REFERENCES [dbo].[Comision]
        ([Cod_Com])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComisionRango'
CREATE INDEX [IX_FK_ComisionRango]
ON [dbo].[Rango]
    ([Cod_Com]);
GO

-- Creating foreign key on [Co_Departamento] in table 'Provincia'
ALTER TABLE [dbo].[Provincia]
ADD CONSTRAINT [FK_PROVINCIA_DEPARTAMENTO]
    FOREIGN KEY ([Co_Departamento])
    REFERENCES [dbo].[Departamento]
        ([Co_Departamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PROVINCIA_DEPARTAMENTO'
CREATE INDEX [IX_FK_PROVINCIA_DEPARTAMENTO]
ON [dbo].[Provincia]
    ([Co_Departamento]);
GO

-- Creating foreign key on [Cod_Prop_Sol] in table 'DetallePropuestaSolucion'
ALTER TABLE [dbo].[DetallePropuestaSolucion]
ADD CONSTRAINT [FK_DetallePropuestaSolucion_PropuestaSolucion]
    FOREIGN KEY ([Cod_Prop_Sol])
    REFERENCES [dbo].[PropuestaSolucion]
        ([Cod_Prop_Sol])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DetallePropuestaSolucion_PropuestaSolucion'
CREATE INDEX [IX_FK_DetallePropuestaSolucion_PropuestaSolucion]
ON [dbo].[DetallePropuestaSolucion]
    ([Cod_Prop_Sol]);
GO

-- Creating foreign key on [Co_Distrito] in table 'Reclamante'
ALTER TABLE [dbo].[Reclamante]
ADD CONSTRAINT [FK__Reclamant__Co_Di__2645B050]
    FOREIGN KEY ([Co_Distrito])
    REFERENCES [dbo].[Distrito]
        ([Co_Distrito])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamant__Co_Di__2645B050'
CREATE INDEX [IX_FK__Reclamant__Co_Di__2645B050]
ON [dbo].[Reclamante]
    ([Co_Distrito]);
GO

-- Creating foreign key on [Co_Distrito] in table 'Reclamante'
ALTER TABLE [dbo].[Reclamante]
ADD CONSTRAINT [FK__Reclamant__Co_Di__5AEE82B9]
    FOREIGN KEY ([Co_Distrito])
    REFERENCES [dbo].[Distrito]
        ([Co_Distrito])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamant__Co_Di__5AEE82B9'
CREATE INDEX [IX_FK__Reclamant__Co_Di__5AEE82B9]
ON [dbo].[Reclamante]
    ([Co_Distrito]);
GO

-- Creating foreign key on [Co_Provincia] in table 'Distrito'
ALTER TABLE [dbo].[Distrito]
ADD CONSTRAINT [FK_DISTRITO_PROVINCIA]
    FOREIGN KEY ([Co_Provincia])
    REFERENCES [dbo].[Provincia]
        ([Co_Provincia])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DISTRITO_PROVINCIA'
CREATE INDEX [IX_FK_DISTRITO_PROVINCIA]
ON [dbo].[Distrito]
    ([Co_Provincia]);
GO

-- Creating foreign key on [Co_Distrito] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_EMPLEADO_DISTRITO]
    FOREIGN KEY ([Co_Distrito])
    REFERENCES [dbo].[Distrito]
        ([Co_Distrito])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EMPLEADO_DISTRITO'
CREATE INDEX [IX_FK_EMPLEADO_DISTRITO]
ON [dbo].[Empleado]
    ([Co_Distrito]);
GO

-- Creating foreign key on [Co_Distrito] in table 'Prestadora'
ALTER TABLE [dbo].[Prestadora]
ADD CONSTRAINT [FK_PRESTADORA_DISTRITO]
    FOREIGN KEY ([Co_Distrito])
    REFERENCES [dbo].[Distrito]
        ([Co_Distrito])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PRESTADORA_DISTRITO'
CREATE INDEX [IX_FK_PRESTADORA_DISTRITO]
ON [dbo].[Prestadora]
    ([Co_Distrito]);
GO

-- Creating foreign key on [Co_Empleado] in table 'Reclamo'
ALTER TABLE [dbo].[Reclamo]
ADD CONSTRAINT [FK__Reclamo__Co_Empl__2739D489]
    FOREIGN KEY ([Co_Empleado])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo__Co_Empl__2739D489'
CREATE INDEX [IX_FK__Reclamo__Co_Empl__2739D489]
ON [dbo].[Reclamo]
    ([Co_Empleado]);
GO

-- Creating foreign key on [Co_Empleado] in table 'Reclamo'
ALTER TABLE [dbo].[Reclamo]
ADD CONSTRAINT [FK__Reclamo__Co_Empl__5BE2A6F2]
    FOREIGN KEY ([Co_Empleado])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo__Co_Empl__5BE2A6F2'
CREATE INDEX [IX_FK__Reclamo__Co_Empl__5BE2A6F2]
ON [dbo].[Reclamo]
    ([Co_Empleado]);
GO

-- Creating foreign key on [IDEmpleadoResponsable] in table 'ProcedimientoAuditoria'
ALTER TABLE [dbo].[ProcedimientoAuditoria]
ADD CONSTRAINT [FK_ProcedimientoAuditoria_Empleado]
    FOREIGN KEY ([IDEmpleadoResponsable])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoAuditoria_Empleado'
CREATE INDEX [IX_FK_ProcedimientoAuditoria_Empleado]
ON [dbo].[ProcedimientoAuditoria]
    ([IDEmpleadoResponsable]);
GO

-- Creating foreign key on [IDRepresentanteUnidad] in table 'ProcedimientoAuditoria'
ALTER TABLE [dbo].[ProcedimientoAuditoria]
ADD CONSTRAINT [FK_ProcedimientoAuditoria_Empleado1]
    FOREIGN KEY ([IDRepresentanteUnidad])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoAuditoria_Empleado1'
CREATE INDEX [IX_FK_ProcedimientoAuditoria_Empleado1]
ON [dbo].[ProcedimientoAuditoria]
    ([IDRepresentanteUnidad]);
GO

-- Creating foreign key on [IDEmpleadoResponsable] in table 'ProcedimientoSeguimiento'
ALTER TABLE [dbo].[ProcedimientoSeguimiento]
ADD CONSTRAINT [FK_ProcedimientoSeguimiento_Empleado]
    FOREIGN KEY ([IDEmpleadoResponsable])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoSeguimiento_Empleado'
CREATE INDEX [IX_FK_ProcedimientoSeguimiento_Empleado]
ON [dbo].[ProcedimientoSeguimiento]
    ([IDEmpleadoResponsable]);
GO

-- Creating foreign key on [IDRepresentanteUnidad] in table 'ProcedimientoSeguimiento'
ALTER TABLE [dbo].[ProcedimientoSeguimiento]
ADD CONSTRAINT [FK_ProcedimientoSeguimiento_Empleado1]
    FOREIGN KEY ([IDRepresentanteUnidad])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoSeguimiento_Empleado1'
CREATE INDEX [IX_FK_ProcedimientoSeguimiento_Empleado1]
ON [dbo].[ProcedimientoSeguimiento]
    ([IDRepresentanteUnidad]);
GO

-- Creating foreign key on [Co_Coordinador] in table 'Solicitud_Afiliacion'
ALTER TABLE [dbo].[Solicitud_Afiliacion]
ADD CONSTRAINT [FK_SOLICITUD_AFILIACION_EMPLEADO]
    FOREIGN KEY ([Co_Coordinador])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SOLICITUD_AFILIACION_EMPLEADO'
CREATE INDEX [IX_FK_SOLICITUD_AFILIACION_EMPLEADO]
ON [dbo].[Solicitud_Afiliacion]
    ([Co_Coordinador]);
GO

-- Creating foreign key on [Co_Evaluador] in table 'Solicitud_Afiliacion'
ALTER TABLE [dbo].[Solicitud_Afiliacion]
ADD CONSTRAINT [FK_SOLICITUD_AFILIACION_EMPLEADO1]
    FOREIGN KEY ([Co_Evaluador])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SOLICITUD_AFILIACION_EMPLEADO1'
CREATE INDEX [IX_FK_SOLICITUD_AFILIACION_EMPLEADO1]
ON [dbo].[Solicitud_Afiliacion]
    ([Co_Evaluador]);
GO

-- Creating foreign key on [Co_Evaluador] in table 'Solicitud_Autorizacion'
ALTER TABLE [dbo].[Solicitud_Autorizacion]
ADD CONSTRAINT [FK_SOLICITUD_AUTORIZACION_EMPLEADO]
    FOREIGN KEY ([Co_Evaluador])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SOLICITUD_AUTORIZACION_EMPLEADO'
CREATE INDEX [IX_FK_SOLICITUD_AUTORIZACION_EMPLEADO]
ON [dbo].[Solicitud_Autorizacion]
    ([Co_Evaluador]);
GO

-- Creating foreign key on [Co_Autorizador] in table 'Solicitud_Autorizacion'
ALTER TABLE [dbo].[Solicitud_Autorizacion]
ADD CONSTRAINT [FK_SOLICITUD_AUTORIZACION_EMPLEADO1]
    FOREIGN KEY ([Co_Autorizador])
    REFERENCES [dbo].[Empleado]
        ([Cod_Emp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SOLICITUD_AUTORIZACION_EMPLEADO1'
CREATE INDEX [IX_FK_SOLICITUD_AUTORIZACION_EMPLEADO1]
ON [dbo].[Solicitud_Autorizacion]
    ([Co_Autorizador]);
GO

-- Creating foreign key on [Co_Estado] in table 'Solicitud_Afiliacion'
ALTER TABLE [dbo].[Solicitud_Afiliacion]
ADD CONSTRAINT [FK_SOLICITUD_AFILIACION_ESTADO_SOLICITUD]
    FOREIGN KEY ([Co_Estado])
    REFERENCES [dbo].[Estado_Solicitud]
        ([Co_Estado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SOLICITUD_AFILIACION_ESTADO_SOLICITUD'
CREATE INDEX [IX_FK_SOLICITUD_AFILIACION_ESTADO_SOLICITUD]
ON [dbo].[Solicitud_Afiliacion]
    ([Co_Estado]);
GO

-- Creating foreign key on [IDPeriodo] in table 'FormatoPlanTrabajo'
ALTER TABLE [dbo].[FormatoPlanTrabajo]
ADD CONSTRAINT [FK_FormatoPlanTrabajo_Periodo]
    FOREIGN KEY ([IDPeriodo])
    REFERENCES [dbo].[Periodo]
        ([IDPeriodo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FormatoPlanTrabajo_Periodo'
CREATE INDEX [IX_FK_FormatoPlanTrabajo_Periodo]
ON [dbo].[FormatoPlanTrabajo]
    ([IDPeriodo]);
GO

-- Creating foreign key on [IDPlan], [IDPeriodo] in table 'FormatoPlanTrabajo'
ALTER TABLE [dbo].[FormatoPlanTrabajo]
ADD CONSTRAINT [FK_FormatoPlanTrabajo_PlanTrabajo]
    FOREIGN KEY ([IDPlan], [IDPeriodo])
    REFERENCES [dbo].[PlanTrabajo]
        ([IDPlan], [IDPeriodo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FormatoPlanTrabajo_PlanTrabajo'
CREATE INDEX [IX_FK_FormatoPlanTrabajo_PlanTrabajo]
ON [dbo].[FormatoPlanTrabajo]
    ([IDPlan], [IDPeriodo]);
GO

-- Creating foreign key on [Co_Invitacion] in table 'Solicitud_Afiliacion'
ALTER TABLE [dbo].[Solicitud_Afiliacion]
ADD CONSTRAINT [FK_SOLICITUD_AFILIACION_INVITACION]
    FOREIGN KEY ([Co_Invitacion])
    REFERENCES [dbo].[Invitacion]
        ([Co_Invitacion])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SOLICITUD_AFILIACION_INVITACION'
CREATE INDEX [IX_FK_SOLICITUD_AFILIACION_INVITACION]
ON [dbo].[Solicitud_Afiliacion]
    ([Co_Invitacion]);
GO

-- Creating foreign key on [IDMateria] in table 'ProcedimientoAuditoria'
ALTER TABLE [dbo].[ProcedimientoAuditoria]
ADD CONSTRAINT [FK_ProcedimientoAuditoria_Materia]
    FOREIGN KEY ([IDMateria])
    REFERENCES [dbo].[Materia]
        ([IDMateria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoAuditoria_Materia'
CREATE INDEX [IX_FK_ProcedimientoAuditoria_Materia]
ON [dbo].[ProcedimientoAuditoria]
    ([IDMateria]);
GO

-- Creating foreign key on [IDMateria] in table 'ProcedimientoSeguimiento'
ALTER TABLE [dbo].[ProcedimientoSeguimiento]
ADD CONSTRAINT [FK_ProcedimientoSeguimiento_Materia]
    FOREIGN KEY ([IDMateria])
    REFERENCES [dbo].[Materia]
        ([IDMateria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoSeguimiento_Materia'
CREATE INDEX [IX_FK_ProcedimientoSeguimiento_Materia]
ON [dbo].[ProcedimientoSeguimiento]
    ([IDMateria]);
GO

-- Creating foreign key on [IDPeriodo] in table 'PlanTrabajo'
ALTER TABLE [dbo].[PlanTrabajo]
ADD CONSTRAINT [FK_PlanTrabajo_Periodo]
    FOREIGN KEY ([IDPeriodo])
    REFERENCES [dbo].[Periodo]
        ([IDPeriodo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlanTrabajo_Periodo'
CREATE INDEX [IX_FK_PlanTrabajo_Periodo]
ON [dbo].[PlanTrabajo]
    ([IDPeriodo]);
GO

-- Creating foreign key on [IDPeriodo] in table 'ProcedimientoAuditoria'
ALTER TABLE [dbo].[ProcedimientoAuditoria]
ADD CONSTRAINT [FK_ProcedimientoAuditoria_Periodo]
    FOREIGN KEY ([IDPeriodo])
    REFERENCES [dbo].[Periodo]
        ([IDPeriodo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoAuditoria_Periodo'
CREATE INDEX [IX_FK_ProcedimientoAuditoria_Periodo]
ON [dbo].[ProcedimientoAuditoria]
    ([IDPeriodo]);
GO

-- Creating foreign key on [IDPeriodo] in table 'ProcedimientoSeguimiento'
ALTER TABLE [dbo].[ProcedimientoSeguimiento]
ADD CONSTRAINT [FK_ProcedimientoSeguimiento_Periodo]
    FOREIGN KEY ([IDPeriodo])
    REFERENCES [dbo].[Periodo]
        ([IDPeriodo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedimientoSeguimiento_Periodo'
CREATE INDEX [IX_FK_ProcedimientoSeguimiento_Periodo]
ON [dbo].[ProcedimientoSeguimiento]
    ([IDPeriodo]);
GO

-- Creating foreign key on [Cod_Prod] in table 'PlanProducto'
ALTER TABLE [dbo].[PlanProducto]
ADD CONSTRAINT [FK_PlanProducto_Producto]
    FOREIGN KEY ([Cod_Prod])
    REFERENCES [dbo].[Producto]
        ([Cod_Prod])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlanProducto_Producto'
CREATE INDEX [IX_FK_PlanProducto_Producto]
ON [dbo].[PlanProducto]
    ([Cod_Prod]);
GO

-- Creating foreign key on [Co_Poliza] in table 'Reclamo_Poliza'
ALTER TABLE [dbo].[Reclamo_Poliza]
ADD CONSTRAINT [FK__Reclamo_P__Co_Po__2A164134]
    FOREIGN KEY ([Co_Poliza])
    REFERENCES [dbo].[Poliza]
        ([Co_Poliza])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo_P__Co_Po__2A164134'
CREATE INDEX [IX_FK__Reclamo_P__Co_Po__2A164134]
ON [dbo].[Reclamo_Poliza]
    ([Co_Poliza]);
GO

-- Creating foreign key on [Co_Poliza] in table 'Reclamo_Poliza'
ALTER TABLE [dbo].[Reclamo_Poliza]
ADD CONSTRAINT [FK__Reclamo_P__Co_Po__5EBF139D]
    FOREIGN KEY ([Co_Poliza])
    REFERENCES [dbo].[Poliza]
        ([Co_Poliza])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo_P__Co_Po__5EBF139D'
CREATE INDEX [IX_FK__Reclamo_P__Co_Po__5EBF139D]
ON [dbo].[Reclamo_Poliza]
    ([Co_Poliza]);
GO

-- Creating foreign key on [Cod_Prod] in table 'PropuestaSolucion'
ALTER TABLE [dbo].[PropuestaSolucion]
ADD CONSTRAINT [FK_PropuestaSolucion_Producto]
    FOREIGN KEY ([Cod_Prod])
    REFERENCES [dbo].[Producto]
        ([Cod_Prod])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropuestaSolucion_Producto'
CREATE INDEX [IX_FK_PropuestaSolucion_Producto]
ON [dbo].[PropuestaSolucion]
    ([Cod_Prod]);
GO

-- Creating foreign key on [Cod_Pros] in table 'PropuestaSolucion'
ALTER TABLE [dbo].[PropuestaSolucion]
ADD CONSTRAINT [FK_PropuestaSolucion_Prospecto]
    FOREIGN KEY ([Cod_Pros])
    REFERENCES [dbo].[Prospecto]
        ([Cod_Pros])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropuestaSolucion_Prospecto'
CREATE INDEX [IX_FK_PropuestaSolucion_Prospecto]
ON [dbo].[PropuestaSolucion]
    ([Cod_Pros]);
GO

-- Creating foreign key on [Co_Reclamante] in table 'Reclamo'
ALTER TABLE [dbo].[Reclamo]
ADD CONSTRAINT [FK__Reclamo__Co_Recl__29221CFB]
    FOREIGN KEY ([Co_Reclamante])
    REFERENCES [dbo].[Reclamante]
        ([Co_Reclamante])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo__Co_Recl__29221CFB'
CREATE INDEX [IX_FK__Reclamo__Co_Recl__29221CFB]
ON [dbo].[Reclamo]
    ([Co_Reclamante]);
GO

-- Creating foreign key on [Co_Reclamante] in table 'Reclamo'
ALTER TABLE [dbo].[Reclamo]
ADD CONSTRAINT [FK__Reclamo__Co_Recl__5DCAEF64]
    FOREIGN KEY ([Co_Reclamante])
    REFERENCES [dbo].[Reclamante]
        ([Co_Reclamante])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo__Co_Recl__5DCAEF64'
CREATE INDEX [IX_FK__Reclamo__Co_Recl__5DCAEF64]
ON [dbo].[Reclamo]
    ([Co_Reclamante]);
GO

-- Creating foreign key on [Co_MotivoReclamo] in table 'Reclamo'
ALTER TABLE [dbo].[Reclamo]
ADD CONSTRAINT [FK__Reclamo__Co_Moti__282DF8C2]
    FOREIGN KEY ([Co_MotivoReclamo])
    REFERENCES [dbo].[Reclamo_Motivo]
        ([Co_MotivoReclamo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo__Co_Moti__282DF8C2'
CREATE INDEX [IX_FK__Reclamo__Co_Moti__282DF8C2]
ON [dbo].[Reclamo]
    ([Co_MotivoReclamo]);
GO

-- Creating foreign key on [Co_MotivoReclamo] in table 'Reclamo'
ALTER TABLE [dbo].[Reclamo]
ADD CONSTRAINT [FK__Reclamo__Co_Moti__5CD6CB2B]
    FOREIGN KEY ([Co_MotivoReclamo])
    REFERENCES [dbo].[Reclamo_Motivo]
        ([Co_MotivoReclamo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo__Co_Moti__5CD6CB2B'
CREATE INDEX [IX_FK__Reclamo__Co_Moti__5CD6CB2B]
ON [dbo].[Reclamo]
    ([Co_MotivoReclamo]);
GO

-- Creating foreign key on [Nu_Reclamo] in table 'Reclamo_Poliza'
ALTER TABLE [dbo].[Reclamo_Poliza]
ADD CONSTRAINT [FK__Reclamo_P__Nu_Re__2B0A656D]
    FOREIGN KEY ([Nu_Reclamo])
    REFERENCES [dbo].[Reclamo]
        ([Nu_Reclamo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo_P__Nu_Re__2B0A656D'
CREATE INDEX [IX_FK__Reclamo_P__Nu_Re__2B0A656D]
ON [dbo].[Reclamo_Poliza]
    ([Nu_Reclamo]);
GO

-- Creating foreign key on [Nu_Reclamo] in table 'Reclamo_Poliza'
ALTER TABLE [dbo].[Reclamo_Poliza]
ADD CONSTRAINT [FK__Reclamo_P__Nu_Re__5FB337D6]
    FOREIGN KEY ([Nu_Reclamo])
    REFERENCES [dbo].[Reclamo]
        ([Nu_Reclamo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Reclamo_P__Nu_Re__5FB337D6'
CREATE INDEX [IX_FK__Reclamo_P__Nu_Re__5FB337D6]
ON [dbo].[Reclamo_Poliza]
    ([Nu_Reclamo]);
GO

-- Creating foreign key on [Co_Tema] in table 'Sugerencia'
ALTER TABLE [dbo].[Sugerencia]
ADD CONSTRAINT [FK__Sugerenci__Co_Te__2DE6D218]
    FOREIGN KEY ([Co_Tema])
    REFERENCES [dbo].[Tema]
        ([Co_Tema])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Sugerenci__Co_Te__2DE6D218'
CREATE INDEX [IX_FK__Sugerenci__Co_Te__2DE6D218]
ON [dbo].[Sugerencia]
    ([Co_Tema]);
GO

-- Creating foreign key on [Co_Tema] in table 'Sugerencia'
ALTER TABLE [dbo].[Sugerencia]
ADD CONSTRAINT [FK__Sugerenci__Co_Te__68487DD7]
    FOREIGN KEY ([Co_Tema])
    REFERENCES [dbo].[Tema]
        ([Co_Tema])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Sugerenci__Co_Te__68487DD7'
CREATE INDEX [IX_FK__Sugerenci__Co_Te__68487DD7]
ON [dbo].[Sugerencia]
    ([Co_Tema]);
GO

-- Creating foreign key on [Cod_Com] in table 'ComisionRequisito'
ALTER TABLE [dbo].[ComisionRequisito]
ADD CONSTRAINT [FK_ComisionComisionRequisito]
    FOREIGN KEY ([Cod_Com])
    REFERENCES [dbo].[Comision]
        ([Cod_Com])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Cod_Req] in table 'ComisionRequisito'
ALTER TABLE [dbo].[ComisionRequisito]
ADD CONSTRAINT [FK_RequisitoComisionRequisito]
    FOREIGN KEY ([Cod_Req])
    REFERENCES [dbo].[Requisito]
        ([Cod_Req])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RequisitoComisionRequisito'
CREATE INDEX [IX_FK_RequisitoComisionRequisito]
ON [dbo].[ComisionRequisito]
    ([Cod_Req]);
GO

-- Creating foreign key on [Cod_Cnl_Vta] in table 'Comision'
ALTER TABLE [dbo].[Comision]
ADD CONSTRAINT [FK_CanalVentaComision]
    FOREIGN KEY ([Cod_Cnl_Vta])
    REFERENCES [dbo].[CanalVenta]
        ([Cod_Cnl_Vta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CanalVentaComision'
CREATE INDEX [IX_FK_CanalVentaComision]
ON [dbo].[Comision]
    ([Cod_Cnl_Vta]);
GO

-- Creating foreign key on [Cod_Camp] in table 'Comision'
ALTER TABLE [dbo].[Comision]
ADD CONSTRAINT [FK_CampaniaComision]
    FOREIGN KEY ([Cod_Camp])
    REFERENCES [dbo].[Campania]
        ([Cod_Camp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CampaniaComision'
CREATE INDEX [IX_FK_CampaniaComision]
ON [dbo].[Comision]
    ([Cod_Camp]);
GO

-- Creating foreign key on [Cod_Car] in table 'Comision'
ALTER TABLE [dbo].[Comision]
ADD CONSTRAINT [FK_CargoComision]
    FOREIGN KEY ([Cod_Car])
    REFERENCES [dbo].[Cargo]
        ([Cod_Car])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CargoComision'
CREATE INDEX [IX_FK_CargoComision]
ON [dbo].[Comision]
    ([Cod_Car]);
GO

-- Creating foreign key on [Cod_Tipo_Visita] in table 'Visita'
ALTER TABLE [dbo].[Visita]
ADD CONSTRAINT [FK_TipoVisitaVisita]
    FOREIGN KEY ([Cod_Tipo_Visita])
    REFERENCES [dbo].[TipoVisita]
        ([Cod_Tipo_Visita])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TipoVisitaVisita'
CREATE INDEX [IX_FK_TipoVisitaVisita]
ON [dbo].[Visita]
    ([Cod_Tipo_Visita]);
GO

-- Creating foreign key on [Cod_Pros] in table 'Visita'
ALTER TABLE [dbo].[Visita]
ADD CONSTRAINT [FK_ProspectoVisita]
    FOREIGN KEY ([Cod_Pros])
    REFERENCES [dbo].[Prospecto]
        ([Cod_Pros])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProspectoVisita'
CREATE INDEX [IX_FK_ProspectoVisita]
ON [dbo].[Visita]
    ([Cod_Pros]);
GO

-- Creating foreign key on [Cod_Plan] in table 'Poliza'
ALTER TABLE [dbo].[Poliza]
ADD CONSTRAINT [FK_TipoPlanPoliza]
    FOREIGN KEY ([Cod_Plan])
    REFERENCES [dbo].[TipoPlan]
        ([Cod_Plan])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TipoPlanPoliza'
CREATE INDEX [IX_FK_TipoPlanPoliza]
ON [dbo].[Poliza]
    ([Cod_Plan]);
GO

-- Creating foreign key on [Co_Poliza] in table 'BeneficiarioSet'
ALTER TABLE [dbo].[BeneficiarioSet]
ADD CONSTRAINT [FK_PolizaBeneficiario]
    FOREIGN KEY ([Co_Poliza])
    REFERENCES [dbo].[Poliza]
        ([Co_Poliza])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PolizaBeneficiario'
CREATE INDEX [IX_FK_PolizaBeneficiario]
ON [dbo].[BeneficiarioSet]
    ([Co_Poliza]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------