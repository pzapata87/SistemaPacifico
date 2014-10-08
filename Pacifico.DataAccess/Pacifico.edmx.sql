
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/08/2014 12:00:53
-- Generated from EDMX file: D:\Proyectos\Academico - Servicio Web\SistemaPacifico\Pacifico.DataAccess\Pacifico.edmx
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

IF OBJECT_ID(N'[dbo].[FK_PlanProducto_Producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlanProducto] DROP CONSTRAINT [FK_PlanProducto_Producto];
GO
IF OBJECT_ID(N'[dbo].[FK_DetallePropuestaSolucion_PropuestaSolucion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DetallePropuestaSolucion] DROP CONSTRAINT [FK_DetallePropuestaSolucion_PropuestaSolucion];
GO
IF OBJECT_ID(N'[dbo].[FK_PropuestaSolucion_Producto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropuestaSolucion] DROP CONSTRAINT [FK_PropuestaSolucion_Producto];
GO
IF OBJECT_ID(N'[dbo].[FK_PropuestaSolucion_Prospecto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PropuestaSolucion] DROP CONSTRAINT [FK_PropuestaSolucion_Prospecto];
GO
IF OBJECT_ID(N'[dbo].[FK_ComisionCanalVenta]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comision] DROP CONSTRAINT [FK_ComisionCanalVenta];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[PlanProducto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlanProducto];
GO
IF OBJECT_ID(N'[dbo].[Prospecto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Prospecto];
GO
IF OBJECT_ID(N'[dbo].[Producto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Producto];
GO
IF OBJECT_ID(N'[dbo].[DetallePropuestaSolucion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DetallePropuestaSolucion];
GO
IF OBJECT_ID(N'[dbo].[PropuestaSolucion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PropuestaSolucion];
GO
IF OBJECT_ID(N'[dbo].[Comision]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comision];
GO
IF OBJECT_ID(N'[dbo].[CanalVenta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CanalVenta];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PlanProducto'
CREATE TABLE [dbo].[PlanProducto] (
    [Co_PlanProducto] int IDENTITY(1,1) NOT NULL,
    [No_PlanProducto] varchar(50)  NOT NULL,
    [Ss_PrimaMinima] decimal(18,2)  NOT NULL,
    [Ss_SumaMinimaAsegurada] int  NOT NULL,
    [Ss_SumaMaximaAsegurada] int  NOT NULL,
    [Co_Producto] int  NOT NULL
);
GO

-- Creating table 'Prospecto'
CREATE TABLE [dbo].[Prospecto] (
    [Co_Prospecto] int IDENTITY(1,1) NOT NULL,
    [No_Prospecto] varchar(50)  NULL,
    [Tx_ApePaterno] varchar(50)  NULL,
    [Tx_ApeMaterno] varchar(50)  NULL,
    [Tx_Direccion] varchar(50)  NULL,
    [Tx_Telefono] varchar(50)  NULL,
    [Tx_Movil] varchar(50)  NULL,
    [Tx_Correo] varchar(50)  NULL,
    [Nu_DNI] varchar(50)  NULL
);
GO

-- Creating table 'Producto'
CREATE TABLE [dbo].[Producto] (
    [Co_Producto] int IDENTITY(1,1) NOT NULL,
    [No_Producto] varchar(50)  NOT NULL,
    [Fe_Creacion] datetime  NOT NULL,
    [FI_Flag] bit  NOT NULL
);
GO

-- Creating table 'DetallePropuestaSolucion'
CREATE TABLE [dbo].[DetallePropuestaSolucion] (
    [Co_DetallePropuestaSolucion] int IDENTITY(1,1) NOT NULL,
    [Co_PropuestaSolucion] int  NOT NULL,
    [Nu_Anio] int  NOT NULL,
    [Nu_Edad] int  NOT NULL,
    [Ss_MontoPrima] decimal(18,0)  NOT NULL,
    [Ss_MontoAhorro] decimal(18,0)  NOT NULL,
    [Ss_ValorRescate] decimal(18,0)  NOT NULL,
    [Ss_MontoAsegurado] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'PropuestaSolucion'
CREATE TABLE [dbo].[PropuestaSolucion] (
    [Co_PropuestaSolucion] int IDENTITY(1,1) NOT NULL,
    [Ss_MontoPrima] decimal(18,2)  NOT NULL,
    [Fe_Nacimiento] datetime  NOT NULL,
    [Ss_MontoRetorno] decimal(18,2)  NOT NULL,
    [Ss_MontoAsegurado] decimal(18,2)  NOT NULL,
    [Co_Prospecto] int  NOT NULL,
    [Co_Producto] int  NOT NULL,
    [Co_Plan] int  NOT NULL,
    [Fe_Creacion] datetime  NOT NULL
);
GO

-- Creating table 'Comision'
CREATE TABLE [dbo].[Comision] (
    [Co_Comision] int IDENTITY(1,1) NOT NULL,
    [No_Comision] nvarchar(50)  NOT NULL,
    [Fe_Registro] datetime  NOT NULL,
    [CanalVenta_Co_CanalVenta] int  NOT NULL,
    [Campania_Co_Campania] int  NOT NULL,
    [Empleado_Co_Empleado] int  NULL
);
GO

-- Creating table 'CanalVenta'
CREATE TABLE [dbo].[CanalVenta] (
    [Co_CanalVenta] int IDENTITY(1,1) NOT NULL,
    [No_CanalVenta] nvarchar(50)  NOT NULL,
    [Tx_Tipo] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Campania'
CREATE TABLE [dbo].[Campania] (
    [Co_Campania] int IDENTITY(1,1) NOT NULL,
    [No_Campania] nvarchar(50)  NOT NULL,
    [Fe_Inicio] datetime  NOT NULL,
    [Fe_Fin] datetime  NOT NULL,
    [Qt_Meta] int  NOT NULL,
    [Fl_Flag] bit  NOT NULL
);
GO

-- Creating table 'Empleado'
CREATE TABLE [dbo].[Empleado] (
    [Co_Empleado] int IDENTITY(1,1) NOT NULL,
    [No_Empleado] nvarchar(50)  NOT NULL,
    [No_ApePaterno] nvarchar(50)  NOT NULL,
    [No_ApeMaterno] nvarchar(max)  NOT NULL,
    [Fl_Sexo] bit  NOT NULL,
    [Cargo_Co_Cargo] int  NOT NULL
);
GO

-- Creating table 'Cargo'
CREATE TABLE [dbo].[Cargo] (
    [Co_Cargo] int IDENTITY(1,1) NOT NULL,
    [No_Cargo] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Co_PlanProducto] in table 'PlanProducto'
ALTER TABLE [dbo].[PlanProducto]
ADD CONSTRAINT [PK_PlanProducto]
    PRIMARY KEY CLUSTERED ([Co_PlanProducto] ASC);
GO

-- Creating primary key on [Co_Prospecto] in table 'Prospecto'
ALTER TABLE [dbo].[Prospecto]
ADD CONSTRAINT [PK_Prospecto]
    PRIMARY KEY CLUSTERED ([Co_Prospecto] ASC);
GO

-- Creating primary key on [Co_Producto] in table 'Producto'
ALTER TABLE [dbo].[Producto]
ADD CONSTRAINT [PK_Producto]
    PRIMARY KEY CLUSTERED ([Co_Producto] ASC);
GO

-- Creating primary key on [Co_DetallePropuestaSolucion] in table 'DetallePropuestaSolucion'
ALTER TABLE [dbo].[DetallePropuestaSolucion]
ADD CONSTRAINT [PK_DetallePropuestaSolucion]
    PRIMARY KEY CLUSTERED ([Co_DetallePropuestaSolucion] ASC);
GO

-- Creating primary key on [Co_PropuestaSolucion] in table 'PropuestaSolucion'
ALTER TABLE [dbo].[PropuestaSolucion]
ADD CONSTRAINT [PK_PropuestaSolucion]
    PRIMARY KEY CLUSTERED ([Co_PropuestaSolucion] ASC);
GO

-- Creating primary key on [Co_Comision] in table 'Comision'
ALTER TABLE [dbo].[Comision]
ADD CONSTRAINT [PK_Comision]
    PRIMARY KEY CLUSTERED ([Co_Comision] ASC);
GO

-- Creating primary key on [Co_CanalVenta] in table 'CanalVenta'
ALTER TABLE [dbo].[CanalVenta]
ADD CONSTRAINT [PK_CanalVenta]
    PRIMARY KEY CLUSTERED ([Co_CanalVenta] ASC);
GO

-- Creating primary key on [Co_Campania] in table 'Campania'
ALTER TABLE [dbo].[Campania]
ADD CONSTRAINT [PK_Campania]
    PRIMARY KEY CLUSTERED ([Co_Campania] ASC);
GO

-- Creating primary key on [Co_Empleado] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [PK_Empleado]
    PRIMARY KEY CLUSTERED ([Co_Empleado] ASC);
GO

-- Creating primary key on [Co_Cargo] in table 'Cargo'
ALTER TABLE [dbo].[Cargo]
ADD CONSTRAINT [PK_Cargo]
    PRIMARY KEY CLUSTERED ([Co_Cargo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Co_Producto] in table 'PlanProducto'
ALTER TABLE [dbo].[PlanProducto]
ADD CONSTRAINT [FK_PlanProducto_Producto]
    FOREIGN KEY ([Co_Producto])
    REFERENCES [dbo].[Producto]
        ([Co_Producto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlanProducto_Producto'
CREATE INDEX [IX_FK_PlanProducto_Producto]
ON [dbo].[PlanProducto]
    ([Co_Producto]);
GO

-- Creating foreign key on [Co_PropuestaSolucion] in table 'DetallePropuestaSolucion'
ALTER TABLE [dbo].[DetallePropuestaSolucion]
ADD CONSTRAINT [FK_DetallePropuestaSolucion_PropuestaSolucion]
    FOREIGN KEY ([Co_PropuestaSolucion])
    REFERENCES [dbo].[PropuestaSolucion]
        ([Co_PropuestaSolucion])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DetallePropuestaSolucion_PropuestaSolucion'
CREATE INDEX [IX_FK_DetallePropuestaSolucion_PropuestaSolucion]
ON [dbo].[DetallePropuestaSolucion]
    ([Co_PropuestaSolucion]);
GO

-- Creating foreign key on [Co_Producto] in table 'PropuestaSolucion'
ALTER TABLE [dbo].[PropuestaSolucion]
ADD CONSTRAINT [FK_PropuestaSolucion_Producto]
    FOREIGN KEY ([Co_Producto])
    REFERENCES [dbo].[Producto]
        ([Co_Producto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropuestaSolucion_Producto'
CREATE INDEX [IX_FK_PropuestaSolucion_Producto]
ON [dbo].[PropuestaSolucion]
    ([Co_Producto]);
GO

-- Creating foreign key on [Co_Prospecto] in table 'PropuestaSolucion'
ALTER TABLE [dbo].[PropuestaSolucion]
ADD CONSTRAINT [FK_PropuestaSolucion_Prospecto]
    FOREIGN KEY ([Co_Prospecto])
    REFERENCES [dbo].[Prospecto]
        ([Co_Prospecto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PropuestaSolucion_Prospecto'
CREATE INDEX [IX_FK_PropuestaSolucion_Prospecto]
ON [dbo].[PropuestaSolucion]
    ([Co_Prospecto]);
GO

-- Creating foreign key on [CanalVenta_Co_CanalVenta] in table 'Comision'
ALTER TABLE [dbo].[Comision]
ADD CONSTRAINT [FK_ComisionCanalVenta]
    FOREIGN KEY ([CanalVenta_Co_CanalVenta])
    REFERENCES [dbo].[CanalVenta]
        ([Co_CanalVenta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComisionCanalVenta'
CREATE INDEX [IX_FK_ComisionCanalVenta]
ON [dbo].[Comision]
    ([CanalVenta_Co_CanalVenta]);
GO

-- Creating foreign key on [Campania_Co_Campania] in table 'Comision'
ALTER TABLE [dbo].[Comision]
ADD CONSTRAINT [FK_CampaniaComision]
    FOREIGN KEY ([Campania_Co_Campania])
    REFERENCES [dbo].[Campania]
        ([Co_Campania])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CampaniaComision'
CREATE INDEX [IX_FK_CampaniaComision]
ON [dbo].[Comision]
    ([Campania_Co_Campania]);
GO

-- Creating foreign key on [Empleado_Co_Empleado] in table 'Comision'
ALTER TABLE [dbo].[Comision]
ADD CONSTRAINT [FK_EmpleadoComision]
    FOREIGN KEY ([Empleado_Co_Empleado])
    REFERENCES [dbo].[Empleado]
        ([Co_Empleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoComision'
CREATE INDEX [IX_FK_EmpleadoComision]
ON [dbo].[Comision]
    ([Empleado_Co_Empleado]);
GO

-- Creating foreign key on [Cargo_Co_Cargo] in table 'Empleado'
ALTER TABLE [dbo].[Empleado]
ADD CONSTRAINT [FK_CargoEmpleado]
    FOREIGN KEY ([Cargo_Co_Cargo])
    REFERENCES [dbo].[Cargo]
        ([Co_Cargo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CargoEmpleado'
CREATE INDEX [IX_FK_CargoEmpleado]
ON [dbo].[Empleado]
    ([Cargo_Co_Cargo]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------