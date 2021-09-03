/*==================================================*/
/*                Tabla Cliente                     */
/*==================================================*/
create table Cliente(
Cliente_Id            serial     not null,
Cliente_nombre        text	     not null,
Cliente_apellido      text       not null,
Cliente_genero        text       not null,
Cliente_direccion     text       not null,
Cliente_telefono      text       not null,
Cliente_fecha_de_registro  date   not null,
Cliente_servicio      text        not null,
Cliente_tipo_de_plan   text        not null,
Cliente_tipo_de_dron    text      not null,
constraint Pk_Cliente primary key(Cliente_Id  )
);

/*==================================================*/
/*                Tabla Contrato                    */
/*==================================================*/
create table Contrato(
Contrato_Id      serial not null,
Cliente_Id       serial not null,
Contrato_detalle  text   not null,
contrato_cantidad integer not null,
contrato_fecha        date    not null,
constraint Pk_Contrato primary key(Contrato_Id   )
);

/*==================================================*/
/*          Tabla Insumo_de_Mantenimiento           */
/*==================================================*/
create table Insumo_de_Mantenimiento(
Insumo_Id    serial    not null,
Mantenimiento_Id  serial  not null,
Insumo_tipo        text    not null,
Insumo_cantidad    text   not null,
Insumo_precio       decimal  not null,
constraint Pk_Insumo_de_Mantenimiento primary key(Insumo_Id )
);

/*==================================================*/
/*          Tabla Detalle_de_Mantenimiento           */
/*==================================================*/

create table Detalle_de_Mantenimiento(
Detalle_Id   serial  not null,
Costo_Id     serial  not null,
Mantenimiento_Id  serial not null,
Detalle_Cantidad_de_dano    int    not null,
Detalle_precio decimal not null,
Detalle_dron_modelo Text not null,
constraint Pk_Detalle_de_Mantenimiento primary key(Detalle_Id)
);

/*==================================================*/
/*          Tabla Registro      */
/*==================================================*/
create table Registro (
contrato_Id  serial  not null,
Detalle_Id   serial  not null,
constraint Pk_Registro primary key(Detalle_Id  )
);

/*==================================================*/
/*                 Tabla Costo                      */
/*==================================================*/

create table Costo(
Costo_Id       serial   not null,
Servicio_Id     serial   not null,
Costo_detalle    text    not null,
Costo_precio      float   not null,
costo_anos         int not null,
constraint Pk_Costo primary key(Costo_Id  )
);

/*==================================================*/
/*        Tabla Personal_de_Mantenimiento           */
/*==================================================*/

create table Personal_de_Mantenimiento(
Pers_Id         serial   not null,
Servicio_Id     serial   not null,
Pers_nombre     text      not null,
Pers_apellido   text      not null,
Pers_cedula      text     not null,
Pers_direccion   text     not null,
Pers_telefono     text    not null,
Pers_ingreso_a_laborar  text   not null,
Pers_correo      text    not null,
constraint Pk_Personal_de_Mantenimiento primary key(Pers_Id  )
);


/*==================================================*/
/*             Tabla Plan_de_Servicio               */
/*==================================================*/

create table Plan_de_Servicio(
Servicio_Id     serial     not null,
Contrato_Id     serial     not null,
Servicio_tipo   text       not null,
Servicio_precio text       not null,
Servicio_detalle  text     not  null,
constraint Pk_Plan_de_Servicio primary key(Servicio_Id )
);

/*==================================================*/
/*               Tabla Especialista                 */
/*==================================================*/

create table Especialista(
Prof_Id    serial    not null,
Servicio_Id  serial   not null,
Prof_nombre  text    not null,
Prof_apellido  text not null,
Prof_cedula   text    not null,
Prof_direccion   text   not null,
Prof_telefono    int    not null,
Prof_fecha_de_nacimiento date  not null,
Prof_ingreso_a_laborar   text  not null,
Prof_correo     text  not null,
Prof_especialidad   text    not null,
constraint Pk_Especialista primary key(Prof_Id )
);

/*==================================================*/
/*               Tabla Mantenimiento                */
/*==================================================*/

create table Mantenimiento(
Mantenimiento_Id   serial     not null,
Pers_Id            serial     not null,
Mantenimiento_tipo    text    not null,
Mantenimiento_detalle  text   not null,
Mantenimiento_insumo   text  not null,
Mantenimiento_plan_de_servicio   text  not null,
constraint Pk_Mantenimiento primary key(Mantenimiento_Id )
);
 
/*==================================================*/
/*               Tabla Detalle_especialista                */
/*==================================================*/

create table Detalle_especialista(
Especialista_Id   serial     not null,
Prof_Id            serial     not null,
Especialista_Cantidad    integer   not null,
constraint Pk_Detalle_especialista primary key(Especialista_Id )
);

/*==================================================*/
/*                 Tabla Dron                       */
/*==================================================*/

create table Dron(
Dron_Id     serial   not null,
Cliente_Id   serial  not null,
Especialista_Id       serial not null,
Detalle_Id    serial  not null,
Dron_Manten_Min  integer not null,
Dron_Manten_Max  integer not null,
Dron_modelo   text   not null,
Dron_año   integer   not null,
Dron_tipo   text   not null,
Dron_tiempo_de_vuelo  text   not null,
Dron_fecha_de_adquisicion  date   not null,
constraint Pk_Dron primary key(Dron_Id )
);


alter table Contrato
  add constraint FK_Contrato_relations_Cliente  foreign key (Cliente_Id)
  references Cliente (Cliente_Id) on delete restrict on update restrict;
  
alter table Insumo_de_Mantenimiento
  add constraint FK_Insumo_de_Mantenimiento_relations_Mantenimiento  foreign key (Mantenimiento_Id )
  references Mantenimiento (Mantenimiento_Id) on delete restrict on update restrict;
 
alter table Detalle_de_Mantenimiento
  add constraint FK_Detalle_de_Mantenimiento_relations_Mantenimiento  foreign key (Mantenimiento_Id )
  references Mantenimiento (Mantenimiento_Id) on delete restrict on update restrict;
  
alter table Detalle_de_Mantenimiento
  add constraint FK_Detalle_de_Mantenimiento_relations_Costo  foreign key (Costo_Id )
  references Costo (Costo_Id) on delete restrict on update restrict;
  
alter table  Mantenimiento
  add constraint FK_Mantenimiento_relations_Personal_de_Mantenimiento  foreign key (Pers_Id )
  references Personal_de_Mantenimiento (Pers_Id) on delete restrict on update restrict;
 
 alter table  Costo
  add constraint FK_Costo_relations_Plan_de_Servicio  foreign key (Servicio_Id )
  references Plan_de_Servicio (Servicio_Id) on delete restrict on update restrict;
 
 alter table  Plan_de_Servicio
  add constraint FK_Plan_de_Servicio_relations_Contrato  foreign key (Contrato_Id )
  references Contrato (Contrato_Id) on delete restrict on update restrict;
 
 alter table Personal_de_Mantenimiento
  add constraint FK_Personal_de_Mantenimiento_relations_Plan_de_Servicio  foreign key (Servicio_Id )
 references Plan_de_Servicio (Servicio_Id) on delete restrict on update restrict;
 
 alter table  Especialista
  add constraint FK_Especialista_relations_Plan_de_Servicio  foreign key (Servicio_Id )
 references Plan_de_Servicio (Servicio_Id) on delete restrict on update restrict;
 
 alter table Detalle_especialista
  add constraint FK_Detalle_especialista_relations_Especialista foreign key (Prof_Id )
  references Especialista (Prof_Id) on delete restrict on update restrict;
  
  alter table  Dron
  add constraint FK_Dron_relations_Cliente  foreign key (Cliente_Id )
 references Cliente (Cliente_Id) on delete restrict on update restrict;
 
  alter table  Dron
  add constraint FK_Dron_relations_Detalle_especialista foreign key (Especialista_Id    )
 references Detalle_especialista  (Especialista_Id  ) on delete restrict on update restrict;
 
  alter table  Dron
  add constraint FK_Dron_relations_Detalle_de_Mantenimiento  foreign key (Detalle_Id )
 references Detalle_de_Mantenimiento (Detalle_Id) on delete restrict on update restrict;
 
 
 alter table  Registro
  add constraint FK_Registro_relations_Contrato  foreign key (Contrato_Id )
 references Contrato (Contrato_Id) on delete restrict on update restrict;
 
  alter table Registro
  add constraint FK_Registro_relations_Detalle_de_mantenimiento  foreign key (Detalle_Id )
 references Detalle_de_mantenimiento (Detalle_Id) on delete restrict on update restrict;
 
