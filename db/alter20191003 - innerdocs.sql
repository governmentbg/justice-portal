insert into [dbo].[UserRight] (UserRightId, Description)
values ('editinsidedocuments', N'Администриране на вътрешни документи')

insert into [dbo].[PortalUser2Right](PortalUserId, UserRightId)
values(1, 'editinsidedocuments')
go

if OBJECT_ID('InnerDoc') is not null
begin
  exec p_ak_drop_all_foreign_keys 'InnerDoc'
  drop table InnerDoc
end
go

create table InnerDoc
(
  InnerDocId int not null identity(1,1),
  PortalPartId nvarchar(20) not null,
  Content nvarchar(max),
  constraint pk_InnerDocId primary key (InnerDocId),
  constraint fk_InnerDoc_PortalPartId foreign key (PortalPartId) references PortalPart(PortalPartId) on delete cascade,

)
go


exec p_ak_create_fk_indeces 'InnerDoc'
go