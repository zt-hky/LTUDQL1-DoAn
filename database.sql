/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     7/12/2018 7:02:28 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BANGGIA') and o.name = 'FK_BANGGIA_SANBAYDI')
alter table BANGGIA
   drop constraint FK_BANGGIA_SANBAYDI
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
           where  id = object_id('DOANHTHUNAM')
            and   type = 'U')
   drop table DOANHTHUNAM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHACHHANG')
            and   type = 'U')
   drop table KHACHHANG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SANBAY')
            and   type = 'U')
   drop table SANBAY
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
   STT                  int                  not null,
   MaCB                 char(10)             not null,
   MaSB                 char(10)             null,
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
   TGBay                datetime             null,
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
/* Table: DOANHTHUNAM                                           */
/*==============================================================*/
create table DOANHTHUNAM (
   Thang                int                  not null,
   Nam                  int                  not null,
   SoChuyenBay          int                  null,
   DoanhThu             float                null,
   TyLe                 float                null,
   constraint PK_DOANHTHUNAM primary key (Thang, Nam)
)
go

/*==============================================================*/
/* Table: KHACHHANG                                             */
/*==============================================================*/
create table KHACHHANG (
   MaKH                 char(10)             not null,
   TenKH                nvarchar(50)         null,
   CMND                 char(20)             null,
   DienThoai            char(20)             null,
   constraint PK_KHACHHANG primary key (MaKH)
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
/* Table: VECHUYENBAY                                           */
/*==============================================================*/
create table VECHUYENBAY (
   Loai                 int                  not null,
   MaCB                 char(10)             not null,
   MaKH                 char(10)             not null,
   GheHang              char(10)             null,
   NgayDat              datetime             null,
   constraint PK_VECHUYENBAY primary key (Loai, MaCB, MaKH)
)
go

alter table BANGGIA
   add constraint FK_BANGGIA_SANBAYDI foreign key (SBDi)
      references SANBAY (MaSB)
go

alter table CHITIETCHUYENBAY
   add constraint FK_CHITIETC_REFERENCE_SANBAY foreign key (MaSB)
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

