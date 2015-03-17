--INSERT GRUPO 1

INSERT [dbo].[Producto] ([Nro_Prod], [Fec_Crea], [FI_Estado], [Flg_Flag]) 
VALUES (N'P001', CAST(0x0000A41300000000 AS DateTime), 0,0)
GO
INSERT [dbo].[Campania] ([Nro_Camp], [Fec_Ini], [Fec_Fin], [Qtd_Meta], [Flg_Flag]) 
VALUES (N'Campaña 1', CAST(0xFFFFF81A00000000 AS DateTime), CAST(0xFFFFF83700000000 AS DateTime), 100000, 0)
GO
Insert into Requisito(Nro_Req) values ('Requisito 1')
Insert into Requisito(Nro_Req) values ('Requisito 2')
Insert into Requisito(Nro_Req) values ('Requisito 3')
GO
Insert into CanalVenta(Nro_Cnl_Vta,Txt_Tipo) values ('Canal de Venta 1','Oficina')
Insert into CanalVenta(Nro_Cnl_Vta,Txt_Tipo) values ('Canal de Venta 2','Virtual')
Insert into CanalVenta(Nro_Cnl_Vta,Txt_Tipo) values ('Canal de Venta 3','Virtual')

GO
Insert into Cargo(Nro_Car) values ('Cargo 1')
Insert into Cargo(Nro_Car) values ('Cargo 2')
Insert into Cargo(Nro_Car) values ('Cargo 3')
GO

INSERT INTO Prospecto(Txt_Pros,Txt_Ape_Pat,Txt_Ape_Mat,Txt_Dir,Txt_Tel,Txt_Mov,Txt_Crr,Num_DNI)
VALUES ('Juan Pablo','Gonzales','Soto','Domicilio 1','01345465','997665443','jpablo@gmail.com','10234546')	
INSERT INTO Prospecto(Txt_Pros,Txt_Ape_Pat,Txt_Ape_Mat,Txt_Dir,Txt_Tel,Txt_Mov,Txt_Crr,Num_DNI)
VALUES ('David','Ramirez','Temoche','Domicilio 2','015455565','989776523','dramirez@gmail.com','10234895')
GO

Insert into PlanProducto(Nro_Plan_Prod,Ss_Prim_Min,Ss_Sum_Min_Aseg,Ss_Sum_Max_Aseg,Cod_Prod) 
values ('Plan Producto 1',1000,50000,100000,1)
Insert into PlanProducto(Nro_Plan_Prod,Ss_Prim_Min,Ss_Sum_Min_Aseg,Ss_Sum_Max_Aseg,Cod_Prod) 
values ('Plan Producto 2',1500,100001,150000,1)

GO
Insert into TipoVisita(Nro_Visita) values ('Oficina')
Insert into TipoVisita(Nro_Visita) values ('Domicilio')