/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     12/30/2018 11:31:18 AM                       */
/*==============================================================*/
create database DoAnUDQL
go
use DoAnUDQL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BANGGIA') and o.name = 'FK_BANGGIA_FK_BANGGI_SANBAYDEN')
alter table BANGGIA
   drop constraint FK_BANGGIA_FK_BANGGI_SANBAYDEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BANGGIA') and o.name = 'FK_BANGGIA_FK_BANGGI_SANBAYDI')
alter table BANGGIA
   drop constraint FK_BANGGIA_FK_BANGGI_SANBAYDI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETCHUYENBAY') and o.name = 'FK_CHITIETC_REFERENCE_SANBAY')
alter table CHITIETCHUYENBAY
   drop constraint FK_CHITIETC_REFERENCE_SANBAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHITIETCHUYENBAY') and o.name = 'FK_CHITIETC_REFERENCE_CHUYENBA')
alter table CHITIETCHUYENBAY
   drop constraint FK_CHITIETC_REFERENCE_CHUYENBA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHUYENBAY') and o.name = 'FK_CHUYENBA_FK_CHUYEN_SANBAY')
alter table CHUYENBAY
   drop constraint FK_CHUYENBA_FK_CHUYEN_SANBAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHUYENBAY') and o.name = 'FK_CHUYENBA_REFERENCE_SANBAY')
alter table CHUYENBAY
   drop constraint FK_CHUYENBA_REFERENCE_SANBAY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VECHUYENBAY') and o.name = 'FK_VECHUYEN_REFERENCE_CHUYENBA')
alter table VECHUYENBAY
   drop constraint FK_VECHUYEN_REFERENCE_CHUYENBA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VECHUYENBAY') and o.name = 'FK_VECHUYEN_REFERENCE_KHACHHAN')
alter table VECHUYENBAY
   drop constraint FK_VECHUYEN_REFERENCE_KHACHHAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BANGGIA')
            and   type = 'U')
   drop table BANGGIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETCHUYENBAY')
            and   type = 'U')
   drop table CHITIETCHUYENBAY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHUYENBAY')
            and   type = 'U')
   drop table CHUYENBAY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHACHHANG')
            and   type = 'U')
   drop table KHACHHANG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RANGBUOC')
            and   type = 'U')
   drop table RANGBUOC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SANBAY')
            and   type = 'U')
   drop table SANBAY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAIKHOAN')
            and   type = 'U')
   drop table "USER"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VECHUYENBAY')
            and   type = 'U')
   drop table VECHUYENBAY
go

/*==============================================================*/
/* Table: BANGGIA                                               */
/*==============================================================*/
create table BANGGIA (
   SBDi                 char(10)             not null,
   SBDen                char(10)             not null,
   GheHang              int                  not null,
   Gia                  float                null,
   constraint PK_BANGGIA primary key (GheHang, SBDen, SBDi)
)
go

/*==============================================================*/
/* Table: CHITIETCHUYENBAY                                      */
/*==============================================================*/
create table CHITIETCHUYENBAY (
   STT                  int      not null,
   MaCB                 char(10)             not null,
   MaSBTG               char(10)             null,
   TGDung               int                  null,
   GhiChu               text                 null,
   constraint PK_CHITIETCHUYENBAY primary key (STT, MaCB)
)
go

/*==============================================================*/
/* Table: CHUYENBAY                                             */
/*==============================================================*/
create table CHUYENBAY (
   MaCB                 char(10)             not null,
   SBDi                 char(10)             null,
   SBDen                char(10)             null,
   NgayGio              datetime             null,
   TGBay                int                  null,
   SLGhe1               int                  null,
   SLGhe2               int                  null,
   SoGheTrong           int                  null,
   SoGheDat             int                  null,
   SoVe                 int                  null,
   TyLe                 float                null,
   DoanhThu             float                null,
   constraint PK_CHUYENBAY primary key (MaCB)
)
go

/*==============================================================*/
/* Table: KHACHHANG                                             */
/*==============================================================*/
create table KHACHHANG (
   MaKH                 int IDENTITY(1,1)    not null,
   TenKH                nvarchar(50)         null,
   CMND                 char(20)             null,
   DienThoai            char(20)             null,
   constraint PK_KHACHHANG primary key (MaKH),
    constraint UQ_CMND unique (CMND)
)
go

/*==============================================================*/
/* Table: RANGBUOC                                              */
/*==============================================================*/
create table RANGBUOC (
   PK                   int                  not null,
   SLSanBay             int                  null,
   ThoiGianBayMin       int                  null,
   SBTGMax              int                  null,
   TGDungMin            int                  null,
   TGDungMax            int                  null,
   SLHangVe             int                  null,
   TGDatVe              int			         null,
   TGHuyVe              int					 null,
   constraint PK_RANGBUOC primary key (PK)
)
go

/*==============================================================*/
/* Table: SANBAY                                                */
/*==============================================================*/
create table SANBAY (
   MaSB                 char(10)             not null,
   TenSB                nvarchar(50)         null,
   constraint PK_SANBAY primary key (MaSB)
)
go

/*==============================================================*/
/* Table: TAIKHOAN                                               */
/*==============================================================*/
create table TAIKHOAN(
   username               varchar(30)          not null,
   password             varchar(120)            null,
   loaiUSER             int                  null,
   constraint PK_USER primary key (username)
)
go

/*==============================================================*/
/* Table: VECHUYENBAY                                           */
/*==============================================================*/
create table VECHUYENBAY (
	MaVe				int IDENTITY(1,1)    not null,
   Loai                 int                  not null,
   MaCB                 char(10)             not null,
   MaKH                 int             not null,
   GheHang              int             null,
   NgayDat              datetime             null,
   GiaVe				int						null,
   constraint PK_VECHUYENBAY primary key (MaVe),
   constraint UQ_MaCB_MaKH unique (MaCB,MaKH)
)
go
/*==============================================================*/
/* Table: HANGVE                                           */
/*==============================================================*/
create table HANGVE (
	MaHangVe int not null,
	TenHangVe nvarchar(30) 
	constraint PK_HANGVE primary key (MaHangVe),
	constraint UQ_TenHangVe unique (TenHangVe)
)
go
alter table BANGGIA
   add constraint FK_BANGGIA_FK_BANGGI_SANBAYDEN foreign key (SBDen)
      references SANBAY (MaSB)
go

alter table BANGGIA
   add constraint FK_BANGGIA_FK_BANGGI_SANBAYDI foreign key (SBDi)
      references SANBAY (MaSB)
go

alter table CHITIETCHUYENBAY
   add constraint FK_CHITIETC_REFERENCE_SANBAY foreign key (MaSBTG)
      references SANBAY (MaSB)
go

alter table CHITIETCHUYENBAY
   add constraint FK_CHITIETC_REFERENCE_CHUYENBA foreign key (MaCB)
      references CHUYENBAY (MaCB)
go

alter table CHUYENBAY
   add constraint FK_CHUYENBA_FK_CHUYEN_SANBAY foreign key (SBDi)
      references SANBAY (MaSB)
go

alter table CHUYENBAY
   add constraint FK_CHUYENBA_REFERENCE_SANBAY foreign key (SBDen)
      references SANBAY (MaSB)
go

alter table VECHUYENBAY
   add constraint FK_VECHUYEN_REFERENCE_CHUYENBA foreign key (MaCB)
      references CHUYENBAY (MaCB)
go

alter table VECHUYENBAY
   add constraint FK_VECHUYEN_REFERENCE_KHACHHAN foreign key (MaKH)
      references KHACHHANG (MaKH)
go
alter table VECHUYENBAY
   add constraint FK_VECHUYEN_REFERENCE_HANGVE foreign key (GheHang)
      references HANGVE (MaHangVe)
go
